local menuEnabled = false 
local anim = "amb@world_human_seat_wall_tablet@female@base"
local animka = "base"
local prop = "ic-book"
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

RegisterCommand('icbook', function()
    Citizen.CreateThread(function()
startTabletAnimation()
	end)
end, false)


Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(1)
			if IsControlJustPressed(0, Keys["HOME"]) then
				startTabletAnimation()
			end
	end
end)

function startTabletAnimation()
	Citizen.CreateThread(function()
	  RequestAnimDict(anim)
	  while not HasAnimDictLoaded(anim) do
	    Citizen.Wait(0)
	  end
		attachObject()
		TaskPlayAnim(GetPlayerPed(-1), anim, animka, 4.0, -4.0, -1, 50, 0, false, false, false)
					ToggleActionMenu()
	end)
end

RegisterNUICallback('exit', function() 
	killTutorialMenu() 
	stopTabletAnimation()
end)

RegisterNUICallback('_blank', function() 
		SetNuiFocus( false )
end)


function attachObject()
	if tabletEntity == nil then
		Citizen.Wait(380)
		RequestModel(prop)
		while not HasModelLoaded(prop) do
			Citizen.Wait(1)
		end
		tabletEntity = CreateObject(GetHashKey(prop), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

function stopTabletAnimation()
	if tabletEntity ~= nil then
		StopAnimTask(GetPlayerPed(-1), anim, animka ,4.0, -4.0, -1, 50, 0, false, false, false)
		DeleteEntity(tabletEntity)
		tabletEntity = nil
	end
end

function ToggleActionMenu()
	menuEnabled = not menuEnabled
	if ( menuEnabled ) then 
		SetNuiFocus( true, true ) 
		SendNUIMessage({
			showPlayerMenu = true 
		})
	else 
		SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
	end 
end 

function killTutorialMenu() 
	stopTabletAnimation()
SetNuiFocus( false )
		SendNUIMessage({
			showPlayerMenu = false
		})
		menuEnabled = false
end