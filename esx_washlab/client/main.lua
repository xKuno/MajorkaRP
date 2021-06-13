---------------------------------------
--      ESX_WASHLAB by Dividerz      --
-- FOR SUPPORT: Arne#7777 on Discord --
---------------------------------------

Keys = {
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

ESX = nil
unProcessedMoneySheets = unProcessedMoneySheets or 0
moneySheets = moneySheets or 0
cuttedMoney = cuttedMoney or 0
local maszynajestladowana = false
isProducingSheets = false
isCountingMoney = false
local maszynajestzaladowana = false
producingTime = Config.ProducingTime
countingTime = Config.CountingTime
local pralniaxx = 0
local pralniayy = 0
local pralniazz = 0
local wszedl = false
local wyszedl = false
local wyslano = false
local chuj = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

AddEventHandler('onResourceStart', function(resource)
    isLoggedIn = true
    TriggerServerEvent('esx_washlab:refreshdrugs')
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    isLoggedIn = true
    TriggerServerEvent('esx_washlab:refreshdrugs')
end)


RegisterNetEvent('esx_washlab:setplayerdrugs')
AddEventHandler('esx_washlab:setplayerdrugs', function(pralniax, pralniay, pralniaz)
	Marker = coords
	allowmarker = true
	Wait(1000)
    pralniaxx = pralniax
    pralniayy = pralniay
    pralniazz = pralniaz
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        local playerPed = GetPlayerPed(-1)
        local playerPosition = GetEntityCoords(playerPed)


        -- ENTER TELEPORTER
        if (#(playerPosition - vector3(pralniaxx, pralniayy, pralniazz)) < 5) then
            DrawMarker(2, pralniaxx, pralniayy, pralniazz-0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 200, 0, 0, 0, 1, 0, 0, 0)
            if (#(playerPosition - vector3(pralniaxx, pralniayy, pralniazz)) < 1.5) then
                DrawText3D(pralniaxx, pralniayy, pralniazz+0.15, '~g~E~w~ - Wejdz')
                if IsControlJustReleased(0, Keys["E"]) then
                    wszedl = true
                    wyszedl = false
                    Citizen.Wait(1000)
                    teleportToWashingOffice()
                end 
            elseif (#(playerPosition - vector3(pralniaxx, pralniayy, pralniazz)) < 8) then
                DrawText3D(pralniaxx, pralniayy, pralniazz+0.15, 'Stara Chata')
            end
        end

        -- EXIT TELEPORTER
        if wszedl == true then
            if (#(playerPosition - vector3(Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z)) < 5) then
                DrawMarker(2, Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z-0.20, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 255, 255, 255, 200, 0, 0, 0, 1, 0, 0, 0)
                if (#(playerPosition - vector3(Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z)) < 1.5) then
                    DrawText3D(Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z+0.15, '~g~E~w~ - Wyjdz')
                    if IsControlJustReleased(0, Keys["E"]) then
                        teleportOutOfWashingOffice()
                        wyszedl = true
                        wszedl = false
                    end
                end
            end
        end

        if wszedl == false and wyszedl == false then
            if wyslano == false then
                if (#(playerPosition - vector3(Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z)) < 10) then
                    TriggerServerEvent('esx_washlab:miejscowkagra', wszedl)
                    wyslano = true
                end
            else
                Wait(60000)
                wyslano = false
            end
        end

        if chuj == false then
            if (#(playerPosition - vector3(Config.Locations.washinglab.teleporters.enter.x, Config.Locations.washinglab.teleporters.enter.y, Config.Locations.washinglab.teleporters.enter.z)) < 10) then
                wszedl = 2
                TriggerServerEvent('esx_washlab:miejscowkagra', wszedl)
                chuj = true
            end
        else
            Wait(60000)
            chuj = false
        end

        -- WASH START
        if wszedl == true then
            if (#(playerPosition - vector3(Config.Locations.washinglab.process.start.x, Config.Locations.washinglab.process.start.y, Config.Locations.washinglab.process.start.z)) < 1.5) then
                DrawText3D(Config.Locations.washinglab.process.start.x, Config.Locations.washinglab.process.start.y, Config.Locations.washinglab.process.start.z+0.15, '~g~E~w~ - Zaladuj maszyne')
                if IsControlJustReleased(0, Keys["E"]) then
                    ESX.TriggerServerCallback('esx_washlab:callback:getBlackMoneyAmount', function(amount)
                        if  maszynajestzaladowana == false then
                        if amount >= 10000 and amount <= 100000 and (amount == 10000 or amount == 20000 or amount == 30000 or amount == 40000 or amount == 50000 or amount == 60000 or amount == 70000 or amount == 80000 or amount == 90000 or amount == 100000) then
                            if unProcessedMoneySheets <= 100000 and moneySheets <= 100000 then
                                TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                                exports['MajorkaRP']:startUI(Config.WaitingTime, "Ladowanie maszyny w toku...")
                                maszynajestladowana = true
                                maszynajestzaladowana = true
                                Citizen.Wait(Config.WaitingTime)
                                maszynajestladowana = false 
                                unProcessedMoneySheets  = amount
                                TriggerServerEvent('esx_washlab:server:removeBlackMoney', amount)
                                startProducingTimer(amount)
                                ClearPedTasksImmediately(playerPed)
                        else
                                ESX.ShowNotification('Maszyna jest w pelni zaladowana...')
                            end
                        else
                            ESX.ShowNotification('Ta maszyna moze pomiescic minimalnie ~r~10000$~s~ i maksymalnie ~r~100000$~s~')
                            Citizen.Wait(2500)
                            ESX.ShowNotification('oraz tylko wielokrotnośći ~g~10000$~s~ np:')
                            Citizen.Wait(2500)
                            ESX.ShowNotification('~g~10000$~s~,\n~g~20000$~s~,\n~g~30000$~s~,\n...\netc aż do ~g~100000$~s~.')
                        end
                        else
                            ESX.ShowNotification('~b~Aktualnie w maszynie znajduja się pieniądze.')
                    end 
                    end)
                end
            end
        end
        
        if maszynajestladowana then
        	DisableAllControlActions()
        end

        if producingTime <= 1 then
            maszynajestzaladowana = false
        end

        -- WASH TIMER
        if isProducingSheets and producingTime > 0 then
            if (#(playerPosition - vector3(Config.Locations.washinglab.process.timer.x, Config.Locations.washinglab.process.timer.y, Config.Locations.washinglab.process.timer.z)) < 10) then
                DrawText3D(Config.Locations.washinglab.process.timer.x, Config.Locations.washinglab.process.timer.y, Config.Locations.washinglab.process.timer.z+0.28, 'Ilosc: ~g~$' .. unProcessedMoneySheets .. '~w~')
                DrawText3D(Config.Locations.washinglab.process.timer.x, Config.Locations.washinglab.process.timer.y, Config.Locations.washinglab.process.timer.z+0.15, 'Proces produkcji: ~y~' .. producingTime .. ' sekund~w~')
            end
        end

        -- WASH MACHINE OUTPUT
        if (#(playerPosition - vector3(Config.Locations.washinglab.process.output.x, Config.Locations.washinglab.process.output.y, Config.Locations.washinglab.process.output.z)) < 2.5) then
            DrawText3D(Config.Locations.washinglab.process.output.x, Config.Locations.washinglab.process.output.y, Config.Locations.washinglab.process.output.z+0.15, 'Wynik: ~y~$' .. moneySheets .. '~w~ wartosc arkuszy')
        end

        -- WASH CUTTER
        if (#(playerPosition - vector3(Config.Locations.washinglab.process.cutter.x, Config.Locations.washinglab.process.cutter.y, Config.Locations.washinglab.process.cutter.z)) < 2.5) then
            DrawText3D(Config.Locations.washinglab.process.cutter.x, Config.Locations.washinglab.process.cutter.y, Config.Locations.washinglab.process.cutter.z+0.25, 'Arkusze pieniedzy: ~y~' .. moneySheets .. '~w~')
            DrawText3D(Config.Locations.washinglab.process.cutter.x, Config.Locations.washinglab.process.cutter.y, Config.Locations.washinglab.process.cutter.z+0.15, '~g~E~w~ - Rozpocznij wycinanie')
            if IsControlJustReleased(0, Keys["E"]) then
                if moneySheets >= 100 then
                    TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_BUM_BIN', 0, true)
                    exports['MajorkaRP']:startUI(Config.WaitingTime, "Wycinanie...")
                    Citizen.Wait(Config.WaitingTime)
                    moneySheets = moneySheets - 10000
                    cuttedMoney = cuttedMoney + 10000
                    ClearPedTasksImmediately(playerPed)
                else
                    ESX.ShowNotification('Masz niewystarczajacy arkuszy pieniedzy...')
                end 
            end
        end

        -- WASH COUNTER
        if (#(playerPosition - vector3(Config.Locations.washinglab.process.counter.x, Config.Locations.washinglab.process.counter.y, Config.Locations.washinglab.process.counter.z)) < 2.5) then
            DrawText3D(Config.Locations.washinglab.process.counter.x, Config.Locations.washinglab.process.counter.y, Config.Locations.washinglab.process.counter.z+0.25, 'Wycieta ilosc: ~y~$' .. cuttedMoney .. '~w~')
            if isCountingMoney and countingTime > 0 then
                DrawText3D(Config.Locations.washinglab.process.counter.x, Config.Locations.washinglab.process.counter.y, Config.Locations.washinglab.process.counter.z+0.15, 'Proces przeliczania: ~y~' .. countingTime .. ' sekund~w~')
            else
                DrawText3D(Config.Locations.washinglab.process.counter.x, Config.Locations.washinglab.process.counter.y, Config.Locations.washinglab.process.counter.z+0.15, '~g~E~w~ - Przelicz pieniadze')
            end
            if IsControlJustReleased(0, Keys["E"]) then
                if cuttedMoney > 0 then
                    startCountingTimer(cuttedMoney)
                else
                    ESX.ShowNotification('Nie pozostalo juz zadnych pieniedzy do przeliczenia...')
                end
            end
        end

    end
end)

startProducingTimer = function(amount)
    isProducingSheets = true
    Citizen.CreateThread(function()
        while isProducingSheets do
            producingTime = producingTime - 1
            if producingTime <= 0 then
                moneySheets = moneySheets + amount
                isProducingSheets = false
                producingTime = producingTime + Config.ProducingTime
            end
            Citizen.Wait(1000)
        end
    end)
end

startCountingTimer = function(amount)
    isCountingMoney = true
    Citizen.CreateThread(function()
        while isCountingMoney do
            countingTime = countingTime - 1
            if countingTime <= 0 then
                cuttedMoney = cuttedMoney - amount
                TriggerServerEvent('esx_washlab:server:giveCleanMoney', amount)
                isCountingMoney = false
                countingTime = countingTime + Config.CountingTime
            end
            Citizen.Wait(1000)
        end
    end)
end

teleportOutOfWashingOffice = function()
    local entity = GetPlayerPed(-1)
    
    DoScreenFadeOut(200)
    Citizen.Wait(200)
    SetEntityCoords(entity, pralniaxx, pralniayy, pralniazz, 0, 0, 0, false)

    PlaceObjectOnGroundProperly(entity)
    Citizen.Wait(1500)
    DoScreenFadeIn(200)
end

teleportToWashingOffice = function()
    local entity = GetPlayerPed(-1)
    
    DoScreenFadeOut(200)
    Citizen.Wait(200)
    SetEntityCoords(entity, Config.Locations.washinglab.teleporters.exit.x, Config.Locations.washinglab.teleporters.exit.y, Config.Locations.washinglab.teleporters.exit.z, 0, 0, 0, false)

    PlaceObjectOnGroundProperly(entity)
    Citizen.Wait(1500)
    DoScreenFadeIn(200)
end

DrawText3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

-- LOAD IPL
Citizen.CreateThread(function()
    BikerCounterfeit = exports['bob74_ipl']:GetBikerCounterfeitObject()
    BikerCounterfeit.Ipl.Interior.Load()

    BikerCounterfeit.Printer.Set(BikerCounterfeit.Printer.upgradeProd)
    BikerCounterfeit.Security.Set(BikerCounterfeit.Security.upgrade)
    BikerCounterfeit.Dryer1.Set(BikerCounterfeit.Dryer1.on)
    BikerCounterfeit.Dryer2.Set(BikerCounterfeit.Dryer2.on)
    BikerCounterfeit.Dryer3.Set(BikerCounterfeit.Dryer3.on)
    BikerCounterfeit.Dryer4.Set(BikerCounterfeit.Dryer4.on)
    BikerCounterfeit.Details.Enable(BikerCounterfeit.Details.chairs, true)
    BikerCounterfeit.Details.Enable(BikerCounterfeit.Details.furnitures, true)

    RefreshInterior(BikerCounterfeit.interiorId)
end)