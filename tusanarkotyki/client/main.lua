Keys = {
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

ESX                  = nil
local DrugLevel     = 0.0
local DrunkLevel = 0.0
local TargetDrunkLevel = 0.0
local maxDrugLevel  = 4.0
local maxDrunkLevel = 2.5
local globalDrugTime = 400000
local globalDrunkTime = 400000
local TargetDrugLevel = 0.0
local isUsing = false
local isDrunk = false
local isBusy = false
local przerobxx = 0
local przerobyy = 0
local przerobzz = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
end)


local function drugHigher(TargetDrugLevel)
	while DrugLevel < TargetDrugLevel do
		DrugLevel = DrugLevel + 0.0007
		SetTimecycleModifierStrength(DrugLevel)
		Wait(10)
	end
end

local function drunkHigher(TargetDrunkLevel)
	while DrunkLevel < TargetDrunkLevel do
		DrunkLevel = TargetDrunkLevel
		SetTimecycleModifierStrength(DrunkLevel)
		Wait(1000)
	end
end

local function drugLower()
	local player = PlayerId()
	while (DrugLevel > 0.0 ) do
		DrugLevel = DrugLevel - 0.000005
		SetTimecycleModifierStrength(DrugLevel)
		Wait(10)
		if DrugLevel == 0 then
			SetRunSprintMultiplierForPlayer(player, 1.0)
		end
	end
