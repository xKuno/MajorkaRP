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

ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local coords
local kontohajs = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)

	ESX.TriggerServerCallback('esx_shops:requestDBItems', function(ShopItems)
		for k,v in pairs(ShopItems) do
			Config.Zones[k].Items = v
		end
	end)
end)

function OpenShopMenu(zone)
	local elements = {}
	for _,i in pairs(Config.Zones[zone].Items) do
		local item = i

		if item.limit == -1 then
			item.limit = 100
		end

		table.insert(elements, {
			label      = ('%s - <span style="color:green;">%s</span>'):format(item.label, _U('shop_item', ESX.Math.GroupDigits(item.price))),
			label_real = item.label,
			item       = item.item,
			price      = item.price,

			-- menu properties
			value      = 1,
			type       = 'slider',
			min        = 1,
			max        = item.limit
		})
	end

	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title    = _U('shop'),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title    = _U('shop_confirm', data.current.value, data.current.label_real, ESX.Math.GroupDigits(data.current.price * data.current.value)),
			align    = 'bottom-right',
			elements = {
				{label = _U('no'),  value = 'no'},
				{label = _U('yes'), value = 'yes'}
			}
		}, function(data2, menu2)
			if data2.current.value == 'yes' then
			ESX.UI.Menu.CloseAll()
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_choose', {
			title    = 'Wybor metody platnosci',
			align    = 'bottom-right',
			elements = {
				{label = 'Gotowka',  value = 'gotowka'},
				{label = 'Karta Bankowa', value = 'bank'}
			}
		}, function(data3, menu3)
				if data3.current.value == 'gotowka' then
					TriggerServerEvent('esx_shops:buyItem', data.current.item, data.current.value, zone, 'gotowka')
				elseif data3.current.value == 'bank' then
					TriggerServerEvent('esx_shops:buyItem', data.current.item, data.current.value, zone, 'bank')
				end
			CurrentAction     = 'shop_menu'
			CurrentActionMsg  = _U('press_menu')
			CurrentActionData = {zone = zone}
			menu3.close()
		end, function(data3, menu3)
			menu3.close()
		end)
			end

			menu2.close()
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		menu.close()

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('press_menu')
		CurrentActionData = {zone = zone}
	end)
end

AddEventHandler('esx_shops:hasEnteredMarker', function(zone)
	CurrentAction     = 'shop_menu'
	CurrentActionMsg  = _U('press_menu')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_shops:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

-- Create Blips
Citizen.CreateThread(function()

	for _,i in pairs(Config.Map) do

		local blip = AddBlipForCoord(i.x, i.y, i.z)
		SetBlipSprite (blip, i.id)
		SetBlipScale  (blip, 0.8)
		SetBlipDisplay(blip, 4)
		SetBlipColour (blip, i.color)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(i.name)
		EndTextCommandSetBlipName(blip)
	end

end)

Citizen.CreateThread(function()
	Citizen.Wait(500)
	while true do
		Citizen.Wait(1000)
		coords = GetEntityCoords(GetPlayerPed(-1))
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		coords = GetEntityCoords(GetPlayerPed(-1))
		Citizen.Wait(1)
		for k,v in pairs(Config.Zones) do
			for _,i in pairs(v.Pos) do
				if(Config.Type ~= -1 and #(coords - vector3(i.x, i.y, i.z)) < Config.DrawDistance) then
					DrawMarker(Config.Type, i.x, i.y, i.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(50)
		local isInMarker  = false
		local currentZone = nil
		coords = GetEntityCoords(GetPlayerPed(-1))

		for k,v in pairs(Config.Zones) do
			for _,i in pairs(v.Pos) do
				if(#(coords - vector3(i.x, i.y, i.z)) < Config.Size.x) then
					isInMarker  = true
					ShopItems   = v.Items
					currentZone = k
					LastZone    = k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_shops:hasEnteredMarker', currentZone)
		end
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_shops:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then
				if CurrentAction == 'shop_menu' then
					OpenShopMenu(CurrentActionData.zone)
				end

				CurrentAction = nil
			end
		end
	end
end)
