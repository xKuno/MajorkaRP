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

ESX =					nil
local Vehicles =		{}
local Donators =		{}
local PlayerData		= {}
local lsMenuIsShowed	= false
local isInLSMarker		= false
local moze = false
local mozerejka = false
local myCar				= {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	ESX.TriggerServerCallback('esx_donator:getVehiclesPrices', function(vehicles)
		Vehicles = vehicles
	end)
	ESX.TriggerServerCallback('esx_donator:getdonators', function(isauthorized)
		if isauthorized then
			moze = true
		end
	end, GetPlayerServerId(PlayerId()))
	ESX.TriggerServerCallback('esx_donator:getdonators1', function(isauthorized1)
		if isauthorized1 then
			mozerejka = true
		end
	end, GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent("chuj:heheheh")
AddEventHandler("chuj:heheheh", function()
	ESX.TriggerServerCallback('esx_donator:getVehiclesPrices', function(vehicles)
		Vehicles = vehicles
	end)
	ESX.TriggerServerCallback('esx_donator:getdonators', function(isauthorized)
		if isauthorized then
			moze = true
		end
	end, GetPlayerServerId(PlayerId()))
	ESX.TriggerServerCallback('esx_donator:getdonators1', function(isauthorized1)
		if isauthorized1 then
			mozerejka = true
		end
	end, GetPlayerServerId(PlayerId()))
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

RegisterNetEvent('esx_donator:installMod')
AddEventHandler('esx_donator:installMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	myCar = ESX.Game.GetVehicleProperties(vehicle)
	TriggerServerEvent('esx_donator:refreshOwnedVehicle', myCar)
end)

RegisterNetEvent('esx_donator:cancelInstallMod')
AddEventHandler('esx_donator:cancelInstallMod', function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	ESX.Game.SetVehicleProperties(vehicle, myCar)
end)

function OpenLSMenu(elems, menuName, menuTitle, parent)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), menuName,
	{
		title    = menuTitle,
		align    = 'bottom-right',
		elements = elems
	}, function(data, menu)
		local isRimMod, found = false, false
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		furmanka = GetEntityModel(vehicle)
		fura = GetDisplayNameFromVehicleModel(furmanka)
		blachy = GetVehicleNumberPlateText(vehicle)

		if data.current.modType == "modFrontWheels" then
			isRimMod = true
		end

		for k,v in pairs(Config.Menus) do

			if k == data.current.modType or isRimMod then

				if data.current.label == _U('by_default') or string.match(data.current.label, _U('installed')) then
					ESX.ShowNotification(_U('already_own', data.current.label))
					TriggerEvent('esx_donator:installMod')
				else
					local vehiclePrice = 200000

					for _,i in pairs(Vehicles) do
						if GetEntityModel(vehicle) == GetHashKey(i.model) then
							vehiclePrice = i.price
							break
						end
					end

					if isRimMod then
						price = math.floor(vehiclePrice * data.current.price / 100)
						TriggerServerEvent("esx_donator:buyMod", price, blachy, fura)
					elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
						price = math.floor(vehiclePrice * v.price[data.current.modNum + 1] / 100)
						TriggerServerEvent("esx_donator:buyMod", price, blachy, fura)
					elseif v.modType == 17 then
						price = math.floor(vehiclePrice * v.price[1] / 100)
						TriggerServerEvent("esx_donator:buyMod", price, blachy, fura)
					else
						price = math.floor(vehiclePrice * v.price / 100)
						TriggerServerEvent("esx_donator:buyMod", price, blachy, fura)
					end
				end

				menu.close()
				found = true
				break
			end

		end

		if not found then
			GetAction(data.current)
		end
	end, function(data, menu) -- on cancel
		menu.close()
		TriggerEvent('esx_donator:cancelInstallMod')

		local playerPed = PlayerPedId()
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		SetVehicleDoorsShut(vehicle, false)

		if parent == nil then
			lsMenuIsShowed = false
			local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
			FreezeEntityPosition(vehicle, false)
			myCar = {}
		end
	end, function(data, menu) -- on change
		UpdateMods(data.current)
	end)
end

function UpdateMods(data)
	local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

	if data.modType ~= nil then
		local props = {}
		
		if data.wheelType ~= nil then
			props['wheels'] = data.wheelType
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'neonColor' then
			if data.modNum[1] == 0 and data.modNum[2] == 0 and data.modNum[3] == 0 then
				props['neonEnabled'] = { false, false, false, false }
			else
				props['neonEnabled'] = { true, true, true, true }
			end
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		elseif data.modType == 'tyreSmokeColor' then
			props['modSmokeEnabled'] = true
			ESX.Game.SetVehicleProperties(vehicle, props)
			props = {}
		end

		props[data.modType] = data.modNum
		ESX.Game.SetVehicleProperties(vehicle, props)
	end
end

function GetAction(data)
	local elements  = {}
	local menuName  = ''
	local menuTitle = ''
	local parent    = nil

	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local currentMods = ESX.Game.GetVehicleProperties(vehicle)

	if data.value == 'modSpeakers' or
		data.value == 'modTrunk' or
		data.value == 'modHydrolic' or
		data.value == 'modEngineBlock' or
		data.value == 'modAirFilter' or
		data.value == 'modStruts' or
		data.value == 'modTank' then
		SetVehicleDoorOpen(vehicle, 4, false)
		SetVehicleDoorOpen(vehicle, 5, false)
	elseif data.value == 'modDoorSpeaker' then
		SetVehicleDoorOpen(vehicle, 0, false)
		SetVehicleDoorOpen(vehicle, 1, false)
		SetVehicleDoorOpen(vehicle, 2, false)
		SetVehicleDoorOpen(vehicle, 3, false)
	else
		SetVehicleDoorsShut(vehicle, false)
	end

	local vehiclePrice = 200000

	for _,i in pairs(Vehicles) do
		if GetEntityModel(vehicle) == GetHashKey(i.model) then
			vehiclePrice = i.price
			break
		end
	end

	for k,v in pairs(Config.Menus) do

		if data.value == k then

			menuName  = k
			menuTitle = v.label
			parent    = v.parent

			if v.modType ~= nil then
				
				if v.modType == 22 then
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = false})
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- disable neon
					table.insert(elements, {label = " " ..  _U('by_default'), modType = k, modNum = {0, 0, 0}})
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then
					local num = myCar[v.modType]
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = num})
				elseif v.modType == 17 then
					table.insert(elements, {label = " " .. _U('no_turbo'), modType = k, modNum = false})
 				else
					table.insert(elements, {label = " " .. _U('by_default'), modType = k, modNum = -1})
				end

				if v.modType == 14 then -- HORNS
					for j = 0, 51, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetHornName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetHornName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 'plateIndex' then -- PLATES
					for j = 0, 4, 1 do
						local _label = ''
						if j == currentMods.plateIndex then
							_label = GetPlatesName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetPlatesName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 22 then -- NEON
					local _label = ''
					if currentMods.modXenon then
						_label = _U('neon') .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						price = math.floor(vehiclePrice * v.price / 100)
						_label = _U('neon') .. ' - <span style="color:green;">$' .. price .. ' </span>'
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				elseif v.modType == 'neonColor' or v.modType == 'tyreSmokeColor' then -- NEON & SMOKE COLOR
					local neons = GetNeons()
					price = math.floor(vehiclePrice * v.price / 100)
					for _,i in pairs(neons) do
						table.insert(elements, {
							label = '<span style="color:rgb(' .. i.r .. ',' .. i.g .. ',' .. i.b .. ');">' .. i.label .. ' - <span style="color:green;">$' .. price .. '</span>',
							modType = k,
							modNum = { i.r, i.g, i.b }
						})
					end
				elseif v.modType == 'color1' or v.modType == 'color2' or v.modType == 'pearlescentColor' or v.modType == 'wheelColor' then -- RESPRAYS
					local colors = GetColors(data.color)
					for __,j in pairs(colors) do
						local _label = ''
						price = math.floor(vehiclePrice * v.price / 100)
						_label = j.label .. ' - <span style="color:green;">$' .. price .. ' </span>'
						table.insert(elements, {label = _label, modType = k, modNum = j.index})
					end
				elseif v.modType == 'windowTint' then -- WINDOWS TINT
					for j = 1, 5, 1 do
						local _label = ''
						if j == currentMods.modHorns then
							_label = GetWindowName(j) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price / 100)
							_label = GetWindowName(j) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
					end
				elseif v.modType == 23 then -- WHEELS RIM & TYPE
					local props = {}

					props['wheels'] = v.wheelType
					ESX.Game.SetVehicleProperties(vehicle, props)

					local modCount = GetNumVehicleMods(vehicle, v.modType)
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName ~= nil then
							local _label = ''
							if j == currentMods.modFrontWheels then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
							table.insert(elements, {label = _label, modType = 'modFrontWheels', modNum = j, wheelType = v.wheelType, price = v.price})
						end
					end
				elseif v.modType == 11 or v.modType == 12 or v.modType == 13 or v.modType == 15 or v.modType == 16 then
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- UPGRADES
					for j = 0, modCount, 1 do
						local _label = ''
						if j == currentMods[k] then
							_label = _U('level', j+1) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
						else
							price = math.floor(vehiclePrice * v.price[j+1] / 100)
							_label = _U('level', j+1) .. ' - <span style="color:green;">$' .. price .. ' </span>'
						end
						table.insert(elements, {label = _label, modType = k, modNum = j})
						if j == modCount-1 then
							break
						end
					end
				elseif v.modType == 17 then -- TURBO
					local _label = ''
					if currentMods[k] then
						_label = 'Turbo - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
					else
						_label = 'Turbo - <span style="color:green;">$' .. math.floor(vehiclePrice * v.price[1] / 250) .. ' </span>'
					end
					table.insert(elements, {label = _label, modType = k, modNum = true})
				else
					local modCount = GetNumVehicleMods(vehicle, v.modType) -- BODYPARTS
					for j = 0, modCount, 1 do
						local modName = GetModTextLabel(vehicle, v.modType, j)
						if modName ~= nil then
							local _label = ''
							if j == currentMods[k] then
								_label = GetLabelText(modName) .. ' - <span style="color:cornflowerblue;">'.. _U('installed') ..'</span>'
							else
								price = math.floor(vehiclePrice * v.price / 100)
								_label = GetLabelText(modName) .. ' - <span style="color:green;">$' .. price .. ' </span>'
							end
							table.insert(elements, {label = _label, modType = k, modNum = j})
						end
					end
				end
			else
				if data.value == 'primaryRespray' or data.value == 'secondaryRespray' or data.value == 'pearlescentRespray' or data.value == 'modFrontWheelsColor' then
					for _,i in pairs(Config.Colors) do
						if data.value == 'primaryRespray' then
							table.insert(elements, {label = i.label, value = 'color1', color = i.value})
						elseif data.value == 'secondaryRespray' then
							table.insert(elements, {label = i.label, value = 'color2', color = i.value})
						elseif data.value == 'pearlescentRespray' then
							table.insert(elements, {label = i.label, value = 'pearlescentColor', color = i.value})
						elseif data.value == 'modFrontWheelsColor' then
							table.insert(elements, {label = i.label, value = 'wheelColor', color = i.value})
						end
					end
				else
					for l,w in pairs(v) do
						if l ~= 'label' and l ~= 'parent' then
							table.insert(elements, {label = w, value = l})
						end
					end
				end
			end
			break
		end
	end

	table.sort(elements, function(a, b)
		return a.label < b.label
	end)

	OpenLSMenu(elements, menuName, menuTitle, parent)