end
 ---------------- TU NOWE DODANE ---------------
 --[[
 Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = GetPlayerPed(-1)
        local playerPosition2 = GetEntityCoords(playerPed)


		-- ENTER TELEPORTER
		if (#(playerPosition2 - vector3(przerobxx, przerobyy, przerobzz)) < 5) then
			DrawMarker(2, przerobxx, przerobyy, przerobzz-0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 200, 0, 0, 0, 1, 0, 0, 0)
			if (#(playerPosition2 - vector3(przerobxx, przerobyy, przerobzz)) < 1.5) then
				DrawText3D(przerobxx, przerobyy, przerobzz+0.15, '~g~E~w~ - Wejdz2')
				if IsControlJustReleased(0, Keys["E"]) then
					wszedl = true
					wyszedl = false
					Citizen.Wait(1000)
					teleportToPrzerobOffice()
				end 
			elseif (#(playerPosition2 - vector3(przerobxx, przerobyy, przerobzz)) < 8) then
				DrawText3D(przerobxx, przerobyy, przerobzz+0.15, 'Produkszyn')
			end
		end

		-- EXIT TELEPORTER
		if PlayerData.job2 ~= nil and PlayerData.job2.name == 'tijuana' then
			if (#(playerPosition2 - vector3(Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z)) < 5) then
				DrawMarker(2, Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z-0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 200, 0, 0, 0, 1, 0, 0, 0)
				if (#(playerPosition2 - vector3(Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z)) < 1.5) then
					DrawText3D(Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z+0.15, '~g~E~w~ - Wyjdz')
					if IsControlJustReleased(0, Keys["E"]) then
						teleportOutOfPrzerobOffice()
						wyszedl = true
						wszedl = false
					end
				end
			end
		end

		if wszedl == false and wyszedl == false then
			if wyslano == false then
				if (#(playerPosition - vector3(Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z)) < 10) then
					TriggerServerEvent('esx_washlab:miejscowkagra', wszedl)
					wyslano = true
				end
			else
				Wait(60000)
				wyslano = false
			end
		end

		if chuj == false then
			if (#(playerPosition - vector3(Config.Przerob.enter.x, Config.Przerob.enter.y, Config.Przerob.enter.z)) < 10) then
				wszedl = 2
				TriggerServerEvent('esx_washlab:miejscowkagra', wszedl)
				chuj = true
			end
		else
			Wait(60000)
			chuj = false
		end
    end
end)

teleportOutOfPrzerobOffice = function()
    local entity = GetPlayerPed(-1)
    
    DoScreenFadeOut(200)
    Citizen.Wait(200)
    SetEntityCoords(entity, przerobxx, przerobyy, przerobzz, 0, 0, 0, false)

    PlaceObjectOnGroundProperly(entity)
    Citizen.Wait(1500)
    DoScreenFadeIn(200)
end

teleportToPrzerobOffice = function()
    local entity = GetPlayerPed(-1)
    
    DoScreenFadeOut(200)
    Citizen.Wait(200)
    SetEntityCoords(entity, Config.Przerob.exit.x, Config.Przerob.exit.y, Config.Przerob.exit.z, 0, 0, 0, false)

    PlaceObjectOnGroundProperly(entity)
    Citizen.Wait(1500)
    DoScreenFadeIn(200)
end

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end



]]--
 --------------- TU KONIEC NOWYCH --------------




RegisterNetEvent('esx_fnkydrugs:checkpos')
AddEventHandler('esx_fnkydrugs:checkpos', function()
	if isBusy then return end
    local coords    = GetEntityCoords(PlayerPedId())
    local distancecheck  = #(vector3(1093.01, -3198.09, -38.99841) - coords)
	local distancecheck2  = #(vector3(1014.21, -3195.08, -38.99) - coords)
	local playerPed = PlayerPedId()
	local dict = 'mini@repair'
    if distancecheck < 5.2 then
		isBusy = true
		--TriggerEvent('2d:progressBars', "Przerabiam", 1120)
		exports['MajorkaRP']:startUI((30000), "PRZERABIAM")
		SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
		Citizen.Wait(1)
		loadAnimDict(dict)
		TaskPlayAnim(playerPed, dict, 'fixing_a_ped', 8.0, 3.0, -1, 1, 0, 0, 0, 0)
		TriggerEvent('esx_drugs:freezePlayer', true)
		Wait(30000)
		TriggerEvent('esx_drugs:freezePlayer', false)
    	TriggerEvent('esx_fnkydrugs:checkposafter')
	elseif distancecheck2 < 2 and PlayerData.job2.name == 'tijuana' then
		isBusy = true
		--TriggerEvent('2d:progressBars', "Przerabiam", 1120)
		exports['MajorkaRP']:startUI((15000), "PRZERABIAM")
		SetCurrentPedWeapon(PlayerPedId(), -1569615261,true)
		Citizen.Wait(1)
		loadAnimDict(dict)
		TaskPlayAnim(playerPed, dict, 'fixing_a_ped', 8.0, 3.0, -1, 1, 0, 0, 0, 0)
		TriggerEvent('esx_drugs:freezePlayer', true)
		Wait(15000)
		TriggerEvent('esx_drugs:freezePlayer', false)
    	TriggerEvent('esx_fnkydrugs:checkposafter')
    elseif (distancecheck > 5.2 and distancecheck < 12) then
    	TriggerEvent("pNotify:SendNotification", {text = "Podejdź bliżej sprzętu"})
	elseif (distancecheck2 > 2 and distancecheck2 < 20) and PlayerData.job2.name == 'tijuana' then
    	TriggerEvent("pNotify:SendNotification", {text = "Podejdź bliżej sprzętu"})
	else
		TriggerEvent('esx:showNotification', '~y~Zaczynasz rozcierać liść moździerzem...')
		TriggerEvent('esx:showNotification', '~b~Bez specjalistycznego sprzetu, nie uda ci sie uzyskać dobrej jakości produktu!')
    end
end)

RegisterNetEvent('esx_narkotyki:aloesik')
AddEventHandler('esx_narkotyki:aloesik', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_energy_drink', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))+5)
		Citizen.Wait(2000)
		timer = timer + 5
	end
	ESX.ShowNotification(_U('redgull_end'))
end)

RegisterNetEvent('esx_fnkydrugs:checkposafter')
AddEventHandler('esx_fnkydrugs:checkposafter', function()
    local coords    = GetEntityCoords(PlayerPedId())
    local distancecheck  = #(vector3(1091.8, -3198.9, -38.99841) - coords)
	local distancecheck2  = #(vector3(1014.21, -3195.08, -38.99) - coords)
	local playerPed = PlayerPedId()
    if distancecheck < 5.2  or distancecheck2 < 6  and IsEntityPlayingAnim(playerPed, "mini@repair", "fixing_a_ped", 3) then
    	TriggerServerEvent('esx_fnkydrugs:mortar')
		ClearPedTasks(playerPed)
		isBusy = false
    else
	local playerPed = PlayerPedId()
		ClearPedTasks(playerPed)
    	TriggerEvent("pNotify:SendNotification", {text = "Patrzysz na zieloną maź, która ci wyszła i zastanawiasz się co poszło nie tak. Spróbuj jeszcze raz"})
		isBusy = false
    end
end)

RegisterNetEvent('esx_fnkydrugs:checkdrugs')
AddEventHandler('esx_fnkydrugs:checkdrugs', function()
 if DrugLevel > 0.0 then
	TriggerEvent("pNotify:SendNotification", {text = "PRZEKRWIONE OCZY, CIĘŻKI ODDECH"})
 end
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end
--Drugs Effects



--Weed indica
RegisterNetEvent('esx_fnkydrugs:onWeed')
AddEventHandler('esx_fnkydrugs:onWeed', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*dookoła czuć zapach marihuany*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
		end
		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.5
		SetTimecycleModifier("drug_drive_blend01")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Faza sie wkreca")
		PlaySoundFrontend(-1, "1st_Person_Transition", "PLAYER_SWITCH_CUSTOM_SOUNDSET", 0)
		Citizen.Wait(5000)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		Citizen.Wait(5000)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		PlaySoundFrontend(-1, "5s_To_Event_Start_Countdown", "GTAO_FM_Events_Soundset", 0)
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/50))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.8)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

-- Weed hybrid
RegisterNetEvent('esx_fnkydrugs:rhybrid')
AddEventHandler('esx_fnkydrugs:rhybrid', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*dookoła czuć zapach marihuany*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
		end
		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.4
		SetTimecycleModifier("drug_drive_blend02")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Faza sie wkreca")
		-- Walking cosmetics
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/80))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.8)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

-- Weed sativa
RegisterNetEvent('esx_fnkydrugs:rsativa')
AddEventHandler('esx_fnkydrugs:rsativa', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*dookoła czuć zapach marihuany*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
		end

		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.2
		SetTimecycleModifier("drug_drive_blend01")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Faza sie wkreca")
		-- Walking cosmetics
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/60))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.8)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

--Bongo
RegisterNetEvent('esx_fnkydrugs:bongo')
AddEventHandler('esx_fnkydrugs:bongo', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*dookoła czuć zapach marihuany*") end

		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.2
		SetTimecycleModifier("drug_drive_blend01")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Faza sie wkreca.")
		-- Walking cosmetics
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/60))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.8)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)


