Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent("defib:123")
AddEventHandler("defib:123", function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local health = GetEntityHealth(closestPlayerPed)
	if closestPlayer == -1 or closestDistance > 3.0 then
		ESX.ShowNotification("~r~W pobliżu nie ma gracza")
	else
		if health == 0 then
			local playerPed = GetPlayerPed(-1)

			ESX.ShowNotification("~y~Trwa resuscytacja")
			TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
			Citizen.Wait(10000)
			ClearPedTasks(playerPed)

			TriggerServerEvent('esx_ambulancejob:revive1', GetPlayerServerId(closestPlayer))
		else
			ESX.ShowNotification("Ta osoba nie potrzebuje ~y~defibrylatora")
		end
	end
end)