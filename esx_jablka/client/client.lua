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

local sluzba					= false
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

Citizen.CreateThread(function()
		while true do
		Citizen.Wait(350000)
		local Packages = Config.Dostarczanie["MiejscaZbiorki"]
		for posId, v in pairs(Packages) do
		
			if not v["state"] then
				v["state"] = true
				end
			end
	end	
end)

Citizen.CreateThread(function()
		while true do
			local sleepThread = 1500

			if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' and sluzba then
			local Packages = Config.Dostarczanie["MiejscaZbiorki"]

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)
				for posId, v in pairs(Packages) do

				local DistanceCheck = #(PedCoords - vector3(v["x"], v["y"], v["z"]))

				if DistanceCheck <= 5.0 then

					sleepThread = 5

					local PackageText = "~g~Zacznij zbierac Owoce"

					if not v["state"] then
						PackageText = "~r~Zebrane"
					end

					ESX.Game.Utils.DrawText3D(v, "~y~[E] " .. PackageText, 0.4)

					if DistanceCheck <= 1.5 then

						if IsControlJustPressed(0, 38) then

							if v["state"] then
								PackPackage(posId)
								v["state"] = false
							else
								ESX.ShowNotification("~r~Juz zebrales owoce z tego drzewa!")
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
	local Package = Config.Dostarczanie["MiejscaZbiorki"][packageId]
	
	LoadAnim("amb@prop_human_movie_bulb@idle_a")
	TaskPlayAnim(PlayerPedId(), "amb@prop_human_movie_bulb@idle_a", "idle_a", 8.0, -8.0, -1, 0, 0, false, false, false)
	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do
		
		Citizen.Wait(1)

		local TimeToTake = 60000 * 0.12 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		if not IsEntityPlayingAnim(PlayerPedId(), "amb@prop_human_movie_bulb@idle_a", "idle_a",3) then
	LoadAnim("amb@prop_human_movie_bulb@exit")
	TaskPlayAnim(PlayerPedId(), "amb@prop_human_movie_bulb@exit", "exit", 8.0, -8.0, -1, 0, 0, false, false, false)
		
			ESX.ShowNotification("~r~Anulowano!")
			Packaging = false
			
		end
		
		if PackPercent >= 100 then

			Packaging = false
			TriggerServerEvent("esx_jablka:sprzedaj")
			LoadAnim("amb@prop_human_movie_bulb@exit")
			TaskPlayAnim(PlayerPedId(), "amb@prop_human_movie_bulb@exit", "exit", 8.0, -8.0, -1, 0, 0, false, false, false)
			Citizen.Wait(1500)
			ClearPedTasks(PlayerPedId())
			
		else
			ESX.Game.Utils.DrawText3D(Package, "~g~Zbieranie w toku... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end
		
	end
end

Citizen.CreateThread(function()

	while true do
	Citizen.Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
			local DeliverPosition = Config.Dostarczanie["DostarczPaczki"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = #(PedPosition - vector3(DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"]))
			local Packaging = false
				if DistanceCheck <= 5.0 then
					if sluzba and PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
						ESX.Game.Utils.DrawText3D(DeliverPosition, "~y~[E] ~r~Sprzedaj Jablka", 0.4)
					end
				else
					Citizen.Wait(500)
				end


				if DistanceCheck <= 2.0 and sluzba then
					if IsControlJustPressed(0, 38) then
						DeleteEntity(packageId)
						Packaging = false
						TriggerServerEvent("esx_jablka:zaplata")
					end
				end
		else
			Citizen.Wait(2000)
		end
	end
end)

Citizen.CreateThread(function()

	while true do

	Citizen.Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
			local DeliverPosition = Config.Dostarczanie["DostarczPaczkiPomarancze"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = #(PedPosition - vector3(DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"]))
			local Packaging = false

			if DistanceCheck <= 5.0 then
				if sluzba and PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
					ESX.Game.Utils.DrawText3D(DeliverPosition, "~y~[E] ~o~Sprzedaj Pomarancze", 0.4)
				end
			end
		
			if DistanceCheck <= 2.0 and sluzba then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(packageId)
					Packaging = false
					TriggerServerEvent("esx_jablka:zaplatapomarancze")
				end
			end	
		else
			Citizen.Wait(2000)		
		end
	end
end)

Citizen.CreateThread(function()

	while true do

	Citizen.Wait(0)
		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
			local DeliverPosition = Config.Dostarczanie["DostarczPaczkiWisnie"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = #(PedPosition - vector3(DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"]))
			local Packaging = false
			if DistanceCheck <= 5.0 then
				if sluzba and PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
					ESX.Game.Utils.DrawText3D(DeliverPosition, "~y~[E] ~p~Sprzedaj Wisnie", 0.4)
				end
			end
		
			if DistanceCheck <= 2.0 and sluzba then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(packageId)
					Packaging = false
					TriggerServerEvent("esx_jablka:zaplatawisnie")
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

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
			TriggerServerEvent("esx_jablka:dupa123", 2)
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'wear_work' then
			sluzba = true
			TriggerServerEvent("esx_jablka:dupa123", 1)
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

	if Config.EnableSocietyOwnedVehicles then
		local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
		TriggerServerEvent('esx_society:putVehicleInGarage', 'jablka', vehicleProps)
		ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
	else
		if IsInAuthorizedVehicle() then
			ESX.Game.DeleteVehicle(CurrentActionData.vehicle)

		else
			ESX.ShowNotification(_U('only_taxi'))
		end
	end
end

function OpenVehicleSpawnerMenu()
	ESX.UI.Menu.CloseAll()

	local elements = {}

	if Config.EnableSocietyOwnedVehicles then

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(vehicles)

			for i=1, #vehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(vehicles[i].model) .. ' [' .. vehicles[i].plate .. ']',
					value = vehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('spawn_veh'),
				align    = 'center',
				elements = elements
			}, function(data, menu)
				if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
					ESX.ShowNotification(_U('spawnpoint_blocked'))
					return
				end

				menu.close()

				local vehicleProps = data.current.value
				ESX.Game.SpawnVehicle(vehicleProps.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
					ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
					local playerPed = PlayerPedId()
					TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				end)

				TriggerServerEvent('esx_society:removeVehicleFromGarage', 'jablka', vehicleProps)

			end, function(data, menu)
				CurrentAction     = 'vehicle_spawner'
				CurrentActionMsg  = _U('spawner_prompt')
				CurrentActionData = {}

				menu.close()
			end)
		end, 'jablka')

	else -- not society vehicles

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('spawn_veh'),
			align		= 'center',
			elements	= Config.AuthorizedVehicles
		}, function(data, menu)
			if not ESX.Game.IsSpawnPointClear(Config.Zones.VehicleSpawnPoint.Pos, 5.0) then
				ESX.ShowNotification(_U('spawnpoint_blocked'))
				return
			end

			menu.close()
			ESX.Game.SpawnVehicle(data.current.model, Config.Zones.VehicleSpawnPoint.Pos, Config.Zones.VehicleSpawnPoint.Heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			end)
		end, function(data, menu)
			CurrentAction     = 'vehicle_spawner'
			CurrentActionMsg  = _U('spawner_prompt')
			CurrentActionData = {}

			menu.close()
		end)
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
			if CurrentAction ~= nil then
				ESX.ShowHelpNotification(CurrentActionMsg)
				
				if IsControlJustReleased(0, Keys['E']) then
					if CurrentAction == 'cloakroom' then
						OpenCloakroom()
					elseif CurrentAction == 'vehicle_spawner' and sluzba then
						OpenVehicleSpawnerMenu()
					elseif CurrentAction == 'delete_vehicle' and sluzba then
						DeleteJobVehicle()
					end

					CurrentAction = nil
				end
			end
		else
			Citizen.Wait(2000)
		end
	end