--Meth
RegisterNetEvent('esx_fnkydrugs:onMeth')
AddEventHandler('esx_fnkydrugs:onMeth', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*wkłada do szklanej fajki mały kryształ*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING_POT", 0, 1)
		end		
		
		-- Set visual fx type
		Citizen.Wait(7000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.7
		SetTimecycleModifier("drug_wobbly")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Metamfetamina wdziera sie do Twojej podświadomości, drylując w myślach niczym młot pneumatyczny.")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		-- set + or - of maxhelath... 100 is 1% of health 1 is 100% of health
		--local newHealth = math.min(maxHealth , math.floor(health - maxHealth/70))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.2)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Czujesz, że efekt kryształów już Cię opuszcza.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

RegisterNetEvent('esx_fnkydrugs:onNitro')
AddEventHandler('esx_fnkydrugs:onNitro', function()
 --[[ local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
	
	SetTimecycleModifierStrength(1.0)
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*wkłada nochala do torby z płynem*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_DRINKING", 0, 1)
			Citizen.Wait(5000)
			ClearPedTasksImmediately(playerPed)
		end		
		Citizen.Wait(6000)
		SetTimecycleModifierStrength(2.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.0)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(2.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.0)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(2.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.5)
		Citizen.Wait(3000)
		SetTimecycleModifierStrength(1.1)
		Citizen.Wait(2000)
		SetTimecycleModifierStrength(0.9)
		Citizen.Wait(2000)
		SetTimecycleModifierStrength(0.5)
		Citizen.Wait(2000)
		SetTimecycleModifier("drug_flying_base")
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 1.0
		SetTimecycleModifier("drug_wobbly")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Nitro wdziera sie do Twojej podświadomości, drylując w myślach niczym młot pneumatyczny.")
		Citizen.Wait(5000)
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		local health = GetEntityHealth(playerPed)
		-- set + or - of maxhelath... 100 is 1% of health 1 is 100% of health
		local newHealth = math.min(maxHealth , math.floor(health - maxHealth/70))
		-- Healing
		SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.2)

		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Czujesz, że efekt dopalaczy już Cię opuszcza.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end]]--
		exports["acidtrip"]:DoAcid(120000)
	
end)


