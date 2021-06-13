-- CLIENTSIDED

-- Registers a network event
RegisterNetEvent('EngineToggle:Engine')
RegisterNetEvent('EngineToggle:RPDamage')

local vehicles = {}; RPWorking = true
local pokazalwiadomosc = false
local UseKey = true
local ToggleKey = 29

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if UseKey and ToggleKey then
			if IsControlJustReleased(1, ToggleKey) then
			  -- local ped = GetPlayerPed(-1)
			--local vehicle = GetVehiclePedIsIn(ped, false)
			--if IsValidVehicle(vehicle) then
				TriggerEvent('EngineToggle:Engine')
				end
		--	end
		end
		if GetSeatPedIsTryingToEnter(GetPlayerPed(-1)) == -1 and not table.contains(vehicles, GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))) then
			table.insert(vehicles, {GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)), IsVehicleEngineOn(GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)))})
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), false) and not table.contains(vehicles, GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
			table.insert(vehicles, {GetVehiclePedIsIn(GetPlayerPed(-1), false), IsVehicleEngineOn(GetVehiclePedIsIn(GetPlayerPed(-1), false))})
		end
		for i, vehicle in ipairs(vehicles) do
			if DoesEntityExist(vehicle[1]) then
				if (GetPedInVehicleSeat(vehicle[1], -1) == GetPlayerPed(-1)) or IsVehicleSeatFree(vehicle[1], -1) then
					if RPWorking then
						SetVehicleEngineOn(vehicle[1], vehicle[2], false, false)
						SetVehicleJetEngineOn(vehicle[1], vehicle[2])
						if not IsPedInAnyVehicle(GetPlayerPed(-1), false) or (IsPedInAnyVehicle(GetPlayerPed(-1), false) and vehicle[1]~= GetVehiclePedIsIn(GetPlayerPed(-1), false)) then
							if IsThisModelAHeli(GetEntityModel(vehicle[1])) or IsThisModelAPlane(GetEntityModel(vehicle[1])) then
								if vehicle[2] then
									SetHeliBladesFullSpeed(vehicle[1])
								end
							end
						end
					end
				end
			else
				table.remove(vehicles, i)
			end
		end
	end
end)

function IsValidVehicle( veh )
    local model = GetEntityModel( veh )

    if ( IsThisModelACar( model ) or IsThisModelABike( model ) or IsThisModelAQuadbike( model ) ) then
        return true
    else
        return false
    end
end


function ManageVehicleDamage()
    local ped = GetPlayerPed(-1)

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
    	if (IsPedSittingInAnyVehicle(ped)) then
			local vehicle = GetVehiclePedIsIn(ped, false)

			if (GetPedInVehicleSeat(vehicle, -1) == ped) then
				local damage = GetVehicleEngineHealth(vehicle)
				local damahe = GetVehicleBodyHealth(vehicle)
				body2 = math.floor(damahe-900)
				body3 = (body2 * 10.001)

				if IsValidVehicle (vehicle) then
					--[[
					local handling  =  GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
					local handling1 = GetVehicleHandlingFloat(vehicle,"CHandlingData","fEngineDamageMult")
					local handling2 = GetVehicleHandlingFloat(vehicle,"CHandlingData","fDeformationDamageMult")
					local handling3 = GetVehicleHandlingFloat(vehicle,"CHandlingData","fWeaponDamageMult")
					local handling4 = GetVehicleHandlingFloat(vehicle,"CHandlingData","fCollisionDamageMult")
					if handling1 ~= 1.5  or handling2 ~= 3.0 or handling3 ~= 1.5 or handling4 ~= 1.5 then
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fEngineDamageMult', 1.7)
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fCollisionDamageMult', 2.9)
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fDeformationDamageMult', 0.8)
						SetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fWeaponDamageMult', 2.5)
					end
					]]--
					if damage >= 700 then
						UszkodzonyPojazd = false
						TriggerEvent('EngineToggle:RPDamage', true)
						pokazalwiadomosc = false
					elseif damage < 550 and damage >= 400 then
						UszkodzonyPojazd = true
						--SetEntityMaxSpeed(vehicle, handling*0.5)
						SetVehicleEngineHealth(vehicle, damage - 25)
						TriggerEvent('EngineToggle:RPDamage', true)
						pokazalwiadomosc = false
					elseif damage < 400 then
						UszkodzonyPojazd = true
						SetVehicleUndriveable(vehicle,true)
						TriggerEvent('EngineToggle:RPDamage', false)
						if not pokazalwiadomosc then
							TriggerEvent("pNotify:SendNotification", {text = 'Silnik Uszkodzony! Udaj się do mechanika!'})
							pokazalwiadomosc = true
						end
					end
				end
			end
    	end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(2500)
		ManageVehicleDamage()
    end
end)

AddEventHandler('EngineToggle:Engine', function()
	local veh
	local StateIndex
	for i, vehicle in ipairs(vehicles) do
		if vehicle[1] == GetVehiclePedIsIn(GetPlayerPed(-1), false) then
			veh = vehicle[1]
			StateIndex = i
		end
	end
	Citizen.Wait(500)
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then 
		if (GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1)) then
			vehicles[StateIndex][2] = not GetIsVehicleEngineRunning(veh)
			if vehicles[StateIndex][2] then
				TriggerEvent("pNotify:SendNotification", {text = 'Silnik Wlaczony!'})
			else
				TriggerEvent("pNotify:SendNotification", {text = 'Silnik Wylaczony!'})
			end
		end 
    end 
end)

AddEventHandler('EngineToggle:RPDamage', function(State)
	RPWorking = State
end)

function table.contains(table, element)
  for _, value in pairs(table) do
    if value[1] == element then
      return true
    end
  end
  return false
end
