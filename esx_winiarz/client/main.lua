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

local HasAlreadyEnteredMarker   = false
local LastZone                  = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local vigneBlip 				= false
local OnJob                     = false
local onDuty                    = false
local CurrentCustomer           = nil
local CurrentCustomerBlip       = nil
local DestinationBlip           = nil
local IsNearCustomer            = false
local CustomerIsEnteringVehicle = false
local CustomerEnteredVehicle    = false
local TargetCoords              = nil
local IsDead                    = false
local showPro                 	= false
local boxowocow 				 = nil
local owoce						= nil
local soki                      = nil
local isHoldingOwoce 			= false
local JobBlips                  = {}
local BlipsAdded 				= false
local cooldownclick             = false
local wyciagnal 				= false

ESX                             = nil



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

function DrawSub(msg, time)
	ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(msg)
	DrawSubtitleTimed(time, 1)
end

function ShowLoadingPromt(msg, time, type)
	Citizen.CreateThread(function()
		Citizen.Wait(0)
		BeginTextCommandBusyString("STRING")
		AddTextComponentString(msg)
		EndTextCommandBusyString(type)
		Citizen.Wait(time)

		RemoveLoadingPrompt()
	end)
end

--function GetRandomWalkingNPC()
--	local search = {}
--	local peds   = ESX.Game.GetPeds()
--
--	for i=1, #peds, 1 do
--		if IsPedHuman(peds[i]) and IsPedWalking(peds[i]) and not IsPedAPlayer(peds[i]) then
--			table.insert(search, peds[i])
--		end
--	end
--
--	if #search > 0 then
--		return search[GetRandomIntInRange(1, #search)]
--	end
--
--	for i=1, 250, 1 do
--		local ped = GetRandomPedAtCoord(0.0, 0.0, 0.0, math.huge + 0.0, math.huge + 0.0, math.huge + 0.0, 26)
--
--		if DoesEntityExist(ped) and IsPedHuman(ped) and IsPedWalking(ped) and not IsPedAPlayer(ped) then
--			table.insert(search, ped)
--		end
--	end
--
--	if #search > 0 then
--		return search[GetRandomIntInRange(1, #search)]
--	end
--end

--function ClearCurrentMission()
--	if DoesBlipExist(CurrentCustomerBlip) then
--		RemoveBlip(CurrentCustomerBlip)
--	end
--
--	if DoesBlipExist(DestinationBlip) then
--		RemoveBlip(DestinationBlip)
--	end
--
--	CurrentCustomer           = nil
--	CurrentCustomerBlip       = nil
--	DestinationBlip           = nil
--	IsNearCustomer            = false
--	CustomerIsEnteringVehicle = false
--	CustomerEnteredVehicle    = false
--	TargetCoords              = nil
--end

--function StartTaxiJob()
--	ShowLoadingPromt(_U('taking_service'), 5000, 3)
--	ClearCurrentMission()
--
--	OnJob = true
--end
--
--function StopTaxiJob()
--	local playerPed = PlayerPedId()
--
--	if IsPedInAnyVehicle(playerPed, false) and CurrentCustomer ~= nil then
--		local vehicle = GetVehiclePedIsIn(playerPed,  false)
--		TaskLeaveVehicle(CurrentCustomer,  vehicle,  0)
--
--		if CustomerEnteredVehicle then
--			TaskGoStraightToCoord(CurrentCustomer,  TargetCoords.x,  TargetCoords.y,  TargetCoords.z,  1.0,  -1,  0.0,  0.0)
--		end
--	end
--
--	ClearCurrentMission()
--	OnJob = false
--	DrawSub(_U('mission_complete'), 5000)
--end

function OpenCloakroom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vigne_cloakroom',
	{
		title    = _U('cloakroom_menu'),
		align    = 'right',
		elements = {
			{ label = _U('wear_citizen'), value = 'wear_citizen' },
			{ label = _U('wear_work'),    value = 'wear_work'}
		}
	}, function(data, menu)
		if data.current.value == 'wear_citizen' then
      offduty()
      mainblip()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		menu.close()
		elseif data.current.value == 'wear_work' then
      onduty()
		      if ESX.PlayerData.job.grade == 0 then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recrue_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recrue_wear.female)
						end
					end)
				elseif ESX.PlayerData.job.grade == 1 then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.novice_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.novice_wear.female)
						end
				end)
				elseif ESX.PlayerData.job.grade == 2 then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.cdisenior_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.cdisenior_wear.female)
						end
				end)
				elseif ESX.PlayerData.job.grade == 3 then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prezes_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.prezes_wear.female)
						end
				end)
				elseif ESX.PlayerData.job.grade == 4 then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zastepca_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zastepca_wear.female)
						end
				end)
				elseif ESX.PlayerData.job.grade == 5 then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.female)
						end
				end)
			 end
		menu.close()
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
	end)