--Opium (Special as morphine for EMS)
RegisterNetEvent('esx_fnkydrugs:onOpium')
AddEventHandler('esx_fnkydrugs:onOpium', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local playerPed = GetPlayerPed(closestPlayer)
	if closestPlayer ~= -1 and closestDistance <= 0.8 then
	
	RequestAnimSet("move_m@drunk@moderatedrunk")
    end
	while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
      Citizen.Wait(0)
    end    
	-- Veri strong
	TargetDrugLevel = DrugLevel + 2.0
	SetTimecycleModifier("drug_wobbly")
	if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*postać wygląda na osłabioną*") end
    SetPedMotionBlur(playerPed, true)
    SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
    SetPedIsDrunk(playerPed, true)
	drugHigher(TargetDrugLevel)

    --Efects
    local player = PlayerId()
    SetRunSprintMultiplierForPlayer(player,0.1)
    SetSwimMultiplierForPlayer(player, 0.1)

    Wait(60000)
	SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
    SetRunSprintMultiplierForPlayer(player, 1.0)
    SetSwimMultiplierForPlayer(player, 1.0)
	-- This needs to be here, dunno why does not work as standalone function
	while (DrugLevel > 0.0 ) do
		DrugLevel = DrugLevel - 0.0001
		SetTimecycleModifierStrength(DrugLevel)
		Wait(10)
			if DrugLevel == 0 then
				SetRunSprintMultiplierForPlayer(player, 1.0)
			end
	end

 end)
 
 
--Coke 100%
RegisterNetEvent('esx_fnkydrugs:onCoke100')
AddEventHandler('esx_fnkydrugs:onCoke100', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hurry_butch@a") 
		while not HasAnimSetLoaded("move_m@hurry_butch@a") do
			Citizen.Wait(0)
		end     
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3ddo:shareDisplay', "*pochyla się nad kreską kokainy*") end
		
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HIKER_STANDING", 0, 1)	
		end
		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.6
		SetTimecycleModifier("mp_battle_int03_tint6")
		drugHigher(TargetDrugLevel)
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
		SetPedIsDrunk(playerPed, true)

		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.2)
		SetSwimMultiplierForPlayer(player, 1.2)
		-- Add armor
		SetPedArmour(playerPed, 10)
		-- Take HP
		--local newHealth = math.min(maxHealth , math.floor(health - maxHealth/50))
		-- HP mod
		--SetEntityHealth(playerPed, newHealth)
		
		Wait(50000)
		TriggerServerEvent('3dme:shareDisplayMe', "*ciężko oddycha*")
		SetRunSprintMultiplierForPlayer(player, 1.0)
		SetSwimMultiplierForPlayer(player, 1.0)
		SetPedArmour(playerPed, 0)
		
		Wait(globalDrugTime-50000) -- -50000 Due to add armor buff.
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)



--[[RegisterNetEvent('esx_fnkydrugs:onCoke90')
AddEventHandler('esx_fnkydrugs:onCoke90', function()
  print('dziala')
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hurry_butch@a") 
		while not HasAnimSetLoaded("move_m@hurry_butch@a") do
			Citizen.Wait(0)
		end     
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*pochyla się nad kreską kokainy*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HIKER_STANDING", 0, 1)	
		end
		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.4
		SetTimecycleModifier("mp_battle_int03_tint7")
		drugHigher(TargetDrugLevel)
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
		SetPedIsDrunk(playerPed, true)

		--Game mechanic effect section
		local player = PlayerId()  
		local health = GetEntityHealth(playerPed)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.1)
		SetSwimMultiplierForPlayer(player, 1.1)
		-- Add armor
		SetPedArmour(playerPed, 5)
		-- Take HP
		local newHealth = math.min(maxHealth , math.floor(health - maxHealth/60))
		-- HP mod
		SetEntityHealth(playerPed, newHealth)
		
		Wait(40000)
		TriggerServerEvent('3dme:shareDisplayMe', "*ciężko oddycha*")
		SetRunSprintMultiplierForPlayer(player, 1.0)
		SetSwimMultiplierForPlayer(player, 1.0)
		SetPedArmour(playerPed, 0)
		
		Wait(globalDrugTime-40000) -- -50000 Due to add armor buff.
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)
]]--

