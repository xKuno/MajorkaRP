local sirene = 1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
	
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then	
			-- Check si le joueurs est conducteur
			local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))	
			local NetId = NetworkGetNetworkIdFromEntity(veh)
			if GetPedInVehicleSeat(veh, -1) == GetPlayerPed(-1) then
				-- Check si il est dans un véhicule de police / EMS
				if GetVehicleClass(veh) == 18 then
					--DisableControlAction(0, 34, true)
					if IsDisabledControlJustReleased(0, 47) then
						if sirene == 0 then
							-- on
							TriggerServerEvent("siren:sync", sirene, NetId)
							sirene = 1
						else
							-- off
							TriggerServerEvent("siren:sync", sirene, NetId)
							sirene = 0
						end
					end
				end
			else
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

RegisterNetEvent("siren:ClientSync")
AddEventHandler("siren:ClientSync", function(sync, NetId)
	local veh = NetworkGetEntityFromNetworkId(NetId)
	if sync == 0 then
		DisableVehicleImpactExplosionActivation(veh, 0)
	elseif sync == 1 then
		DisableVehicleImpactExplosionActivation(veh, 1)
	end
end)