end

-- Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		local blip = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
		SetBlipSprite(blip, 72)
		SetBlipScale(blip, 0.8)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.Name)
		EndTextCommandSetBlipName(blip)
	end
end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if moze then
		local playerPed = PlayerPedId()
			if IsPedInAnyVehicle(playerPed, false) then
				local coords      = GetEntityCoords(PlayerPedId())
				local currentZone = nil
				local zone 		  = nil
				local lastZone    = nil
				if moze then
					for k,v in pairs(Config.Zones) do
						if #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x then
							isInLSMarker  = true
							ESX.ShowHelpNotification(v.Hint)

							break
						else
							isInLSMarker  = false
						end
					end
				end

				if IsControlJustReleased(0, Keys['E']) and not lsMenuIsShowed and isInLSMarker then
					if moze then
						lsMenuIsShowed = true

						local vehicle = GetVehiclePedIsIn(playerPed, false)
						FreezeEntityPosition(vehicle, true)

						myCar = ESX.Game.GetVehicleProperties(vehicle)

						ESX.UI.Menu.CloseAll()
						GetAction({value = 'main'})
					end
				end

				if isInLSMarker and not hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = true
				end

				if not isInLSMarker and hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = false
				end

			end
		end
	end
end)

function OpenRejkaMenu(vehicle)
		staryplate = GetVehicleNumberPlateText(vehicle)
		myCar123 = ESX.Game.GetVehicleProperties(vehicle)
	--	FreezeEntityPosition(vehicle, true)
		
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'open_rejka_menu', {
			title = ('Zmien Rejestracje')
		}, function(data, menu)

		if data.value == nil then
			ESX.ShowNotification(('Niepoprawne rejestracje'))
			menu.close()
			Citizen.Wait(100)
			ESX.UI.Menu.CloseAll()
			Citizen.Wait(100)
			OpenRejkaMenu()
		else
			Citizen.Wait(500)
			myCar = ESX.Game.GetVehicleProperties(vehicle)
			local nameLength = string.len(data.value)
			if nameLength < 8 then
				--TriggerServerEvent('esx_donator:zmienrejke', myCar123, data.value, myCar)
				ESX.TriggerServerCallback("esx_donator:zmienrejke", function(takjes) 
					if takjes then
						SetVehicleNumberPlateText(vehicle, data.value)
						menu.close()
						Citizen.Wait(100)
						ESX.UI.Menu.CloseAll()
						lsMenuIsShowed = false
					else
						menu.close()
						Citizen.Wait(100)
						ESX.UI.Menu.CloseAll()
						lsMenuIsShowed = false
					end
				end, myCar123, data.value, myCar)
				menu.close()
				Citizen.Wait(100)
				ESX.UI.Menu.CloseAll()
				lsMenuIsShowed = false
			else
				ESX.ShowNotification(('Niepoprawne rejestracje, rejki nie moga byc dluzsze niz 8 znakow'))
				menu.close()
				Citizen.Wait(100)
				ESX.UI.Menu.CloseAll()
				Citizen.Wait(100)
				OpenRejkaMenu()
			end
		end
	end, function(data, menu)
		menu.close()
		lsMenuIsShowed = false
	end)
