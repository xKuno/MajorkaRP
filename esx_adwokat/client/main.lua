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
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local playerInService         = false
local wyciagnal 			  = false

ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function SetVehicleMaxMods(vehicle)
	local props = {
		SetVehicleColours(vehicle, 0, 0),
		modEngine       = 1,
		modBrakes       = 1,
		modTransmission = 1,
		modSuspension   = 1,
		modLivery       = 1,
		modAPlate        = 1,
		modTurbo        = true
	}

	ESX.Game.SetVehicleProperties(vehicle, props)
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(job2, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job2].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job2].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		else
			if Config.Uniforms[job2].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job2].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		end
	end)
end

function OpenCloakroomMenu(station)
	local playerPed = PlayerPedId()

	local elements = {
		{ label = ('Ubrania z Mieszkań'), value = 'player_dressing' },
		{ label = ('Przeglądaj ubrania'), value = 'przegladaj_ubrania' }
	}
	ESX.UI.Menu.CloseAll()
	if PlayerData.job2.grade_name == 'boss' then
		table.insert(elements, {
			label = ('Dodaj ubranie'),
			value = 'zapisz_ubranie' 
		})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = ('Ubrania'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'przegladaj_ubrania' then
			ESX.TriggerServerCallback('esx_adwokat:getPlayerDressing', function(dressing)
				elements = nil
				local elements = {}
				for i=1, #dressing, 1 do
					table.insert(elements, {
						label = dressing[i],
						value = i
					})
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wszystkie_ubrania', {
					title    = ('Ubrania'),
					align    = 'center',
					elements = elements
				}, function(data2, menu2)
				
					local elements2 = {
						{ label = ('Ubierz ubranie'), value = 'ubierz_sie' },
					}
					if PlayerData.job2.grade_name == 'boss' then
						table.insert(elements2, {
							label = ('<span style="color:red;"><b>Usuń ubranie</b></span>'),
							value = 'usun_ubranie' 
						})
					end
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'edycja_ubran', {
					title    = ('Ubrania'),
					align    = 'center',
					elements = elements2
				}, function(data3, menu3)
						if data3.current.value == 'ubierz_sie' then
							TriggerEvent('skinchanger:getSkin', function(skin)
								ESX.TriggerServerCallback('esx_adwokat:getPlayerOutfit', function(clothes)
									TriggerEvent('skinchanger:loadClothes', skin, clothes)
									TriggerEvent('esx_skin:setLastSkin', skin)
									ESX.ShowNotification('Pomyślnie zmieniłeś swój ubiór!')
									ClearPedBloodDamage(playerPed)
									ResetPedVisibleDamage(playerPed)
									ClearPedLastWeaponDamage(playerPed)
									ResetPedMovementClipset(playerPed, 0)
									TriggerEvent('skinchanger:getSkin', function(skin)
										TriggerServerEvent('esx_skin:save', skin)
									end)
								end, data2.current.value, station)
							end)
						end
						if data3.current.value == 'usun_ubranie' then
							TriggerServerEvent('esx_adwokat:removeOutfit', data2.current.value, station)
							ESX.ShowNotification('Pomyślnie usunąłeś ubiór o nazwie: ' .. data2.current.label)
						end
					end, function(data3, menu3)
						menu3.close()
						
						CurrentAction     = 'menu_cloakroom'
						--CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
						CurrentActionData = {}
					end)
					
				end, function(data2, menu2)
					menu2.close()
					
					CurrentAction     = 'menu_cloakroom'
				--	CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
					CurrentActionData = {}
				end)
			end, station)
		end
		if data.current.value == 'player_dressing' then

            ESX.TriggerServerCallback('esx_property:getPlayerDressing', function(dressing)
                local elements = {}

                for i=1, #dressing, 1 do
                    table.insert(elements, {
                        label = dressing[i],
                        value = i
                    })
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
                    title    = 'Ubrania z mieszkań',
                    align    = 'center',
                    elements = elements
                }, function(data2, menu2)
                    TriggerEvent('skinchanger:getSkin', function(skin)
                        ESX.TriggerServerCallback('esx_property:getPlayerOutfit', function(clothes)
                            TriggerEvent('skinchanger:loadClothes', skin, clothes)
                            TriggerEvent('esx_skin:setLastSkin', skin)

                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerServerEvent('esx_skin:save', skin)
                            end)
                        end, data2.current.value)
                    end)
                end, function(data2, menu2)
                	menu2.close()
				
					CurrentAction     = 'menu_cloakroom'
					CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
					CurrentActionData = {}
                end)
      		end)
   		end

		if data.current.value == 'zapisz_ubranie' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'nazwa_ubioru', {
				title = ('Nazwa ubioru')
			}, function(data2, menu2)
				ESX.UI.Menu.CloseAll()

				TriggerEvent('skinchanger:getSkin', function(skin)
					TriggerServerEvent('esx_adwokat:saveOutfit', data2.value, skin, station)
					ESX.ShowNotification('Pomyślnie zapisano ubiór o nazwie: ' .. data2.value)
				end)
				
				CurrentAction     = 'menu_cloakroom'
				CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
				CurrentActionData = {}
			end, function(data2, menu2)
				menu2.close()
				
				CurrentAction     = 'menu_cloakroom'
				CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
				CurrentActionData = {}
			end)
		end
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = ('~y~Naciśnij ~INPUT_CONTEXT~ aby otworzyć przebieralnie.')
		CurrentActionData = {}
	end)