RegisterNetEvent('esx_fnkydrugs:onCoke70')
AddEventHandler('esx_fnkydrugs:onCoke70', function()
  local playerPed = GetPlayerPed(-1)
  local maxHealth = GetEntityMaxHealth(playerPed)
  
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hurry_butch@a") 
		while not HasAnimSetLoaded("move_m@hurry_butch@a") do
			Citizen.Wait(0)
		end     
		-- Trigger *action*
		if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*pochyla się nad kreską kokainy*") end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HIKER_STANDING", 0, 1)
		end
		-- Set visual fx type
		Citizen.Wait(10000)
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			ClearPedTasksImmediately(playerPed)
		end
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.2
		SetTimecycleModifier("mp_battle_int03_tint8")
		drugHigher(TargetDrugLevel)
		-- Walking cosmetics
		SetPedMovementClipset(playerPed, "move_m@hurry_butch@a", true)
		SetPedIsDrunk(playerPed, true)

		--Game mechanic effect section
		local player = PlayerId()  
		local health = GetEntityHealth(playerPed)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.15)
		-- Take HP
		--local newHealth = math.min(maxHealth , math.floor(health - maxHealth/80))
		-- HP mod
		--SetEntityHealth(playerPed, newHealth)
		
		Wait(50000)
		TriggerServerEvent('3dme:shareDisplayMe', "*ciężko oddycha*")
		SetRunSprintMultiplierForPlayer(player, 1.0)
		
		Wait(globalDrugTime-50000) -- -50000 Due to add armor buff.
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

RegisterNetEvent('esx_fnkydrugs:onAcid')
AddEventHandler('esx_fnkydrugs:onAcid', function()
local playerPed = GetPlayerPed(-1)
	if DrugLevel < maxDrugLevel then
		-- Set movement
		RequestAnimSet("move_m@hipster@a") 
		while not HasAnimSetLoaded("move_m@hipster@a") do
		Citizen.Wait(0)
		end    
		-- Trigger *action*
		if IsEntityPlayingAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 3) == false then  TriggerServerEvent('3dme:shareDisplayMe', "*wkłada sobie coś pod język*") end
		ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
		TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
		Citizen.Wait(3000)
		end)
		-- Set drug potency
		TargetDrugLevel = DrugLevel + 0.8
		SetTimecycleModifier("DRUG_gas_huffin")
		drugHigher(TargetDrugLevel)
		ESX.ShowHelpNotification("Faza sie wkreca")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local maxHealth = GetEntityMaxHealth(playerPed)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 1.15)
		-- Add armor
		SetPedArmour(playerPed, 10)
		-- Modify HP
		local rng = math.random(1,2)
			if rng == 1 then
				--local newHealth = math.min(maxHealth , math.floor(health - maxHealth/10))
				 -- SetEntityHealth(playerPed, newHealth)
				  
				  if IsEntityPlayingAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 3) == false then
				  ESX.ShowHelpNotification("*postać wygląda na zaniepokojoną*")
				  end
			else
				--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/11))
				--  SetEntityHealth(playerPed, newHealth)
					if IsEntityPlayingAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 3) == false then  
					ESX.ShowHelpNotification("*postać wygląda na zadowoloną*")
					end
			end
		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
			ClearPedTasksImmediately(playerPed)
		end
		ClearPedSecondaryTask(playerPed)
		
		SetRunSprintMultiplierForPlayer(player, 0.9)
		
		Wait(globalDrugTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		while (DrugLevel > 0.0 ) do
			DrugLevel = DrugLevel - 0.0001
			SetTimecycleModifierStrength(DrugLevel)
			Wait(10)
				if DrugLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
		end
		
	else
		ESX.ShowHelpNotification("Czujesz, że faza jest już za mocna...")
	end
end)

--Xanax
RegisterNetEvent('esx_fnkydrugs:onXanax')
AddEventHandler('esx_fnkydrugs:onXanax', function()
	local playerPed = GetPlayerPed(-1)
	local player = PlayerId()
	if IsEntityPlayingAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 3) == false then TriggerServerEvent('3dme:shareDisplayMe', "*wyciąga tabletkę z blistra i ją spożywa*") end
	ESX.Streaming.RequestAnimDict('mp_player_inteat@burger', function()
	TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
	end)
	Citizen.Wait(2000)
	if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then 
		ClearPedTasksImmediately(playerPed)
	end
	ClearPedSecondaryTask(playerPed)
	

	while (DrugLevel > 0.0 ) do
		DrugLevel = DrugLevel - 0.002
		SetTimecycleModifierStrength(DrugLevel)
		Wait(0)
		if DrugLevel <= 0.0 then
			SetRunSprintMultiplierForPlayer(player, 1.0)
			SetTimecycleModifierStrength(0.0)
			SetRunSprintMultiplierForPlayer(player, 1.0)
			SetSwimMultiplierForPlayer(player, 1.0)
			SetPedArmour(PlayerPedId(), 0)
			SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		end
	end
