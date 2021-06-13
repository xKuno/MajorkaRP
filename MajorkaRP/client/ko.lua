

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

local knockedOut = false
local blockuj = false
local wait = 120000
local count = 10000

RegisterCommand("hp",function(source, args)
	local myPed = GetPlayerPed(-1)
	SetEntityHealth(myPed, 105)
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local myPed = GetPlayerPed(-1)
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 130 then
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				--ShowNotification("~r~Zemdlałeś!\n~r~Zemdlałeś!\n~r~Zemdlałeś!\n~r~Zemdlałeś!\n~r~Zemdlałeś!")
				SzowText("~r~Straciłeś przytomność...")
				TriggerServerEvent('3ddo:shareDisplay', 'Stracił przytomność...')
				wait = 120000
				knockedOut = true
				blockuj = true
				--SetEntityHealth(myPed, 110)
			end
		end
		if knockedOut == true then
			StartScreenEffect('ChopVision', 0, false)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			if wait >= 0 then
				count = count - 1000
				if count == 0 then
					count = 10000
					wait = wait - 1000
					--print(wait)
					if wait == 30000 then
						if not IsPedDeadOrDying(myPed) then
							--ShowNotification("~o~Odzyskałeś przytomność!\n~o~Odzyskałeś przytomność!\n~o~Odzyskałeś przytomność!\n")
							SzowText("~b~Odzyskałeś przytomność!")
							blockuj = false
						else
							blockuj = false	
						end
					end
					if wait == 5000 then
						if not IsPedDeadOrDying(myPed) then
							SzowText("~g~Odzyskałeś czucie w nogach!")
						else
							blockuj = false
						end
					end
					if wait == 0 then
						if not IsPedDeadOrDying(myPed) then
							SzowText("~b~Nacisnij E aby wstać!")
						else
							blockuj = false
						end
					end
				--SetEntityHealth(myPed, GetEntityHealth(myPed)+4)
				end
			end
			if wait <= 0 then
				if IsControlJustReleased(0, Keys['E']) then
					knockedOut = false
					blockuj = false
				else
					knockedOut = true
				end
			end	
			if IsPedDeadOrDying(myPed) then
				knockedOut = false
				blockuj = false
			end
		end
	end
end)

local letsleep = 1
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(letsleep)
		if blockuj then
			letsleep = 1
			DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, Keys['R'], true) -- Reload
            DisableControlAction(2, Keys['SPACE'], true) -- Jump
            DisableControlAction(2, Keys['Q'], true) -- Cover
			DisableControlAction(2, Keys['N'], true) -- Cover
			DisableControlAction(0, Keys['N'], true) -- Cover
			DisableControlAction(1, Keys['N'], true) -- Cover
			DisableControlAction(3, Keys['N'], true) -- Cover
            DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(2, Keys['E'], true) -- Select Weapon
            DisableControlAction(2, Keys['F1'], true) -- Disable phone
            DisableControlAction(2, Keys['F2'], true) -- Inventory
            DisableControlAction(2, Keys['F3'], true) -- Animations
            DisableControlAction(2, Keys['F6'], true) -- Animations
            DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            --DisableControlAction(2, Keys['P'], true) -- Disable pause screen
            DisableControlAction(2, Keys['F9'], true) -- Disable pause screen
            DisableControlAction(2, 59, true) -- Disable steering in vehicle
            DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            ---[DisableControlAction(0, 75, true)  -- Disable exit vehicle
            --DisableControlAction(27, 75, true) -- Disable exit vehicle
            DisableControlAction(0, 21, true)  -- Bieganie
            DisableControlAction(0, Keys[','], true)  -- Bieganie
            DisableControlAction(1, Keys[','], true)  -- Bieganie
            DisableControlAction(2, Keys[','], true)  -- Bieganie
			DisableControlAction(1, Keys['B'], true) -- Disable going stealth
			DisableControlAction(0, Keys['B'], true) -- Disable going stealth
			DisableControlAction(3, Keys['B'], true) -- Disable going stealth
            DisableControlAction(0, Keys['='], true)  -- Bieganie
            DisableControlAction(1, Keys['='], true)  -- Bieganie
            DisableControlAction(2, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['='], true)  -- Bieganie	
		else
			letsleep = 500
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(12000)
		if knockedOut and wait <= 0 then
			SzowText("~b~Nacisnij E aby wstać!")
		end
	end
end)
function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

function SzowText(message)
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~y~NIEPRZYTOMNY")
		PushScaleformMovieMethodParameterString(message)
		PushScaleformMovieMethodParameterInt(message)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		local drawing = true
		Citizen.SetTimeout((10 * 1000),function() drawing = false end)
		while drawing do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end


function ShowTextDesync()
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~y~NIE WYCHODŹ Z SERWERA")
		PushScaleformMovieMethodParameterString("Przez kolejną minute!")
		PushScaleformMovieMethodParameterInt(message)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "10_SEC_WARNING", "HUD_MINI_GAME_SOUNDSET")
		local drawing = true
		Citizen.SetTimeout((10 * 1000),function() drawing = false end)
		while drawing do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end



RegisterNetEvent('esx_pow:desync')
AddEventHandler('esx_pow:desync', function ()
	ShowTextDesync()
	TriggerEvent("chat:addMessage",{color={255,255,0},multiline=true,args={"MajorkaRP","Nie wychodź z serwera przez kolejną MINUTĘ!"}})
	Citizen.Wait(60000)
	ESX.ShowNotification("Możesz opuścić server")
	TriggerEvent("chat:addMessage",{color={255,255,0},multiline=true,args={"MajorkaRP","Już możesz opuścić serwer!"}})
end)
