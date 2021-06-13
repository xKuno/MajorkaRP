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
local Blips 					= {}
local JobBlips 					= {}
local IsDead                    = false
local DestinationBlip           = nil
local Praca 					= false
local zbiera 					= false
local Packaging					= false
local wyciagnal				    = false
local wzialpaczki 				= false
local sluzba					= false
local oddal = 0
ESX = nil

PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	
	CipaBlips()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	deleteBlips()
	CipaBlips()
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job

	Citizen.Wait(200)
	deleteBlips()
	CipaBlips()
end)

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function SetVehicleMaxMods(vehicle)
	local props = {
		SetVehicleNumberPlateText(vehicle, plate),
	}
	ESX.Game.SetVehicleProperties(vehicle, props)
end

Citizen.CreateThread(function()
		while true do
			local sleepThread = 500

			if PlayerData.job ~= nil and PlayerData.job.name == 'kurier'  then
			local Packages = Config.Dostarczanie["SprawdzaniePaczki"]

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)
				for posId, v in pairs(Packages) do
if wzialpaczki then
				local DistanceCheck = #(PedCoords - vector3(v["x"], v["y"], v["z"]))

				if DistanceCheck <= 5.0 then

					sleepThread = 5

					local PackageText = "~g~Sprawdzaj paczki"

					if not v["state"] then
						PackageText = "~r~Sprawdzone"
					end

						ESX.Game.Utils.DrawText3D(v, "~y~[E] " .. PackageText, 0.4)

					if DistanceCheck <= 1.5 then
						if IsControlJustPressed(0, 38) and not uzywa then
							uzywa = true
						ESX.TriggerServerCallback('esx_kurier:jablkailosc', function(ilosc)
						if ilosc >= 40 then
							if v["state"] and not zbiera then
								PackPackage(posId)
								TriggerServerEvent("esx_kurier:dajsprawdzone")
								LosujDostawce1()
								wzialpaczki = false
								v["state"] = false
								Citizen.Wait(50000)
								v["state"] = true
								uzywa = false
							else
								TriggerEvent('pNotify:SendNotification', {text ='<b style = color:red>Juz sprawdziles paczki z tego kursu, odczekaj 5 minut!</b>'})
								--ESX.ShowNotification("~r~Juz sprawdziles paczki z tego kursu, odczekaj 5 minut!")
								end
							else
								TriggerEvent('pNotify:SendNotification', {text ='<b style = color:red>Nie masz paczek! Wroc do siedziby GoPostal i wez pojazd.</b>'})
								--ESX.ShowNotification("~r~Nie masz paczek! Wroc do siedziby GoPostal i wez pojazd.")
									end
								end, 'paczkadosprawdzenia')
							end	
						end
					end
				end
			end
		end
			Citizen.Wait(sleepThread)
	end
end)