end)

--Alco
--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(0)
--		if DrunkLevel >= 0.3 then
--		isDrunk = true
--		else
--		isDrunk = false
--		end
--	end
--end)



--picie
RegisterNetEvent('esx_fnkydrugs:onBeer')
AddEventHandler('esx_fnkydrugs:onBeer', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_amb_beer_bottle'
		IsAnimated = true
	end
	
  	local playerPed = GetPlayerPed(-1)
  	local maxHealth = GetEntityMaxHealth(playerPed)
  	local beerStr = 0.085
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(playerPed, 18905)

	if DrunkLevel < maxDrunkLevel then
		-- Trigger *action*
		--if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*dookoła czuć zapach marihuany*") end
					AttachEntityToEntity(prop, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, 3.0, -1, 56, 1, 0, 0, 0)
		-- Set visual fx type
		Citizen.Wait(3000)
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		-- Set drug potency
		TargetDrunkLevel = DrunkLevel + beerStr
		SetTimecycleModifier("Drunk")
		drunkHigher(TargetDrunkLevel)
		ESX.ShowHelpNotification("Wypij piwa kilka kufli... Zaraz twój optymizm wzrośnie")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		--local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/50))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.9)

		Wait(globalDrunkTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		DrunkLevel = DrunkLevel - beerStr
			SetTimecycleModifierStrength(DrunkLevel)
			Wait(10)
				if DrunkLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end	
			end)
	else
		ESX.ShowHelpNotification("Jesteś tak pijany/a że nie jesteś w stanie trafić do ust i rozlewasz alkohol na siebie...")
	end
end)

RegisterNetEvent('esx_fnkydrugs:onWine')
AddEventHandler('esx_fnkydrugs:onWine', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'p_wine_glass_s'
		IsAnimated = true
	end

  	local playerPed = GetPlayerPed(-1)
  	local maxHealth = GetEntityMaxHealth(playerPed)
  	local beerStr = 0.16
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(playerPed, 18905)

	if DrunkLevel < maxDrunkLevel then
		-- Trigger *action*
		--if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*dookoła czuć zapach marihuany*") end
					AttachEntityToEntity(prop, playerPed, boneIndex, 0.06, -0.045, 0.055, -100.0, 0.0, -50.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, 3.0, -1, 56, 1, 0, 0, 0)
		-- Set visual fx type
		Citizen.Wait(3000)
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		-- Set drug potency
		TargetDrunkLevel = DrunkLevel + beerStr
		SetTimecycleModifier("Drunk")
		drunkHigher(TargetDrunkLevel)
		ESX.ShowHelpNotification("Otwieram wino ze swoją dziewczyną...")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		--local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/50))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.9)

		Wait(globalDrunkTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		DrunkLevel = DrunkLevel - beerStr
			SetTimecycleModifierStrength(DrunkLevel)
			Wait(10)
				if DrunkLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end
			end)	
	else
		ESX.ShowHelpNotification("Jesteś tak pijany/a że nie jesteś w stanie trafić do ust i rozlewasz alkohol na siebie...")
	end
end)

RegisterNetEvent('esx_fnkydrugs:onWhisky')
AddEventHandler('esx_fnkydrugs:onWhisky', function(prop_name)
	
	if not IsAnimated then
		prop_name = prop_name or 'prop_whiskey_bottle'
		IsAnimated = true
	end

  	local playerPed = GetPlayerPed(-1)
  	--local maxHealth = GetEntityMaxHealth(playerPed)
  	local beerStr = 0.22
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(playerPed, 18905)

	if DrunkLevel < maxDrunkLevel then
		-- Trigger *action*
		--if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*dookoła czuć zapach marihuany*") end
					AttachEntityToEntity(prop, playerPed, boneIndex, 0.02, -0.2, 0.065, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, 3.0, -1, 56, 1, 0, 0, 0)
		-- Set visual fx type
		Citizen.Wait(3000)
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		-- Set drug potency
		TargetDrunkLevel = DrunkLevel + beerStr
		SetTimecycleModifier("Drunk")
		drunkHigher(TargetDrunkLevel)
		ESX.ShowHelpNotification("Whisky moja żono...")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedIsDrunk(playerPed, true)
		
		
		--Game mechanic effect section
		--local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/50))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.9)

		Wait(globalDrunkTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		DrunkLevel = DrunkLevel - beerStr
			SetTimecycleModifierStrength(DrunkLevel)
			Wait(10)
				if DrunkLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end	
			end)
	else
		ESX.ShowHelpNotification("Jesteś tak pijany/a że nie jesteś w stanie trafić do ust i rozlewasz alkohol na siebie...")
	end
