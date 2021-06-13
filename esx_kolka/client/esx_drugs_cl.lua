local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX 			    			= nil
local aloesQTE       			= 0
local acetoneQTE 				= 0
local myJob 					= nil
local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local isInZone                  = false
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}

local antidotum = 0
local kokaina = 0
local morfina = 0


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_kolka:hasEnteredMarker', function(zone)
	if myJob == 'ambulance' then
		return
	end

	if myJob == 'police' then
		return
	end
	
	if IsPedInAnyVehicle(PlayerPedId()) then
		TriggerEvent('pNotify:SendNotification', {text = 'Nie mozesz zbierac narkotykow bedac w pojedzie.'})
		return
	end

	ESX.UI.Menu.CloseAll()
	
	if zone == 'exitMarker' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('exit_marker')
		CurrentActionData = {}
	end
	
	
	if zone == 'AcetoneField' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_acetone')
		CurrentActionData = {}
	end

	if zone == 'aloes' then
		CurrentAction     = zone
		CurrentActionMsg  = _U('press_collect_aloes')
		CurrentActionData = {}
	end


end)

AddEventHandler('esx_kolka:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

	TriggerServerEvent('esx_kolka:stopHarvestAcetone')
end)




-- RETURN NUMBER OF ITEMS FROM SERVER
RegisterNetEvent('esx_kolka:ReturnInventory')
AddEventHandler('esx_kolka:ReturnInventory', function(acetoneNbr, acetonepNbr, jobName, currentZone)
	acetoneQTE	   = acetoneNbr
	acetone_poochQTE = acetonepNbr
	myJob		 = jobName
	TriggerEvent('esx_kolka:hasEnteredMarker', currentZone)
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(#(coords - vector3(v.x, v.y, v.z)) < Config.ZoneSize.x ) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone				= currentZone
			TriggerServerEvent('esx_kolka:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_kolka:hasExitedMarker', lastZone)
		end

		if isInMarker and isInZone then
			TriggerEvent('esx_kolka:hasEnteredMarker', 'exitMarker')
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, Keys['E']) then
				isInZone = true -- unless we set this boolean to false, we will always freeze the user
				if CurrentAction == 'exitMarker' then
					isInZone = false -- do not freeze user
					TriggerEvent('esx_kolka:freezePlayer', false)
					TriggerEvent('esx_kolka:hasExitedMarker', lastZone)
					Citizen.Wait(15000)
				elseif CurrentAction == 'AcetoneField' then
					TriggerServerEvent('esx_kolka:startHarvestAcetone')
				elseif CurrentAction == 'aloes' then
					TriggerServerEvent('esx_kolka:startHarvestAcetone')
				else
					isInZone = false -- not a esx_kolka zone
				end
				
				if isInZone then
					TriggerEvent('esx_kolka:freezePlayer', true)
				end
				
				CurrentAction = nil
			end
		end
	end
end)

RegisterNetEvent('esx_kolka:freezePlayer')
AddEventHandler('esx_kolka:freezePlayer', function(freeze)
	FreezeEntityPosition(GetPlayerPed(-1), freeze)
end)
