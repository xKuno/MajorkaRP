local blips = {}
local PlayerData                = {}
local GUI                       = {}
local sData 					= false
local playerCanSee 				= false
local PlayerData                = {}
local players 					= {}
local playerlist 				= {}
ESX                             = nil





Citizen.CreateThread(function()
  while ESX == nil do
   TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(1)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  	PlayerData = xPlayer
end)


RegisterNetEvent('esx_tracker:wyjebalgpslubteznie')
AddEventHandler('esx_tracker:wyjebalgpslubteznie', function(ococichodziejziom)
	if ococichodziejziom == 1 then
		sData = false
	elseif ococichodziejziom == 2 then
		sData = true
	end
end)