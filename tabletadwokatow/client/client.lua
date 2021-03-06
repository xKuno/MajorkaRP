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

local PoliceGUI               = false
local PlayerData              = {}
local CurrentTask             = {}

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setjob2')
AddEventHandler('esx:setjob2', function(job2)
	PlayerData.job2 = job2
end)

Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(1)
		if PlayerData.job2 ~= nil and (PlayerData.job2.name == 'adwokat' or PlayerData.job2.name == 'offadwokat') then
			if IsControlJustPressed(0, Keys["PAGEUP"]) then
				if PlayerData.job2.name == 'adwokat' then
					if not PoliceGUI then
						SetNuiFocus(true, true)
						SendNUIMessage({type = 'open'})
						PoliceGUI = true
					end
				else
					ESX.ShowNotification("~r~Nie jeste?? na s??u??bie!")
				end
			end

			if IsControlJustReleased(0, Keys['E']) and CurrentTask.Busy then
				ESX.ShowNotification('Uniewa??ni??e??/a?? zaj??cie')
				ESX.ClearTimeout(CurrentTask.Task)
				ClearPedTasks(PlayerPedId())
			
				CurrentTask.Busy = false
			end
		end
	end
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'close'})
	PoliceGUI = false
end)

function UbezpieczeniePlayer(player, ilosc, powod)
	TriggerServerEvent("wyspa_jail_medycy:SendMessage", player, ilosc, powod)
end

RegisterNUICallback('ubezpieczenie', function(data, cb)
	local sender = GetPlayerServerId(player)
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	if closestPlayer ~= -1 and closestDistance <= 3.0 then
		UbezpieczeniePlayer(GetPlayerServerId(closestPlayer), data.ubezpieczenieamount, data.ubezpieczeniereason)
		ESX.ShowNotification('~p~Wp??acono ' .. data.ubezpieczenieamount / 2 .. '$ z ubezpieczenia na Twoje konto w banku')	
	end	
end)


RegisterNUICallback('kartotekalist', function(data, cb)
	ESX.TriggerServerCallback('wyspa_jail_medycy:getKartoteka', function (wynik)
        for i = 1, #wynik, 1 do
			SendNUIMessage({
			   type = 'kartoteka',
			   number = i,
			   imie = wynik[i].imie,
			   policjant = wynik[i].policjant,
			   powod = wynik[i].powod,
			   grzywna = wynik[i].grzywna,
			   ilosc_lat = wynik[i].ilosc_lat,
			   dataaa = wynik[i].data,
			   nazwisko = wynik[i].nazwisko
           })
        end
    end)
end)
