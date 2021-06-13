
----
-- @var vehicles[plate_number] = newVehicle Object
local vehicles = {}

---- Main thread
-- The logic of the script is here
Citizen.CreateThread(function()
    while true do
        Wait(0)

        -- If the defined key is pressed
        if(IsControlJustPressed(1, Config.key))then

            -- Init player infos
            local ply = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ply, true)
            isInside = false

            -- Pobierz lokalny identyfikator docelowego pojazdu
            if(IsPedInAnyVehicle(ply, true))then
                -- by sitting inside him
                localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                isInside = true
            else
                -- celujac w pojazd
                localVehId = GetTargetedVehicle(pCoords, ply)
            end

            -- Uzyskaj ukierunkowane informacje o pojazdach
            if(localVehId and localVehId ~= 0)then
                local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
                if localVehPlateTest ~= nil then
                    local localVehPlate = string.lower(localVehPlateTest)
                    local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
                    local hasKey = false

                    -- If the vehicle appear in the table (if this is the player's vehicle or a locked vehicle)
                    for plate, vehicle in pairs(vehicles) do
                        if(string.lower(plate) == localVehPlate)then
                            -- If the vehicle is not locked (this is the player's vehicle)
                            if(vehicle ~= "locked")then
                                hasKey = true
                                if(time > timer)then
                                    -- update the vehicle infos (Useful for hydrating instances created by the /givekey command)
                                    vehicle.update(localVehId, localVehLockStatus)
                                    -- Lock or unlock the vehicle
                                    vehicle.lock()
                                    time = 0
                                    Citizen.CreateThread(function()
                                        Dostuff()
                                        Citizen.Wait(1000)
                                        ClearPedTasks(GetPlayerPed(-1))
                                    end)
                                else
                                    TriggerEvent("ls:notify", _U("lock_cooldown", (timer / 1000)))
                                end
                            else
                                TriggerEvent("ls:notify", _U("keys_not_inside"))
                            end
                        end
                    end

                    -- Jesli gracz nie ma kluczy
                    if(not hasKey)then
                        -- If the player is inside the vehicle
                        if(isInside)then
                            -- Jesli gracz znajduje sie w pojezdzie
                            if(canSteal())then
                                -- Sprawdz, czy pojazd jest juz wlasnoscia.
                                -- I wyslij parametry, aby utworzyc obiekt pojazdu, jesli tak nie jest.
                                TriggerServerEvent('ls:checkOwner', localVehId, localVehPlate, localVehLockStatus)
                            else
                                -- Jesli gracz nie znajdzie kluczy
                                -- Lock the vehicle (players can't try to find the keys again)
                                vehicles[localVehPlate] = "locked"
                                TriggerServerEvent("ls:lockTheVehicle", localVehPlate)
                                TriggerEvent("ls:notify", _U("keys_not_inside"))
                            end
                        end
                    end
                else
                    TriggerEvent("ls:notify", _U("could_not_find_plate"))
                end
            end
        end
    end
end)

---- Timer
Citizen.CreateThread(function()
    timer = Config.lockTimer * 1000
    time = 0
	while true do
		Wait(1000)
		time = time + 1000
	end
end)

---- Prevents the player from breaking the window if the vehicle is locked
-- (fixing a bug in the previous version)
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
        	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
	        local lock = GetVehicleDoorLockStatus(veh)
	        if lock == 4 then
	        	ClearPedTasks(ped)
	        end
        end
	end
end)

---- Locks vehicles if non-playable characters are in them
-- Can be disabled in "config/shared.lua"
if(Config.disableCar_NPC)then
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            local ped = GetPlayerPed(-1)
            if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
                local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
                local lock = GetVehicleDoorLockStatus(veh)
                if lock == 7 then
                    SetVehicleDoorsLocked(veh, 2)
                    Citizen.CreateThread(function()
                        local dict = "anim@mp_player_intmenu@key_fob@"
                    
                        RequestAnimDict(dict)
                        while not HasAnimDictLoaded(dict) do
                            Citizen.Wait(0)
                        end
                        local handsup = false
                        while true do
                            Citizen.Wait(0)
                            if IsControlJustPressed(1, 303) then 
                                if not handsup then
                                    TaskPlayAnim(GetPlayerPed(-1), dict, "base", 8.0, 8.0, -1, 50, 0, false, false, false)
                                    handsup = true
                                else
                                    handsup = false
                                    ClearPedTasks(GetPlayerPed(-1))
                                end
                            end
                        end
                    end)
                end
                local pedd = GetPedInVehicleSeat(veh, -1)
                if pedd then
                    SetPedCanBeDraggedOut(pedd, false)
                end
            end
        end
    end)
