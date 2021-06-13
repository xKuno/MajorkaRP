local CurrentActionData, PlayerData, userProperties, this_Garage, BlipList, PrivateBlips, JobBlips = {}, {}, {}, {}, {}, {}, {}
local HasAlreadyEnteredMarker = false
local LastZone, CurrentAction, CurrentActionMsg
local WasInPound, WasinJPound = false, false
ESX = nil
local Playerdata = {}
local playerCoords 

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()

	CreateBlips()
	RefreshJobBlips()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	if Config.UsePrivateCarGarages then
		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedProperties', function(properties)
			userProperties = properties
			DeletePrivateBlips()
			RefreshPrivateBlips()
		end)
	end

	ESX.PlayerData = xPlayer

	RefreshJobBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job

	DeleteJobBlips()
	RefreshJobBlips()
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
    ESX.PlayerData.job2 = job2

	DeleteJobBlips()
	RefreshJobBlips()
end)

RegisterNetEvent('esx_advancedgarage:getPropertiesC')
AddEventHandler('esx_advancedgarage:getPropertiesC', function(source)
	if Config.UsePrivateCarGarages then
		ESX.TriggerServerCallback('esx_advancedgarage:getOwnedProperties', function(properties)
			userProperties = properties
			DeletePrivateBlips()
			RefreshPrivateBlips()
		end)

		ESX.ShowNotification(_U('get_properties'))
		TriggerServerEvent('esx_advancedgarage:printGetProperties')
	end
end)

local function has_value (tab, val)
	for index, value in ipairs(tab) do
		if value == val then
			return true
		end
	end
	return false
end

