
--[[
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsPedInAnyVehicle(GetPlayerPed(-1), true) then
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local vehicleClass = GetVehicleClass(vehicle)
		local carModel = GetEntityModel(vehicle)
			if vehicleClass == 15 or vehicleClass == 16 then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)
]]--
local chujdodriveby = true
local PlayerData, CurrentAction = {}
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  	end
  
  	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

  	while ESX.GetPlayerData().job2 == nil do
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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Wait(10)
		local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local speed = GetEntitySpeed(vehicle)
		local kmh = 3.6
	--	local mph = 2.23694
		local vehicleClass = GetVehicleClass(vehicle)
		local vehicleModel = GetEntityModel(vehicle)
		if PlayerData.job2 then
			if PlayerData.job2 ~= nil and (PlayerData.job2.name == 'balas' or PlayerData.job2.name == 'families' or PlayerData.job2.name == 'menel' or PlayerData.job2.name == 'vagos' or PlayerData.job2.name == 'crips'
			or PlayerData.job2.name == 'lost' or PlayerData.job2.name == 'swat') then	
				if math.floor(speed*kmh) > 50 and vehicleClass ~= 15 and vehicleClass ~= 16 then
					SetPlayerCanDoDriveBy(PlayerId(), false)
				elseif chujdodriveby then
					SetPlayerCanDoDriveBy(PlayerId(), true)
				elseif vehicleClass == 15 or vehicleClass == 16 then
						SetPlayerCanDoDriveBy(PlayerId(), true)
				elseif not chujdodriveby then 
					SetPlayerCanDoDriveBy(PlayerId(), false)
				else
					SetPlayerCanDoDriveBy(PlayerId(), false)
				end
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end 
		else
			Citizen.Wait(500)   
		end
	end
end)

local vehicleClassDisableControl = {
    [0] = true,     --compacts
    [1] = true,     --sedans
    [2] = true,     --SUV's
    [3] = true,     --coupes
    [4] = true,     --muscle
    [5] = true,     --sport classic
    [6] = true,     --sport
    [7] = true,     --super
    [8] = false,    --motorcycle
    [9] = true,     --offroad
    [10] = true,    --industrial
    [11] = true,    --utility
    [12] = true,    --vans
    [13] = false,   --bicycles
    [14] = false,   --boats
    [15] = false,   --helicopter
    [16] = false,   --plane
    [17] = true,    --service
    [18] = true,    --emergency
    [19] = false    --military
}

-- Main thread
Citizen.CreateThread(function()
    while true do
        -- Loop forever and update every frame
        Citizen.Wait(1)

        -- Get player, vehicle and vehicle class
        local player = GetPlayerPed(-1)
        local vehicle = GetVehiclePedIsIn(player, false)
        local vehicleClass = GetVehicleClass(vehicle)

        -- Disable control if player is in the driver seat and vehicle class matches array
        if ((GetPedInVehicleSeat(vehicle, -1) == player) and vehicleClassDisableControl[vehicleClass]) then
            -- Check if vehicle is in the air and disable L/R and UP/DN controls
            if IsEntityInAir(vehicle) then
                DisableControlAction(2, 59)
                DisableControlAction(2, 60)
            end
				local roll = GetEntityRoll(vehicle)
				if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(vehicle) < 2 then
					DisableControlAction(2,59,true) -- Disable left/right
					DisableControlAction(2,60,true) -- Disable up/down
					DisableControlAction(2,108,true) -- Disable up/down
					DisableControlAction(2,36,true) -- Disable up/down
					DisableControlAction(2,21,true) -- Disable up/down
				end
        end
    end
end)
