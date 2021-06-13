-- SCREEN POSITION PARAMETERS
local screenPosX = 0.165                    -- X coordinate (top left corner of HUD)
local screenPosY = 0.882                    -- Y coordinate (top left corner of HUD)

-- GENERAL PARAMETERS
local enableController = true               -- Enable controller inputs

-- SPEEDOMETER PARAMETERS
local speedLimit = 100.0 
local speedmax = 200.0                     -- Speed limit for changing speed color
local speedColorText = {255, 255, 255}      -- Color used to display speed label text
local speedColorUnder = {255, 255, 255}
local speedColorkm100 = {163, 34, 252} 			-- Kolor powyzej 100km ale ponizej 200
local speedColorkmover = {255, 255, 255}       -- Color used to display speed when under speedLimit
local speedColorOver = {255, 255, 255}
local speedColorMax = {255, 255, 255}   
local speedColorkmmax = {255, 0, 0}        -- Color used to display speed when over speedLimit

-- FUEL PARAMETERS
local fuelShowPercentage = false             -- Show fuel as a percentage (disabled shows fuel in liters)
local fuelWarnLimit = 25.0                  -- Fuel limit for triggering warning color
local fuelColorText = {255, 255, 255}       -- Color used to display fuel text
local fuelColorOver = {255, 255, 255}       -- Color used to display fuel when good
local fuelColorUnder = {255, 96, 96}        -- Color used to display fuel warning

-- SEATBELT PARAMETERS
local seatbeltInput = 182                   -- Toggle seatbelt on/off with L or DPAD down (controller)
local seatbeltPlaySound = true              -- Play seatbelt sound
local seatbeltDisableExit = true            -- Disable vehicle exit when seatbelt is enabled
local seatbeltEjectSpeed = 45.0             -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100.0            -- Acceleration threshold to eject player (G's)
local seatbeltColorOn = {0, 201, 1}     -- Color used when seatbelt is on
local seatbeltColorOff = {207, 7, 1}      -- Color used when seatbelt is off
local seatbeltIsOn = false

-- CRUISE CONTROL PARAMETERS
local cruiseInput = 137                     -- Toggle cruise on/off with CAPSLOCK or A button (controller)
local cruiseColorOn = {0, 201, 1}       -- Color used when seatbelt is on
local cruiseColorOff = {207, 7, 1}      -- Color used when seatbelt is off

-- LOCATION AND TIME PARAMETERS
local locationAlwaysOn  = false              -- Always display location and time
local locationColorText = {255, 255, 255}
local timecolor			= {163, 34, 252}      -- Color used to display location and time

-- Lookup tables for direction and zone
local directions = { [0] = 'Północ', [1] = 'Południowy zachód', [2] = 'Zachód', [3] = 'Południowy zachód', [4] = 'Południe', [5] = 'Południowy wschód', [6] = 'Wschód', [7] = 'Północny wschód', [8] = 'Północ' } 
local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }

-- Globals
local pedInVeh = false
local timeText = ""
local locationText = ""
local currentFuel = 0.0

AddEventHandler('seatbelt:sounds', function(soundFile, soundVolume)
  SendNUIMessage({
    transactionType = 'playSound',
    transactionFile = soundFile,
    transactionVolume = soundVolume
  })
end)

