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

local CurrentTest       = nil
local zdal 				= false
local FirstSpawn    	= true

local FirstSpawn, PlayerLoaded = true, false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

AddEventHandler('playerSpawned', function()
	if FirstSpawn then
		exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		FirstSpawn = false
			while not PlayerLoaded do
				Citizen.Wait(12500)
			end
		--	TriggerServerEvent('esx_quiz:didQuestion')
			
	end
end)

--[[AddEventHandler('playerSpawned', function()
	Citizen.CreateThread(function()
		while not PlayerLoaded do
			Citizen.Wait(12500)
		end

		if not FirstSpawn then
			TriggerServerEvent('esx_quiz:didQuestion')
		else
			FirstSpawn = false
		end
	end)
end)]]--

RegisterNetEvent('esx_quiz:notMade')
AddEventHandler('esx_quiz:notMade', function()
	StartTheoryTest()
end)

RegisterNetEvent('esx_quiz:chuj')
AddEventHandler('esx_quiz:chuj', function()
	StartTheoryTest()
end)

function StartTheoryTest()
	CurrentTest = 'rp'

	SendNUIMessage({
		openQuestion = true
	})

	ESX.SetTimeout(200, function()
		SetNuiFocus(true, true)
	end)

	ESX.SetTimeout(300*1000, function()
		if CurrentTest == 'rp' then
			StopTheoryTest(false)
			SetNuiFocus(false, false)
		end
	end)

end

function StopTheoryTest(success)
	CurrentTest = nil

	SendNUIMessage({
		openQuestion = false
	})

	SetNuiFocus(false)

	if success then
		zdal = true
		ESX.ShowNotification(_U('passed_test'))
		TriggerServerEvent('esx_quiz:success')
		TriggerEvent('esx_skin:playerRegistered')
	else
		zdal = false
		Citizen.Wait(500)
		ESX.ShowNotification(_U('failed_test'))
		ESX.ShowNotification(('~r~Nie zaliczyles quizu, zostaniesz wyrzucony za 5 sekund!'))
		Citizen.Wait(1000)
		ESX.ShowNotification(('~r~Nie zaliczyles quizu, zostaniesz wyrzucony za 4 sekundy!'))
		Citizen.Wait(1000)
		ESX.ShowNotification(('~r~Nie zaliczyles quizu, zostaniesz wyrzucony za 3 sekundy!'))
		Citizen.Wait(1000)
		ESX.ShowNotification(('~r~Nie zaliczyles quizu, zostaniesz wyrzucony za 2 sekundy!'))
		Citizen.Wait(1000)
		ESX.ShowNotification(('~r~Nie zaliczyles quizu, zostaniesz wyrzucony za 1 sekunde!'))
		Citizen.Wait(1000)
		TriggerServerEvent('esx_quiz:kick')
	end
end

RegisterNUICallback('question', function(data, cb)
	SendNUIMessage({
		openSection = 'question'
	})

	cb('OK')
end)

RegisterNUICallback('close', function(data, cb)
	StopTheoryTest(true)
	TriggerServerEvent('esx_quiz:success')
	zdal = true
	cb('OK')
end)

RegisterNUICallback('kick', function(data, cb)
	StopTheoryTest(false)
--	TriggerServerEvent('esx_quiz:kick')
	zdal = false
	cb('OK')
end)

-- Block UI
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)

		if CurrentTest == 'rp' then
			local playerPed = PlayerPedId()

			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisablePlayerFiring(playerPed, true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)