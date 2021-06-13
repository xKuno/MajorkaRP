local myJob 					= nil
local isDead 					= false


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

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	PlayerData.job2 = job2
	Citizen.Wait(5000)
end)
--[[
AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerServerEvent('esx_rpchat:revive')
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
	TriggerServerEvent('esx_rpchat:die')
end)

]]--
RegisterNetEvent('sendProximityMessage')
AddEventHandler('sendProximityMessage', function(id, name, message, color)
	color = color or  {51, 77, 77}
	local pid = GetPlayerFromServerId(id)
	if pid and pid ~= -1 then
		local ped = GetPlayerPed(pid)
		if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(ped, true)) < 15 or PlayerId() == GetPlayerFromServerId(id) then
			TriggerEvent('chatMessage', name, color , message)
		end
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/dw',  _U('dark_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/handlarz',  _U('handlarz_help') )
    TriggerEvent('chat:addSuggestion', '/czapka',  _U('itdel_help') )


end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/twt')
		TriggerEvent('chat:removeSuggestion', '/dark')
	end
end)

RegisterNetEvent('pokaDw')
AddEventHandler('pokaDw', function(id, message)
    PlayerData = ESX.GetPlayerData()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then


    else
		TriggerEvent('chatMessage',"💻 DARKNET", {0, 0, 0, 0})
    end
end)



