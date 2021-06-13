ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while not ESX.GetPlayerData().job or not ESX.GetPlayerData().job2 do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	-- Update the door list
	ESX.TriggerServerCallback('esx_doorlock:getDoorState', function(doorState)
		for index,state in pairs(doorState) do
			Config.DoorList[index].locked = state
		end
	end)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2) ESX.PlayerData.job2 = job2 end)

RegisterNetEvent('esx_doorlock:setDoorState')
AddEventHandler('esx_doorlock:setDoorState', function(index, state) Config.DoorList[index].locked = state end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 360
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

Citizen.CreateThread(function()

	while true do
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k,v in ipairs(Config.DoorList) do
			v.isAuthorized = isAuthorized(v)

			if v.doors then
				for k2,v2 in ipairs(v.doors) do
					if v2.object and DoesEntityExist(v2.object) then
						if k2 == 1 then
							v.distanceToPlayer = #(playerCoords - GetEntityCoords(v2.object))
						end

						if v.locked and v2.objHeading and ESX.Math.Round(GetEntityHeading(v2.object)) ~= v2.objHeading then
							SetEntityHeading(v2.object, v2.objHeading)
						end

						if v.locked and v.brama ~=nil and v.brama == true then
							SetEntityCoords(v2.object, v2.objCoords.x, v2.objCoords.y , v2.objCoords.z, true , true, true ,true)
						end

					else
						v.distanceToPlayer = nil
						v2.object = GetClosestObjectOfType(v2.objCoords, 1.0, v2.objHash, false, false, false)
					end
				end
			else
				if v.object and DoesEntityExist(v.object) then
					v.distanceToPlayer = #(playerCoords - GetEntityCoords(v.object))

					if v.locked and v.objHeading and ESX.Math.Round(GetEntityHeading(v.object)) ~= v.objHeading then
						SetEntityHeading(v.object, v.objHeading)
					end

					if v.locked and v.brama ~=nil and v.brama == true then
						SetEntityCoords(v2.object, v2.objCoords.x, v2.objCoords.y , v2.objCoords.z, true , true, true ,true)
					end

				else
					v.distanceToPlayer = nil
					v.object = GetClosestObjectOfType(v.objCoords, 1.0, v.objHash, false, false, false)
				end
			end
		end

		Citizen.Wait(1500)
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local letSleep = true

		for k,v in ipairs(Config.DoorList) do
			if v.distanceToPlayer and v.distanceToPlayer < 25 then
				letSleep = false

				if v.doors then
					for k2,v2 in ipairs(v.doors) do
						FreezeEntityPosition(v2.object, v.locked)
					end
				else
					FreezeEntityPosition(v.object, v.locked)
				end
			end

			if v.distanceToPlayer and v.distanceToPlayer < v.maxDistance then
				local size, displayText = 1, _U('unlocked')

				if v.size then size = v.size end
				if v.locked then displayText = _U('locked') end
				if v.isAuthorized then displayText = _U('press_button', displayText) end
				if v.isAuthorized then DrawText3Ds(v.textCoords.x, v.textCoords.y, v.textCoords.z, displayText) end
				if IsControlJustReleased(0, 38) then
					if v.isAuthorized then
						v.locked = not v.locked
						TriggerServerEvent('esx_doorlock:updateState', k, v.locked) -- broadcast new state of the door to everyone
					end
				end
			end
		end

		if letSleep then
			Citizen.Wait(500)
		end
	end
end)

function isAuthorized(door)
	if not ESX or not ESX.PlayerData.job or not ESX.PlayerData.job2 then
		return false
	end

	for k,job in pairs(door.authorizedJobs) do
		if job == ESX.PlayerData.job.name then
			return true
		end
	end
	
		for k,job2 in pairs(door.authorizedJobs) do
		if job2 == ESX.PlayerData.job2.name then
			return true
		end
	end

	return false
end
