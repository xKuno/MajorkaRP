local Keys = {
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

local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local LastEntity              = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local rucha = false
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)



Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_y_business_03"))
	
    while not HasModelLoaded(GetHashKey("a_m_y_business_03")) do
        Wait(1)
    end
	
	if Config.EnableShops then
		for _, item in pairs(Config.Locations1) do
			local npc = CreatePed(4, 0xA1435105, item.x, item.y, item.z, item.heading, false, true)
			
			SetEntityHeading(npc, item.heading)
			FreezeEntityPosition(npc, true)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
		end
	end
end)

-----------------------------------------------------------------NIGHTCLUB---------------------------------------------------------------------------
-- Nightclub Girls1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("csb_stripper_01"))
	
    while not HasModelLoaded(GetHashKey("csb_stripper_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations2) do
			local npc = CreatePed(4, 0xAEEA76B5, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("mini@strip_club@lap_dance@ld_girl_a_song_a_p1")
			while not HasAnimDictLoaded("mini@strip_club@lap_dance@ld_girl_a_song_a_p1") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"mini@strip_club@lap_dance@ld_girl_a_song_a_p1","ld_girl_a_song_a_p1_f",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
			--TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)--
		end
	end
end)

-- Nightclub Girls1
Citizen.CreateThread(function()
    RequestModel(GetHashKey("csb_stripper_02"))
	
    while not HasModelLoaded(GetHashKey("csb_stripper_02")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations3) do
			local npc = CreatePed(4, 0x81441B71, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("mini@strip_club@lap_dance@ld_girl_a_song_a_p1")
			while not HasAnimDictLoaded("mini@strip_club@lap_dance@ld_girl_a_song_a_p1") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"mini@strip_club@lap_dance@ld_girl_a_song_a_p1","ld_girl_a_song_a_p1_f",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
			--TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)--
		end
	end
end)

-- Nightclub Bartender
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_f_y_bartender_01"))
	
    while not HasModelLoaded(GetHashKey("s_f_y_bartender_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations10) do
			local npc = CreatePed(4, 0x780c01bd, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			SetPedCanPlayAmbientAnims(npc, true)
		end
	end
end)

-- Nightclub Guards
Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_chemsec_01"))
	
    while not HasModelLoaded(GetHashKey("s_m_m_chemsec_01")) do
        Wait(1)
    end
	
	if Config.EnableNightclubs then
		for _, item in pairs(Config.Locations11) do
			local npc = CreatePed(4, 0x2EFEAFD5, item.x, item.y, item.z, item.heading, false, true)
			
			FreezeEntityPosition(npc, true)	
			SetEntityHeading(npc, item.heading)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("anim@amb@nightclub@peds@")
			while not HasAnimDictLoaded("anim@amb@nightclub@peds@") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)
			TaskPlayAnim(npc,"anim@amb@nightclub@peds@","amb_world_human_stand_guard_male_base",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
		end
	end
end)

AddEventHandler('esx_vanilla:hasEnteredMarker', function(station, part, partNum)

	if part == 'dziwka' then
		CurrentAction     = 'dziwka'
		CurrentActionMsg  = ('Nacisnij E aby wynajac striptizerke, koszt ~r~5000$')
		CurrentActionData = {}

	end

end)

AddEventHandler('esx_vanilla:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)



Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		for _, item in pairs(Config.Prywatne) do
			if #(coords -vector3(item.x, item.y, item.z)) < Config.DrawDistance then
				DrawMarker(Config.MarkerType, item.x, item.y, item.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil
			for _, item in pairs(Config.Prywatne) do
				if #(coords - vector3(item.x, item.y, item.z)) < Config.MarkerSize.x then
					isInMarker     = true
					currentStation = _
					currentPart    = 'dziwka'
					currentPartNum = item
					print(CurrentAction)
				end
			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_vanilla:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_vanilla:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_vanilla:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end

	end
end)

function Dziwka()
	ESX.TriggerServerCallback('esx_vanilla:canAfford', function(canAfford)
	if canAfford then
		Citizen.CreateThread(function()

		Citizen.Wait(200)
		DoScreenFadeOut(100)
		SetEntityCoords(GetPlayerPed(-1), -1472.14, -532.01, 50.45)
		Citizen.Wait(500)
		RequestModel(GetHashKey("csb_stripper_02"))
	
		while not HasModelLoaded(GetHashKey("csb_stripper_02")) do
			Wait(1)
		end
			local npc = CreatePed(4, 0x81441B71, -1471.61, -531.52, 50.39, 147.04, false, true)
			FreezeEntityPosition(npc, true)
			SetEntityHeading(npc, 121.4)
			SetEntityInvincible(npc, true)
			SetBlockingOfNonTemporaryEvents(npc, true)
			RequestAnimDict("mini@strip_club@lap_dance@ld_girl_a_song_a_p1")
			while not HasAnimDictLoaded("mini@strip_club@lap_dance@ld_girl_a_song_a_p1") do
			Citizen.Wait(1000)
			end
				
	        Citizen.Wait(200)	
			TaskPlayAnim(npc,"mini@strip_club@lap_dance@ld_girl_a_song_a_p1","ld_girl_a_song_a_p1_f",1.0, 1.0, -1, 9, 1.0, 0, 0, 0)
			SetEntityHeading(PlayerPedId(), 121.4)
			rucha = true
			FreezeEntityPosition(PlayerPedId(), true)	
			TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, false)
			TriggerEvent('skinchanger:getSkin', function(skin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadSkin', {
						sex      = 0,
						tshirt_1 = 15,
						tshirt_2 = 0,
						arms     = 15,
						torso_1  = 91,
						torso_2  = 0,
						pants_1  = 61,
						pants_2  = 1
					})
				else
					TriggerEvent('skinchanger:loadSkin', {
						sex      = 1,
						tshirt_1 = 14,
						tshirt_2 = 0,
						arms     = 15,
						torso_1  = 15,
						torso_2  = 0,
						pants_1  = 15,
						pants_2  = 0
					})
				end
			end)
			Citizen.Wait(5000)
			DoScreenFadeIn(50)
			Citizen.Wait(180000)
			DoScreenFadeOut(100)
			setPedSkin()
			DeleteEntity(npc)
			Citizen.Wait(5000)
			rucha = false
			FreezeEntityPosition(PlayerPedId(), false)
			SetEntityCoords(GetPlayerPed(-1), -1384.46, -619.84, 30.82)
			DoScreenFadeIn(50)
		end)
		else
			ESX.ShowNotification(('Potrzebujesz 5000$, aby wynajac striptizerke.'))
			Citizen.Wait(5000)
		end
	end)
end

function setPedSkin()
	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)