end

------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
RegisterNetEvent("ls:updateVehiclePlate")
AddEventHandler("ls:updateVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(vehicles[oldPlate])then
        vehicles[newPlate] = vehicles[oldPlate]
        vehicles[oldPlate] = nil

        TriggerServerEvent("ls:updateServerVehiclePlate", oldPlate, newPlate)
    end
end)

---- Event called from the server
-- Get the keys and create the vehicle Object if the vehicle has no owner
-- @param boolean hasOwner
-- @param int localVehId
-- @param string localVehPlate
-- @param int localVehLockStatus
RegisterNetEvent("ls:getHasOwner")
AddEventHandler("ls:getHasOwner", function(hasOwner, localVehId, localVehPlate, localVehLockStatus)
    if(not hasOwner)then
        TriggerEvent("ls:newVehicle", localVehPlate, localVehId, localVehLockStatus)
        TriggerServerEvent("ls:addOwner", localVehPlate)

        TriggerEvent("ls:notify", getRandomMsg().."                          ~b~Rejestracja: " .. localVehPlate)
    else
        TriggerEvent("ls:notify", _U("vehicle_not_owned"))
    end
end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
RegisterNetEvent("ls:newVehicle")
AddEventHandler("ls:newVehicle", function(plate, id, lockStatus)
    if(plate)then
        local plate = string.lower(plate)
        if(not id)then id = nil end
        if(not lockStatus)then lockStatus = nil end
        vehicles[plate] = newVehicle()
        vehicles[plate].__construct(plate, id, lockStatus)
    else
        print("Can't create the vehicle instance. Missing argument PLATE")
    end
end)

---- Event called from server when a player execute the /givekey command
-- Create a new vehicle object with its plate
-- @param string plate
RegisterNetEvent("ls:giveKeys")
AddEventHandler("ls:giveKeys", function(plate)
    local plate = string.lower(plate)
    TriggerEvent("ls:newVehicle", plate, nil, nil)
end)

RegisterNetEvent('ls:notify')
AddEventHandler('ls:notify', function(text, duration)
	Notify(text, duration)
end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
function canSteal()
    nb = math.random(1, 100)
    percentage = Config.percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end

---- Return a random message
-- @return string
function getRandomMsg()
    msgNb = math.random(1, #Config.randomMsg)
    return Config.randomMsg[msgNb]
end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end

---- Notify the player
-- Can be configured in "config/shared.lua"
-- @param string text
-- @param float duration [opt]
function Notify(text, duration)
	if(Config.notification)then
		if(Config.notification == 1)then
			if(not duration)then
				duration = 0.080
			end
			SetNotificationTextEntry("STRING")
			AddTextComponentString(text)
			Citizen.InvokeNative(0x1E6611149DB3DB6B, "CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "Zamek", "MajorkaRP", duration)
			DrawNotification_4(false, true)
		elseif(Config.notification == 2)then
			TriggerEvent('chatMessage', '^1LockSystem V' .. _VERSION, {255, 255, 255}, text)
		else
			return
		end
	else
		return
	end
end

function Dostuff()
    local Dict = "anim@mp_player_intmenu@key_fob@"
    local Name  = "fob_click_fp"
    RequestAnimDict(Dict)
    while not HasAnimDictLoaded(Dict) do
        Citizen.Wait(100)
    end
    TaskPlayAnim(GetPlayerPed(-1), Dict, Name, 8.0, 8.0, -1, 50, 0, false, false, false)
end