end)


-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
			local coords = GetEntityCoords(PlayerPedId())
			
			for k,v in pairs(Config.Zones) do
				if(v.Type == 23 or v.Type ~= -1 and sluzba and #(coords -vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < Config.DrawDistance) then
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

		if PlayerData.job ~= nil and PlayerData.job.name == 'jablka' then
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
				TriggerEvent('esx_jablka:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_jablka:hasExitedMarker', LastZone)
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

AddEventHandler('esx_jablka:hasEnteredMarker', function(zone)
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
		
	elseif zone == 'Cloakroom' then
		CurrentAction     = 'cloakroom'
		CurrentActionMsg  = _U('cloakroom_prompt')
		CurrentActionData = {}
		end
end)

AddEventHandler('esx_jablka:hasExitedMarker', function(zone)
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

		if 'jablka' == PlayerData.job.name then
			-- sprzedaz jablek
			local blip = AddBlipForCoord(2748.96, 3473.28, 55.267)
			SetBlipSprite  (blip, 409)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Sprzedaż Jabłek")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			-- sprzedaz pomaranczy
			local blip = AddBlipForCoord(-2511.5, 3611.92, 13.72)
			SetBlipSprite  (blip, 409)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Sprzedaż Pomarańczy")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			-- sprzedaz wisni
			local blip = AddBlipForCoord(1792.5, 4594.3, 37.67)
			SetBlipSprite  (blip, 409)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Sprzedaż Wiśni")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			-- Sad
			local blip = AddBlipForCoord(282.04, 6506.14, 30.13)
			SetBlipSprite  (blip, 409)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Sad")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			-- Szatnia
			local blip = AddBlipForCoord(-2187.93, 4251.33, 48.94)
			SetBlipSprite  (blip, 409)
			SetBlipDisplay (blip, 4)
			SetBlipScale   (blip, 1.2)
			SetBlipCategory(blip, 3)
			SetBlipColour  (blip, 69)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Szatnia Sadownika")
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
			
		end
	end
end