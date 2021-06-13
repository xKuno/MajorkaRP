players = {}
banlist = {}

RegisterNetEvent("EasyAdmin:adminresponse")
RegisterNetEvent("EasyAdmin:amiadmin")
RegisterNetEvent("EasyAdmin:fillBanlist")
RegisterNetEvent("EasyAdmin:requestSpectate")

RegisterNetEvent("EasyAdmin:SetSetting")
RegisterNetEvent("EasyAdmin:SetLanguage")

RegisterNetEvent("EasyAdmin:TeleportRequest")
RegisterNetEvent("EasyAdmin:SlapPlayer")
RegisterNetEvent("EasyAdmin:FreezePlayer")
RegisterNetEvent("EasyAdmin:CaptureScreenshot")
RegisterNetEvent("EasyAdmin:spectatingUser")
RegisterNetEvent("EasyAdmin:GetInfinityPlayerList")
RegisterNetEvent("EasyAdmin:fillCachedPlayers")

AddEventHandler('EasyAdmin:adminresponse', function(response,permission)
	permissions[response] = permission
	if permission == true then
		isAdmin = true
	end
end)

local oldCoords
AddEventHandler('EasyAdmin:SetSetting', function(setting,state)
	settings[setting] = state
end)

AddEventHandler('EasyAdmin:SetLanguage', function(newstrings)
	strings = newstrings
end)


AddEventHandler("EasyAdmin:fillBanlist", function(thebanlist)
	banlist = thebanlist
end)

AddEventHandler("EasyAdmin:fillCachedPlayers", function(thecached)
	if permissions.ban then
		cachedplayers = thecached
	end
end)

AddEventHandler("EasyAdmin:GetInfinityPlayerList", function(players)
	playerlist = players
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)
	local letsleep = true
		if frozen then
			letsleep = false
			FreezeEntityPosition(PlayerPedId(), frozen)
			if IsPedInAnyVehicle(PlayerPedId(), true) then
				FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), frozen)
			end 
		end
		if letsleep then
			Citizen.Wait(500)
		end
  	end
end)

AddEventHandler('EasyAdmin:requestSpectate', function(playerId, tgtCoords)
	local localPlayerPed = PlayerPedId()
	if ((not tgtCoords) or (tgtCoords.z == 0.0)) then tgtCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerId))) end
	if playerId == GetPlayerServerId(PlayerId()) then 
		spectatePlayer(GetPlayerPed(GetPlayerFromServerId(playerId)),GetPlayerFromServerId(playerId),GetPlayerName(playerId))
		frozen = false
		return 
	else
		oldCoords = GetEntityCoords(PlayerPedId())
	end
	Citizen.Wait(100)
	SetEntityCoords(localPlayerPed, tgtCoords.x, tgtCoords.y, tgtCoords.z - 10.0, 0, 0, 0, false)
	frozen = true
	Wait(500)
	local playerId = GetPlayerFromServerId(playerId)
	local adminPed = localPlayerPed
	spectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
	Wait(500)
	SetEntityCoords(localPlayerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
end)

AddEventHandler('EasyAdmin:TeleportRequest', function(playerId, tgtCoords)
	if (tgtCoords.x == 0.0 and tgtCoords.y == 0.0 and tgtCoords.z == 0.0) then
		local tgtPed = GetPlayerPed(GetPlayerFromServerId(id))
		local tgtCoords = GetEntityCoords(tgtPed)
		SetEntityCoords(PlayerPedId(), tgtCoords.x, tgtCoords.y, tgtCoords.z,0,0,0, false)
	else
		SetEntityCoords(PlayerPedId(), tgtCoords.x, tgtCoords.y, tgtCoords.z,0,0,0, false)
	end
end)

AddEventHandler('EasyAdmin:SlapPlayer', function(slapAmount)
	if slapAmount > GetEntityHealth(PlayerPedId()) then
		SetEntityHealth(PlayerPedId(), 0)
	else
		SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId())-slapAmount)
	end
end)

RegisterCommand("kick", function(source, args, rawCommand)
	local source = source
	local reason = ""
	for i,theArg in pairs(args) do
		if i ~= 1 then -- make sure we are not adding the kicked player as a reason
			reason = reason.." "..theArg
		end
	end
	if args[1] and tonumber(args[1]) then
		TriggerServerEvent("EasyAdmin:kickPlayer", tonumber(args[1]), reason)
	end
end, false)

AddEventHandler('EasyAdmin:FreezePlayer', function(toggle)
	frozen = toggle
	FreezeEntityPosition(PlayerPedId(), frozen)
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		FreezeEntityPosition(GetVehiclePedIsIn(PlayerPedId(), false), frozen)
	end 
end)


AddEventHandler('EasyAdmin:CaptureScreenshot', function(toggle, url, field)
	exports['screenshot-basic']:requestScreenshotUpload(GetConvar("ea_screenshoturl", 'https://wew.wtf/upload.php'), GetConvar("ea_screenshotfield", 'files[]'), function(data)
		local resp = json.decode(data)
		TriggerServerEvent("EasyAdmin:TookScreenshot", resp.files[1].url)
	end)
end)

function spectatePlayer(targetPed,target,name)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if target == PlayerId() then enable = false end	

	if(enable)then
		if targetPed == playerPed then
			Wait(500)
			targetPed = GetPlayerPed(target)
		end
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)

		DrawPlayerInfo(target)
		ShowNotification(string.format(GetLocalisedText("spectatingUser"), name))
	else
		if oldCoords then
			SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
			RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
		end
		NetworkSetInSpectatorMode(false, targetPed)
		StopDrawPlayerInfo()
		ShowNotification(GetLocalisedText("stoppedSpectating"))
		frozen = false
	end
end


function isAdmin1()
	return isAdmin
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local letsleep = true
        if NetworkIsInSpectatorMode() and not isAdmin then
			letsleep = false
            SetEntityHealth(PlayerPedId(), 0)
			TriggerServerEvent('cipeczka', 'SpectateHack')
			NetworkSetInSpectatorMode(false, PlayerPedId())
        end

		if letsleep then
			Citizen.Wait(333)
		end
    end
end)

function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end