end

function OpenSell()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vigne_sell',
	{
		title    = _U('sell_menu'),
		align    = 'right',
		elements = {
			{ label = _U('sell_apple'), value = 'sell_apple' },
		}
	}, function(data, menu)
		if data.current.value == 'sell_apple' then
      if cooldownclick == false then
        cooldownclick = true
        animacjasprzedaz()
		FreezeEntityPosition(PlayerPedId(), true)
        procent(30)
		FreezeEntityPosition(PlayerPedId(), false)
		TriggerServerEvent('vigne:job3apple')
		Citizen.Wait(1000)
		ClearPedTasks(PlayerPedId())
      end
		elseif data.current.value == 'sell_orange' then
      if cooldownclick == false then
        cooldownclick = true
		animacjasprzedaz()
		animacjazbieraniabutelek()
		FreezeEntityPosition(PlayerPedId(), true)
        procent(30)
		FreezeEntityPosition(PlayerPedId(), false)
		TriggerServerEvent('vigne:job3orange')
      end
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'vigne_sell'
		CurrentActionMsg  = _U('sell_prompt')
		CurrentActionData = {}
	end)
end

function OpenJuice()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vigne_juice',
	{
		title    = _U('juice_menu'),
		align    = 'right',
		elements = {
			{ label = _U('juice_maker'), value = 'juice_maker' },
		}
	}, function(data, menu)
		if data.current.value == 'juice_maker' then
	   	 	if cooldownclick == false then
		    	if not isHoldingOwoce then
			      	if IsPedInAnyVehicle(PlayerPedId()) then
			        	ESX.ShowHelpNotification('Wyjdz z pojazdu.')
			    	else
			       	 	cooldownclick = true
			        	menu.close()
			        	FreezeEntityPosition(PlayerPedId(), true)
			        	procent(30)
			    		TriggerServerEvent('vigne:job2')
			    		FreezeEntityPosition(PlayerPedId(), false)
			      	end
			 	else
			  		ESX.ShowHelpNotification('Skoncz przerabianie poprzednich sokow.')
 	 			end
    		end
	 	end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'vigne_juice'
		CurrentActionMsg  = _U('juice_prompt')
		CurrentActionData = {}
	end)
end

function SetVehicleMaxMods(vehicle, model, extras)
	local mods = {
		color1 = 71,
		extras  = {false,false,false,false,false,false,false,false,false,false,false,false,false}
	}

	if extras then
		for k, v in pairs(extras) do
			mods.extras[tonumber(k)] = tonumber(v)
		end
	end

	ESX.Game.SetVehicleProperties(vehicle, mods)
end

function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()

	local elements = {}

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('spawn_veh'),
			align    = 'right',
			elements	= Config.AuthorizedVehicles
		}, function(data, menu)
			if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				TriggerEvent("pNotify:SendNotification", {text = "Jaki?? pojazd blokuje wyjazd z gara??u!"})
				return
			elseif wyciagnal == true then
				TriggerEvent("pNotify:SendNotification", {text = "Nie odstawi??e?? poprzedniego auta, co ty odwalasz."})
				return
			end

			menu.close()
			ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				SetVehicleMaxMods(vehicle, data.current.model, (data.current.extras or nil))
				local plate = "VIGNE" .. math.random(1000,9999)
				SetVehicleNumberPlateText(vehicle, plate)
				Wait(200)
				vigne_givekeys()
				wyciagnal = true
				TriggerServerEvent('esx_winiarz:kaucja', 1)
			end)
		end, function(data, menu)
			CurrentAction     = 'vehicle_spawner'
			CurrentActionMsg  = _U('spawner_prompt')
			CurrentActionData = {}

			menu.close()
		end)
	--end
end

function DeleteJobVehicle()
	local playerPed = PlayerPedId()

		if IsInAuthorizedVehicle() and wyciagnal == true then

			local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
			--TriggerServerEvent('esx_society:putVehicleInGarage', 'vigne', vehicleProps)
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
			TriggerServerEvent('esx_winiarz:kaucja', 2)
			wyciagnal = false

			--if Config.MaxInService ~= -1 then
			--	TriggerServerEvent('esx_service:disableService', 'vigne')
			--end
		else
			ESX.ShowNotification('Tylko Samochody Winiarza Mog?? tu Parkowa??/Juz odlozyles samochod!')
		end
end