-- Start of Aircraft Code
function ListOwnedAircraftsMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedAircrafts', function(ownedAircrafts)
		if #ownedAircrafts == 0 then
			ESX.ShowNotification(_U('garage_no_aircrafts'))
		else
			for _,v in pairs(ownedAircrafts) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)
				local labelvehicle3 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, aheadVehName)

				TriggerServerEvent('esx_advancedgarage:nazwaauta', aheadVehName, plate)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

			local elems = {}
			local playersInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId(), true), 2.5)
			table.insert(elems,{label='Wyciagnij pojazd',value='wezauto'})
			table.insert(elems,{label='Zmien zamki dla tego pojazdu',value='zamekchange'})
			table.insert(elems,{label='Daj klucze osobie obok',value='przepisz'})
			for _, player in ipairs(playersInArea) do
				if player ~= PlayerId() then
					local sid = GetPlayerServerId(player)
					table.insert(elems, {label = sid, value = sid})
				end
			end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_aircraft', {
			title = _U('garage_aircrafts'),
			align = Config.MenuAlign,
			elements = elements
		}, function(data, menu)
		if data.current.value ~= nil then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_keys', {title= 'Daj klucze osobie obok',
				align = 'center',
				elements=elems
			},
			function(data1,menu1)
			if data1.current.value=="wezauto" then
				if data.current.value == nil then
			else
				if data.current.value.stored then
					menu.close()
					SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
				else
					ESX.ShowNotification(_U('aircraft_is_impounded'))
				end
				end
				elseif data1.current.value~="wezauto" and data1.current.value~="przepisz" and data1.current.value ~= "zamekchange" then
					ESX.TriggerServerCallback("esx_advancedgarage:giveKeys",function()
						TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Dałeś klucze do pojazdu osobie </b>'..data1.current.value})
					end, data.current.value.plate, data1.current.value)
				elseif data1.current.value == "zamekchange" then
					TriggerServerEvent("esx_advancedgarage:removeKeysAll", data.current.value.plate)
						TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Zmieniłeś zamek w tym pojeździe </b>'})
				end
				menu1.close()
			end,function(data1,menu1) 
				menu1.close() 
			end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function StoreOwnedAircraftsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
			--	if engineHealth <= 900 then
				--	ESX.ShowNotification(('Udaj się do mechanika, aby naprawić swój pojazd.'))
					--if Config.UseDamageMult then
						--local apprasial = math.floor((1000 - engineHealth)/1000*Config.AircraftPoundPrice*Config.DamageMult)
						--RepairVehicle(apprasial, vehicle, vehicleProps)
					--else
					--	local apprasial = math.floor((1000 - engineHealth)/1000*Config.AircraftPoundPrice)
						--RepairVehicle(apprasial, vehicle, vehicleProps)
				--	end
				--else
					StoreVehicle(vehicle, vehicleProps)
				--end	
			else
				ESX.ShowNotification(_U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		ESX.ShowNotification(_U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedAircraftsMenu()
	if WasInPound then
		ESX.ShowNotification(_U('must_wait', Config.PoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedAircrafts', function(ownedAircrafts)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedAircrafts) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_aircraft', {
				title = _U('pound_aircrafts', ESX.Math.GroupDigits(Config.AircraftPoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				--[[ESX.TriggerServerCallback('esx_advancedgarage:checkMoneyAircrafts', function(hasEnoughMoney)
					if hasEnoughMoney then
						if data.current.value == nil then
						else
							SpawnVehicle(data.current.value, data.current.value.plate)
							TriggerServerEvent('esx_advancedgarage:payAircraft')
						end
					else
						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)]]--
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.TriggerServerCallback('esx_advancedgarage:checkMoney1', function(mahajs)
							if mahajs then
				
						TriggerServerEvent('esx_advancedgarage:pay1')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
							
							else
											ESX.TriggerServerCallback('esx_advancedgarage:checkMoney', function(hasEnoughMoney)
				if hasEnoughMoney then
				
						TriggerServerEvent('esx_advancedgarage:pay')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
		end
	end, GetPlayerServerId(PlayerId()), 'ubezpieczalnia')
			end, function(data, menu)
				menu.close()
				WasInPound = true
			end)
		end)
	end
end
-- End of Aircraft Code

-- Start of Boat Code
function ListOwnedBoatsMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:red;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedBoats', function(ownedBoats)
		if #ownedBoats == 0 then
			ESX.ShowNotification(_U('garage_no_boats'))
		else
			for _,v in pairs(ownedBoats) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)
				local labelvehicle3 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, aheadVehName)

				TriggerServerEvent('esx_advancedgarage:nazwaauta', aheadVehName, plate)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

			local elems = {}
			local playersInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId(), true), 2.5)
			table.insert(elems,{label='Wyciagnij pojazd',value='wezauto'})
			table.insert(elems,{label='Zmien zamki dla tego pojazdu',value='zamekchange'})
			table.insert(elems,{label='Daj klucze osobie obok',value='przepisz'})
			for _, player in ipairs(playersInArea) do
				if player ~= PlayerId() then
					local sid = GetPlayerServerId(player)
					table.insert(elems, {label = sid, value = sid})
				end
			end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_boat', {
			title = _U('garage_boats'),
			align = Config.MenuAlign,
			elements = elements
		}, function(data, menu)
		if data.current.value ~= nil then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_keys', {title= 'Daj klucze osobie obok',
				align = 'center',
				elements=elems
			},
			function(data1,menu1)
			if data1.current.value=="wezauto" then
				if data.current.value == nil then
			else
				if data.current.value.stored then
					menu.close()
					SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
				else
					ESX.ShowNotification(_U('boat_is_impounded'))
				end
				end
				elseif data1.current.value~="wezauto" and data1.current.value~="przepisz" and data1.current.value ~= "zamekchange" then
					ESX.TriggerServerCallback("esx_advancedgarage:giveKeys",function()
						TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Dałeś klucze do pojazdu osobie </b>'..data1.current.value})
					end, data.current.value.plate, data1.current.value)
				elseif data1.current.value == "zamekchange" then
					TriggerServerEvent("esx_advancedgarage:removeKeysAll", data.current.value.plate)
						TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Zmieniłeś zamek w tym pojeździe </b>'})
				end
				menu1.close()
			end,function(data1,menu1) 
				menu1.close() 
			end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function StoreOwnedBoatsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				--if engineHealth <= 900 then
				--	ESX.ShowNotification(('Udaj się do mechanika, aby naprawić swój pojazd.'))
				--else
					StoreVehicle(vehicle, vehicleProps)
				--end	
			else
				ESX.ShowNotification(_U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		ESX.ShowNotification(_U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedBoatsMenu()
	if WasInPound then
		ESX.ShowNotification(_U('must_wait', Config.PoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedBoats', function(ownedBoats)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedBoats) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_boat', {
				title = _U('pound_boats', ESX.Math.GroupDigits(Config.BoatPoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
				--[[ESX.TriggerServerCallback('esx_advancedgarage:checkMoneyBoats', function(hasEnoughMoney)
					if hasEnoughMoney then
						if data.current.value == nil then
						else
							SpawnVehicle(data.current.value, data.current.value.plate)
							TriggerServerEvent('esx_advancedgarage:payBoat')
						end
					else
						ESX.ShowNotification(_U('not_enough_money'))
					end
				end)]]--
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.TriggerServerCallback('esx_advancedgarage:checkMoney1', function(mahajs)
							if mahajs then
				
						TriggerServerEvent('esx_advancedgarage:pay1')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
							
							else
											ESX.TriggerServerCallback('esx_advancedgarage:checkMoney', function(hasEnoughMoney)
				if hasEnoughMoney then
				
						TriggerServerEvent('esx_advancedgarage:pay')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
		end
	end, GetPlayerServerId(PlayerId()), 'ubezpieczalnia')
			end, function(data, menu)
				menu.close()
				WasInPound = true
			end)
		end)
	end
end
-- End of Boat Code

-- Start of Car Code
function ListOwnedCarsMenu()
	local elements = {}

	if Config.ShowVehicleLocation and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - <span style="color:red;">%s</span> |'):format(_U('plate'), _U('vehicle'), _U('location'))
		table.insert(elements, {label = spacer, value = nil})
	elseif Config.ShowVehicleLocation == false and Config.ShowSpacers then
		local spacer = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
		table.insert(elements, {label = ('<span style="color:yellow;">%s</span>'):format(_U('spacer1')), value = nil})
		table.insert(elements, {label = spacer, value = nil})
	end

	ESX.TriggerServerCallback('esx_advancedgarage:getOwnedCars', function(ownedCars)
		if #ownedCars == 0 then
			ESX.ShowNotification(_U('garage_no_cars'))
		else
			for _,v in pairs(ownedCars) do
				local hashVehicule = v.vehicle.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)
				local labelvehicle3 = ('| <span style="color:yellow;">%s</span> - <span style="color:darkgoldenrod;">%s</span> | '):format(plate, aheadVehName)

				TriggerServerEvent('esx_advancedgarage:nazwaauta', aheadVehName, plate)

				if Config.ShowVehicleLocation then
					if v.stored then
						labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('loc_garage'))
					else
						labelvehicle = labelvehicle2 .. ('<span style="color:red;">%s</span> |'):format(_U('loc_pound'))
					end
				else
					if v.stored then
						labelvehicle = labelvehicle3
					else
						labelvehicle = labelvehicle3
					end
				end

				table.insert(elements, {label = labelvehicle, value = v})
			end
		end

			local el33ems = {}
			local elems = {}
			local playersInArea = ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId(), true), 2.5)
			table.insert(elems,{label='Wyciagnij pojazd',value='wezauto'})
			table.insert(elems,{label='Sprawdz stan pojazdu',value='checkkaroseria'})
			table.insert(elems,{label='Zmien zamki dla tego pojazdu',value='zamekchange'})
			table.insert(elems,{label='Daj klucze osobie obok',value='przepisz'})
			for _, player in ipairs(playersInArea) do
				if player ~= PlayerId() then
					local sid = GetPlayerServerId(player)
					table.insert(elems, {label = sid, value = sid})
				end
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
				title = _U('garage_cars'),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
			if data.current.value ~= nil then
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_keys', {title= 'Daj klucze osobie obok',
					align = 'center',
					elements=elems
				},
				function(data1,menu1)

				--table.insert(el33ems,{label=('Silnik '..data.current.value.vehicle.engineHealth/10 ..'% Karoseria '.. data.current.value.vehicle.bodyHealth/10 .. "%"),value='karoseria'})
				if data1.current.value=="wezauto" then
					if data.current.value == nil then
				else
					if data.current.value.stored then
						menu.close()
						SpawnVehicle(data.current.value.vehicle, data.current.value.plate)
					else
						ESX.ShowNotification(_U('car_is_impounded'))
					end
					end
					elseif data1.current.value~="wezauto" and data1.current.value~="przepisz" and data1.current.value ~= "zamekchange" and data1.current.value ~= "checkkaroseria" then
						ESX.TriggerServerCallback("esx_advancedgarage:giveKeys",function()
							TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Dałeś klucze do pojazdu osobie </b>'..data1.current.value})
						end, data.current.value.plate, data1.current.value)
					elseif data1.current.value == "zamekchange" then
						TriggerServerEvent("esx_advancedgarage:removeKeysAll", data.current.value.plate)
							TriggerEvent('pNotify:SendNotification',{text =' <b style = color:aqua> Zmieniłeś zamek w tym pojeździe </b>'})
					elseif data1.current.value == "checkkaroseria" then
						menu.close()
						menu1.close()
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'legancko_tego', {
				title = _U('garage_cars'),
				align = 'center',
				elements = {
					{label=('Silnik '..data.current.value.vehicle.engineHealth/10 ..'% Karoseria '.. data.current.value.vehicle.bodyHealth/10 .. "%"),value='karoseria'},
				}
			}, function(data5, menu5)
				if data5.current.value == 'karoseria' then
					menu5.close()
				end
					menu5.close()
				end,function(data5,menu5) 
					menu5.close()
				end)
				--menu5.close()
					end
					menu1.close()
				end,function(data1,menu1) 
					menu1.close() 
				end)
			end
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function StoreOwnedCarsMenu()
	local playerPed  = GetPlayerPed(-1)

	if IsPedInAnyVehicle(playerPed,  false) then
		local playerPed = GetPlayerPed(-1)
		local coords = GetEntityCoords(playerPed)
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
		local current = GetPlayersLastVehicle(GetPlayerPed(-1), true)
		local engineHealth = GetVehicleEngineHealth(current)
		local plate = vehicleProps.plate

		ESX.TriggerServerCallback('esx_advancedgarage:storeVehicle', function(valid)
			if valid then
				--if engineHealth <= 900 then
				--	ESX.ShowNotification(('Udaj się do mechanika, aby naprawić swój pojazd.'))
				--	if Config.UseDamageMult then
						--local apprasial = math.floor((1000 - engineHealth)/1000*Config.AircraftPoundPrice*Config.DamageMult)
						--RepairVehicle(apprasial, vehicle, vehicleProps)
				--	else
					--	local apprasial = math.floor((1000 - engineHealth)/1000*Config.AircraftPoundPrice)
						--RepairVehicle(apprasial, vehicle, vehicleProps)
				--	end
				--else
					StoreVehicle(vehicle, vehicleProps)
				--end	
			else
				ESX.ShowNotification(_U('cannot_store_vehicle'))
			end
		end, vehicleProps)
	else
		ESX.ShowNotification(_U('no_vehicle_to_enter'))
	end
