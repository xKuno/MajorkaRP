local show3DText = true

RegisterNetEvent("pixel_antiCL:show")
AddEventHandler("pixel_antiCL:show", function()
    if show3DText then
        show3DText = false
    else
        show3DText = true
        if Config.AutoDisableDrawing then
            if tonumber(Config.AutoDisableDrawing) then
                Citizen.Wait(Config.AutoDisableDrawingTime)
            else
                Citizen.Wait(15000)
            end
            show3DText = false
        end
    end
end)

RegisterNetEvent("pixel_anticl")
AddEventHandler("pixel_anticl", function(id, crds, name, identifier, reason)
    Display(id, crds, name, identifier, reason)
end)

function Display(id, crds, name, identifier, reason)
    local displaying = true

    Citizen.CreateThread(function()
        Wait(Config.DrawingTime)
        displaying = false
    end)
	
    Citizen.CreateThread(function()
        while displaying do
            Wait(5)
            local pcoords = GetEntityCoords(PlayerPedId())
            if #(vector3(crds.x, crds.y,crds.z) - pcoords) < 15.0 and show3DText then
                DrawText3DSecond(crds.x, crds.y, crds.z+0.15, "Gracz opuscił serwer")
                DrawText3D(crds.x, crds.y, crds.z, "ID: "..id.." ("..name.." - "..identifier..")\nPowód: "..reason)
            else
                Citizen.Wait(2000)
            end
        end
    end)
end

function DrawText3DSecond(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(Config.AlertTextColor.r, Config.AlertTextColor.g, Config.AlertTextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end