function OpenVigneActionsMenu()
	local elements = {
		{ label = ('Liczba Kurs??w'), value = 'liczba' }
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job ~= nil and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'zastepca') then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
		table.insert(elements, {label = ('Godziny ludzi'), value = 'pizda'})
		table.insert(elements, {label = ('Wyczysc Godziny ludzi'), value = 'wyczysc'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vigne_actions',
	{
		title    = 'Winiarz',
		align    = 'right',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'pizda' then
			OpenKutasMenu()
		elseif data.current.value == 'liczba' then
			OpenKursMenu()
		elseif data.current.value == 'wyczysc' then
			OpenWyczyscMenu()
		elseif data.current.value == 'boss_actions' then
			if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'boss' then
				TriggerEvent('esx_society:openBossMenu', 'vigne', function(data, menu)
					menu.close()
				end, { limit = true }) -- wylacza wyplacanie monet
				elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'zastepca' then
					TriggerEvent('esx_society:openBossMenu', 'vigne', function(data, menu)
						menu.close()
					end, { withdraw = false, balance = false }) -- wylacza wyplacanie monet
				end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'vigne_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end

function OpenWyczyscMenu()
	local elements = {}

	table.insert(elements, {label = 'Tak', value = 'tak'})
	table.insert(elements, {label = 'Nie', value = 'nie'})

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wyczysc_actions',
	{
		title    = 'Czyszczenie',
		align    = 'center',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'nie' then

		elseif data.current.value == 'tak' then
			TriggerServerEvent('vigne:tak')
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenKursMenu()

	ESX.TriggerServerCallback('vigne:getEmployeer', function(liczba)
		local elements = {}

		 if #liczba == 0 then 
			TriggerEvent('pNotify:SendNotification', {text='Nie posiadasz ??adnych wykonanych kurs??w'})
			return
		end

		for i = 1, #liczba, 1 do
			table.insert(elements, {label = "Pracownik: " .. " | " .. liczba[i].name .. " | " .. liczba[i].kursy .. " kursow"})	
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'liczba_menu',
		{
			title    = 'Winiarz',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
			end)
	end)
end

function OpenKutasMenu()

	ESX.TriggerServerCallback('vigne:getEmployees', function(gracze)
		local elements = {}

				if #gracze == 0 then
					TriggerEvent('pNotify:SendNotification',{text ='<b style = color:purple>Twoja lista pracownikow jest pusta!</b>'})
					--ESX.ShowNotification("Twoja lista pracownikow jest pusta!")
					return
				end

				for i = 1, #gracze, 1 do
					table.insert(elements, {label = "Pracownik: " .. " | " .. gracze[i].name .. " | " .. gracze[i].kursy .. " kursow", value = gracze[i].identifier })
				end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'kutas_menu',
		{
			title    = 'Winiarz',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
		end)
	end)
end

--[[function OpenMobileVigneActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_vigne_actions',
	{
		title    = 'Taxi',
		align    = 'top-right',
		elements = {
			{ label = _U('billing'),   value = 'billing' },
			{ label = _U('start_job'), value = 'start_job' }
		}
	}, function(data, menu)
		if data.current.value == 'billing' then

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing', {
				title = _U('invoice_amount')
			}, function(data, menu)

				local amount = tonumber(data.value)
				if amount == nil then
					ESX.ShowNotification(_U('amount_invalid'))
				else
					menu.close()
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if closestPlayer == -1 or closestDistance > 3.0 then
						ESX.ShowNotification(_U('no_players_near'))
					else
						TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_vigne', 'Winogroniarz', amount)
						ESX.ShowNotification(_U('billing_sent'))
					end

				end

			end, function(data, menu)
				menu.close()
			end)

		elseif data.current.value == 'start_job' then
			if OnJob then
				StopTaxiJob()
			else
				if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'vigne' then
					local playerPed = PlayerPedId()
					local vehicle   = GetVehiclePedIsIn(playerPed, false)

					if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
						if tonumber(ESX.PlayerData.job.grade) >= 3 then
							StartTaxiJob()
						else
							if IsInAuthorizedVehicle() then
								StartTaxiJob()
							else
								ESX.ShowNotification(_U('must_in_taxi'))
							end
						end
					else
						if tonumber(ESX.PlayerData.job.grade) >= 3 then
							ESX.ShowNotification(_U('must_in_vehicle'))
						else
							ESX.ShowNotification(_U('must_in_taxi'))
						end
					end
				end
			end
		end
	end, function(data, menu)
		menu.close()
	end)
end]]

function IsInAuthorizedVehicle()
	local playerPed = PlayerPedId()
	local vehModel  = GetEntityModel(GetVehiclePedIsIn(playerPed, false))

	for i=1, #Config.AuthorizedVehicles, 1 do
		if vehModel == GetHashKey(Config.AuthorizedVehicles[i].model) then
			return true
		end
	end
	
	return false
end



----------------------------------------------------------------- WIPWIPWIP
function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'right',
		elements = elements
	}, function(data, menu)

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm',
		{
			title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
			align    = 'right',
			elements = {
				{ label = _U('confirm_no'), value = 'no' },
				{ label = _U('confirm_yes'), value = 'yes' }
			}
		}, function(data2, menu2)

			if data2.current.value == 'yes' then
				local newPlate = exports['esx_vehicleshop']:GeneratePlate()
				local vehicle  = GetVehiclePedIsIn(playerPed, false)
				local props    = ESX.Game.GetVehicleProperties(vehicle)
				props.plate    = newPlate

				ESX.TriggerServerCallback('esx_ambulancejob:buyJobVehicle', function (bought)
					if bought then
						ESX.ShowNotification(_U('vehicleshop_bought', data.current.name, ESX.Math.GroupDigits(data.current.price)))

						isInShopMenu = false
						ESX.UI.Menu.CloseAll()

						DeleteSpawnedVehicles()
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)

						ESX.Game.Teleport(playerPed, restoreCoords)
					else
						ESX.ShowNotification(_U('vehicleshop_money'))
						menu2.close()
					end
				end, props, data.current.type)
			else
				menu2.close()
			end

		end, function(data2, menu2)
			menu2.close()
		end)

		end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()

		WaitForVehicleToLoad(data.current.model)
		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
	end)
