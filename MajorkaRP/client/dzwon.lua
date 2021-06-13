-- No need to modify any of this, but I tried to document what it's doing
local isBlackedOut = false
local oldBodyDamage = 0
local oldSpeed = 0

local function blackout()
	-- Only blackout once to prevent an extended blackout if both speed and damage thresholds were met
	if not isBlackedOut then
		isBlackedOut = true 
		-- This thread will black out the user's screen for the specified time
		--[[Citizen.CreateThread(function()
			DoScreenFadeOut(100)
			while not IsScreenFadedOut() do
				Citizen.Wait(0)
			end
			Citizen.Wait(2000)
			DoScreenFadeIn(250)]]
			StartScreenEffect('DeathFailOut', 0, true)
			--if not exports['esx_optionalneeds']:IsDrunk() and not exports['esx_drugs']:IsHigh() then
				SetTimecycleModifier("hud_def_blur")
			--end
	
			ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 2.0)
			Citizen.Wait(1000)
	
			ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
			Citizen.Wait(1000)
	
			ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 1.0)
			Citizen.Wait(1000)
			StopScreenEffect('DeathFailOut')
			isBlackedOut = false
			SetTimecycleModifier("")
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		-- Get the vehicle the player is in, and continue if it exists
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		if DoesEntityExist(vehicle) then
			-- Check if damage blackout is enabled
			if true then
				local currentDamage = GetVehicleBodyHealth(vehicle)
				-- If the damage changed, see if it went over the threshold and blackout if necesary
				if currentDamage ~= oldBodyDamage then
					if not isBlackedOut and (currentDamage < oldBodyDamage) and ((oldBodyDamage - currentDamage) >= 50) then
						blackout()
					
					end
					oldBodyDamage = currentDamage
				end
			end
			
			-- Check if speed blackout is enabled
			if true then
				local currentSpeed = GetEntitySpeed(vehicle) * 2.23
				-- If the speed changed, see if it went over the threshold and blackout if necesary
				if currentSpeed ~= oldSpeed then
					if not isBlackedOut and (currentSpeed < oldSpeed) and ((oldSpeed - currentSpeed) >= 75) then
						blackout()

					end
					oldSpeed = currentSpeed
				end
			end
		else
			oldBodyDamage = 0
			oldSpeed = 0
		end
		
	end
end)

Citizen.CreateThread(function()

	while true do 
	Citizen.Wait(0)
		if isBlackedOut then
			DisableControlAction(0, 71 ,true) -- veh forward
			DisableControlAction(0, 72 ,true) -- veh backwards
			DisableControlAction(0, 63 ,true) -- veh turn left
			DisableControlAction(0, 64 ,true) -- veh turn right
			DisableControlAction(0, 75 ,true) -- disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)