end)

RegisterNetEvent('esx_fnkydrugs:onVodka')
AddEventHandler('esx_fnkydrugs:onVodka', function(prop_name)
	if not IsAnimated then
		prop_name = prop_name or 'prop_shot_glass'
		IsAnimated = true
	end

  	local playerPed = GetPlayerPed(-1)
  --	local maxHealth = GetEntityMaxHealth(playerPed)
  	local beerStr = 0.25
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(playerPed, 18905)

	if DrunkLevel < maxDrunkLevel then
		-- Trigger *action*
		--if IsPedActiveInScenario(GetPlayerPed(-1)) == false then TriggerServerEvent('3dme:shareDisplayMe', "*dookoła czuć zapach marihuany*") end
					AttachEntityToEntity(prop, playerPed, boneIndex, 0.11, -0.015, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)

			ESX.Streaming.RequestAnimDict('mp_player_intdrink', function()
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 8.0, 3.0, -1, 56, 1, 0, 0, 0)
		-- Set visual fx type
		Citizen.Wait(3000)
		IsAnimated = false
		ClearPedSecondaryTask(playerPed)
		DeleteObject(prop)
		-- Set drug potency
		TargetDrunkLevel = DrunkLevel + beerStr
		SetTimecycleModifier("Drunk")
		drunkHigher(TargetDrunkLevel)
		ESX.ShowHelpNotification("Leże... leże... uwaliłem się jak zwierze... czystą... wódką!")
		-- Walking cosmetics
		SetPedMotionBlur(playerPed, true)
		SetPedIsDrunk(playerPed, true)
		

		--Game mechanic effect section
		--local player = PlayerId()  
		--local health = GetEntityHealth(playerPed)
		--local newHealth = math.min(maxHealth , math.floor(health + maxHealth/50))
		-- Healing
		--SetEntityHealth(playerPed, newHealth)
		-- Sprint modifier
		SetRunSprintMultiplierForPlayer(player, 0.9)

		Wait(globalDrunkTime)
		
		SetRunSprintMultiplierForPlayer(player, 1.0)		
		ESX.ShowHelpNotification("Powoli trzeźwiejesz... czujesz się trochę lepiej.")
				
		-- This needs to be here, dunno why does not work as standalone function
		DrunkLevel = DrunkLevel - beerStr
			SetTimecycleModifierStrength(DrunkLevel)
			Wait(10)
				if DrunkLevel == 0 then
					SetRunSprintMultiplierForPlayer(player, 1.0)
				end	
			end)
	else
		ESX.ShowHelpNotification("Jesteś tak pijany/a że nie jesteś w stanie trafić do ust i rozlewasz alkohol na siebie...")
	end
end)

--kontrola chodzenia xD
Citizen.CreateThread(function()
	local playerPed = GetPlayerPed(-1)
	while true do
	Citizen.Wait(0)
	--ESX.ShowHelpNotification(DrunkLevel)
		if DrunkLevel > 0.25 and DrunkLevel < 0.6 then
		RequestAnimSet("move_m@drunk@slightlydrunk")
			while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
			Citizen.Wait(0)
			end
		SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
		elseif DrunkLevel >= 0.6 and DrunkLevel < 1.2 then
		RequestAnimSet("move_m@drunk@moderatedrunk")
			while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
			Citizen.Wait(0)
			end
		SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
		elseif DrunkLevel >= 1.2 and DrunkLevel < 2.0 then
		RequestAnimSet("move_m@drunk@verydrunk")
			while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
			Citizen.Wait(0)
			end
		SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
		elseif DrunkLevel <= 0.25 and DrunkLevel >= 0.1 then
		RequestAnimSet("move_m@hipster@a")
			while not HasAnimSetLoaded("move_m@hipster@a") do
			Citizen.Wait(0)
			end
		SetPedMovementClipset(playerPed, "move_m@hipster@a", true)
		end
	end
end)
