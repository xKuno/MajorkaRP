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
  local isDead                  = false
  local player = PlayerPedId()
  local inside 				  = nil
  local wsrodku				  = nil
  local rejka
  local lastSkin = {}
  local newSkin = {}
  local clearSkinMale = {
	  ['tshirt_1'] = 15,
	  ['tshirt_2'] = 0,
	  ['torso_1'] = 15,
	  ['torso_2'] = 0,
	  ['chain_1'] = 0,
	  ['chain_2'] = 0,
	  ['arms'] = 15,
	  ['pants_1'] = 41,
	  ['pants_2'] = 0,
	  ['shoes_1'] = 42,
	  ['shoes_2'] = 0,
	  ['helmet_1'] = -1,
	  ['helmet_2'] = 0,
	  ['ears_1'] = -1,
	  ['ears_2'] = 0,
	  ['mask_1'] = 0,
	  ['mask_2'] = 0,
	  ['glasses_1'] = 0,
	  ['glasses_2'] = 0,
	  ['bags_1'] = 0,
	  ['bags_2'] = 0,
  }
  
  local clearSkinFemale = {
	  ['tshirt_1'] = 15,
	  ['tshirt_2'] = 0,
	  ['torso_1'] = 15,
	  ['torso_2'] = 0,
	  ['chain_1'] = 0,
	  ['chain_2'] = 0,
	  ['arms'] = 15,
	  ['pants_1'] = 26,
	  ['pants_2'] = 0,
	  ['shoes_1'] = 35,
	  ['shoes_2'] = 0,
	  ['helmet_1'] = -1,
	  ['helmet_2'] = 0,
	  ['ears_1'] = -1,
	  ['ears_2'] = 0,
	  ['mask_1'] = 0,
	  ['mask_2'] = 0,
	  ['glasses_1'] = 5,
	  ['glasses_2'] = 0,
	  ['bags_1'] = 0,
	  ['bags_2'] = 0,
  }
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
  
  AddEventHandler('playerSpawned', function()
	  if inside or wsrodku then
		  TriggerEvent('esx_mafiajob:wyciaganiebagaznik')
	  end
  end)
  
  function OpenMafiaActionsMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mafia_actions',
	  {
		  title    = 'Menu Kajdanek',
		  align    = 'center',
		  elements = {
			  {label = 'Kajdanki',	value = 'citizen_interaction'}
		  }
	  }, function(data, menu)
  
		  if data.current.value == 'citizen_interaction' then
			  local elements = {
				  {label = ('Przeszukaj'),			value = 'body_search'},
				  {label = ('Zakuj/Rozkuj'),		value = 'handcuff'},
				  {label = ('Przenies'),			value = 'drag'},
				  {label = ('Wsadz do pojazdu'),	value = 'put_in_vehicle'},
				  {label = ('Wyciagnij do pojazdu'),	value = 'out_the_vehicle'},
				  {label = ('Wrzuc do bagaznika'),	value = 'wsadz'},
				  {label = ('Wyciagnij z bagaznika'),	value = 'wyciagnij'},
				  --{label = 'Menu Ubran',	value = 'ubranie'},
			  }
			  ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'citizen_interaction',
			  {
				  title    = 'Kajdanki',
				  align    = 'center',
				  elements = elements
			  }, function(data2, menu2)
				  local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				  if closestPlayer ~= -1 and closestDistance <= 3.0 then
					  local action = data2.current.value
					  local playerPed = PlayerPedId()
					  if not exports['esx_property']:isInProperty1() then
					  if action == 'body_search' then
						  TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Jesteś przeszukiwany przez : ~b~') .. GetPlayerServerId(PlayerId()))
						  ESX.ShowNotification(('Przeszukujesz : ~b~') .. GetPlayerServerId(closestPlayer))
						  OpenBodySearchMenu(closestPlayer)
					  elseif action == 'handcuff' then
						  if GetEntitySpeed(player) > 0.5 or GetEntitySpeed(dupa) > 0.5 then
							  ESX.ShowNotification('~r~Nie możesz zakuwac w ruchu')
						  else
							  animacjazakuciarozkuciaxd()
							  TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Zostałeś Zakuty/Rozkuty : ~b~') .. GetPlayerServerId(PlayerId()))
							  TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
							  ESX.ShowNotification(('Zakuwasz/Rozkuwasz : ~b~') .. GetPlayerServerId(closestPlayer))
					  end
					  elseif action == 'drag' then
						  TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
						  TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Jesteś Eskortowany : ~b~') .. GetPlayerServerId(PlayerId()))
						  ESX.ShowNotification(('Eskortujesz : ~b~') .. GetPlayerServerId(closestPlayer))
					  elseif action == 'put_in_vehicle' then
						  TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
						  TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Zostałeś wsadzony do pojazdu : ~b~') .. GetPlayerServerId(PlayerId()))
						  ESX.ShowNotification(('Wsadziłeś do pojazdu : ~b~') .. GetPlayerServerId(closestPlayer))
					  elseif action == 'out_the_vehicle' then
						  TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
						  TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Zostałeś Wyciągniety z pojazdu : ~b~') .. GetPlayerServerId(PlayerId()))
						  ESX.ShowNotification(('Wyciągnąłeś z pojazdu : ~b~') .. GetPlayerServerId(closestPlayer))
					  elseif action == 'wsadz' then
						  TriggerServerEvent('esx_mafiajob:wkladaniebagaznik', GetPlayerServerId(closestPlayer))
					  elseif action == 'wyciagnij' then
						  TriggerServerEvent('esx_mafiajob:wyciaganiebagaznik', GetPlayerServerId(closestPlayer))
					  elseif action == 'ubranie' then
						  OpenUbraniaMenu(closestPlayer)
					  end
					  else
						  ESX.ShowNotification("~r~Nie mozesz uzywac kajdanek w domu")
					  end
				  else
					  ESX.ShowNotification(_U('no_players_nearby'))
				  end
			  end, function(data2, menu2)
				  menu2.close()
			  end)
		  end
  
	  end, function(data, menu)
		  menu.close()
	  end)
  end
  
  function OpenUbraniaMenu(player)
  
		  local elements = {}
  
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		  {
			  title    = _U('search'),
			  align    = 'center',
			  elements = {
			  {label = 'Czapki',		value = 'hat'},
			  {label = 'Okulary',		value = 'glasses'},
			  {label = 'Maski',		value = 'mask'},
			  {label = 'Szalik',		value = 'chain'},
			  {label = 'Torba',		value = 'bag'},
			  {label = 'Koszulka i Kurtka',	value = 'coat'},
			  {label = 'Spodnie',	value = 'legs'},
			  {label = 'Buty',		value = 'shoes'},
		  }
		  },
		  function(data, menu)
  
					  local action = data.current.value
  
					  if action == 'chain' and not ubieranie then
					  TaskPlayAnim(player, dict3, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1400)
  ubieranie = false
				  ClearPedTasks(player)
					  
  if 0 == GetPedDrawableVariation(player, 7) then
  TriggerServerEvent('esx_ciuchy:szalik')
  else
  SetPedComponentVariation(player, 7, 0, 0, 2)
  
  end
  --TriggerEvent('esx_ciuchy:ubierz')
  
  elseif action == 'mask' then
  if 0 == GetPedDrawableVariation(player, 1) then
					  TaskPlayAnim(player, dict4, "put_on_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  TriggerServerEvent('esx_ciuchy:maska')
  else
					  TaskPlayAnim(player, dict5, "takeoff_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  SetPedComponentVariation(player, 1, 0, 0, 2)
  
  end
  
  
  
  elseif action == 'hat' then
  if 8 == GetPedPropIndex(player, 0) then
					  TaskPlayAnim(player, dict4, "put_on_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  TriggerServerEvent('esx_ciuchy:czapka')
  else
					  TaskPlayAnim(player, dict5, "takeoff_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  SetPedPropIndex(player, 0, 8, 0, true)
  
  end
  
  elseif action == 'glasses' then
  if 0 == GetPedPropIndex(player, 1) then
					  TaskPlayAnim(player, dict4, "put_on_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  TriggerServerEvent('esx_ciuchy:okulary')
  else
					  TaskPlayAnim(player, dict5, "takeoff_mask", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1000)
  ubieranie = false
				  ClearPedTasks(player)
  SetPedPropIndex(player, 1, 0, 0, true)
  
  end
  
  
												  
					  elseif action == 'bag' and not ubieranie then
					  TaskPlayAnim(player, dict1, "check_out_a", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1400)
  ubieranie = false
				  ClearPedTasks(player)
									 if 0 == GetPedDrawableVariation(player, 5) then
  TriggerServerEvent('esx_ciuchy:torba')
  else
  SetPedComponentVariation(player, 5, 0, 0, 2)
  
  end
  
  
  
					  elseif action == 'coat' and not ubieranie then
  
					  TaskPlayAnim(player, dict1, "check_out_c", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1400)
  ubieranie = false
				  ClearPedTasks(player)
  
	  if 15 == GetPedDrawableVariation(player, 8) or 15 == GetPedDrawableVariation(player, 11) then
  TriggerServerEvent('esx_ciuchy:kurtka')
  else
  
  
  SetPedComponentVariation(player, 8, 15, 0, 2)
  SetPedComponentVariation(player, 11, 15, 0, 2)
  SetPedComponentVariation(player, 3, 15, 0, 2)
  SetPedComponentVariation(player, 10, 0, 0, 2)
  end
  
  
					  
					  elseif action == 'legs' and not ubieranie then
  TaskPlayAnim(player, dict2, "try_shoes_positive_a", 8.0, 8.0, -1, 50, 0, false, false, false)
  ubieranie = true
					  Wait(1400)
  ubieranie = false
				  ClearPedTasks(player)
  
	  TriggerEvent('skinchanger:getSkin', function(skin)
	  if 14 == GetPedDrawableVariation(player, 4) and skin.sex == 0 or  17 == GetPedDrawableVariation(player, 4) and skin.sex == 1 then
  
  TriggerServerEvent('esx_ciuchy:spodnie')
  else
  
		  if skin.sex == 0 then
			  SetPedComponentVariation(player, 4, 14, 0, 2)
  else
		  SetPedComponentVariation(player, 4, 17, 1, 2)
  end
  end
  end)
  
  
  
  
					  elseif action == 'shoes' and not ubieranie then
					  TaskPlayAnim(player, dict6, "base", 8.0, 8.0, -1, 11, 0, false, false, false)
  ubieranie = true
					  Wait(1400)
  ubieranie = false
				  ClearPedTasks(player)
	  TriggerEvent('skinchanger:getSkin', function(skin)
		   if 34 == GetPedDrawableVariation(player, 6) and skin.sex == 0 or  35 == GetPedDrawableVariation(player, 6) and skin.sex == 1 then
  
  TriggerServerEvent('esx_ciuchy:buty')
  else
  if skin.sex == 0 then
  SetPedComponentVariation(player, 6, 34, 0, 2)
  else
  SetPedComponentVariation(player, 6, 35, 0, 2)
  end
  end
  end)
  
  
  
					  end
  
  
  
  
  
	  
  
	  end, function(data, menu)
		  menu.close()
	  end)
  end
  
  RegisterNetEvent('esx_ciuchy:wear')
  AddEventHandler('esx_ciuchy:wear', function()
  
  mask= GetPedDrawableVariation(GetPlayerPed(-1), 1)
  mask1 = GetPedTextureVariation(GetPlayerPed(-1), 1)
  bag = GetPedDrawableVariation(GetPlayerPed(-1), 5)
  bag1 = GetPedTextureVariation(GetPlayerPed(-1), 5)
  tshirt = GetPedDrawableVariation(GetPlayerPed(-1), 8)
  thsirt1 = GetPedTextureVariation(GetPlayerPed(-1), 8)
  torso = GetPedDrawableVariation(GetPlayerPed(-1), 11)
  torso1 = GetPedTextureVariation(GetPlayerPed(-1), 11)
  legs = GetPedDrawableVariation(GetPlayerPed(-1), 4)
  legs1 = GetPedTextureVariation(GetPlayerPed(-1), 4)
  boots = GetPedDrawableVariation(GetPlayerPed(-1), 6)
  boots1 = GetPedTextureVariation(GetPlayerPed(-1), 6)
  arms = GetPedDrawableVariation(GetPlayerPed(-1), 3)
  chain = GetPedDrawableVariation(GetPlayerPed(-1), 7)
  chain1 = GetPedTextureVariation(GetPlayerPed(-1), 7)
  mask= GetPedDrawableVariation(GetPlayerPed(-1), 1)
  mask1 = GetPedTextureVariation(GetPlayerPed(-1), 1)
  decals= GetPedDrawableVariation(GetPlayerPed(-1), 10)
  decals1 = GetPedTextureVariation(GetPlayerPed(-1), 10)
  local hat = GetPedPropIndex(GetPlayerPed(-1), 0)
  local hat1 = GetPedPropTextureIndex(GetPlayerPed(-1), 0)
  local glasses = GetPedPropIndex(GetPlayerPed(-1), 1)
  local glasses1 = GetPedPropTextureIndex(GetPlayerPed(-1), 1)
	  TriggerServerEvent('esx_ciuchy:dodaj', bag, bag1, tshirt, thsirt1, torso, torso1, legs, legs1, boots, boots1, arms, chain,chain1,mask,mask1,decals,decals1,hat,hat1,glasses,glasses1)
  
  end)
  RegisterNetEvent('esx_ciuchy:ubierz')
  AddEventHandler('esx_ciuchy:ubierz', function(id1,id2, id3)
	  local playerPed       = PlayerPedId()
  SetPedComponentVariation(GetPlayerPed(-1), id3, id1, id2, 2)
  
  end)
  RegisterNetEvent('esx_ciuchy:prop')
  AddEventHandler('esx_ciuchy:prop', function(id1,id2, id3)
	  local playerPed       = PlayerPedId()
  SetPedPropIndex(GetPlayerPed(-1), id3, id1, id2, true)
  
  end)
  
  
  function UpdateSkin()
	  TriggerEvent('skinchanger:getSkin', function(skin)
		  updatedSkin = skin
		  newSkin = skin
		  if skin.sex == 0 then
			  for i in pairs(skin) do
				  if lastSkin[i] == nil then
					  lastSkin[i] = skin[i]
				  elseif clearSkinMale[i] ~= nil and skin[i] ~= clearSkinMale[i] then
					  lastSkin[i] = skin[i]
				  end
			  end
		  else
			  for i in pairs(skin) do
				  if lastSkin[i] == nil then
					  lastSkin[i] = skin[i]
				  elseif clearSkinFemale[i] ~= nil and skin[i] ~= clearSkinFemale[i] then
					  lastSkin[i] = skin[i]
				  end
			  end
		  end
	  end)
  end
  
  function PA(lib, anim)
	  RequestAnimDict(lib)
	  while not HasAnimDictLoaded(lib) do
		  Citizen.Wait(10)
	  end
	  TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, 0, 0, 0)
  end
  
  local disabledTrunk = {
	  [1] = "zentorno",
	  [2] = "bdivo",
	  [3] = "mini",
	  [4] = "trophytruck2",
	  [5] = "nova",
	  [6] = "pista",
	  [7] = "bullet",
	  [8] = "gsxb",
	  [9] = "ONEFIFTY55",
	  [10] = "hs",
	  [11] = "c63coupe",
	  [12] = "arrinera",
	  [13] = "tropos",
	  [14] = "charge4",
	  [15] = "regera",
	  [16] = "ar33",
	  [17] = "hermes",
	  [18] = "rubi3d",
	  [19] = "italigtb2",
	  [20] = "jester2",
	  [21] = "continental",
	  [22] = "GP1",
	  [23] = "boss429",
	  [24] = "gt3rs",
	  [25] = "infernus2",
	  [26] = "turismo2",
	  [27] = "610lb",
	  [28] = "apollos",
	  [29] = "e30mt2",
	  [30] = "488",
	  [31] = "aventadors",
	  [32] = "pd458wb",
	  [33] = "lp580",
	  [34] = "mb300sl",
	  [35] = "lp770",
	  [36] = "650s",
	  [37] = "rmodlp570",
	  [38] = "morgan",
	  [39] = "lykan",
	  [40] = "ts1",
	  [41] = "polaventa",
	  [42] = "taxi"
  }
  
  function checkTrunk(veh)
	  for i = 1, #disabledTrunk do
		  if GetEntityModel(veh) == GetHashKey(disabledTrunk[i]) then
			  return false
		  end
	  end
  
	  return true
  end
  
  function OpenBagaznikMenu()
	  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pozyczka_actions',
	  {
		  title    = 'Menu',
		  align    = 'center',
		  elements = {
			  {label = ('Interakcja z Bagaznikiem'),		value = 'citizen_interaction'}
		  }
	  }, function(data, menu)
  
  
		  if data.current.value == 'citizen_interaction' then
			  local elements = {
				  {label = ('Wejdz'),			value = 'wloz'},
				  {label = ('Wyjdz'),			value = 'wyciagnij'}
			  }
  
			  ESX.UI.Menu.Open(
			  'default', GetCurrentResourceName(), 'citizen_interaction',
			  {
				  title    = ('Bagaznik'),
				  align    = 'center',
				  elements = elements
			  }, function(data2, menu2)
				  player = PlayerPedId()
				  local plyCoords = GetEntityCoords(player, false)
				  local vehicle = VehicleInFront()
					  local action = data2.current.value
			  
					  if action == 'wloz' then
				  if not exports['esx_policejob']:JestZakuty() then
				  if not wsrodku then
	  local me = GetPlayerServerId(PlayerId())
		  if not IsPedDeadOrDying(PlayerPedId(), 1) then
			  local targetVehicle = ESX.Game.GetVehicleInDirection()
			  if not DoesEntityExist(targetVehicle) then
				  ESX.ShowNotification('~r~Zbyt daleko do bagażnika')
			  elseif IsThisModelACar(GetEntityModel(targetVehicle)) and checkTrunk(targetVehicle) and not DoesVehicleHaveDoor(targetVehicle, 6) and DoesVehicleHaveDoor(targetVehicle, 5) then
				  RequestAnimDict("fin_ext_p1-7")
				  while not HasAnimDictLoaded("fin_ext_p1-7") do
					  Citizen.Wait(0)
				  end
  
				  if DoesEntityExist(targetVehicle) then
					  ESX.TriggerServerCallback('esx_mafiajob:checkczyjest', function(plate)
						  if plate then
				  if GetVehicleDoorLockStatus(targetVehicle) < 2 then
						  
					  local d1, d2 = GetModelDimensions(GetEntityModel(targetVehicle))
							  TriggerServerEvent('esx_mafiajob:addTrunk', GetVehicleNumberPlateText(targetVehicle))
							  SetVehicleDoorOpen(targetVehicle, 5, false)
							  local id = NetworkGetNetworkIdFromEntity(targetVehicle)
  
							  SetNetworkIdCanMigrate(id, true)
							  SetEntityAsMissionEntity(targetVehicle, true, false)
							  SetVehicleHasBeenOwnedByPlayer(targetVehicle,  true)
							  wsrodku = { vehicle = targetVehicle, plate = GetVehicleNumberPlateText(targetVehicle) }
							  rejka = GetVehicleNumberPlateText(targetVehicle)
							  local ped = PlayerPedId()
							  ClearPedTasksImmediately(ped)
							  TriggerEvent("esx_policejob:unrestrain", ped)
							  Citizen.Wait(500)
							  TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
							  AttachEntityToEntity(ped, targetVehicle, 0, -0.1, d1.y + 0.85, d2.z - 0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
					  else
						  ESX.ShowNotification('~r~Nie mozesz wejsc do zamknietego auta!')
					  end
						  else
							  ESX.ShowNotification('~r~Ten bagażnik jest zajęty')
						  end
					  end, GetVehicleNumberPlateText(targetVehicle))
				  else
					  ESX.ShowNotification('~r~Zbyt daleko do bagażnika')
				  end
			  else
				  ESX.ShowNotification('~r~W tym aucie nie można umieścić w bagażniku!')
			  end
		  else
			  ESX.ShowNotification('~r~Nie można umieścić w bagażniku')
		  end
	  else
		  ESX.ShowNotification('~y~Już w bagażniku')
	  end
  else
  
		  ESX.ShowNotification('~y~Nie możesz wchodzić do bagaznika zakutym.')
	  end
					  elseif action == 'wyciagnij' then	
	  if wsrodku then
	  if GetVehicleDoorLockStatus(wsrodku.vehicle) < 2 then
		  local ped = PlayerPedId()
		  ClearPedTasks(ped)
		  DetachEntity(ped)
		  TriggerServerEvent('esx_mafiajob:leaveTrunk123', wsrodku.plate)
		  
		  local DropCoords = GetEntityCoords(ped, true)
		  SetEntityCoords(ped, DropCoords.x + 1.5, DropCoords.y + 1.5, DropCoords.z)
		  SetVehicleDoorOpen(wsrodku.vehicle, 5, 1, 1)	
		  cameraTrunkDisable()
		  wsrodku = nil
		  else
			  ESX.ShowNotification('~r~Nie mozesz wyjsc z zamknietego auta!')
		  end
	  else
		  ESX.ShowNotification('~r~Nie jesteś w bagażniku!')
	  end
					  end
  
			  end, function(data2, menu2)
				  menu2.close()
			  end)
		  end
	  end, function(data, menu)
		  menu.close()
	  end)
  end
  
  
  function checkInTrunk()
	  return inside ~= nil
  end
  
  function checkInTrunk1()
	  return wsrodku ~= nil
  end
  
  RegisterNetEvent('esx_mafiajob:wkladaniebagaznik')
  AddEventHandler('esx_mafiajob:wkladaniebagaznik', function()
				  if not inside then
	  local me = GetPlayerServerId(PlayerId())
		  if not IsPedDeadOrDying(PlayerPedId(), 1) then
			  local targetVehicle = ESX.Game.GetVehicleInDirection()
			  if not DoesEntityExist(targetVehicle) then
				  ESX.ShowNotification('~r~Zbyt daleko do bagażnika')
			  elseif IsThisModelACar(GetEntityModel(targetVehicle)) and checkTrunk(targetVehicle) and not DoesVehicleHaveDoor(targetVehicle, 6) and DoesVehicleHaveDoor(targetVehicle, 5) then
				  RequestAnimDict("fin_ext_p1-7")
				  while not HasAnimDictLoaded("fin_ext_p1-7") do
					  Citizen.Wait(0)
				  end
  
				  if DoesEntityExist(targetVehicle) then
					  ESX.TriggerServerCallback('esx_mafiajob:checkczyjest', function(plate)
						  if plate then
					  if GetVehicleDoorLockStatus(targetVehicle) < 2 then
						  local d1, d2 = GetModelDimensions(GetEntityModel(targetVehicle))
								  inside = { vehicle = targetVehicle, plate = GetVehicleNumberPlateText(targetVehicle) }
								  TriggerServerEvent('esx_mafiajob:addTrunk', GetVehicleNumberPlateText(targetVehicle))
								  SetVehicleDoorOpen(targetVehicle, 5, false)
								  local id = NetworkGetNetworkIdFromEntity(targetVehicle)
								  SetNetworkIdCanMigrate(id, true)
								  SetEntityAsMissionEntity(targetVehicle, true, false)
								  SetVehicleHasBeenOwnedByPlayer(targetVehicle,  true)
								  local ped = PlayerPedId()
								  ClearPedTasksImmediately(ped)
								  TriggerEvent("esx_policejob:unrestrain", ped)
								  Citizen.Wait(500)
								  TaskPlayAnim(ped, "fin_ext_p1-7", "cs_devin_dual-7", 8.0, 8.0, -1, 1, 999.0, 0, 0, 0)
								  AttachEntityToEntity(ped, targetVehicle, 0, -0.1, d1.y + 0.85, d2.z - 0.87, 0, 0, 40.0, 1, 1, 1, 1, 1, 1)
							  else
						  ESX.ShowNotification('~r~Nie mozesz wejsc do zamknietego auta!')
					  end
						  else
							  ESX.ShowNotification('~r~Ten bagażnik jest zajęty')
						  end
					  end, GetVehicleNumberPlateText(targetVehicle))
						  else
					  ESX.ShowNotification('~r~Zbyt daleko do bagażnika')
				  end
					  else
				  ESX.ShowNotification('~r~W tym aucie nie można umieścić w bagażniku!')
			  end
				  else
			  ESX.ShowNotification('~r~Nie można umieścić w bagażniku')
		  end
			  else
		  ESX.ShowNotification('~y~Już w bagażniku')
	  end  			
  end)
  
  RegisterNetEvent('esx_mafiajob:wyciaganiebagaznik')
  AddEventHandler('esx_mafiajob:wyciaganiebagaznik', function()
  local player = PlayerPedId()
	  if inside then
		  if GetVehicleDoorLockStatus(inside.vehicle) < 2 then
		  local ped = PlayerPedId()
		  ClearPedTasks(ped)
		  DetachEntity(ped)
		  --TriggerServerEvent('esx_mafiajob:leaveTrunk', inside.plate)
		  TriggerServerEvent('esx_mafiajob:leaveTrunk123', inside.plate)
		  
		  local DropCoords = GetEntityCoords(ped, true)
		  SetEntityCoords(ped, DropCoords.x + 1.5, DropCoords.y + 1.5, DropCoords.z)
		  SetVehicleDoorOpen(inside.vehicle, 5, 1, 1)
		  cameraTrunkDisable()
		  inside = nil
		  else
			  ESX.ShowNotification('~r~Nie mozesz wyjsc z zamknietego auta!')
		  end
	  else
		  ESX.ShowNotification('~r~Nie jesteś w bagażniku!')
	  end
  end)
  
  function OpenBodySearchMenu(player)
	urfhjuigdhjsuifghedsuifhdsuifhsdui = GetPlayerPed(player)
	jeden = GetEntityCoords(urfhjuigdhjsuifghedsuifhdsuifhsdui)
	kordy = GetEntityCoords(PlayerPedId())
	dist = #(kordy - jeden)
	if dist < 5 then
		TriggerEvent("pNotify:SendNotification",{
			text = ('PRZESZUKIWANIE OSOBY'),
			type = "success",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "police",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
  		}})
	  Citizen.Wait(3000)
	  ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
  
		  local elements = {}
		  
			  table.insert(elements, {
				  label      = '[' .. ('Pieniadze') .. '] $' .. data.money,
				  value      = 'money',
				  itemType    = 'item_money',
				  amount     = data.money,
			  })
		  
		  for i=1, #data.accounts, 1 do
  
			  if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then
  
				  table.insert(elements, {
					  label    = _U('confiscate_dirty', ESX.Round(data.accounts[i].money)),
					  value    = 'black_money',
					  itemType = 'item_account',
					  amount   = data.accounts[i].money
				  })
  
				  break
			  end
  
		  end
  
		  table.insert(elements, {label = ('--- Bronie ---'), value = nil})
  
		  for i=1, #data.inventory, 1 do
			  if data.inventory[i].count > 0 and (data.inventory[i].name == 'pistol' or data.inventory[i].name == 'snspistol' or data.inventory[i].name == 'combatpistol' or data.inventory[i].name == 'vintagepistol' or data.inventory[i].name == 'pistol_mk2' or  data.inventory[i].name == 'snspistol_mk2' or data.inventory[i].name == 'revolver' or data.inventory[i].name == 'pistol50' or data.inventory[i].name == 'heavypistol'
			  or data.inventory[i].name == 'knife'  or data.inventory[i].name == 'knuckle'  or data.inventory[i].name == 'nightstick'  or data.inventory[i].name == 'hammer'  or data.inventory[i].name == 'bat'  or data.inventory[i].name == 'golfclub' or data.inventory[i].name == 'crowbar' or data.inventory[i].name == 'bottle' or data.inventory[i].name == 'dagger' or data.inventory[i].name == 'hatchet' or data.inventory[i].name == 'machete'
			  or data.inventory[i].name == 'flashlight' or data.inventory[i].name == 'switchblade' or data.inventory[i].name == 'poolcue' or data.inventory[i].name == 'pipewrench' or data.inventory[i].name == 'ball'or data.inventory[i].name == 'stungun') then 
				  table.insert(elements, {
					  label    = _U('confiscate_weapon', data.inventory[i].count, data.inventory[i].label),
					  value    = data.inventory[i].name,
					  itemType = 'item_standard',
					  amount   = data.inventory[i].count
				  })
			  end
		  end
  
		  table.insert(elements, {label = ('--- Ekwipunek ---'), value = nil})
  
		  for i=1, #data.inventory, 1 do
			  if data.inventory[i].count > 0 and (data.inventory[i].name ~= 'pistol'  and data.inventory[i].name ~= 'snspistol' and data.inventory[i].name ~= 'combatpistol' and data.inventory[i].name ~= 'vintagepistol' and data.inventory[i].name ~= 'pistol_mk2' and data.inventory[i].name ~= 'snspistol_mk2' and data.inventory[i].name ~= 'revolver' and data.inventory[i].name ~= 'pistol50' and data.inventory[i].name ~= 'heavypistol'
			  and data.inventory[i].name ~= 'knife'   and data.inventory[i].name ~= 'knuckle'  and data.inventory[i].name ~= 'nightstick'  and data.inventory[i].name ~= 'hammer'  and data.inventory[i].name ~= 'bat'  and data.inventory[i].name ~= 'golfclub' and data.inventory[i].name ~= 'crowbar' and data.inventory[i].name ~= 'bottle' and data.inventory[i].name ~= 'dagger' and data.inventory[i].name ~= 'hatchet' and data.inventory[i].name ~= 'machete'
			  and data.inventory[i].name ~= 'flashlight' and data.inventory[i].name ~= 'switchblade' and data.inventory[i].name ~= 'poolcue' and data.inventory[i].name ~= 'pipewrench' and data.inventory[i].name ~= 'ball'and data.inventory[i].name ~= 'stungun') then 
				  table.insert(elements, {
					  label    = _U('confiscate_inv', data.inventory[i].count, data.inventory[i].label),
					  value    = data.inventory[i].name,
					  itemType = 'item_standard',
					  amount   = data.inventory[i].count
				  })
			  end
		  end
  
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		  {
			  title    = _U('search'),
			  align    = 'center',
			  elements = elements,
		  },
		  function(data, menu)
  
			  local itemType = data.current.itemType
			  local itemName = data.current.value
			  local amount   = data.current.amount
  
			  if data.current.value ~= nil then
				jeden = GetEntityCoords(urfhjuigdhjsuifghedsuifhdsuifhsdui)
				kordy = GetEntityCoords(PlayerPedId())
				dist = #(kordy - jeden)
				Citizen.Wait(100)
				if dist < 5 then
					ESX.UI.Menu.CloseAll()
					Citizen.Wait(1)
					TriggerEvent("pNotify:SendNotification",{
						text = ("Zabieranie przedmiotu obywatelowi: "..GetPlayerServerId(player)),
						type = "success",
						timeout = (2000),
						layout = "bottomCenter",
						queue = "police",
						animation = {
						open = "gta_effects_fade_in",
						close = "gta_effects_fade_out"
					}})
			  --	exports['MajorkaRP']:startUI((1 * 2000), "Zabieranie przedmiotu obywatelowi: "..GetPlayerServerId(player))
					Citizen.Wait(2000)
					TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
					ESX.UI.Menu.CloseAll()
					Citizen.Wait(100)
					OpenBodySearchMenu(player)
				else
					ESX.UI.Menu.CloseAll()
					ESX.ShowNotification("Obywatel jest za daleko, przestajesz przeszukiwać.")
				end
			end
  
		  end, function(data, menu)
			  menu.close()
		  end)
  
	  end, GetPlayerServerId(player))
	else
		ESX.UI.Menu.CloseAll()
		ESX.ShowNotification("Obywatel jest za daleko, przestajesz przeszukiwać.")
	end