end

function ReturnOwnedCarsMenu()
	if WasInPound then
		ESX.ShowNotification(_U('must_wait', Config.PoundWait))
	else
		ESX.TriggerServerCallback('esx_advancedgarage:getOutOwnedCars', function(ownedCars)
			local elements = {}

			if Config.ShowVehicleLocation == false and Config.ShowSpacers then
				local spacer = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> |'):format(_U('plate'), _U('vehicle'))
				table.insert(elements, {label = spacer, value = nil})
			end

			for _,v in pairs(ownedCars) do
				local hashVehicule = v.model
				local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
				local vehicleName = GetLabelText(aheadVehName)
				local plate = v.plate
				local labelvehicle
				local labelvehicle2 = ('| <span style="color:red;">%s</span> - <span style="color:darkgoldenrod;">%s</span> - '):format(plate, aheadVehName)

				labelvehicle = labelvehicle2 .. ('<span style="color:green;">%s</span> |'):format(_U('return'))

				table.insert(elements, {label = labelvehicle, value = v})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'return_owned_car', {
				title = _U('pound_cars', ESX.Math.GroupDigits(Config.CarPoundPrice)),
				align = Config.MenuAlign,
				elements = elements
			}, function(data, menu)
			ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_choose123', {
			title    = 'Wybor metody platnosci',
			align    = 'bottom-right',
			elements = {
				{label = 'Gotowka',  value = 'gotowka'},
				{label = 'Karta Bankowa', value = 'bank'}
			}
		}, function(data3, menu3)
			if data3.current.value == 'gotowka' then 
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.TriggerServerCallback('esx_advancedgarage:checkMoney1', function(mahajs)
							if mahajs then
				
						TriggerServerEvent('esx_advancedgarage:pay1')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)

							else
											ESX.TriggerServerCallback('esx_advancedgarage:checkMoney', function(hasEnoughMoney)
				if hasEnoughMoney then
				
						TriggerServerEvent('esx_advancedgarage:pay')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
		end
	end, GetPlayerServerId(PlayerId()), 'ubezpieczalnia')
					elseif data3.current.value == 'bank' then 
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.TriggerServerCallback('esx_advancedgarage:checkMoney1bank', function(mahajs)
							if mahajs then
				
						TriggerServerEvent('esx_advancedgarage:pay1bank')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)

							else
											ESX.TriggerServerCallback('esx_advancedgarage:checkMoneybank', function(hasEnoughMoney)
				if hasEnoughMoney then
				
						TriggerServerEvent('esx_advancedgarage:paybank')
						SpawnVehicle(data.current.value, data.current.value.plate)
						
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end)
		end
	end, GetPlayerServerId(PlayerId()), 'ubezpieczalnia')
