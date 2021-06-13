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
local PlayerData = {}
ESX = nil
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
local craft = false

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function menu_makeweapons(menu_name)
	local elements = {
	}

	if PlayerData.job2 ~= nil then
		if PlayerData.job2.name == 'shadow' then
			table.insert(elements, {label = "Złóż Pistolet SNS MK II", value = '3'})
		elseif PlayerData.job2.name == 'gabrys' then
			table.insert(elements, {label = "Złóż Pistolet Vintage", value = '2'})
		elseif PlayerData.job2.name == 'bloods' then
			table.insert(elements, {label = "Złóż Pistolet MK II", value = '1'})
		elseif PlayerData.job2.name == 'pruszkowski' then
			table.insert(elements, {label = "Złóż Pistolet MK II", value = '1'})
		elseif PlayerData.job2.name == 'sicario' then
			table.insert(elements, {label = "Złóż Pistolet Ceramiczny" , value = '4'})
		end
	end	

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'weaponcraft_menu',
	{
		title    = menu_name,
		align    = 'center',
		elements = elements
	}, function(data, menu)
		local action = data.current.value
			TriggerServerEvent('esx_makeweapons:craftweapon', action)
	ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx_makeweapons:craftuje')
AddEventHandler('esx_makeweapons:craftuje', function()
	if craft == false then
		craft = true
	else
		ESX.ShowNotification('Jesteś w trakcie wytwarzania broni!')
	end

end)

RegisterNetEvent('esx_makeweapons:notifikacje')
AddEventHandler('esx_makeweapons:notifikacje', function(typ)
	if typ == 1 then 
		TriggerEvent("pNotify:SendNotification",{
			text = ('Wytwarzasz Broń <b style = color:red>(500s)</span>'),
			type = "error",
			timeout = (Config.CzasRobieniabroni * 1000),
			layout = "bottomCenter",
			queue = "bronie",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	elseif typ == 2 then
		TriggerEvent("pNotify:SendNotification",{
			text = ('Wytwarzasz Komponent Do Broni <b style = color:red>(30s)</span>'),
			type = "error",
			timeout = (Config.CzasRobieniaKomponentow * 1000),
			layout = "bottomCenter",
			queue = "bronie",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	elseif typ == 3 then
		TriggerEvent("pNotify:SendNotification",{
			text = ('Wytwarzasz Ammunicje 9mm <b style = color:red>(5s)</span>'),
			type = "error",
			timeout = (Config.CzasRobieniaAmmo * 1000),
			layout = "bottomCenter",
			queue = "bronie",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	end

end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        for k,v in pairs(Config.Zones) do
            if PlayerData.job2 ~= nil and (PlayerData.job2.name == 'shadow' or PlayerData.job2.name == 'sicario' or PlayerData.job2.name == 'gabrys'  or PlayerData.job2.name == 'pruszkowski' or PlayerData.job2.name == 'bloods'
            	or PlayerData.job2.name == 'balas' or PlayerData.job2.name == 'families' or PlayerData.job2.name == 'crips' or PlayerData.job2.name == 'vagos') then
	            	if v.Job == PlayerData.job2.name and v.Grade <= PlayerData.job2.grade then
		                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2) then
		                    DisplayHelpText(v.Text)
		                end

		                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 50) then
		                    DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
		                end
		                if(v.Type ~= -1 and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < 2) and IsControlJustReleased(0, 38) then
							menu_name = v.Name
							if v.menu_label == "make_weapons" or v.menu_label == "make_weaponsv2" or v.menu_label== "make_weaponsv3" or v.menu_label== "make_weaponsv4" or v.menu_label== "make_weaponsv5" then
								menu_makeweapons(menu_name)
							elseif v.menu_label == "barrel_craft" or v.menu_label== "barrel_craftv2" or v.menu_label== "barrel_craftv3" or  v.menu_label== "barrel_craftv4" or v.menu_label== "barrel_craftv5"  then
								if craft == false then
									craft = true
									TriggerServerEvent('esx_makeweapons:craftbarrel')
								end
							elseif v.menu_label == "spring_craft" or v.menu_label== "spring_craftv2" or v.menu_label== "spring_craftv3" or v.menu_label== "spring_craftv4" or v.menu_label== "spring_craftv5" then
								if craft == false then
									craft = true
									TriggerServerEvent('esx_makeweapons:craftspring')
								end
							elseif v.menu_label == "lock_craft" or v.menu_label== "lock_craftv2" or v.menu_label == "lock_craftv3" or v.menu_label == "lock_craftv4" or v.menu_label == "lock_craftv5" then
								if craft == false then
									craft = true
									TriggerServerEvent('esx_makeweapons:craftlock')
								end
							elseif v.menu_label == "make_ammo" or  v.menu_label == "make_ammov2" or v.menu_label== "make_ammov3" or v.menu_label == "make_ammov4" then
								if craft == false then
									craft = true
								TriggerServerEvent('esx_makeweapons:craftammo')
								end
							end	
							end
		                end   	  	
            	     end
               end
    end
end)

RegisterNetEvent('esx_makeweapons:shownotification')
AddEventHandler('esx_makeweapons:shownotification', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('esx_makeweapons:startanim')
AddEventHandler('esx_makeweapons:startanim', function(source)
	TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_PARKING_METER", 0, false)
end)
RegisterNetEvent('esx_makeweapons:stopanim')
AddEventHandler('esx_makeweapons:stopanim', function(source)
	ClearPedTasksImmediately(GetPlayerPed(-1))
end)
RegisterNetEvent('esx_makeweapons:givedamage')
AddEventHandler('esx_makeweapons:givedamage', function(source)
	local health = GetEntityHealth(playerPed)
	if health > Config.damage then
		ApplyDamageToPed(GetPlayerPed(-1), Config.damage, false)
	end
end)
RegisterNetEvent('esx_makeweapons:craftend')
AddEventHandler('esx_makeweapons:craftend', function(source)
	craft = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
 
        if craft then
            DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, Keys['R'], true) -- Reload
            DisableControlAction(2, Keys['SPACE'], true) -- Jump
            DisableControlAction(2, Keys['Q'], true) -- Cover
            DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(2, Keys['E'], true) -- Select Weapon
            DisableControlAction(2, Keys['F1'], true) -- Disable phone
            DisableControlAction(2, Keys['F2'], true) -- Inventory
            DisableControlAction(2, Keys['F3'], true) -- Animations
            DisableControlAction(2, Keys['F6'], true) -- Animations
            DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(2, Keys['P'], true) -- Disable pause screen
            DisableControlAction(2, Keys['F9'], true) -- Disable pause screen
            DisableControlAction(2, 59, true) -- Disable steering in vehicle
            DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            ---[DisableControlAction(0, 75, true)  -- Disable exit vehicle
            --DisableControlAction(27, 75, true) -- Disable exit vehicle
            DisableControlAction(0, 21, true)  -- Bieganie
            DisableControlAction(0, Keys[','], true)  -- Bieganie
            DisableControlAction(1, Keys[','], true)  -- Bieganie
            DisableControlAction(2, Keys[','], true)  -- Bieganie
			DisableControlAction(1, Keys['B'], true) -- Disable going stealth
			DisableControlAction(0, Keys['B'], true) -- Disable going stealth
			DisableControlAction(3, Keys['B'], true) -- Disable going stealth
            DisableControlAction(0, Keys['='], true)  -- Bieganie
            DisableControlAction(1, Keys['='], true)  -- Bieganie
            DisableControlAction(2, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['X'], true)  -- Bieganie
        end
    end
end)