end
  
RegisterNetEvent('esx_handcuffs:cuffcheck')
AddEventHandler('esx_handcuffs:cuffcheck', function()
	local player, distance = ESX.Game.GetClosestPlayer()
	if distance ~= -1 and distance <= 3.0 then
		ESX.ShowNotification('~g~Uzyles swoich kajdanek')
		Wait(5)
		OpenMafiaActionsMenu(GetPlayerServerId(player))
	else
		ESX.ShowNotification('Brak graczy w poblizu')
	end
end)
  
function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end
  
function animacjazakuciarozkuciaxd()
	  local ad = "mp_arresting"
	  local anim = "a_uncuff"
	  local player = PlayerPedId()
  
	  if ( DoesEntityExist(player) and not IsEntityDead(player)) then
		  loadAnimDict(ad)
		  if (IsEntityPlayingAnim(player, ad, anim, 8)) then
			  
			  TaskPlayAnim(player, ad, "exit", 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
			  ClearPedSecondaryTask(player)
		  else
			  TaskPlayAnim(player, ad, anim, 8.0, 3.0, 2000, 26, 1, 0, 0, 0)
		  end
	  end
  end
  
  function Streaming(animDict, cb)
	  if not HasAnimDictLoaded(animDict) then
		  RequestAnimDict(animDict)
  
		  while not HasAnimDictLoaded(animDict) do
			  Citizen.Wait(1)
		  end
	  end
  
	  if cb ~= nil then
		  cb()
	  end
  end	
  
  function VehicleInFront()
	  local pos = GetEntityCoords(player)
	  local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 12.0, 0.0)
	  local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, player, 0)
	  local _, _, _, _, result = GetRaycastResult(rayHandle)
	  return result
  end
  
  Citizen.CreateThread(function()
	  while true do
	  Citizen.Wait(5)
		  if IsControlJustReleased(1, 83) then
			  OpenBagaznikMenu()
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(1)
		  local playerPed = PlayerPedId()
		  if inside then
			  cameraTrunk()
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
			  DisableControlAction(2, 59, true) -- Disable steering in vehicle
			  DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
			  DisableControlAction(0, 47, true)  -- Disable weapon
			  DisableControlAction(2, Keys['Z'], true) -- Disable going stealth
			  DisableControlAction(1, Keys['Z'], true) -- Disable going stealth
			  DisableControlAction(1, Keys['X'], true) -- Disable going stealth
			  DisableControlAction(0, Keys['X'], true) -- Disable going stealth
			  DisableControlAction(0, 264, true) -- Disable melee
			  DisableControlAction(0, 257, true) -- Disable melee
			  DisableControlAction(0, 140, true) -- Disable melee
			  DisableControlAction(0, 141, true) -- Disable melee
			  DisableControlAction(0, 142, true) -- Disable melee
			  DisableControlAction(0, 143, true) -- Disable melee
			  DisableControlAction(0, 75, true)  -- Disable exit vehicle
			  DisableControlAction(27, 75, true) -- Disable exit vehicle
			  DisableControlAction(1, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(0, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(2, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(3, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(1, Keys['T'], true) -- Disable going stealth
			  DisableControlAction(0, Keys['T'], true) -- Disable going stealth
			  DisableControlAction(2, Keys['T'], true) -- Disable going stealth
			  DisableControlAction(3, Keys['T'], true) -- Disable going stealth
			  DisableControlAction(0, 21, true)  -- Bieganie
			  DisableControlAction(0, Keys[','], true)  -- Bieganie
			  DisableControlAction(1, Keys[','], true)  -- Bieganie
			  DisableControlAction(2, Keys[','], true)  -- Bieganie
			  DisableControlAction(3, Keys[','], true)  -- Bieganie
			  DisableControlAction(0, Keys[','], true)  -- Bieganie
			  DisableControlAction(1, Keys['-'], true)  -- Bieganie
			  DisableControlAction(2, Keys['-'], true)  -- Bieganie
			  DisableControlAction(3, Keys['-'], true)  -- Bieganie
			  DisableControlAction(0, Keys['='], true)  -- Bieganie
			  DisableControlAction(1, Keys['='], true)  -- Bieganie
			  DisableControlAction(2, Keys['='], true)  -- Bieganie
			  DisableControlAction(3, Keys['='], true)  -- Bieganie
			  DisablePlayerFiring(playerPed, false)
			  --	if not (IsEntityPlayingAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 3) == 1) then
			  --      	Streaming('timetable@floyd@cryingonbed@base', function()
			  --		TaskPlayAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 49, 0, 0, 0, 0)
			  --		TriggerEvent('esx_mafiajob:wkladaniebagaznik')
			  --   end)
			  --end
		  end
	  end
  end)
  
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(1)
		  local playerPed = PlayerPedId()
		  if wsrodku then
			  cameraTrunk()
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
			  DisableControlAction(2, 59, true) -- Disable steering in vehicle
			  DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
			  DisableControlAction(0, 47, true)  -- Disable weapon
			  DisableControlAction(2, Keys['Z'], true) -- Disable going stealth
			  DisableControlAction(1, Keys['Z'], true) -- Disable going stealth
			  DisableControlAction(3, Keys['X'], true) -- Disable going stealth
			  DisableControlAction(0, Keys['X'], true) -- Disable going stealth
			  DisableControlAction(0, 264, true) -- Disable melee
			  DisableControlAction(0, 257, true) -- Disable melee
			  DisableControlAction(0, 140, true) -- Disable melee
			  DisableControlAction(0, 141, true) -- Disable melee
			  DisableControlAction(0, 142, true) -- Disable melee
			  DisableControlAction(0, 143, true) -- Disable melee
			  DisableControlAction(0, 75, true)  -- Disable exit vehicle
			  DisableControlAction(27, 75, true) -- Disable exit vehicle
			  DisableControlAction(1, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(0, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(2, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(3, Keys['B'], true) -- Disable going stealth
			  DisableControlAction(0, 21, true)  -- Bieganie
			  DisableControlAction(0, Keys[','], true)  -- Bieganie
			  DisableControlAction(1, Keys[','], true)  -- Bieganie
			  DisableControlAction(2, Keys[','], true)  -- Bieganie
			  DisableControlAction(3, Keys[','], true)  -- Bieganie
			  DisableControlAction(0, Keys[','], true)  -- Bieganie
			  DisablePlayerFiring(playerPed, false)
	  --			if not (IsEntityPlayingAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 3) == 1) then
	  --	          	Streaming('timetable@floyd@cryingonbed@base', function()
		  --			TaskPlayAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 49, 0, 0, 0, 0)
			--      end)
			--  end
		  end
	  end
  end)
  
  function cameraTrunk()
	  local ped = PlayerPedId()
	  if not DoesCamExist(cam) then
		  cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
		  SetCamActive(cam, true)
		  RenderScriptCams(true, false, 0, true, true)
		  SetCamCoord(cam, GetEntityCoords(ped))
	  end
  
	  AttachCamToEntity(cam, ped, 0.0, -2.0, 1.0, true)
	  SetCamRot(cam, -30.0, 0.0, GetEntityHeading(ped))
  end
  
  function cameraTrunkDisable()
	  RenderScriptCams(false, false, 0, 1, 0)
	  DestroyCam(cam, false)
  end