end

			menu3.close()
		end, function(data3, menu3)
			menu3.close()
		end)
			end, function(data, menu)
				menu.close()
				WasInPound = true
			end)
		end)
	end
end
-- End of Car Code

-- WasInPound & WasinJPound Code
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if WasInPound then
			Citizen.Wait(Config.PoundWait * 60000)
			WasInPound = false
		end

		if WasinJPound then
			Citizen.Wait(Config.JPoundWait * 60000)
			WasinJPound = false
		end
	end
end)

-- Repair Vehicles
function RepairVehicle(apprasial, vehicle, vehicleProps)
	ESX.UI.Menu.CloseAll()

	local elements = {
		{label = _U('return_vehicle').." (<span style = color:red>$"..apprasial.."</span>)", value = 'yes'},
		{label = _U('see_mechanic'), value = 'no'}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
		title = _U('damaged_vehicle'),
		align = Config.MenuAlign,
		elements = elements
	}, function(data, menu)
		menu.close()

		if data.current.value == 'yes' then
			TriggerServerEvent('esx_advancedgarage:payhealth', apprasial)
			vehicleProps.bodyHealth = 1000.0 -- must be a decimal value!!!
			vehicleProps.engineHealth = 1000
			StoreVehicle(vehicle, vehicleProps)
		elseif data.current.value == 'no' then
			ESX.ShowNotification(_U('visit_mechanic'))
		end
	end, function(data, menu)
		menu.close()
	end)