end

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then

				if CurrentAction == 'dziwka' then
					Dziwka()
				end
				
				CurrentAction = nil
			end
		end -- CurrentAction end
	end
end)

-- Handcuff
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
 
        if rucha then
            DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, Keys['R'], true) -- Reload
            DisableControlAction(2, Keys['SPACE'], true) -- Jump
            DisableControlAction(2, Keys['Q'], true) -- Cover
            DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(2, Keys['F'], true) -- Also 'enter'?
            DisableControlAction(2, Keys['F1'], true) -- Disable phone
            DisableControlAction(2, Keys['F2'], true) -- Inventory
            DisableControlAction(2, Keys['F3'], true) -- Animations
            DisableControlAction(2, Keys['F6'], true) -- Animations
            DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(2, Keys['P'], true) -- Disable pause screen
            DisableControlAction(2, Keys['F9'], true) -- Disable pause screen
            DisableControlAction(2, Keys['Z'], true) -- Disable pause screen
            DisableControlAction(2, 59, true) -- Disable steering in vehicle
            DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(27, 75, true) -- Disable exit vehicle
            DisableControlAction(0, 21, true)  -- Bieganie
            DisableControlAction(0, Keys[','], true)  -- Bieganie
            DisableControlAction(1, Keys[','], true)  -- Bieganie
            DisableControlAction(2, Keys[','], true)  -- Bieganie
			DisableControlAction(1, Keys['B'], true) -- Disable going stealth
			DisableControlAction(0, Keys['B'], true) -- Disable going stealth
			DisableControlAction(3, Keys['B'], true) -- Disable going stealth
            DisableControlAction(0, Keys['='], true)  -- Bieganie
            DisableControlAction(1, Keys['='], true)  -- Bieganie
            DisableControlAction(2, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['='], true)  -- Bieganie
			if rucha then
				if not IsPedUsingScenario(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK") then
					TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, false)
				end
			end
        end
    end
end)