end

RegisterNetEvent("zmienrejkenastara")
AddEventHandler("zmienrejkenastara", function()


end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if mozerejka then
		local playerPed = PlayerPedId()
			if IsPedInAnyVehicle(playerPed, false) then
				local coords      = GetEntityCoords(PlayerPedId())
				local currentZone = nil
				local zone 		  = nil
				local lastZone    = nil
				if mozerejka then
					for k,v in pairs(Config.ZonesRejka) do
						if #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x then
							isInLSMarker  = true
							ESX.ShowHelpNotification(v.Hint)

							break
						else
							isInLSMarker  = false
						end
					end
				end

				if IsControlJustReleased(0, Keys['E']) and not lsMenuIsShowed and isInLSMarker then
					if mozerejka then
						lsMenuIsShowed = true
						--print("bagno")
						local vehicle = GetVehiclePedIsIn(playerPed, false)
						Citizen.Wait(100)
						OpenRejkaMenu(vehicle)
						ESX.ShowNotification(('~r~PAMIETAJ REJESTRACJA NIE MOZE POSIADAC ZNAK??W SPECJALNYCH ORAZ MOZE MIEC MAX 8 LITER/LICZB WLICZAJAC SPACJE!!'))
						ESX.ShowNotification(('~r~PAMIETAJ REJESTRACJA NIE MOZE POSIADAC ZNAK??W SPECJALNYCH ORAZ MOZE MIEC MAX 8 LITER/LICZB WLICZAJAC SPACJE!!'))
						ESX.ShowNotification(('~r~PAMIETAJ REJESTRACJA NIE MOZE POSIADAC ZNAK??W SPECJALNYCH ORAZ MOZE MIEC MAX 8 LITER/LICZB WLICZAJAC SPACJE!!'))
						ESX.ShowNotification(('~r~PAMIETAJ REJESTRACJA NIE MOZE POSIADAC ZNAK??W SPECJALNYCH ORAZ MOZE MIEC MAX 8 LITER/LICZB WLICZAJAC SPACJE!!'))
						--print("bagno1")
						--FreezeEntityPosition(vehicle, true)

						myCar = ESX.Game.GetVehicleProperties(vehicle)

						--ESX.UI.Menu.CloseAll()
						
						
					end
				end

				if isInLSMarker and not hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = true
				end

				if not isInLSMarker and hasAlreadyEnteredMarker then
					hasAlreadyEnteredMarker = false
				end

			end
		end
	end
end)


-- Prevent Free Tunning Bug
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if lsMenuIsShowed then
			DisableControlAction(2, Keys['F1'], true)
			DisableControlAction(2, Keys['F2'], true)
			DisableControlAction(2, Keys['F3'], true)
			DisableControlAction(2, Keys['F6'], true)
			DisableControlAction(2, Keys['F7'], true)
			DisableControlAction(2, Keys['F'], true)
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)