end

-- Store Vehicles
function StoreVehicle(vehicle, vehicleProps)
	ESX.Game.DeleteVehicle(vehicle)
	TriggerServerEvent('esx_advancedgarage:setVehicleState', vehicleProps.plate, true)
	ESX.ShowNotification(_U('vehicle_in_garage'))
end


function orchard_givekeys()
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

-- Spawn Vehicles
function SpawnVehicle(vehicle, plate)
	if vehicle.engineHealth and vehicle.bodyHealth then
		ESX.Game.SpawnVehicle(vehicle.model, this_Garage.Spawner, this_Garage.Heading, function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			SetVehRadioStation(callback_vehicle, "OFF")
			SetVehicleFixed(callback_vehicle)
			SetVehicleDeformationFixed(callback_vehicle)
			SetVehicleUndriveable(callback_vehicle, false)
			SetVehicleEngineOn(callback_vehicle, true, true)
			SetVehicleEngineHealth(callback_vehicle, vehicle.engineHealth+0.0) -- Might not be needed
			SetVehicleBodyHealth(callback_vehicle, vehicle.bodyHealth+0.0) -- Might not be needed
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		end)
	else
		ESX.Game.SpawnVehicle(vehicle.model, this_Garage.Spawner, this_Garage.Heading, function(callback_vehicle)
			ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
			SetVehRadioStation(callback_vehicle, "OFF")
			SetVehicleFixed(callback_vehicle)
			SetVehicleDeformationFixed(callback_vehicle)
			SetVehicleUndriveable(callback_vehicle, false)
			SetVehicleEngineOn(callback_vehicle, true, true)
			SetVehicleEngineHealth(callback_vehicle, 1000.0)
			SetVehicleBodyHealth(callback_vehicle, 1000.0)
			TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		end)
	end
	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

function SpawnVehicle2(vehicle, plate)

	ESX.Game.SpawnVehicle(vehicle.model, this_Garage.Spawner2, this_Garage.Heading2, function(callback_vehicle)
		ESX.Game.SetVehicleProperties(callback_vehicle, vehicle)
		SetVehRadioStation(callback_vehicle, "OFF")
		SetVehicleFixed(callback_vehicle)
		SetVehicleDeformationFixed(callback_vehicle)
		SetVehicleUndriveable(callback_vehicle, false)
		SetVehicleEngineOn(callback_vehicle, true, true)
		SetVehicleEngineHealth(callback_vehicle, vehicle.engineHealth) -- Might not be needed
		SetVehicleBodyHealth(callback_vehicle, vehicle.bodyHealth) -- Might not be needed
		TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
		orchard_givekeys()
	end)

	TriggerServerEvent('esx_advancedgarage:setVehicleState', plate, false)
end

