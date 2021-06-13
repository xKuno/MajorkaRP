----------------------
-- Author : Deediezi
-- Version 4.5
--
-- Contributors : No contributors at the moment.
--
-- Github link : https://github.com/Deediezi/FiveM_LockSystem
-- You can contribute to the project. All the information is on Github.

--  Vehicle object manager - Client side

function newVehicle()
    local self = {}

    self.id = nil
    self.plate = nil
    self.lockStatus = nil

    rTable = {}

    rTable.__construct = function(id, plate, lockStatus)
        if(id and type(id) == "number")then
            self.id = id
        end
        if(plate and type(plate) == "string")then
            self.plate = plate
        end
        if(lockStatus and type(lockStatus) == "number")then
            self.lockStatus = lockStatus
        end
    end

    -- Methods

    rTable.update = function(id, lockStatus)
        self.id = id
        self.lockStatus = lockStatus
    end


           local ply = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ply, true)
            local px, py, pz = table.unpack(GetEntityCoords(ply, true))
            isInside = false
			
            if(IsPedInAnyVehicle(ply, true))then
                -- by sitting inside him
                localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                isInside = true
            else
                -- celujac w pojazd
                localVehId = GetTargetedVehicle(pCoords, ply)
            end

    -- 0, 1 = unlocked
    -- 2 = locked
    -- 4 = locked and player can't get out
    rTable.lock = function()
        lockStatus = self.lockStatus
		local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
        if(lockStatus <= 2)then
            self.lockStatus = 4
            SetVehicleDoorsLocked(self.id, self.lockStatus)
            SetVehicleDoorsLockedForAllPlayers(self.id, 1)
            TriggerEvent("ls:notify", _U("vehicle_locked").."                                                 ~b~Rejestracja: " .. localVehPlateTest)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 1.0)
        elseif(lockStatus > 2)then
            self.lockStatus = 1
            SetVehicleDoorsLocked(self.id, self.lockStatus)
            SetVehicleDoorsLockedForAllPlayers(self.id, false)
            TriggerEvent("ls:notify", _U("vehicle_unlocked").. "                                                 ~b~Rejestracja: " .. localVehPlateTest)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 1.0)
        end
    end

    -- Setters

    rTable.setId = function(id)
        if(type(id) == "number" and id >= 0)then
            self.id = id
        end
    end

    rTable.setPlate = function(plate)
        if(type(plate) == "string")then
            self.plate = plate
        end
    end

    rTable.setLockStatus = function(lockStatus)
        if(type(lockStatus) == "number" and lockStatus >= 0)then
            self.lockStatus = lockStatus
            SetVehicleDoorsLocked(self.id, lockStatus)
        end
    end

    -- Getters

    rTable.getId = function()
        return self.id
    end

    rTable.getPlate = function()
        return self.plate
    end

    rTable.getLockStatus = function()
        return self.lockStatus
    end

    return rTable
end
