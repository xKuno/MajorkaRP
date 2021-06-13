ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if NetworkIsSessionStarted() then
            Citizen.Wait(500)
			TriggerEvent("kashactersC:WelcomePage")
            TriggerEvent("kashactersC:SetupCharacters")
            return -- break the loop
        end
    end
end)

local IsChoosing = true

local cam = nil
local cam2 = nil
RegisterNetEvent('kashactersC:SetupCharacters')
AddEventHandler('kashactersC:SetupCharacters', function()
    FreezeEntityPosition(GetPlayerPed(-1), true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 256.32,-1055.71,369.89, 300.00,0.00,0.00, 100.00, false, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
end)

RegisterNetEvent('kashactersC:WelcomePage')
AddEventHandler('kashactersC:WelcomePage', function()
    SetNuiFocus(false, false)
	SendNUIMessage({
        action = "openwelcome"
    })
end)

RegisterNetEvent('kashactersC:SetupUI')
AddEventHandler('kashactersC:SetupUI', function(Characters)
	IsChoosing = true
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openui",
        characters = Characters,
    })
end)

RegisterNetEvent('kashactersC:SpawnCharacter')
AddEventHandler('kashactersC:SpawnCharacter', function(spawn, isnew)
    TriggerServerEvent('es:firstJoinProper')
    TriggerEvent('es:allowedToSpawn')

    SetTimecycleModifier('default')
    local pos = spawn
    SetEntityCoords(GetPlayerPed(-1), pos.x, pos.y, pos.z)
	Citizen.Wait(50)
	local gowno = GetEntityCoords(GetPlayerPed(-1))
    DoScreenFadeIn(500)
    Citizen.Wait(500)
    cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam2, pos.x, pos.y, pos.z+200)
    SetCamActiveWithInterp(cam2, cam, 900, true, true)
    Citizen.Wait(900)
    exports.spawnmanager:setAutoSpawn(false)
    if isnew then
		TriggerServerEvent('esx_quiz:didQuestion')
       -- TriggerEvent('esx_identity:showRegisterIdentity')
	end

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z+200, 300.00,0.00,0.00, 100.00, false, 0)
    PointCamAtCoord(cam, pos.x, pos.y, pos.z+2)
    SetCamActiveWithInterp(cam, cam2, 3700, true, true)
    Citizen.Wait(3700)
    PlaySoundFrontend(-1, "Zoom_Out", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 1)
    RenderScriptCams(false, true, 500, true, true)
    PlaySoundFrontend(-1, "CAR_BIKE_WHOOSH", "MP_LOBBY_SOUNDS", 1)
    FreezeEntityPosition(GetPlayerPed(-1), false)
    Citizen.Wait(500)
    SetCamActive(cam, false)
    DestroyCam(cam, true)
    IsChoosing = false
    DisplayHud(true)
    DisplayRadar(true)
--	TriggerServerEvent("esx_addonaccount:load")
--	TriggerServerEvent("esx_addoninventory:load")
--	TriggerServerEvent("esx_datastore:load")
end)

RegisterNetEvent('kashactersC:ReloadCharacters')
AddEventHandler('kashactersC:ReloadCharacters', function()
    TriggerServerEvent("kashactersS:SetupCharacters")
    TriggerEvent("kashactersC:SetupCharacters")
end)

RegisterNUICallback("CharacterChosen", function(data, cb)
    SetNuiFocus(false,false)
    TriggerServerEvent('kashactersS:CharacterChosen', data.charid, data.ischar, data.spawnid or "1")
    cb("ok")
end)

RegisterNUICallback('Get2Postac', function(data, cb)
	ESX.TriggerServerCallback('kashactersS:get2postac', function(data1)
		if data1 then
			SetNuiFocus(false,false)
			TriggerServerEvent('kashactersS:CharacterChosen', data.charid, data.ischar, data.spawnid or "1")
			cb(true)
		else
			TriggerEvent("pNotify:SendNotification", {text = 'Napisz podanie na 2 postac!'})
            Citizen.Wait(5000)
			TriggerEvent("kashactersC:WelcomePage")
            TriggerEvent("kashactersC:SetupCharacters")
			cb(false)
		end
	end)
end)

RegisterNUICallback('Get3Postac', function(data, cb)
	ESX.TriggerServerCallback('kashactersS:get3postac', function(data1)
		if data1 then
			SetNuiFocus(false,false)
			TriggerServerEvent('kashactersS:CharacterChosen', data.charid, data.ischar, data.spawnid or "1")
			cb(true)
		else
			TriggerEvent("pNotify:SendNotification", {text = 'Opcja tylko dla donatorow debesta!'})
            Citizen.Wait(5000)
			TriggerEvent("kashactersC:WelcomePage")
            TriggerEvent("kashactersC:SetupCharacters")
			cb(false)
		end
	end)
end)

RegisterNUICallback('Get4Postac', function(data, cb)
	ESX.TriggerServerCallback('kashactersS:get4postac', function(data1)
		if data1 then
			SetNuiFocus(false,false)
			TriggerServerEvent('kashactersS:CharacterChosen', data.charid, data.ischar, data.spawnid or "1")
			cb(true)
		else
			TriggerEvent("pNotify:SendNotification", {text = 'Opcja tylko dla donatorow debestav2!'})
            Citizen.Wait(5000)
			TriggerEvent("kashactersC:WelcomePage")
            TriggerEvent("kashactersC:SetupCharacters")
			cb(false)
		end
	end)
end)

RegisterNUICallback("ShowSelection", function(data, cb)
	TriggerServerEvent("kashactersS:SetupCharacters")
end)

function DrawText3Ds(x,y,z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local p = GetGameplayCamCoords()
	local distance = #(vector3(p.x, p.y, p.z) - vector3(x, y, z))
	local scale = (1 / distance) * 2
	local fov = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov
	if onScreen then
		SetTextScale(0.30, 0.30)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 215)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
		local factor = (string.len(text)) / 370
		DrawRect(_x,_y+0.0120, factor, 0.026, 41, 11, 41, 68)
	end
end