-- Main thread
Citizen.CreateThread(function()
    -- Initialize local variable
    local currSpeed = 0.0
    local cruiseSpeed = 999.0
    local prevVelocity = {x = 0.0, y = 0.0, z = 0.0}
    local cruiseIsOn = false

    while true do
        -- Loop forever and update HUD every frame
		Citizen.Wait(0)
        -- Get player PED, position and vehicle and save to locals
        local player = GetPlayerPed(-1)
        local position = GetEntityCoords(player)
        local vehicle = GetVehiclePedIsIn(player, false)

        -- Set vehicle states
        if IsPedInAnyVehicle(player, false) then
            pedInVeh = true
        else
            -- Reset states when not in car
            pedInVeh = false
            cruiseIsOn = false
            seatbeltIsOn = false
        end
        
        -- Display Location and time when in any vehicle or on foot (if enabled)
        if pedInVeh or locationAlwaysOn then
            -- Get time and display
            drawTxt(timeText, 4, timecolor, 0.35, screenPosX, screenPosY + 0.018)
            
            -- Display heading, street name and zone when possible
            drawTxt(locationText, 4, locationColorText, 0.30, screenPosX, screenPosY + 0.075)
        
            -- Display remainder of HUD when engine is on and vehicle is not a bicycle
            local vehicleClass = GetVehicleClass(vehicle)
            if pedInVeh and GetIsVehicleEngineRunning(vehicle) and vehicleClass ~= 13 then
                -- Save previous speed and get current speed
                local prevSpeed = currSpeed
                currSpeed = GetEntitySpeed(vehicle)

                -- Set PED flags
                SetPedConfigFlag(PlayerPedId(), 32, true)
                
                -- Check if seatbelt button pressed, toggle state and handle seatbelt logic
                if IsControlJustReleased(0, seatbeltInput) and (enableController or GetLastInputMethod(0)) and vehicleClass ~= 8 then
                    -- Toggle seatbelt status and play sound when enabled
                    seatbeltIsOn = not seatbeltIsOn
                    if seatbeltIsOn then
                    	exports['mythic_notify']:DoCustomHudText('inform', '<span style="font-size:13px;"> Zapiąłeś </span> Pas <span style="color:black</span>', 10000)
                    	--PlaySoundFrontend(-1, "Highlight_Accept", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 0)
						TriggerEvent("seatbelt:sounds", "buckle", 0.2)
                        --TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.7, 'seaton', 0.2)
                    else
                    	exports['mythic_notify']:DoCustomHudText('error', '<span style="font-size:13px;"> Odpiąłeś </span> Pas <span style="color:black</span>', 10000)
                    	--PlaySoundFrontend(-1, "Highlight_Cancel", "DLC_HEIST_PLANNING_BOARD_SOUNDS", 0)
						TriggerEvent("seatbelt:sounds", "unbuckle", 0.2)
                      --  TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.7, 'seatoff', 0.2)
                        
                    end
                end
                if not seatbeltIsOn then
                    -- Eject PED when moving forward, vehicle was going over 45 MPH and acceleration over 100 G's
                    local vehIsMovingFwd = GetEntitySpeedVector(vehicle, true).y > 1.0
                    local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                    if (vehIsMovingFwd and (prevSpeed > (seatbeltEjectSpeed/2.237)) and (vehAcc > (seatbeltEjectAccel*9.81))) then
                        SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                        SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                        Citizen.Wait(1)
                        SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                    else
                        -- Update previous velocity for ejecting player
                        prevVelocity = GetEntityVelocity(vehicle)
                    end
                elseif seatbeltDisableExit then
                    -- Disable vehicle exit when seatbelt is on
                    DisableControlAction(0, 75)
                end
                -- Check what units should be used for speed
                if pedInVeh then
                    -- Get vehicle speed in KPH and draw speedometer
                    local speed = currSpeed*3.6
                    if speed <= 100 then 
                    local speedColor = (speed >= speedLimit ) and speedColorOver or speedColorUnder 
                    drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColor, 0.4, screenPosX + 0.000, screenPosY + 0.044)
                    drawTxt("KMH", 2, speedColorkmover, 0.20, screenPosX + 0.020, screenPosY + 0.048)
                elseif speed >= 100 and speed < 200 then 
                    drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColorMax, 0.4, screenPosX + 0.000, screenPosY + 0.044)
                    drawTxt("KMH", 2, speedColorkm100, 0.20, screenPosX + 0.020, screenPosY + 0.048)
                elseif speed >= 200 then 
                    drawTxt(("%.3d"):format(math.ceil(speed)), 2, speedColorMax, 0.4, screenPosX + 0.000, screenPosY + 0.044)
                    drawTxt("KMH", 2, speedColorkmmax, 0.20, screenPosX + 0.020, screenPosY + 0.048)
                end
                end

                -- Draw seatbelt status if not a motorcyle
                if vehicleClass ~= 8 then
                    local seatbeltColor = seatbeltIsOn and seatbeltColorOn or seatbeltColorOff
                    drawTxt("Pasy", 2, seatbeltColor, 0.5, screenPosX + 0.033, screenPosY + 0.044)
                end
            end
        end
    end
end)

-- Secondary thread to update strings
Citizen.CreateThread(function()
    while true do
        -- Update when player is in a vehicle or on foot (if enabled)
        if pedInVeh or locationAlwaysOn then
            -- Get player, position and vehicle
            local player = GetPlayerPed(-1)
            local position = GetEntityCoords(player)

            -- Update time text string
            local hour = GetClockHours()
            local minute = GetClockMinutes()
            timeText = ("%.2d"):format((hour == 0) and 12 or hour) .. ":" .. ("%.2d"):format( minute) .. ((hour < 12) and "AM" or " PM")

            -- Get heading and zone from lookup tables and street name from hash
            local heading = directions[math.floor((GetEntityHeading(player) + 22.5) / 45.0)]
            local zoneNameFull = zones[GetNameOfZone(position.x, position.y, position.z)]
            local streetName = GetStreetNameFromHashKey(GetStreetNameAtCoord(position.x, position.y, position.z))
            
            -- Update location text string
            locationText = heading
            locationText = (streetName == "" or streetName == nil) and (locationText) or (locationText .. " | " .. streetName)
            locationText = (zoneNameFull == "" or zoneNameFull == nil) and (locationText) or (locationText .. " | " .. zoneNameFull)

            -- Update fuel when in a vehicle
    
            -- Update every second
            Citizen.Wait(1500)
        else
            -- Wait until next frame
            Citizen.Wait(0)
        end
    end
end)

-- Helper function to draw text to screen
function drawTxt(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

Citizen.CreateThread(function()
	while true do
			Citizen.Wait(3500)
		if not seatbeltIsOn and pedInVeh and not IsPauseMenuActive() then
		Citizen.Wait(250)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
		local vehicleClass = GetVehicleClass(vehicle)
			if not seatbeltIsOn and pedInVeh and not IsPauseMenuActive() and vehicleClass ~= 8 and vehicleClass ~= 13 and GetIsVehicleEngineRunning(vehicle)then
				TriggerEvent("seatbelt:sounds", "seatbelt", 0.1)
			end
		end    
	end
end)