end

function OpenVehicleSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

		local elements = {}


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'center',
			elements = Config.AuthorizedVehicles
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

			if foundSpawnPoint and wyciagnal == false then
				ESX.ShowNotification('~y~Szanuj swoj samochod, jezeli go nie zwrocisz nie wyciagniesz nastepnego!')
				if Config.MaxInService == -1 then
					ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						SetVehicleMaxMods(vehicle)
						wyciagnal = true 
					end)
				else

					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)

						if isInService then
							ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
								TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								SetVehicleMaxMods(vehicle)
								wyciagnal = true 
							end)
						else
							ESX.ShowNotification(_U('service_not'))
						end

					end, 'adwokat')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

end

function GetAvailableVehicleSpawnPoint(station, partNum)
	local spawnPoints = Config.AdwokatStations[station].Vehicles[partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i], spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end


RegisterNetEvent('esx:setjob2')
AddEventHandler('esx:setjob2', function(job2)
	PlayerData.job2 = job2
	
	Citizen.Wait(5000)
	TriggerServerEvent('esx_adwokatKOZA:forceBlip')
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_adwokat'),
		number     = 'adwokat',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTV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'
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if type(PlayerData.job2.name) == 'string' and PlayerData.job2.name == 'adwokat' and PlayerData.job2.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)


AddEventHandler('esx_adwokatKOZA:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}

	elseif part == 'VehicleSpawner' then

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'Szafka' then

		CurrentAction     = 'menu_szafka'
		CurrentActionMsg  = (_U('open_armory'))
		CurrentActionData = {station = station, partNum = partNum}


	elseif part == 'VehicleDeleter' then

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed,  false) then

			local vehicle = GetVehiclePedIsIn(playerPed, false)

			if DoesEntityExist(vehicle) then
				CurrentAction     = 'delete_vehicle'
				CurrentActionMsg  = _U('store_vehicle')
				CurrentActionData = {vehicle = vehicle}
			end

		end

	elseif part == 'BossActions' then

		CurrentAction     = 'menu_boss_actions'
		CurrentActionMsg  = _U('open_bossmenu')
		CurrentActionData = {}

	end