end
---------------------------------------------------------------------
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
  	offduty()
   	mainblip()
end)

AddEventHandler('esx_vigne:hasEnteredMarker', function(zone)
	if zone == 'VehicleSpawner' then
		CurrentAction     = 'vehicle_spawner'
		CurrentActionMsg  = _U('spawner_prompt')
		CurrentActionData = {}
	elseif zone == 'VehicleDeleter' and wyciagnal == true then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('store_veh')
			CurrentActionData = { vehicle = vehicle }
		end
	elseif zone == 'VigneActions' then
		CurrentAction     = 'vigne_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}

	elseif zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}

  elseif zone == 'Help' then
    CurrentAction     = 'help'
    CurrentActionMsg  = ('Nacisnij ~g~~INPUT_CONTEXT~~s~ aby uzyskac pomoc')
    CurrentActionData = {}

	elseif zone == 'BuyVehicle' then
		CurrentAction     = 'buy_vehicle'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}

		elseif zone == 'Job1' then
		CurrentAction     = 'Job1'
		CurrentActionMsg  = _U('press_to_work')
		CurrentActionData = {}

		elseif zone == 'Job1b' then
		CurrentAction     = 'Job1b'
		CurrentActionMsg  = _U('press_to_work')
		CurrentActionData = {}

		elseif zone == 'Job1c' then
		CurrentAction     = 'Job1c'
		CurrentActionMsg  = _U('press_to_work')
		CurrentActionData = {}

		elseif zone == 'Job2' then
		CurrentAction     = 'Job2'
		CurrentActionMsg  = _U('juice_work')
		CurrentActionData = {}

		elseif zone == 'Job3' then
		CurrentAction     = 'Job3'
		CurrentActionMsg  = _U('sell_prompt')
		CurrentActionData = {}

		elseif zone == 'Job3a' then
		CurrentAction     = 'Job3a'
		CurrentActionMsg  = _U('press_to_work')
		CurrentActionData = {}

	end
end)