-- Entered Marker
AddEventHandler('esx_advancedgarage:hasEnteredMarker', function(zone)
	if zone == 'ambulance_garage_point' then
		CurrentAction = 'ambulance_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'ambulance_store_point' then
		CurrentAction = 'ambulance_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'ambulance_pound_point' then
		CurrentAction = 'ambulance_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'police_garage_point' then
		CurrentAction = 'police_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'police_store_point' then
		CurrentAction = 'police_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'police_pound_point' then
		CurrentAction = 'police_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'aircraft_garage_point' then
		CurrentAction = 'aircraft_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'aircraft_store_point' then
		CurrentAction = 'aircraft_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'aircraft_pound_point' then
		CurrentAction = 'aircraft_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'boat_garage_point' then
		CurrentAction = 'boat_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'boat_store_point' then
		CurrentAction = 'boat_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'boat_pound_point' then
		CurrentAction = 'boat_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	elseif zone == 'car_garage_point' then
		CurrentAction = 'car_garage_point'
		CurrentActionMsg = _U('press_to_enter')
		CurrentActionData = {}
	elseif zone == 'car_store_point' then
		CurrentAction = 'car_store_point'
		CurrentActionMsg = _U('press_to_delete')
		CurrentActionData = {}
	elseif zone == 'car_pound_point' then
		CurrentAction = 'car_pound_point'
		CurrentActionMsg = _U('press_to_impound')
		CurrentActionData = {}
	end
end)

-- Exited Marker
AddEventHandler('esx_advancedgarage:hasExitedMarker', function()
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		ESX.UI.Menu.CloseAll()
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		playerCoords = GetEntityCoords(PlayerPedId())
	end
end)

