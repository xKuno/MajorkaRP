ESX 					  = nil
local CurrentActionData   = {}
local lastTime 			  = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_extraitems:umbrella')
AddEventHandler('esx_extraitems:umbrella', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 57005)
	
	RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
	while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('p_amb_brolly_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 2
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
		TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
		Citizen.Wait(30000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:rose')
AddEventHandler('esx_extraitems:rose', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)
	local boneIndex = GetPedBoneIndex(playerPed, 57005)
	
	RequestAnimDict('amb@code_human_wander_drinking@beer@male@base')
	while not HasAnimDictLoaded('amb@code_human_wander_drinking@beer@male@base') do
		Citizen.Wait(10)
	end
	
	ESX.Game.SpawnObject('p_single_rose_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z + 2
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.10, 0, -0.001, 80.0, 150.0, 200.0, true, true, false, true, 1, true)
		TaskPlayAnim(playerPed, "amb@code_human_wander_drinking@beer@male@base", "static", 3.5, -8, -1, 49, 0, 0, 0, 0)
		Citizen.Wait(30000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:donut')
AddEventHandler('esx_extraitems:donut', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_donut_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(6500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:oxygen_mask')
AddEventHandler('esx_extraitems:oxygen_mask', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 12844)
	local boneIndex2 = GetPedBoneIndex(playerPed, 24818)
	
	ESX.Game.SpawnObject('p_s_scuba_mask_s', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		ESX.Game.SpawnObject('p_s_scuba_tank_s', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object2)
		if not IsPedInAnyVehicle(playerPed, true) then
			AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification(_U('dive_suit_on') .. '%.')
			Citizen.Wait(100000)
			ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '')
			
			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			ClearPedSecondaryTask(playerPed)
		else
			SetPedDiesInWater(playerPed, false)
			
			ESX.ShowNotification(_U('dive_suit_on') .. '%.')
			Citizen.Wait(100000)
			ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '')
			Citizen.Wait(50000)
			ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '')
			
			SetPedDiesInWater(playerPed, true)
			DeleteObject(object)
			DeleteObject(object2)
			end
		end)
	end)
end)