end)
local sleepThread = 10
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(sleepThread)

		if PlayerData.job2 ~= nil and PlayerData.job2.name == 'adwokat' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			for k,v in pairs(Config.AdwokatStations) do

				for i=1, #v.Cloakrooms, 1 do
					if #(coords - vector3(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z)) < Config.DrawDistance then
						sleepThread = 10
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Szafka, 1 do
					if #(coords - vector3(v.Szafka[i].x, v.Szafka[i].y, v.Szafka[i].z)) < Config.DrawDistance then
						sleepThread = 10
						DrawMarker(Config.MarkerType, v.Szafka[i].x, v.Szafka[i].y, v.Szafka[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end


				for i=1, #v.Vehicles, 1 do
					if #(coords - vector3(v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z)) < Config.DrawDistance then
						sleepThread = 10
						DrawMarker(Config.MarkerType, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.VehicleDeleters, 1 do
					if #(coords - vector3(v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z)) < Config.DrawDistance then
						sleepThread = 10
						DrawMarker(Config.MarkerType, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				if PlayerData.job2.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and #(coords - vector3(v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						end
					end
				end
				sleepThread = 500
			end
		else
			sleepThread = 2000
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(10)

		if PlayerData.job2 ~= nil and PlayerData.job2.name == 'adwokat' then

			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k,v in pairs(Config.AdwokatStations) do

				for i=1, #v.Cloakrooms, 1 do
					if #(coords - vector3(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i=1, #v.Szafka, 1 do
					if #(coords - vector3(v.Szafka[i].x, v.Szafka[i].y, v.Szafka[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Szafka'
						currentPartNum = i
					end
				end


				for i=1, #v.Vehicles, 1 do
					if #(coords - vector3(v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleSpawner'
						currentPartNum = i
					end
				end


				for i=1, #v.VehicleDeleters, 1 do
					if #(coords - vector3(v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'VehicleDeleter'
						currentPartNum = i
					end
				end

				if PlayerData.job2.grade_name == 'boss' then
					for i=1, #v.BossActions, 1 do
						if #(coords - vector3(v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z)) < Config.MarkerSize.x then
							isInMarker     = true
							currentStation = k
							currentPart    = 'BossActions'
							currentPartNum = i
						end
					end
				end

			end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_adwokatKOZA:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_adwokatKOZA:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_adwokatKOZA:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end
		end

	end
end)

  function OpenSzafkaMenu()
  
	  local elements = {
		  {label = _U('deposit_object'), value = 'put_stock'}
	  }
  
	  if PlayerData.job.grade >= 5 then
		  table.insert(elements,{label = _U('remove_object'), value = 'get_stock'})
	  end
  
  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	  {
		  title    = ('Szafka'),
		  align    = 'center',
		  elements = elements
	  }, function(data, menu)
			  if data.current.value == 'put_stock' then
			  OpenPutStocksMenu()
			  elseif data.current.value == 'get_stock' then
			  OpenGetStocksMenu()
			  menu.close()
		end
		  end,
		  function(data, menu)
		menu.close()
	  end
	)
  end

    function OpenPutStocksMenu()
  
	  ESX.TriggerServerCallback('esx_adwokatKOZA:getPlayerInventory', function(inventory)
  
		  local elements = {}
  
		  for i=1, #inventory.items, 1 do
			  local item = inventory.items[i]
  
			  if item.count > 0 then
				  table.insert(elements, {
					  label = item.label .. ' x' .. item.count,
					  type = 'item_standard',
					  value = item.name
				  })
			  end
		  end
  
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		  {
			  title    = _U('inventory'),
			  align    = 'center',
			  elements = elements
		  }, function(data, menu)
  
			  local itemName = data.current.value
  
			  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				  title = _U('quantity')
			  }, function(data2, menu2)
  
				  local count = tonumber(data2.value)
  
				  if count == nil then
					  ESX.ShowNotification(_U('quantity_invalid'))
				  else
					  menu2.close()
					  menu.close()
					  TriggerServerEvent('esx_adwokatKOZA:putStockItems', itemName, count)
  
					  Citizen.Wait(300)
					  OpenPutStocksMenu()
				  end
  
			  end, function(data2, menu2)
				  menu2.close()
			  end)
  
		  end, function(data, menu)
			  menu.close()
		  end)
	  end)
  
  end
  
  
  function OpenGetStocksMenu()
  
	  ESX.TriggerServerCallback('esx_adwokatKOZA:getStockItems', function(items)
  
		  local elements = {}
  
		  for i=1, #items, 1 do
			  table.insert(elements, {
				  label = 'x' .. items[i].count .. ' ' .. items[i].label,
				  value = items[i].name
			  })
		  end
  
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		  {
			  title    = _U('police_stock'),
			  align    = 'center',
			  elements = elements
		  }, function(data, menu)
  
			  local itemName = data.current.value
  
			  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				  title = _U('quantity')
			  }, function(data2, menu2)
  
				  local count = tonumber(data2.value)
  
				  if count == nil then
					  ESX.ShowNotification(_U('quantity_invalid'))
				  else
					  menu2.close()
					  menu.close()
					  TriggerServerEvent('esx_adwokatKOZA:getStockItem', itemName, count)
  
					  Citizen.Wait(300)
					  OpenGetStocksMenu()
				  end
  
			  end, function(data2, menu2)
				  menu2.close()
			  end)
  
		  end, function(data, menu)
			  menu.close()
		  end)
  
	  end)
  
  end

AddEventHandler('esx_adwokatKOZA:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)
-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job2 ~= nil and PlayerData.job2.name == 'adwokat' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_szafka' then
					OpenSzafkaMenu()
				elseif CurrentAction == 'menu_vehicle_spawner' and wyciagnal == false then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'menu_vehicle_spawner' and wyciagnal == true then
					ESX.ShowNotification('~r~Schowaj swoj poprzedni wyciagniety samochod!')
				elseif CurrentAction == 'delete_vehicle' then
					if IsInAuthorizedVehicle() then
					wyciagnal = false
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
					else
					TriggerEvent('pNotify:SendNotification', {text= '<span style = color:blue>Tu parkować mogą tylko samochody Adwokatow</span>'})
				end
				elseif CurrentAction == 'menu_boss_actions' then
					ESX.UI.Menu.CloseAll()
					TriggerEvent('esx_society:openBossMenu', 'adwokat', function(data, menu)
						menu.close()
						CurrentAction     = 'menu_boss_actions'
						CurrentActionMsg  = _U('open_bossmenu')
						CurrentActionData = {}
					end, { wash = false }) -- disable washing money
				end

				CurrentAction = nil
			end
		end -- CurrentAction end
		
	end
end)

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