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

ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(1000)
	ESX.TriggerServerCallback('esx_weaponshop:getShop', function(shopItems)
		for k,v in pairs(shopItems) do
			Config.Zones[k].Items = v
		end
	end)
end)

RegisterNetEvent('esx_weaponshop:sendShop')
AddEventHandler('esx_weaponshop:sendShop', function(shopItems)
	for k,v in pairs(shopItems) do
		Config.Zones[k].Items = v
	end
end)

function Magazynek()
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4
	price = 4500
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString('🗄️  Magazynek')
	PushScaleformMovieMethodParameterInt('🗄️  Magazynek')
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

function Tlumik()
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4
	price = 40000
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString('🗞  Tlumik')
	PushScaleformMovieMethodParameterInt('🗞  Tlumik')
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

function Chwyt()
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4
	price = 25000
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString('🔭 Chwyt')
	PushScaleformMovieMethodParameterInt('🔭 Chwyt')
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

function Skin()
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4
	price = 70000
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString('🔫 Skorka do broni')
	PushScaleformMovieMethodParameterInt('🔫 Skorka do broni')
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

function Latarka()
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4
	price = 10000
	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString('🔦 Latarka')
	PushScaleformMovieMethodParameterInt('🔦 Latarka')
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

RegisterNetEvent('esx_weaponshop:magazynek1')
AddEventHandler('esx_weaponshop:magazynek1', function()
Magazynek()
end)

RegisterNetEvent('esx_weaponshop:latarka1')
AddEventHandler('esx_weaponshop:latarka1', function()
Latarka()
end)

RegisterNetEvent('esx_weaponshop:skin1')
AddEventHandler('esx_weaponshop:skin1', function()
Skin()
end)

RegisterNetEvent('esx_weaponshop:chwyt1')
AddEventHandler('esx_weaponshop:chwyt1', function()
Chwyt()
end)

RegisterNetEvent('esx_weaponshop:tlumik1')
AddEventHandler('esx_weaponshop:tlumik1', function()
Tlumik()
end)

RegisterNetEvent('esx_weaponshop:blad')
AddEventHandler('esx_weaponshop:blad', function()
PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
end)

function OpenBuyLicenseMenu(zone)
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
		title = _U('buy_license'),
		align = 'center',
		elements = {
			{ label = ('Licencje do wyrobienia na komendzie, potrzebujesz aktualnych badań psychologa oraz licencji na broń!'), value = 'no' },
		}
	}, function(data, menu)
		if data.current.value == 'yes' then
			ESX.TriggerServerCallback('esx_weaponshop:buyLicense', function(bought)
				if bought then
					menu.close()
					Cipka()
				end
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

function Cipka()
	local elements = {}
		table.insert(elements, {
			label = ('----------------------')})
PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_wybor', {
		title = ('Co chcesz kupic?'),
		align = 'center',
		elements = {
			{ label = ('Bronie'), value = 'cipeczka' },
			{ label = ('Komponenty do broni'), value = 'cipa' },
		}
	}, function(data, menu)
		if data.current.value == 'cipa' then
			OpenChujeMenu()
		elseif data.current.value == 'cipeczka' then
			OpenShopMenu(CurrentActionData.zone)
		end
		end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		menu.close()
		
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
	end, function(data, menu)
		PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
	
	
end

function OpenChujeMenu(zone) 
	local elements = {}
		table.insert(elements, {
			label = ('----------------------')})

	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'chuj',
	{
		title		= ('Komponenty do broni'),
		align		= 'center',
		elements = {
			{label = ('%s - <span style="color: green;">%s</span>'):format('Tlumik', _U('shop_menu_item', '40000')),
			value = 'silencieux'},
			{label = ('%s - <span style="color: green;">%s</span>'):format('Chwyt', _U('shop_menu_item', '25000')),
			value = 'grip'},
			{label = ('%s - <span style="color: green;">%s</span>'):format('Magazynek', _U('shop_menu_item', '4500')),
			value = 'clip'},
			{label = ('%s - <span style="color: green;">%s</span>'):format('Latarka', _U('shop_menu_item', '10000')),
			value = 'flashlight'},
			{label = ('%s - <span style="color: green;">%s</span>'):format('Skorka do broni', _U('shop_menu_item', '70000')),
			value = 'yusuf'}
		}
	}, function(data, menu)
		if data.current.value == 'silencieux' then
		TriggerServerEvent('esx_weaponshop:tlumik')
		elseif data.current.value == 'grip' then
		TriggerServerEvent('esx_weaponshop:grip')
		elseif data.current.value == 'flashlight' then
		TriggerServerEvent('esx_weaponshop:latarka')
		elseif data.current.value == 'yusuf' then
		TriggerServerEvent('esx_weaponshop:skin')
		elseif data.current.value == 'clip' then
		TriggerServerEvent('esx_weaponshop:magazynek')
		end
	end, function(data, menu)
	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
	menu.close()
	end, function(data, menu)
	PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
	