AddEventHandler('esx_vigne:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
			if not onDuty then
				local coords = GetEntityCoords(PlayerPedId())
				local distance = #(coords - vector3(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z))
				local isInMarker, currentZone = false

				if distance < Config.DrawDistance then
					DrawMarker(Config.Zones.Cloakroom.Type, Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Zones.Cloakroom.Size.x, Config.Zones.Cloakroom.Size.y, Config.Zones.Cloakroom.Size.z, Config.Zones.Cloakroom.Color.r, Config.Zones.Cloakroom.Color.g, Config.Zones.Cloakroom.Color.b, 100, false, false, 2, Config.Zones.Cloakroom.Rotate, nil, nil, false)
					if distance < 4.0 then
						DrawText3Ds(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z+0.5, Config.Zones.Cloakroom.Text)
					end
				if distance < Config.Zones.Cloakroom.Size.x then
					isInMarker, currentZone = true, 'Cloakroom'
				end

				if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
					HasAlreadyEnteredMarker, LastZone = true, currentZone
					TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
				end

				if not isInMarker and HasAlreadyEnteredMarker then
					HasAlreadyEnteredMarker = false
					TriggerEvent('esx_vigne:hasExitedMarker', LastZone)
				end

				if isInMarker and IsControlJustReleased(0, Keys['E']) then
						OpenCloakroom()
						CurrentAction = nil
					end
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

Citizen.CreateThread(function()
mainblip()
	while true do
		Citizen.Wait(0)
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
				if onDuty then
					local coords = GetEntityCoords(PlayerPedId())
					local isInMarker, currentZone = false


					for k,v in pairs(Config.Zones) do
						local distance = #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z))

						if v.Type ~= -1 then
							--and distance < Config.DrawDistance then
							if distance > 5 and distance < Config.DrawDistance then
							DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, v.Rotate, nil, nil, false)
							--DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+0.5, v.Text)
							elseif distance < 5 and distance < Config.DrawDistance then
								DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, v.Rotate, nil, nil, false)
								DrawText3Ds(v.Pos.x, v.Pos.y, v.Pos.z+0.5, v.Text)
							end
						end

						if distance < v.Size.x then
							isInMarker, currentZone = true, k
						end
					end

					if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
						HasAlreadyEnteredMarker, LastZone = true, currentZone
						TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
					end

					if not isInMarker and HasAlreadyEnteredMarker then
						HasAlreadyEnteredMarker = false
						TriggerEvent('esx_vigne:hasExitedMarker', LastZone)
					end
				else
					Citizen.Wait(2000)
				end

				if CurrentAction and not IsDead then
					--ESX.ShowHelpNotification(CurrentActionMsg)

					if IsControlJustReleased(0, Keys['E']) and ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
						if CurrentAction == 'vigne_actions_menu' then
							OpenVigneActionsMenu()
						elseif CurrentAction == 'cloakroom' then
							OpenCloakroom()
						elseif CurrentAction == 'help' then
							sadownikhelp()
						elseif CurrentAction == 'vehicle_spawner' then
							OpenVehicleSpawnerMenu()
						elseif CurrentAction == 'delete_vehicle'  then
							DeleteJobVehicle()
						elseif CurrentAction == 'buy_vehicle' then
							OpenShopMenu()
						elseif CurrentAction == 'Job1' then
							WorkJob1()
						elseif CurrentAction == 'Job1b' then
							WorkJob1b()
						elseif CurrentAction == 'Job1c' then
							WorkJob1c()
						elseif CurrentAction == 'Job2' then
							OpenJuice()
						elseif CurrentAction == 'Job3' then
							OpenSell()
						elseif CurrentAction == 'Job3a' then
							WorkJob3a()
						end
					CurrentAction = nil
				 	end
				end
			else
				Citizen.Wait(2000)
			end
	end
end)

--[[if IsControlJustReleased(0, Keys['F6']) and IsInputDisabled(0) and not IsDead and Config.EnablePlayerManagement and ESX.PlayerData.job and ESX.PlayerData.job.name == 'vigne' then
  OpenMobileVigneActionsMenu()
end]]

-- 3x Marker Praca

function isonduty()
	return onDuty ~= nil
end