function PackPackage(packageId)
	local Package = Config.Dostarczanie["SprawdzaniePaczki"][packageId]
	
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)

	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do
		
		Citizen.Wait(1)
		DisableAllControlActions(PlayerPedId(), true)
		local TimeToTake = 60000 * 0.05 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		--[[if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then

			TriggerEvent('pNotify:SendNotification', {text ='<b style = color:red>Anulowano!</b>'})

			Packaging = false
		end]]



		if PackPercent >= 100 then

			Packaging = false
			ClearPedTasksImmediately(PlayerPedId())
			ClearPedTasks(PlayerPedId())
			zbiera = true
			DisableAllControlActions(PlayerPedId(), false)
			
		else
			ESX.Game.Utils.DrawText3D(Package, "~g~Trwa sprawdzanie paczek... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end
		
	end
end

function ClearCurrentMission()

	if DoesBlipExist(DestinationBlip) then
		RemoveBlip(DestinationBlip)
		DestinationBlip           = nil
	end
	RemoveBlip(DestinationBlip)
	DestinationBlip           = nil
end

function SprzedajPaczke(x,y,z)
	
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)

	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do
		
		Citizen.Wait(1)
		DisableAllControlActions(PlayerPedId(), true)
		local TimeToTake = 60000 * 0.45 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		--[[if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then
			TriggerEvent('pNotify:SendNotification', {text ='<b style = color:red>Anulowano!</b>'})
			--ESX.ShowNotification('Anulowano!')

			Packaging = false
		end]]

		if PackPercent >= 100 then
			oddal = oddal + 1
			Packaging = false
			ClearPedTasks(PlayerPedId())
			TriggerServerEvent("esx_kurier:zaplata")
			ClearCurrentMission()
			DisableAllControlActions(PlayerPedId(), false)
			
		else
			ESX.Game.Utils.DrawText3D(vector3(x,y,z), "~g~Trwa oddawanie paczek... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end
		
	end
end

function LosujDostawce1()
	local grade = PlayerData.job.grade_name
		if grade == 'recrue' then
		TargetCoords = Config.JobLocations[GetRandomIntInRange(1, #Config.JobLocations)]

		DestinationBlip = AddBlipForCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Destination")
		EndTextCommandSetBlipName(blip)
		SetBlipRoute(DestinationBlip, true)
		local PedPosition = GetEntityCoords(PlayerPedId())
		Citizen.CreateThread(function()
			while zbiera do
				Citizen.Wait(0)
				local Ped = PlayerPedId()
				local PedCoords = GetEntityCoords(Ped)
				if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and sluzba then
					
					local DistanceCheck = #(PedCoords -vector3(TargetCoords.x, TargetCoords.y, TargetCoords.z))

					if DistanceCheck <= 5.0 then

						local PackageText = "~g~Dostarcz Paczke"

						ESX.Game.Utils.DrawText3D(vector3(TargetCoords.x, TargetCoords.y, TargetCoords.z), "~y~[E] " .. PackageText, 0.4)

						if DistanceCheck <= 1.5 then

							if IsControlJustPressed(0, 38) then
							--	RemoveBlip(DestinationBlip)
								zbiera = false
								SprzedajPaczke(TargetCoords.x, TargetCoords.y, TargetCoords.z)
							--	DestinationBlip           = nil
							end	
						end
					end
				else
					Ciitzen.Wait(1000)
				end
			end
		end)
else
	if grade ~= 'recrue' then
		TargetCoords = Config.JobLocationsLepszy[GetRandomIntInRange(1, #Config.JobLocationsLepszy)]

		DestinationBlip = AddBlipForCoord(TargetCoords.x, TargetCoords.y, TargetCoords.z)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Destination")
		EndTextCommandSetBlipName(blip)
		SetBlipRoute(DestinationBlip, true)
		local PedPosition = GetEntityCoords(PlayerPedId())
	Citizen.CreateThread(function()
		while zbiera do
			Citizen.Wait(0)
			local Ped = PlayerPedId()
				local PedCoords = GetEntityCoords(Ped)
				if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' and sluzba then
					
				local DistanceCheck = #(PedCoords -vector3(TargetCoords.x, TargetCoords.y, TargetCoords.z))

					if DistanceCheck <= 5.0 then

						local PackageText = "~g~Dostarcz Paczke"

						ESX.Game.Utils.DrawText3D(vector3(TargetCoords.x, TargetCoords.y, TargetCoords.z), "~y~[E] " .. PackageText, 0.4)

						if DistanceCheck <= 1.5 then

							if IsControlJustPressed(0, 38) then
								--DestinationBlip           = nil
								zbiera = false
								SprzedajPaczke(TargetCoords.x, TargetCoords.y, TargetCoords.z)
								--RemoveBlip(DestinationBlip)
							end	
						end
					end
				else
					Citizen.Wait(1000)
				end
			end
		end)
	end
end
end

function OpenCloakroom()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'jablka_cloakroom',
	{
		title    = _U('cloakroom_menu'),
		align    = 'center',
		elements = {
			{ label = _U('wear_citizen'), value = 'wear_citizen' },
			{ label = _U('wear_work'),    value = 'wear_work'}
		}
	}, function(data, menu)
		if data.current.value == 'wear_citizen' then
			sluzba = false
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'wear_work' then
			sluzba = true
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
	end)
end


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


function DeleteJobVehicle()
	local playerPed = PlayerPedId()
		if IsInAuthorizedVehicle() then
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
			if wyciagnal == true then
				TriggerServerEvent('esx_kurier:kaucja', 2)
				wyciagnal = false
			else
				TriggerEvent('pNotify:SendNotification', {text= '<b style = color:pink>Dziękuje za oczyszczanie naszego miasta z niepotrzebnych samochodów!</b>'})
			end
		else
			TriggerEvent('pNotify:SendNotification', {text= '<b style = color:pink>Tu parkować mogą tylko samochody GoPostal</b>'})
			--ESX.ShowNotification(_U('only_taxi'))
		end
end

function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()

	local elements = {}


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('spawn_veh'),
			align		= 'center',
			elements	= Config.AuthorizedVehicles
		}, function(data, menu)
			if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				TriggerEvent('pNotify:SendNotification',{text =_U('spawnpoint_blocked')})
				--ESX.ShowNotification(_U('spawnpoint_blocked'))
				return
			end

			menu.close()
			if not wyciagnal then
			ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			end)
			TriggerServerEvent('esx_kurier:kaucja', 1)
			wyciagnal = true
else
	TriggerEvent('pNotify:SendNotification', {text='Juz wyciagnales swoj pojazd!'})
--ESX.ShowNotification('Juz wyciagnales swoj pojazd!')
end
		end, function(data, menu)
			CurrentAction     = 'vehicle_spawner'
			CurrentActionMsg  = _U('spawner_prompt')
			CurrentActionData = {}

			menu.close()
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
			TriggerServerEvent('esx_kurier:tak')
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenKurierActionsMenu()
	local elements = {
		{ label = ('Liczba Kursów'), value = 'liczba' }
	}

	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
		table.insert(elements, {label = _U('deposit_stock'), value = 'get_stock'})
		table.insert(elements, {label = _U('take_stock'), value = 'put_stock'})
		if Config.Kutas then
			table.insert(elements, {label = ('Godziny ludzi'), value = 'pizda'})
			table.insert(elements, {label = ('Wyczysc Godziny ludzi'), value = 'wyczysc'})
		end
	end

	if PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
		table.insert(elements, {label = _U('deposit_stock'), value = 'get_stock'})
		table.insert(elements, {label = _U('take_stock'), value = 'put_stock'})
	if Config.Kutas then
		table.insert(elements, {label = ('Godziny ludzi'), value = 'pizda'})
		table.insert(elements, {label = ('Wyczysc Godziny ludzi'), value = 'wyczysc'})
		end
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'kurier_actions',
	{
		title    = 'Kurier',
		align    = 'center',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'pizda' then
			OpenKutasMenu()
		elseif data.current.value == 'liczba' then
			OpenKursMenu()
		elseif data.current.value == 'wyczysc' then
			OpenWyczyscMenu()
		elseif data.current.value == 'boss_actions' then
		if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
			TriggerEvent('esx_society:openBossMenu', 'kurier', function(data, menu)
				menu.close()
			end, { limit = true }) -- wylacza wyplacanie monet
			elseif PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
				TriggerEvent('esx_society:openBossMenu', 'kurier', function(data, menu)
					menu.close()
				end, { withdraw = false }) -- wylacza wyplacanie monet
			end
		end

	end, function(data, menu)
		menu.close()

		CurrentAction     = 'taxi_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end

function OpenKutasMenu()

	ESX.TriggerServerCallback('esx_kurier:getEmployees', function(gracze)
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
			title    = 'Kurier',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
		end)
	end)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)
			
			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
				if CurrentAction == 'cloakroom' then
					OpenCloakroom()
				elseif CurrentAction == 'vehicle_spawner' and sluzba then
				if PlayerData.job.grade == 0 or PlayerData.job.grade == 1 then
							if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				TriggerEvent('pNotify:SendNotification',{text =_U('spawnpoint_blocked')})
				return
			end


			ESX.Game.SpawnVehicle('boxville2', Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								TriggerServerEvent('esx_kurier:dajdosprawdzenia')
				wyciagnal = true
				TriggerServerEvent('esx_kurier:kaucja', 1)
				wzialpaczki = true
				TriggerEvent('pNotify:SendNotification',{text ='<b style = color:white>Jedz do biura GoPostal, aby sprawdzic zawartosc paczki!</b>'})
			end)
				elseif PlayerData.job.grade >= 2 and PlayerData.job.grade <= 6 then
							if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				TriggerEvent('pNotify:SendNotification',{text =_U('spawnpoint_blocked')})
				return
			end

			ESX.Game.SpawnVehicle('master2019', Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								TriggerServerEvent('esx_kurier:dajdosprawdzenia')
				wyciagnal = true
				wzialpaczki = true
				TriggerServerEvent('esx_kurier:kaucja', 1)
				TriggerEvent('pNotify:SendNotification',{text ='<b style = color:white>Jedz do biura GoPostal, aby sprawdzic zawartosc paczki!</b>'})
			end)
				elseif PlayerData.job.grade > 6 then 
							if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				TriggerEvent('pNotify:SendNotification',{text =_U('spawnpoint_blocked')})
				return
			end

			ESX.Game.SpawnVehicle('master2019', Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
								TriggerServerEvent('esx_kurier:dajdosprawdzenia')
				wyciagnal = true
				wzialpaczki = true
				TriggerServerEvent('esx_kurier:kaucja', 1)
				TriggerEvent('pNotify:SendNotification',{text ='<b style = color:white>Jedz do biura GoPostal, aby sprawdzic zawartosc paczki!</b>'})
			end)

				end
				elseif CurrentAction == 'delete_vehicle' and sluzba then
					DeleteJobVehicle()
				elseif CurrentAction == 'kurier_actions_menu' then
					OpenKurierActionsMenu()
				end

				CurrentAction = nil
			end
		end
	end
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
			local coords = GetEntityCoords(PlayerPedId())
			
			for k,v in pairs(Config.Zones) do
				if(v.Type == 25 or v.Type ~= -1 and sluzba and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end

			for k,v in pairs(Config.Cloaakroom) do
				if(v.Type == 25 or v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < Config.DrawDistance) then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'kurier' then
			local coords      = GetEntityCoords(PlayerPedId())
			local isInMarker  = false
			local currentZone = nil

			for k,v in pairs(Config.Zones) do
				if #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x then
				isInMarker  = true
				currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker = true
				LastZone                = currentZone
				TriggerEvent('esx_kurier:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_kurier:hasExitedMarker', LastZone)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

AddEventHandler('esx_kurier:hasEnteredMarker', function(zone)
	if zone == 'VehicleSpawner' and sluzba then
		CurrentAction     = 'vehicle_spawner'
		CurrentActionMsg  = _U('spawner_prompt')
		CurrentActionData = {}
		
	elseif zone == 'VehicleDeleter' and sluzba then
		local playerPed = PlayerPedId()
		local vehicle   = GetVehiclePedIsIn(playerPed, false)

		if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(vehicle, -1) == playerPed then
			CurrentAction     = 'delete_vehicle'
			CurrentActionMsg  = _U('store_veh')
			CurrentActionData = { vehicle = vehicle }
		end
		
	elseif zone == 'KurierActions' then
		CurrentAction     = 'kurier_actions_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}

		
	elseif zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
		end
end)

function OpenKursMenu()

	ESX.TriggerServerCallback('esx_kurier:getEmployeer', function(liczba)
		local elements = {}

		 if #liczba == 0 then 
			TriggerEvent('pNotify:SendNotification',{text='Nie posiadasz żadnych wykonanych kursów'})
			return
		end

		for i = 1, #liczba, 1 do
			table.insert(elements, {label = "Pracownik: " .. " | " .. liczba[i].name .. " | " .. liczba[i].kursy .. " kursow"})	
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'liczba_menu',
		{
			title    = 'Kurier',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
			end)
	end)
end

AddEventHandler('esx_kurier:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function CipaBlips()
	local zones = {}
	local blipInfo = {}

	if PlayerData.job ~= nil then

		if 'kurier' == PlayerData.job.name then
			-- Sprawdzanie Paczek
			local blip = AddBlipForCoord(-259.24, -841.72, 30.42)
			SetBlipSprite  (blip, 440)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Sprawdzanie Paczek")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			-- Szatnia
			local blip = AddBlipForCoord(78.71, 111.89, 80.17)
			SetBlipSprite  (blip, 440)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Szatnia Kuriera")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			
		end
	end
end
Citizen.CreateThread(function()
			local blip = AddBlipForCoord(62.53, 99.2, 78.85)
			SetBlipSprite  (blip, 440)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Baza GoPostal")
			EndTextCommandSetBlipName(blip)
end)
