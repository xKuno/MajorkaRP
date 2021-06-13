ESX = nil

local connected = false
local playerLoaded = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)
--[[AddEventHandler("playerSpawned", function()
	if connected == false then
		TriggerServerEvent('quantum_servicecounting:connectPlayer')
		connected = true
	end
end)]]--


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	if not playerLoaded then 
		TriggerServerEvent('quantum_servicecounting:connectPlayer')
		PlayerLoaded = true
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	TriggerServerEvent('quantum_servicecounting:setJob', ESX.PlayerData.job.name, job.name)
	ESX.PlayerData.job = job
end)

--[[ 
*HOW TO USE TEGO GOWNA :)*

ESX.TriggerServerCallback('quantum_servicecounting:getServicesCount', function(count)
	print(count)
end, 'police')

ESX.TriggerServerCallback('quantum_servicecounting:getAllServices', function(table)
	for k,v in pairs(table) do
		print(v)
	end
end, 'police')
]]--