end

function OpenShopMenu(zone)
	local elements = {}
	ShopOpen = true

	for _,i in pairs(Config.Zones[zone].Items) do
		local item = i

		table.insert(elements, {
			label = ('%s - <span style="color: green;">%s</span>'):format(item.label, _U('shop_menu_item', ESX.Math.GroupDigits(item.price))),
			price = item.price,
			weaponName = item.item
		})
	end

	PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
		title = _U('shop_menu_title'),
		align = 'center',
		elements = elements
	}, function(data, menu)
		ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function(bought)
			if bought then
				DisplayBoughtScaleform('WEAPON_' .. data.current.weaponName, data.current.price)
			else
				PlaySoundFrontend(-1, 'ERROR', 'HUD_AMMO_SHOP_SOUNDSET', false)
			end
		end, data.current.weaponName, zone)
	end, function(data, menu)
		PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
		ShopOpen = false
		menu.close()
		if Config.Zones[CurrentActionData.zone].Legal then
		else

		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
end
	end, function(data, menu)
		PlaySoundFrontend(-1, 'NAV', 'HUD_AMMO_SHOP_SOUNDSET', false)
	end)
end

function DisplayBoughtScaleform(weaponName, price)
	local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
	local sec = 4

	BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

	PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
	PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
	PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
	PushScaleformMovieMethodParameterString('')
	PushScaleformMovieMethodParameterInt(100)

	EndScaleformMovieMethod()

	PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

	Citizen.CreateThread(function()
		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
	
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
	end)
end

AddEventHandler('esx_weaponshop:hasEnteredMarker', function(zone)
	if zone == 'GunShop' or zone == 'BialeShop' or zone == 'KrotkieShop' or zone == 'KrotkieShopv2' or zone == 'RzucaneShop' or zone =='KrotkieShopv3' or zone =='KrotkieShopv4' then
		CurrentAction     = 'shop_menu'
		CurrentActionMsg  = _U('shop_menu_prompt')
		CurrentActionData = { zone = zone }
	end
end)

AddEventHandler('esx_weaponshop:hasExitedMarker', function(zone)
	CurrentAction = nil
	ESX.UI.Menu.CloseAll()
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		if ShopOpen then
			ESX.UI.Menu.CloseAll()
		end
	end
end)

-- Create Blips
Citizen.CreateThread(function()
	for k,v in pairs(Config.Zones) do
		if v.Legal then
			for _,i in pairs(v.Locations) do
				local blip = AddBlipForCoord(i)

				SetBlipSprite (blip, 154)
				SetBlipDisplay(blip, 4)
				SetBlipScale  (blip, 1.0)
				SetBlipColour (blip, 81)
				SetBlipAsShortRange(blip, true)

				BeginTextCommandSetBlipName("STRING")
				AddTextComponentSubstringPlayerName(_U('map_blip'))
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local coords = GetEntityCoords(PlayerPedId())

		for k,v in pairs(Config.Zones) do
			for _,i in pairs(v.Locations) do
				if (Config.Type ~= -1 and #(coords - i) < Config.DrawDistance) then
					DrawMarker(Config.Type, i, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.Size.x, Config.Size.y, Config.Size.z, Config.Color.r, Config.Color.g, Config.Color.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(PlayerPedId())
		local isInMarker, currentZone = false, nil

		for k,v in pairs(Config.Zones) do
			for _,i in pairs(v.Locations) do
				if #(coords - i) < Config.Size.x then
					isInMarker, ShopItems, currentZone, LastZone = true, v.Items, k, k
				end
			end
		end
		if isInMarker and not HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = true
			TriggerEvent('esx_weaponshop:hasEnteredMarker', currentZone)
		end
		
		if not isInMarker and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_weaponshop:hasExitedMarker', LastZone)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) then

				if CurrentAction == 'shop_menu' then
					if Config.LicenseEnable and Config.Zones[CurrentActionData.zone].Legal then
						ESX.TriggerServerCallback('esx_license:checkLicense2', function(hasWeaponLicense)
							if hasWeaponLicense then
								Cipka()
							else
								OpenBuyLicenseMenu(CurrentActionData.zone)
							end
						end, GetPlayerServerId(PlayerId()), 'weapon', 'psycholog')
					else
						OpenShopMenu(CurrentActionData.zone)
					end
				end

				CurrentAction = nil
			end
		end
	end
end)

--[[RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')
      AddAmmoToPed(GetPlayerPed(-1), hash,25)
      ESX.ShowNotification("Uzyles magazynka")
    else
      ESX.ShowNotification("Nie masz broni w reku")
    end
  else
    ESX.ShowNotification("typ amunicji jest nieodpowiedni do broni")
  end
end)]]