function WorkJob1()
if onDuty == true then
	if not ESX.Game.IsSpawnPointClear(Config.Zones.Job1.Pos, 14.0) then
		TriggerEvent("pNotify:SendNotification", {text = "Kto?? pozostawi?? pojazd na terenie sadu, ZBIORY WSTRZYMANE!"})
		Citizen.Wait(2000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
	else
	if IsPedInAnyVehicle(PlayerPedId()) then
		ESX.ShowHelpNotification("~r~Tej pracy nie mo??esz wykonywa?? bed??c w pojezdzie!")
		Citizen.Wait(2000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
	else
		local tree = dupa()
		if tree ~= 0 then
			if isHoldingOwoce == true then
				TriggerEvent("pNotify:SendNotification", {text = "Najpierw odstaw owoce do strefy pakowania"})
			else
			animacjazbierania()
			FreezeEntityPosition(PlayerPedId(), true)
			procent(150)
			FreezeEntityPosition(PlayerPedId(), false)
			TriggerServerEvent('vigne:job1a')
			ESX.ShowHelpNotification("~w~Podejd?? do auta i wci??nij ~g~E ~w~aby odlo??y?? owoce")
			Citizen.Wait(3000)
			HasAlreadyEnteredMarker, LastZone = true, currentZone
			TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
			end
		elseif isHoldingOwoce == false then
		ESX.ShowHelpNotification('Musisz podej???? bli??ej drzewa aby co?? z niego zebra??.')
		Citizen.Wait(2000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
		end
	end
	end
else
  ESX.ShowHelpNotification('A gdzie ciuchy robocze?')
  end
end

function WorkJob1b()
if onDuty == true then
	if not ESX.Game.IsSpawnPointClear(Config.Zones.Job1b.Pos, 5.0) then
		TriggerEvent("pNotify:SendNotification", {text = "Kto?? pozostawi?? pojazd na terenie sadu, ZBIORY WSTRZYMANE!"})
		Citizen.Wait(2000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
	else
	if IsPedInAnyVehicle(PlayerPedId()) then
	ESX.ShowHelpNotification("~r~Tej pracy nie mo??esz wykonywa?? bed??c w pojezdzie!")
	Citizen.Wait(2000)
	HasAlreadyEnteredMarker, LastZone = true, currentZone
	TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
	else
	local tree = dupa()
		if tree ~= 0 then
		if isHoldingOwoce == true then
			TriggerEvent("pNotify:SendNotification", {text = "Najpierw odstaw owoce do strefy pakowania"})
		else
		animacjasprzedaz()
		FreezeEntityPosition(PlayerPedId(), true)
			procent(150)
		FreezeEntityPosition(PlayerPedId(), false)
		TriggerServerEvent('vigne:job1b')
		ESX.ShowHelpNotification("~w~Podejd?? do auta i wci??nij ~g~E ~w~aby odlo??y?? butelki")
		Citizen.Wait(3000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
		end
		else
		ESX.ShowHelpNotification('Musisz podej???? bli??ej drzewa aby co?? z niego zebra??22.')
		Citizen.Wait(2000)
		HasAlreadyEnteredMarker, LastZone = true, currentZone
		TriggerEvent('esx_vigne:hasEnteredMarker', currentZone)
				end
			end
		end
		else
			ESX.ShowHelpNotification('A gdzie ciuchy robocze?')
	end
end

function WorkJob3a()
  local pojazd = GetVehiclePedIsIn(PlayerPedId(), false)
  if IsPedInAnyVehicle(PlayerPedId(), false) and IsInAuthorizedVehicle() and not robijuz then
	robijuz = true
    TaskLeaveVehicle(PlayerPedId(), pojazd, 0)
	procent(2)
	TriggerServerEvent('vigne:job3')
	robijuz = false
  else
    ESX.ShowNotification('Musisz byc w aucie')
  end
end

RegisterNetEvent('sadownik:anim')
AddEventHandler('sadownik:anim', function()
	ClearPedTasks(PlayerPedId())
	Wait(750)
	animacjanoszeniaowocow()
  TriggerEvent('sadownik:petelka')
end)

RegisterNetEvent('sadownik:anim22')
AddEventHandler('sadownik:anim22', function()
	ClearPedTasks(PlayerPedId())
	Wait(750)
	animacjanoszeniabutelek()
  TriggerEvent('sadownik:petelka')
end)

RegisterNetEvent('sadownik:anim2')
AddEventHandler('sadownik:anim2', function()
  ESX.ShowHelpNotification('Zanie?? soki do pojazdu.')
	animacjasoki()
  TriggerEvent('sadownik:petelka')
end)

RegisterNetEvent('sadownik:toomuch')
AddEventHandler('sadownik:toomuch', function()
		ESX.ShowHelpNotification("~r~NIE UDZWIGNIESZ WIECEJ OWOCK??W")
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('sadownik:toomuchj')
AddEventHandler('sadownik:toomuchj', function()
		ESX.ShowHelpNotification("~r~NIE UDZWIGNIESZ WIECEJ SOK??W")
	ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('sadownik:toomuch3')
AddEventHandler('sadownik:toomuch3', function()
		ESX.ShowHelpNotification("~r~NIE UDZWIGNIESZ WIECEJ BUTELEK")
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('sadownik:niemasz')
AddEventHandler('sadownik:niemasz', function()
	TriggerEvent("pNotify:SendNotification", {text = "Nie posiadasz odpowiedniej ilosci owocow lub butelek."})
	ClearPedSecondaryTask(PlayerPedId())
end)

RegisterNetEvent('pokaz:kase')
AddEventHandler('pokaz:kase', function()
	TriggerEvent('es:setMoneyDisplay', 1.0)
	Citizen.Wait(2500)
	TriggerEvent('es:setMoneyDisplay', 0.0)
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
  --onDuty = false
  usunboxowocowx()
end)

AddEventHandler('playerSpawned', function(spawn)
	IsDead = false
end)

function animacjazbierania()
	local ad = "amb@prop_human_movie_bulb@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		end
	end
end

function animacjazbieraniabutelek()
	local ad = "amb@prop_human_movie_bulb@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		end
	end
end

function animacjasprzedaz()
	local ad = "mini@repair"
	local anim = "fixing_a_ped"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
		end
	end
end

function animacjanoszeniaowocow()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			boxowocow = CreateObject(GetHashKey("prop_fruit_basket"), 0, 0, 0, true, true, false) -- creates object
			AttachEntityToEntity(boxowocow, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, -0.1, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			AttachEntityToEntity(boxowocow, GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end

function animacjanoszeniabutelek()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			boxbutelek = CreateObject(GetHashKey("v_ret_ml_beerjak2"), 0, 0, 0, true, true, false) -- creates object
			AttachEntityToEntity(boxbutelek, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, -0.1, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			AttachEntityToEntity(boxbutelek, GetPedBoneIndex(GetPlayerPed(-1), 28422), 0.0, 0.0, 0.1, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end

function animacjasoki()
	local ad = "anim@heists@box_carry@"
	local anim = "idle"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			usunpropboxowocowx()
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			soki = CreateObject(GetHashKey("v_ret_ml_beerpat1"), 0, 0, 0, true, true, true) -- creates object
			AttachEntityToEntity(soki, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 28422), 0, -0.2, -0.2, 0, 0, 0, true, true, false, true, 1, true)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 50, 1, 0, 0, 0 )
		end
	end
end

--- usuwanie propa owocow
function usunboxowocowx()
    --DetachEntity(boxowocow, true, false)
    --Citizen.Wait(10000)
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
	DeleteEntity(soki)
	DeleteEntity(boxbutelek)
    ClearPedSecondaryTask(PlayerPedId())
    boxowocow = nil
    owoce = nil
	soki = nil
	boxbutelek = nil
end

--- usuwanie samego propa owocow
function usunpropboxowocowx()
    DeleteEntity(boxowocow)
    DeleteEntity(owoce)
	DeleteEntity(soki)
	DeleteEntity(boxbutelek)
end

-- pomoc dla debili
RegisterCommand("sadownik", function(source, args, raw)
                  sadownikhelp()
end, false)

function sadownikhelp()
		ESX.Scaleform.ShowPopupWarning(Config.Help.Title, Config.Help.Text, bottom, Config.Help.Time)
end

RegisterNetEvent('sadownik:petelka')
AddEventHandler('sadownik:petelka', function()
	isHoldingOwoce = true
  while (isHoldingOwoce) do
    Citizen.Wait(1)
		if IsControlJustPressed(1, 38) then
          local coords = GetEntityCoords(PlayerPedId())
          local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 2.0, 0, 70)
          local dupcia = GetEntityModel(vehicle)
            for i=1, #Config.AuthorizedVehicles, 1 do
				if dupcia == GetHashKey(Config.AuthorizedVehicles[i].model) then
					usunboxowocowx()
					isHoldingOwoce = false
				else
					ESX.ShowNotification("Za daleko do pojazdu lub nieautoryzowany model.")
				end
        end
			end
	end
end)

RegisterNetEvent('sadownik:oddajsoki')
AddEventHandler('sadownik:oddajsoki', function()
  oddajsoki = true
  animacjasoki()
    while (oddajsoki) do
      Citizen.Wait(10)
      local playerPed = PlayerPedId()
      local coordsy = GetEntityCoords(playerPed)
      local odlegloscodskupu = #(coordsy - vector3(2548.443, 2581.251, 37.944))
      DisableControlAction(0, 73, true) -- X
        if IsControlJustReleased(0, Keys['E']) then
          if odlegloscodskupu < 1.5 then
            usunboxowocowx()
            oddajsoki = false
            TriggerServerEvent('vigne:job3a')
          else
            ESX.ShowNotification("Oddaj soki")
          end
        end
    end
end)

RegisterNetEvent('sadownik:procenty')
AddEventHandler('sadownik:procenty', function()
  showPro = true
    while (showPro) do
      Citizen.Wait(10)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DisableControlAction(0, 73, true) -- X
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Pracuje...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

-- check na drzewo przy zbieraniu
function dupa()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local plyOffset = GetOffsetFromEntityInWorldCoords(plyPed, 0.0, 1.0, 0.0)
	local radius = 0.5
	local rayHandle = StartShapeTestCapsule(plyPos.x, plyPos.y, plyPos.z, plyOffset.x, plyOffset.y, plyOffset.z, radius, 1, plyPed, 5)
	local _, _, _, _, tree = GetShapeTestResult(rayHandle)
	return tree
end


function mainblip()
  local blipVigne = AddBlipForCoord(Config.Zones.Cloakroom.Pos.x, Config.Zones.Cloakroom.Pos.y, Config.Zones.Cloakroom.Pos.z)

  SetBlipSprite (blipVigne, Config.Blips.Cloakroom.Sprite)
  SetBlipDisplay(blipVigne, 4)
  SetBlipScale  (blipVigne, 1.0)
  SetBlipColour (blipVigne, 0)
  SetBlipAsShortRange(blipVigne, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Winiarz')
  EndTextCommandSetBlipName(blipVigne)
  table.insert(JobBlips, blipVigne)
end

-- wejscie na sluzbe i dodanie blipow
function onduty()
if not BlipsAdded then
  onDuty = true
  BlipsAdded = true 
  local blipVigne2 = AddBlipForCoord(Config.Zones.Job1.Pos.x, Config.Zones.Job1.Pos.y, Config.Zones.Job1.Pos.z)
  local blipVigne3 = AddBlipForCoord(Config.Zones.Job1b.Pos.x, Config.Zones.Job1b.Pos.y, Config.Zones.Job1b.Pos.z)
  local blipVigne4 = AddBlipForCoord(Config.Zones.Job2.Pos.x, Config.Zones.Job2.Pos.y, Config.Zones.Job2.Pos.z)
  local blipVigne6 = AddBlipForCoord(Config.Zones.Job3a.Pos.x, Config.Zones.Job3a.Pos.y, Config.Zones.Job3a.Pos.z)

  SetBlipSprite (blipVigne2, Config.Blips.Apple.Sprite)
  SetBlipDisplay(blipVigne2, 4)
  SetBlipScale  (blipVigne2, 1.0)
  SetBlipColour (blipVigne2, 0)
  SetBlipAsShortRange(blipVigne2, true)
  AddBlipForRadius(Config.Zones.Job1.Pos.x, Config.Zones.Job1.Pos.y, Config.Zones.Job1.Pos.z , 14.0)

  SetBlipSprite (blipVigne3, Config.Blips.Orange.Sprite)
  SetBlipDisplay(blipVigne3, 4)
  SetBlipScale  (blipVigne3, 1.0)
  SetBlipColour (blipVigne3, 0)
  SetBlipAsShortRange(blipVigne3, true)

  SetBlipSprite (blipVigne4, Config.Blips.Juice.Sprite)
  SetBlipDisplay(blipVigne4, 4)
  SetBlipScale  (blipVigne4, 1.0)
  SetBlipColour (blipVigne4, 0)
  SetBlipAsShortRange(blipVigne4, true)

  SetBlipSprite (blipVigne5, Config.Blips.SellJuice.Sprite)
  SetBlipDisplay(blipVigne5, 4)
  SetBlipScale  (blipVigne5, 1.0)
  SetBlipColour (blipVigne5, 0)
  SetBlipAsShortRange(blipVigne5, true)

  SetBlipSprite (blipVigne6, Config.Blips.SellFruits.Sprite)
  SetBlipDisplay(blipVigne6, 4)
  SetBlipScale  (blipVigne6, 1.0)
  SetBlipColour (blipVigne6, 0)
  SetBlipAsShortRange(blipVigne6, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Zbieranie winogron')
  EndTextCommandSetBlipName(blipVigne2)
  table.insert(JobBlips, blipVigne2)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Zbieranie butelek')
  EndTextCommandSetBlipName(blipVigne3)
  table.insert(JobBlips, blipVigne3)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Hurtownia sok??w')
  EndTextCommandSetBlipName(blipVigne4)
  table.insert(JobBlips, blipVigne4)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Sprzeda?? winogron')
  EndTextCommandSetBlipName(blipVigne5)
  table.insert(JobBlips, blipVigne5)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentSubstringPlayerName('Skup sok??w')
  EndTextCommandSetBlipName(blipVigne6)
  table.insert(JobBlips, blipVigne6)
 else
 	ESX.ShowNotification('Masz juz s??u??bowe ciuchy.')
 end
end

-- usuwanie blipow pracy oraz zejscie ze sluzby.
function offduty()
  onDuty = false
  BlipsAdded = false
  if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function procent(time)
  TriggerEvent('sadownik:procenty')
  TimeLeft = 0
  repeat
  TimeLeft = TimeLeft + 1
  Citizen.Wait(time)
  until(TimeLeft == 100)
  showPro = false
  cooldownclick = false
end

function vigne_givekeys()
    if(IsPedInAnyVehicle(PlayerPedId(), true))then
        VehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
        local VehPlateTest = GetVehicleNumberPlateText(VehId)
        local VehLockStatus = GetVehicleDoorLockStatus(VehId)
        if VehPlateTest ~= nil then
            local VehPlate = string.lower(VehPlateTest)
            TriggerServerEvent('ls:checkOwner', VehId, VehPlate, VehLockStatus)
        end
    end
end


function DrawText3D(x, y, z, text, scale)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

  SetTextScale(scale, scale)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextEntry("STRING")
  SetTextCentre(1)
  SetTextColour(255, 255, 255, 255)
  SetTextOutline()

  AddTextComponentString(text)
  DrawText(_x, _y)

  local factor = (string.len(text)) / 270
  DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        mainblip()
    end
end)

AddEventHandler('onClientMapStart', function()
    mainblip() 
end)