RegisterNetEvent('esx_extraitems:sandwich')
AddEventHandler('esx_extraitems:sandwich', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_sandwich_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(6500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:redgull')
AddEventHandler('esx_extraitems:redgull', function()
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
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	ESX.ShowNotification(_U('redgull_consumed'))
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification(_U('redgull_end'))
end)

RegisterNetEvent('esx_extraitems:water')
AddEventHandler('esx_extraitems:water', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('ba_prop_club_water_bottle', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.11, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:cocacola')
AddEventHandler('esx_extraitems:cocacola', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_ecola_can', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.11, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:coffe')
AddEventHandler('esx_extraitems:coffe', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('ng_proc_coffee_01a', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.11, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:tequila')
AddEventHandler('esx_extraitems:tequila', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_cocktail_glass', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.11, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:milk')
AddEventHandler('esx_extraitems:milk', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_cs_milk_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.11, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)


--[[RegisterNetEvent('esx_extraitems:aloes_pooch')
AddEventHandler('esx_extraitems:aloes_pooch', function()
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
	
			SetEntityHealth(GetPlayerPed(-1), 150)
			Citizen.Wait(800)
			SetEntityHealth(GetPlayerPed(-1), 155)
			Citizen.Wait(900)
			SetEntityHealth(GetPlayerPed(-1), 165)
			Citizen.Wait(950)
			SetEntityHealth(GetPlayerPed(-1), 175)
			Citizen.Wait(975)
			SetEntityHealth(GetPlayerPed(-1), 185)
			Citizen.Wait(985)
			SetEntityHealth(GetPlayerPed(-1), 195)
			Citizen.Wait(995)
			SetEntityHealth(GetPlayerPed(-1), 200)
			Citizen.Wait(1000)
	
	
	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 5
	end
	ESX.ShowNotification(_U('redgull_end'))
end)]]--

RegisterNetEvent('esx_extraitems:picnic')
AddEventHandler('esx_extraitems:picnic', function()
	local playerPed = GetPlayerPed(-1)
	local coords    = GetEntityCoords(playerPed)

	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x,
		y = coords.y,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x ,
		y = coords.y -0.9,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_yoga_mat_02',  {
		x = coords.x ,
		y = coords.y +0.9,
		z = coords.z -1
	}, function(object)
	end)
	ESX.Game.SpawnObject('prop_champset',  {
		x = coords.x ,
		y = coords.y ,
		z = coords.z -1
	}, function(object)
	end)
end)

RegisterNetEvent('esx_extraitems:sokzwinogron')
AddEventHandler('esx_extraitems:sokzwinogron', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_food_bs_juice01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 0.95, -1.0, 5000, 0, 1, true, true, true)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.04, 0.008, 0.05, -40.0, 115.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)

RegisterNetEvent('esx_extraitems:hamburger')
AddEventHandler('esx_extraitems:hamburger', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_cs_burger_01', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex2, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
		Citizen.Wait(6500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
end)

RegisterNetEvent('esx_extraitems:winogron')
AddEventHandler('esx_extraitems:winogron', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('ng_proc_food_aple2a', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, 0.1, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)

RegisterNetEvent('esx_extraitems:bread')
AddEventHandler('esx_extraitems:bread', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
	while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('v_ret_247_bread1', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, 0.1, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)

RegisterNetEvent('esx_extraitems:chocolate')
AddEventHandler('esx_extraitems:chocolate', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_inteat@burger')
	while not HasAnimDictLoaded('mp_player_inteat@burger') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_choc_ego', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "mp_player_inteat@burger", "mp_player_int_eat_burger_fp", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.08, 0.02, 0.02, 60.0, -30.0, -70.0, true, true, false, true, 1, true)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)
--TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)

RegisterNetEvent('esx_extraitems:zestaw')
AddEventHandler('esx_extraitems:zestaw', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@world_human_seat_wall_eating@male@both_hands@base')
	while not HasAnimDictLoaded('amb@world_human_seat_wall_eating@male@both_hands@base') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_food_cb_tray_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@world_human_seat_wall_eating@male@both_hands@base", "base", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, -60.0, 300.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(2500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)

RegisterNetEvent('esx_extraitems:pizza')
AddEventHandler('esx_extraitems:pizza', function()
	local playerPed  = GetPlayerPed(-1)
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('amb@world_human_seat_wall_eating@male@both_hands@base')
	while not HasAnimDictLoaded('amb@world_human_seat_wall_eating@male@both_hands@base') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_pizza_box_02', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		TaskPlayAnim(playerPed, "amb@world_human_seat_wall_eating@male@both_hands@base", "base", 3.5, -8, -1, 49, 0, 0, 0, 0)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.12, 0.028, 0.001, -60.0, 300.0, 0.0, true, true, false, true, 1, true)
		Citizen.Wait(2500)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)
	
end)


RegisterNetEvent('esx_extraitems:drink')
AddEventHandler('esx_extraitems:drink', function()
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
	
end)

RegisterNetEvent('esx_extraitems:bandage')
AddEventHandler('esx_extraitems:bandage', function(source)
	local playerPed = GetPlayerPed(-1)
	local health = GetEntityHealth(playerPed)
	local maxHealth = GetEntityMaxHealth(playerPed)
	local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 10)) -- 16

	if IsPedSittingInAnyVehicle(playerPed) then
		ESX.ShowNotification(_U('error_veh'))
	else
		if IsPedOnFoot(playerPed) then
			local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01'
			ESX.Streaming.RequestAnimDict(lib, function()
				TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)

				Citizen.Wait(500)
				while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
					Citizen.Wait(0)
					DisableAllControlActions(0)
				end

				SetEntityHealth(playerPed, newHealth)
				ESX.ShowNotification('Odrazu lepiej!')
			end)
		else
			ESX.ShowNotification(_U('error_no_foot'))
		end
	end
end)