-- Enter / Exit marker events & Draw Markers
Citizen.CreateThread(function()
	Citizen.Wait(1500)
	while true do
		Citizen.Wait(0)
		if playerCoords then
			local isInMarker, letSleep, currentZone = false, true

			if Config.UseAircraftGarages then
				for k,v in pairs(Config.AircraftGarages) do
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PointMarker.Type ~= -1 then
							DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PointMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'aircraft_garage_point'
						end
					end

					if distance2 < Config.DrawDistance then
						letSleep = false

						if Config.DeleteMarker.Type ~= -1 then
							DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.DeleteMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'aircraft_store_point'
						end
					end
				end
				
				
				for k,v in pairs(Config.PrivateAircraftGarages) do
				if not v.Org or (ESX.PlayerData.job2 ~= nil and v.Org == ESX.PlayerData.job2.name) or (ESX.PlayerData.job ~= nil and v.Org == ESX.PlayerData.job.name) then
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PointMarker.Type ~= -1 then
							DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PointMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'aircraft_garage_point'
						end
					end

					if distance2 < Config.DrawDistance then
						letSleep = false

						if Config.DeleteMarker.Type ~= -1 then
							DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.DeleteMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'aircraft_store_point'
						end
					end
				end
			end

				for k,v in pairs(Config.AircraftPounds) do
					local distance = #(playerCoords - v.Marker)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PoundMarker.Type ~= -1 then
							DrawMarker(Config.PoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r, Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PoundMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'aircraft_pound_point'
						end
					end
				end
			end

			if Config.UseBoatGarages then
				for k,v in pairs(Config.BoatGarages) do
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PointMarker.Type ~= -1 then
							DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PointMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'boat_garage_point'
						end
					end

					if distance2 < Config.DrawDistance then
						letSleep = false

						if Config.DeleteMarker.Type ~= -1 then
							DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.DeleteMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'boat_store_point'
						end
					end
				end

				for k,v in pairs(Config.BoatPounds) do
					local distance = #(playerCoords - v.Marker)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PoundMarker.Type ~= -1 then
							DrawMarker(Config.PoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r, Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PoundMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'boat_pound_point'
						end
					end
				end
			end

			if Config.UseCarGarages then
				for k,v in pairs(Config.CarGarages) do
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PointMarker.Type ~= -1 then
							DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PointMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_garage_point'
						end
					end

					if distance2 < Config.DrawDistance then
						letSleep = false

						if Config.DeleteMarker.Type ~= -1 then
							DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.DeleteMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_store_point'
						end
					end
				end

				for k,v in pairs(Config.CarPounds) do
					local distance = #(playerCoords - v.Marker)

					if distance < Config.DrawDistance then
						letSleep = false

						if Config.PoundMarker.Type ~= -1 then
							DrawMarker(Config.PoundMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PoundMarker.x, Config.PoundMarker.y, Config.PoundMarker.z, Config.PoundMarker.r, Config.PoundMarker.g, Config.PoundMarker.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.PoundMarker.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_pound_point'
						end
					end
				end
			end

--[[
		if Config.Pvt.Garages then
			for k,v in pairs(Config.PrivateCarGarages) do
				if not v.Private or has_value(userProperties, v.Private) then
					local distance = #(playerCoords - v.Marker)
					local distance2 = #(playerCoords - v.Deleter)

					if distance < Config.Main.DrawDistance then
						letSleep = false

						if Config.Pvt.Markers.Points.Type ~= -1 then
							DrawMarker(Config.Pvt.Markers.Points.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Pvt.Markers.Points.x, Config.Pvt.Markers.Points.y, Config.Pvt.Markers.Points.z, Config.Pvt.Markers.Points.r, Config.Pvt.Markers.Points.g, Config.Pvt.Markers.Points.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance < Config.Pvt.Markers.Points.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_garage_point'
						end
					end

					if distance2 < Config.Main.DrawDistance then
						letSleep = false

						if Config.Pvt.Markers.Delete.Type ~= -1 then
							DrawMarker(Config.Pvt.Markers.Delete.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Pvt.Markers.Delete.x, Config.Pvt.Markers.Delete.y, Config.Pvt.Markers.Delete.z, Config.Pvt.Markers.Delete.r, Config.Pvt.Markers.Delete.g, Config.Pvt.Markers.Delete.b, 100, false, true, 2, false, nil, nil, false)
						end

						if distance2 < Config.Pvt.Markers.Delete.x then
							isInMarker, this_Garage, currentZone = true, v, 'car_store_point'
						end
					end
				end
			end
		end
]]

			if Config.UsePrivateCarGarages then
				for k,v in pairs(Config.PrivateCarGarages) do
					if not v.Org or (ESX.PlayerData.job2 ~= nil and v.Org == ESX.PlayerData.job2.name) or (ESX.PlayerData.job ~= nil and v.Org == ESX.PlayerData.job.name) then
						if not v.Private or has_value(userProperties, v.Private) then
							local distance = #(playerCoords - v.Marker)
							local distance2 = #(playerCoords - v.Deleter)

							if distance < Config.DrawDistance then
								letSleep = false

								if Config.PointMarker.Type ~= -1 then
									DrawMarker(Config.PointMarker.Type, v.Marker, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.PointMarker.x, Config.PointMarker.y, Config.PointMarker.z, Config.PointMarker.r, Config.PointMarker.g, Config.PointMarker.b, 100, false, true, 2, false, nil, nil, false)
								end

								if distance < Config.PointMarker.x then
									isInMarker, this_Garage, currentZone = true, v, 'car_garage_point'
								end
							end

							if distance2 < Config.DrawDistance then
								letSleep = false

								if Config.DeleteMarker.Type ~= -1 then
									DrawMarker(Config.DeleteMarker.Type, v.Deleter, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.DeleteMarker.x, Config.DeleteMarker.y, Config.DeleteMarker.z, Config.DeleteMarker.r, Config.DeleteMarker.g, Config.DeleteMarker.b, 100, false, true, 2, false, nil, nil, false)
								end

								if distance2 < Config.DeleteMarker.x then
									isInMarker, this_Garage, currentZone = true, v, 'car_store_point'
								end
							end
						end
					end
				end
			end
			
			

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				LastZone = currentZone
				TriggerEvent('esx_advancedgarage:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_advancedgarage:hasExitedMarker', LastZone)
			end

			if letSleep then
				Citizen.Wait(500)
			end
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'aircraft_garage_point' then
					ListOwnedAircraftsMenu()
				elseif CurrentAction == 'aircraft_store_point' then
					StoreOwnedAircraftsMenu()
				elseif CurrentAction == 'aircraft_pound_point' then
					ReturnOwnedAircraftsMenu()
				elseif CurrentAction == 'boat_garage_point' then
					ListOwnedBoatsMenu()
				elseif CurrentAction == 'boat_store_point' then
					StoreOwnedBoatsMenu()
				elseif CurrentAction == 'boat_pound_point' then
					ReturnOwnedBoatsMenu()
				elseif CurrentAction == 'car_garage_point' then
					ListOwnedCarsMenu()
				elseif CurrentAction == 'car_store_point' then
					StoreOwnedCarsMenu()
				elseif CurrentAction == 'car_pound_point' then
					ReturnOwnedCarsMenu()
				end

				CurrentAction = nil
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Create Blips
function CreateBlips()
	if Config.UseAircraftGarages and Config.UseAircraftBlips then
		for k,v in pairs(Config.AircraftGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.AircraftPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end

	if Config.UseBoatGarages and Config.UseBoatBlips then
		for k,v in pairs(Config.BoatGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.BoatPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end

	if Config.UseCarGarages and Config.UseCarBlips then
		for k,v in pairs(Config.CarGarages) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.GarageBlip.Sprite)
			SetBlipColour (blip, Config.GarageBlip.Color)
			SetBlipDisplay(blip, Config.GarageBlip.Display)
			SetBlipScale  (blip, Config.GarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end

		for k,v in pairs(Config.CarPounds) do
			local blip = AddBlipForCoord(v.Marker)

			SetBlipSprite (blip, Config.PoundBlip.Sprite)
			SetBlipColour (blip, Config.PoundBlip.Color)
			SetBlipDisplay(blip, Config.PoundBlip.Display)
			SetBlipScale  (blip, Config.PoundBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_pound'))
			EndTextCommandSetBlipName(blip)
			table.insert(BlipList, blip)
		end
	end
end

-- Handles Private Blips
function DeletePrivateBlips()
	if PrivateBlips[1] ~= nil then
		for i=1, #PrivateBlips, 1 do
			RemoveBlip(PrivateBlips[i])
			PrivateBlips[i] = nil
		end
	end
end

function RefreshPrivateBlips()
	for zoneKey,zoneValues in pairs(Config.PrivateCarGarages) do
		if zoneValues.Private and has_value(userProperties, zoneValues.Private) then
			local blip = AddBlipForCoord(zoneValues.Marker)

			SetBlipSprite(blip, Config.PGarageBlip.Sprite)
			SetBlipColour(blip, Config.PGarageBlip.Color)
			SetBlipDisplay(blip, Config.PGarageBlip.Display)
			SetBlipScale(blip, Config.PGarageBlip.Scale)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('blip_garage_private'))
			EndTextCommandSetBlipName(blip)
			table.insert(PrivateBlips, blip)
		end
	end
end

-- Handles Job Blips
function DeleteJobBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function RefreshJobBlips()
			for k,v in pairs(Config.PrivateCarGarages) do
				if ESX.PlayerData.job and ESX.PlayerData.job.name == v.Org or ESX.PlayerData.job2 and ESX.PlayerData.job2.name == v.Org then
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JPoundBlip.Sprite)
				SetBlipColour (blip, Config.JPoundBlip.Color)
				SetBlipDisplay(blip, Config.JPoundBlip.Display)
				SetBlipScale  (blip, Config.JPoundBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString('Garaż | Prywatny')
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	if Config.UseAmbulanceGarages and Config.UseAmbulanceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for k,v in pairs(Config.AmbulanceGarages) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JGarageBlip.Sprite)
				SetBlipColour (blip, Config.JGarageBlip.Color)
				SetBlipDisplay(blip, Config.JGarageBlip.Display)
				SetBlipScale  (blip, Config.JGarageBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_ambulance_garage'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.UseAmbulancePounds and Config.UseAmbulanceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'ambulance' then
			for k,v in pairs(Config.AmbulancePounds) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JPoundBlip.Sprite)
				SetBlipColour (blip, Config.JPoundBlip.Color)
				SetBlipDisplay(blip, Config.JPoundBlip.Display)
				SetBlipScale  (blip, Config.JPoundBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_ambulance_pound'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.UsePoliceGarages and Config.UsePoliceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			for k,v in pairs(Config.PoliceGarages) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JGarageBlip.Sprite)
				SetBlipColour (blip, Config.JGarageBlip.Color)
				SetBlipDisplay(blip, Config.JGarageBlip.Display)
				SetBlipScale  (blip, Config.JGarageBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_police_garage'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end

	if Config.UsePolicePounds and Config.UsePoliceBlips then
		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
			for k,v in pairs(Config.PolicePounds) do
				local blip = AddBlipForCoord(v.Marker)

				SetBlipSprite (blip, Config.JPoundBlip.Sprite)
				SetBlipColour (blip, Config.JPoundBlip.Color)
				SetBlipDisplay(blip, Config.JPoundBlip.Display)
				SetBlipScale  (blip, Config.JPoundBlip.Scale)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString(_U('blip_police_pound'))
				EndTextCommandSetBlipName(blip)
				table.insert(JobBlips, blip)
			end
		end
	end
end
