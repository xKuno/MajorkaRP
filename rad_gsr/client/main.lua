ESX = nil
local hasShot = false
local ignoreShooting = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if IsPedShooting(ped) then
            local currentWeapon = GetSelectedPedWeapon(ped)
            for _,k in pairs(Config.weaponChecklist) do
                if currentWeapon == k then
                    ignoreShooting = true
                    break
                end
            end
            
            if not ignoreShooting then
                TriggerServerEvent('GSR:SetGSR', timer)
                hasShot = true
                ignoreShooting = false
                Citizen.Wait(Config.gsrUpdate)
            end
			ignoreShooting = false
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                exports('mythic_notify:client:SendAlert', Source, { type = 'inform', text = 'Rozpoczynasz czyszczenie pozostałości po wystrzale ... pozostań w wodzie', length = 5000 })
				Wait(100)
				TriggerEvent("progressBars:client:progress", {
        			name = "washing_gsr",
        			duration = Config.waterCleanTime,
        			label = "Zmywanie GSR",
        			useWhileDead = false,
        			canCancel = true,
        			controlDisables = {
            			disableMovement = false,
            			disableCarMovement = false,
            			disableMouse = false,
            			disableCombat = false,
        			},
    			}, function(status)
        			if not status then
            			if IsEntityInWater(ped) then
                    		hasShot = false
                    		TriggerServerEvent('GSR:Remove')
							exports['mythic_notify']:SendAlert('success', 'Zmyłeś wszystkie pozostałości po postrzale z wody', 5000)
                		else
							exports['mythic_notify']:SendAlert('error', 'Zostawiłeś wodę za wcześnie i nie zmyłeś pozostałości po wystrzale.', 5000)
                		end
        			end
    			end)
				Citizen.Wait(Config.waterCleanTime)
            end
        end
    end
end)]]--

function status()
    if hasShot then
        ESX.TriggerServerCallback('GSR:Status', function(cb)
            if not cb then
                hasShot = false
            end
        end)
    end
end

function updateStatus()
    status()
    SetTimeout(Config.gsrUpdateStatus, updateStatus)
end

updateStatus()
