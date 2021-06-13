ESX 					  = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_gazetka:uzyj')
AddEventHandler('esx_gazetka:uzyj', function()
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_TOURIST_MAP", 0, false)
end)


