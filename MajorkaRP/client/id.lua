ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

local idovi = false

local disPlayerNames = 25


RegisterCommand("id", function()
    ESX.TriggerServerCallback("majorkarp:getRank", function(playerRank)
        if playerRank == "admin" or playerRank == "superadmin" or playerRank == "mod" then
          if not idovi then
            TriggerEvent("pNotify:SendNotification", {text = "ID ON!", type = "success", queue = "success", timeout = 1500, layout = "topright"})
            idovi = true
          else
            idovi = false
            TriggerEvent("pNotify:SendNotification", {text = "ID OF!", type = "success", queue = "success", timeout = 1500, layout = "topright"})
          end
        else
           TriggerEvent("pNotify:SendNotification", {text = "Funkcja tylko dla administracji!", type = "success", queue = "success", timeout = 2000, layout = "topright"})
        end
    end)
end)

playerDistances = {}

Citizen.CreateThread(function()
    Wait(100)
    while true do
    Citizen.Wait(0)
      if not idovi then
        Citizen.Wait(2000)
      else
        for _, player in ipairs(GetActivePlayers()) do
          local ped = GetPlayerPed(player)
          if GetPlayerPed(player) ~= GetPlayerPed(-1) then
            if playerDistances[player] ~= nil and playerDistances[player] < disPlayerNames then
              x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
              if not NetworkIsPlayerTalking(player) then
                DrawText3D(x2, y2, z2+0.94, '~b~' .. GetPlayerServerId(player) .. ' ~c~| ~w~' .. GetPlayerName(player))
              else
                DrawText3D(x2, y2, z2+0.94, '~g~' .. GetPlayerServerId(player) .. ' ~c~| ~w~' .. GetPlayerName(player))
              end
            end
          end
        end
      end
    end
end)


Citizen.CreateThread(function()
    while true do
        for _, player in ipairs(GetActivePlayers()) do
            if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                x1, y1, z1 = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
                x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(player), true))
                distance = math.floor(GetDistanceBetweenCoords(x1,  y1,  z1,  x2,  y2,  z2,  true))
                playerDistances[player] = distance
            end
        end
        Citizen.Wait(1000)
    end
end)

function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*5
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextScale(0.0*scale, 0.22*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end