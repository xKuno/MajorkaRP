--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------ poprawiany NAPEWNO NIE PRZEZ KOZE BO TO GBUR I NIE CHEC MU SIE ZROBIC NAWET MENU
----------------- ©  2019 ------------------ Wiec ukochany kamilek skryuptert zrobil bo koza chuj
-------------------------------------------- :) dobra koza tez cos zrobil ale to malo wazne

local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  }
  
  ESX                      	= nil
  
  local Akt         			= nil
  local CurrentActionMsg  	= ''
  local CurrentActionData  	= {}
  local LastStation             = nil
  local LastPart                = nil
  local LastPartNum             = nil
  local LastEntity              = nil
  local JestWMarkerze 		= false
  local OstStrefa          	= nil
  local Czaspozostaly			= 0
  local PlayerData         	= {}
  local onDuty 				= false
  local cd 					= false
  local majuznoty				= false
  local as1					= false
  local as2					= false
  local sprzataj				= false
  local usluzb				= false 
  local hardblock				= false
  local Blips                   = {}
  local destination = {}
  local MissionRegion = 1
  local an 					= 'anim@amb@business@coc@coc_unpack_cut_left@'
  local animacja 				= "coke_cut_v4_coccutter"
  local nozhash				= GetHashKey('prop_knife')
  local wietara = nil
  local gruchapelna = false
  local moznamlot = false
  local etap = 0
  local dostawa = false
  local MissionRegion = 1
  local ropa = 0
  local wyciagnal = false
  local pizze = 0
  local cooldown = false
  
  
  function hasPizza (cb)
	  cb(true)
	end
  
  Citizen.CreateThread(function ()
	while ESX == nil do
	  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	  Citizen.Wait(0)
	   PlayerData = ESX.GetPlayerData()
	end
	  if PlayerData.job ~= nil then
		odswiezblipy()
	  end
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	if PlayerData.job ~= nil then
		odswiezblipy()
	  end
  end)
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	if PlayerData.job ~= nil then
		odswiezblipy()
	  end
  end)
  
  
  function odswiezblipy() 
  
  
   blipypracy = AddBlipForCoord(-628.05932617188, 227.8263549804, 13)
	  SetBlipSprite (blipypracy, 267)
	  SetBlipDisplay(blipypracy, 4)
	  SetBlipScale  (blipypracy, 1.0)
	  SetBlipColour (blipypracy, 47)
	  SetBlipAsShortRange(blipypracy, true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString('Pizzeria')
	  EndTextCommandSetBlipName(blipypracy)
  
  end
  
  
  
  AddEventHandler('esx_pizza:wmarkerze', function (zone)
  if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
  
	if zone == 'Lodowka' and onDuty == true and sprzataj == false then
	  Akt     = 'lod'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby otworzyć ~g~lodówkę')
	  CurrentActionData = {}
	elseif zone == 'Smaz' and onDuty == true and sprzataj == false then
	  Akt	  = 'smazenie'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~smażyć~w~ rybke')
	  CurrentActionData = {}
	elseif zone == 'Przebieralnia' and PlayerData.job.name == 'pizza'  then
	  Akt	  = 'przeb'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby się ~b~przebrać~w~')
	  CurrentActionData = {}
	elseif zone == 'Kroj' and onDuty == true and sprzataj == false then
	  Akt	  = 'krojenie'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~pokroić ~w~ser')
	  CurrentActionData = {}
	elseif zone == 'Myj' and onDuty == true and sprzataj == false then
	  Akt	  = 'myju'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~wyrobić~w~ ciasto')
	  CurrentActionData = {}
	elseif zone == 'Przyg' and onDuty == true and sprzataj == false then
	  Akt	  = 'przygotuj'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~przygotować~w~ pizzaa')
	  CurrentActionData = {}
	elseif zone == 'Sprzedaz' and onDuty == true and sprzataj == false then
	  Akt	  = 'sell'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~sprzedać~w~ zamowienie')
	  CurrentActionData = {}
	elseif zone == 'Szef' and PlayerData.job.grade_name == 'boss' then
	  Akt	  = 'MenuSzefa'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~g~odpalic~w~ ~b~Menu Best Szefa')
	  CurrentActionData = {}
	elseif zone == 'Szafka' then 
	  Akt	  = 'szafka'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby otworzyc szafe')
	  CurrentActionData = {}
	elseif zone == 'Samochody'  and onDuty == true then 
	  Akt   = 'WezSamochod'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~g~Wyciagnac samochod')
	  CurrentActionData = {}
	elseif zone == 'Samochodyschowaj' and onDuty == true then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	  Akt   = 'SamochodUsun'
	  CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~g~Schowac samochod')
	  CurrentActionData = {vehicle = vehicle}
	elseif zone == namezone then
		  --if MissionLivraison and MissionNum == namezonenum then
		  --	if Blips['delivery'] ~= nil and IsControlPressed(0,  Keys['E']) then
		  --		RemoveBlip(Blips['delivery'])
		  --		Blips['delivery'] = nil
		  --	end
  
			  Akt     = 'delivery'
			  CurrentActionMsg  = 'Kliknij ~INPUT_CONTEXT~ aby dostarczyć pizze!'
			  CurrentActionData = {}
  
		  --end
  
	elseif zone == 'AnnulerMission' then
		  if isInService and MissionLivraison and IsJobTrucker() then
			  if IsPedSittingInAnyVehicle(playerPed) and IsATruck() then
				  VerifPlaqueVehiculeActuel()
  
				  ----TriggerServerEvent('esx:clientLog', "3'" .. json.encode(plaquevehicule) .. "' '" .. json.encode(plaquevehiculeactuel) .. "'")
				  
				  if plaquevehicule == plaquevehiculeactuel then
					  Akt     = 'retourcamionannulermission'
					  CurrentActionMsg  = _U('cancel_mission')
				  else
					  Akt = 'hint'
					  CurrentActionMsg  = _U('not_your_truck')
				  end
			  else
				  Akt     = 'retourcamionperduannulermission'
			  end
		  end
	elseif zone == 'RetourCamion' then
		  if isInService and MissionRetourCamion and IsJobTrucker() then
			  if IsPedSittingInAnyVehicle(playerPed) and IsATruck() then
				  VerifPlaqueVehiculeActuel()
  
				  if plaquevehicule == plaquevehiculeactuel then
					  Akt     = 'retourcamion'
				  else
					  Akt     = 'retourcamionannulermission'
					  CurrentActionMsg  = _U('not_your_truck')
				  end
			  else
				  Akt     = 'retourcamionperdu'
			  end
		  end
	  end
  end
  end)
  
  function carcheck()
	  local currentcar = GetVehiclePedIsIn(PlayerPedId(), false)
	  local currentcarmodel = GetEntityModel(currentcar)
	  if currentcarmodel == GetHashKey('skuterp') or currentcarmodel == GetHashKey('foodcar4') or currentcarmodel == GetHashKey('foodcar2') or currentcarmodel == GetHashKey('bmx') then 
		  return true
	  else 
		  return false
	  end
  end
  
  function hasPizza (cb)
	  if (ESX == nil) then return cb(0) end
	  ESX.TriggerServerCallback('esx_pizzeria:getItemAmount', function(qtty)
		cb(qtty > 0)
	  end, 'pizza')
	end
  
	function ShowNoPizzaWarning () 
	  if (ESX == nil) then return end
	  ESX.ShowNotification("Nie posiadasz ~r~pizzy~s~")
	end
  
	
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
		  if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
			if IsControlJustReleased(0, Keys['BACKSPACE']) and onDuty == true and dostawa == false then   
					if carcheck() then
						hasPizza(function (hasPizza)
							if hasPizza == true then
								MissionLivraisonSelect()
								dostawa = true
							else
								ShowNoPizzaWarning()
							end
						end)	
					else
						ESX.ShowNotification("~r~Nie ten wóz, musisz byc w firmowym.")	
					end
			end
		else
			Citizen.Wait(2000)
		end
	  end
  end)
  
  AddEventHandler('esx_pizza:pozamarkerem', function (zone)
		ESX.UI.Menu.CloseAll()
	  Akt = nil
  end)
  
  
  
  Citizen.CreateThread(function()
  
	while true do
  
	  Citizen.Wait(1)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
			if Akt ~= nil then
			
				SetTextComponentFormat('STRING')
				AddTextComponentString(CurrentActionMsg)
				DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			
					if IsControlPressed(0,  Keys['E']) then
					
						if Akt == 'przeb' then
							MenuPrzebieralnia()
						end
				
						if Akt == 'MenuSzefa' then
							OpenBurgerActions()	
						end
				
						if Akt == 'WezSamochod' then
							OpenVehicleSpawnerMenu()
						end
						if Akt == 'SamochodUsun' then
							local playerPed = PlayerPedId()
				
							if IsPedInAnyVehicle(playerPed,  false) then
				
								local vehicle = GetVehiclePedIsIn(playerPed, false)
				
								if DoesEntityExist(vehicle) then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
									wyciagnal = false
								end
				
							end
						end
						
						if Akt == 'szafka' then
							Menuszafka()
						end
						
						if Akt == 'smazenie' and as1 == false then
								TriggerServerEvent('esx_pizza:czymozesmazyc')
								if as1 == false then
									as1 = true
								end
						end
				
						if Akt == 'krojenie' and as1 == false then
							TriggerServerEvent('esx_pizza:czymozekroic')
							if as1 == false then
								as1 = true
							end
						end
						
						if Akt == 'myju' and as1 == false then
							TriggerServerEvent('esx_pizza:czymozemyc')
							if as1 == false then
								as1 = true
							end
						end	
				
				
						if Akt == 'przygotuj'  then
							MenuPrzygotuj()
							
						
						end	
				
				
						if Akt == 'sell' and hardblock == false then
							MenuSprzedaj()
						
						end	
								
						if Akt == 'lod' then
							MenuLodowki()
						end
					end
						
					if Akt == 'delivery' then
						if IsControlPressed(0,  Keys['E']) then
							if carcheck() then
								if cooldown == false then
								--TriggerServerEvent('esx_truckerjob:dodajdobazy', 1)
								FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
								ESX.ShowNotification("Trwa wydawanie pizzy..")
								Wait(6000)
								FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
								TriggerServerEvent('pizzeria:job2')
								Wait(200)
								nouvelledestination() -- i chuj
								TriggerEvent('esx_pizza:pozamarkerem', OstStrefa)
								else
									ESX.ShowNotification("Klient nie jest jeszcze gotowy na odbiór!")
								end
							else
								ESX.ShowNotification("To nie jest skuter do pizzy")
							end
						end
					end
					
					if Akt == 'retourcamion' then
						retourcamion_oui()
					end
					
					if Akt == 'retourcamionperdu' then
						retourcamionperdu_oui()
					end
					
					if Akt == 'retourcamionannulermission' then
						retourcamionannulermission_oui()
					end
					
					if Akt == 'retourcamionperduannulermission' then
						retourcamionperduannulermission_oui()
					end
			end
		else
			Citizen.Wait(2000)
		end
	end 
  end)
  
  function MenuPrzygotuj()
  
	   local elements = {
				  {label = 'Przygotuj pizza', value = 'pizza'}
			  }
  
  
  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	  {
		  title    = ('Przygotowywanie Dan'),
		  align    = 'center',
		  elements = elements
	  }, function(data, menu)
			  if data.current.value == 'pizza' then
			  TriggerServerEvent('esx_pizza:czymozeprzygotowac')
			  menu.close()
		end
		  end,
		  function(data, menu)
		menu.close()
	  end
	)
  end
  
  function Menuszafka()
  
	  local elements = {
		  --{label = _U('acces_denied'), value = 'denied'}
	  }
  
	  if PlayerData.job.grade >= 2 then
		  table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
		  table.insert(elements,{label = _U('remove_object'), value = 'get_stock'})
	-- elseif PlayerData.job.grade_name == 'recrue'  then
	--	  table.insert(elements, {label = _U('deposit_object'), value = 'put_stock'})
	--	  table.insert(elements,{label = _U('remove_object'), value = 'get_stock'})
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

  function MenuSprzedaj()
  
	   local elements = {
				  {label = 'Sprzedaj pizza', value = 'pizza'}
			  }
  
  
  ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	  {
		  title    = ('Przygotowywanie Dan'),
		  align    = 'center',
		  elements = elements
	  }, function(data, menu)
		if data.current.value == 'pizza' then
			TriggerServerEvent('esx_pizza:hajs')
			menu.close()
		end
		  end,
		  function(data, menu)
		menu.close()
	  end
	)
  end
  
  function MenuPrzebieralnia()
	  local usluzb = false 
	ESX.UI.Menu.CloseAll()
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'cloakroom',
	  {
		title    = 'Szatnia',
		align    = 'center',
		elements = {
		  {label = 'Ubranie robocze', value = 'job_wear'},
		  {label = 'Ubranie cywilne', value = 'citizen_wear'}
		}
	  },
	  function(data, menu)
			  if data.current.value == 'citizen_wear' then 
				TriggerEvent("pNotify:SendNotification",{
			  text = ('Przebieranie'),
			  type = "info",
			  timeout = (Config.Czasprzebierania * 1000),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
			  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES", 0, true)
			  FreezeEntityPosition(GetPlayerPed(-1), true)
			  Wait(Config.Czasprzebierania * 1000 + 250)
			  FreezeEntityPosition(GetPlayerPed(-1), false)
			  ClearPedTasks(GetPlayerPed(-1))
		  onDuty = false
			  TriggerServerEvent("esx_pizza:dupa123", 2)
			  TriggerEvent("pNotify:SendNotification",{
			  text = ('Zakładasz ubranie cywilne'),
			  type = "error",
			  timeout = (3000),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
		  majuznoty = false
		   TriggerServerEvent('esx_pizza:pow2')
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
			  TriggerEvent('skinchanger:loadSkin', skin)
		  end)
		 -- elseif data.current.value == 'citizen_wear' and usluzb == true then
		  -- TriggerEvent("pNotify:SendNotification", {text ='Nie jestes przebrany w stroj roboczy!'})
		end
		if data.current.value == 'job_wear' then
				  TriggerEvent("pNotify:SendNotification",{
			  text = ('Przebieranie'),
			  type = "info",
			  timeout = (Config.Czasprzebierania * 1000),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
			  TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES", 0, true)
			  FreezeEntityPosition(GetPlayerPed(-1), true)
			  Wait(Config.Czasprzebierania * 1000 + 250)
			  FreezeEntityPosition(GetPlayerPed(-1), false)
			  ClearPedTasks(GetPlayerPed(-1))
		  usluzb = true
		  onDuty = true
		  TriggerServerEvent("esx_pizza:dupa123", 1)
			  TriggerEvent("pNotify:SendNotification",{
			  text = ('Zakładasz ubranie robocze'),
			  type = "success",
			  timeout = (3000),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
		  majuznoty = false
			TriggerServerEvent('esx_pizza:pow')
		  ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		   if PlayerData.job.grade <= 4 then	
			  if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_wear.male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_wear.female)
			end
		   elseif  PlayerData.job.grade == 5 then
			   if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_szefkuchni.male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_szefkuchni.female)
			 end
			elseif  PlayerData.job.grade == 6 then
			   if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_manager.male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_manager.female)
			end
			elseif  PlayerData.job.grade == 7 then
			   if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_zastepca.male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_zastepca.female)
			end	
			elseif  PlayerData.job.grade == 8 then
			   if skin.sex == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_szef.male)   
			else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.job_szef.female)
			end	  
		   end 
		  end)
		end
		menu.close()
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  end
  
  function MenuLodowki()
	
	local elements = {
				  {label = 'Weź sos', value = 'sos'},
				  {label = 'Weź ciasto', value = 'ciasto'},
				  {label = 'Weź ser', value = 'ser'},
	  }
  
   ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	  {
		  title    = ('Lodowka'),
		  align    = 'center',
		  elements = elements
	  }, function(data, menu)
			  if data.current.value == 'sos' then
			  TriggerServerEvent('esx_pizza:dajitemsos')
			  elseif data.current.value == 'ciasto' then
			  TriggerServerEvent('esx_pizza:dajitemciasto')
			  elseif data.current.value == 'ser' then
			  TriggerServerEvent('esx_pizza:dajitemser')
		end
		  end,
		  function(data, menu)
		menu.close()
	  end
	)
  end
  
  local sleepThread = 5
  Citizen.CreateThread(function ()
		while true do
	  Citizen.Wait(sleepThread)
		local ped = GetPlayerPed(-1)
		local coords = GetEntityCoords(ped)
		if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
			if MissionLivraison then
				DrawMarker(destination.Type, destination.Pos.x, destination.Pos.y, destination.Pos.z+0.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
			end
			for k,v in pairs(Config.StrefyJesliPrzebrany) do
				if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and onDuty == true and sprzataj == false then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
			for k,v in pairs(Config.StrefyJesliMaPrace) do
				if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
			for k,v in pairs(Config.Strefysprzatanko) do
				if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and sprzataj == true and onDuty == true then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
		
			for k,v in pairs(Config.Szefu) do
				if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and  PlayerData.job.grade_name == 'boss' then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
			
			for k,v in pairs(Config.Szafka) do
				if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
			for k,v in pairs(Config.Dostawy) do
				if #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
				end
			end
			for k,v in pairs(Config.Samochod) do
				if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and onDuty == true then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end
			for k,v in pairs(Config.SamochodUsun) do
				if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 25.0) and PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and onDuty == true then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
				else
					sleepThread = 500
				end
			end	
		else
			sleepThread = 2000
		end
	end 
  end)
  
  
  
  Citizen.CreateThread(function ()
  
	while true do
	  Citizen.Wait(5)
  
	  local ped = GetPlayerPed(-1)
	  local coords      = GetEntityCoords(ped)
	  local isInMarker  = false
	  local currentZone = nil
  		if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' then
	 		  if MissionLivraison then
		 	 	 --DrawMarker(destination.Type, destination.Pos.x, destination.Pos.y, destination.Pos.z+0.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, destination.Size.x, destination.Size.y, destination.Size.z, destination.Color.r, destination.Color.g, destination.Color.b, 100, false, true, 2, false, false, false, false)
	  		  end
			  for k,v in pairs(Config.StrefyJesliPrzebrany) do
				  if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				  isInMarker  = true
				  currentZone = k
				  end
			  end
	  
			  for k,v in pairs(Config.StrefyJesliMaPrace) do
				  if  (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				  isInMarker  = true
				  currentZone = k
				  end
			  end
  
			  for k,v in pairs(Config.Strefysprzatanko) do
				  if  (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				  isInMarker  = true
				  currentZone = k
				  end
			  end
  
			  for k,v in pairs(Config.Szefu) do
				  if  (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				  isInMarker  = true
				  currentZone = k
				  end
			  end
			  
			  for k,v in pairs(Config.Szafka) do
				  if  (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				  isInMarker  = true
				  currentZone = k
				  end
			  end
  
			  for k,v in pairs(Config.Dostawy) do
				  if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x)  then
					  isInMarker  = true
					  currentZone = k
				  end
			  end
  
			  for k,v in pairs(Config.Samochod) do
				  if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x)  then
					  isInMarker  = true
					  currentZone = k
				  end
			  end
  
			  for k,v in pairs(Config.SamochodUsun) do
				  if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x)  then
					  isInMarker  = true
					  currentZone = k
				  end
			  end
  
			
				if (isInMarker and not JestWMarkerze) or (isInMarker and OstStrefa ~= currentZone) then
					JestWMarkerze = true
					OstStrefa                = currentZone
					TriggerEvent('esx_pizza:wmarkerze', currentZone)
				end
			
				if not isInMarker and JestWMarkerze then
					TriggerEvent('esx_pizza:pozamarkerem', OstStrefa)
					JestWMarkerze = false
				end
		else
			Citizen.Wait(2000)
		end
	end 
  end)
  
  
  RegisterNetEvent('esx_pizza:animacjasmazenia')
  AddEventHandler('esx_pizza:animacjasmazenia', function()
	  if as2 == false then
	  as2 = true
	  local pP = GetPlayerPed(-1)  
	  SetEntityCoords(pP, -1842.92, -1186.21, 13.33)
	  SetEntityHeading(pP, 62.8)
	  TaskStartScenarioInPlace(pP, "PROP_HUMAN_BBQ", 0, true) 
	  smazeniepozostalo = Config.czassmazenia
	  FreezeEntityPosition(pP, true)
				TriggerEvent("pNotify:SendNotification",{
			  text = ('Smazysz rybe'),
			  type = "info",
			  timeout = (Config.czassmazenia * 999),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
	  repeat
	  smazeniepozostalo = smazeniepozostalo - 1
	  Citizen.Wait(1000)
	  until(smazeniepozostalo == 0) 
		  TriggerServerEvent('esx_pizza:dajitemgmieso')
		  FreezeEntityPosition(pP, false)
		  Wait(1000)
	  ClearPedTasksImmediately(pP)
	  if as1 == true then
		  as1 = false
	  end
  
	  if as2 == true then
		  as2 = false
	  end
  end
  
  end)
  
  
  RegisterNetEvent('esx_pizza:animacjaprzygotowania')
  AddEventHandler('esx_pizza:animacjaprzygotowania', function()
	  if as2 == false then
		  as2 = true
	  if PlayerData.job.grade > 4 then
		  local pP = GetPlayerPed(-1)  
		  SetEntityCoords(pP, -631.57, 224.85, 80.88)
		  SetEntityHeading(pP, 87.5)
		  TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
		  przygotowanieczas = Config.czasprzygotowanianajmniejszy
		  FreezeEntityPosition(pP, true)
		  --DisableAllControlActions(pP,true)
					TriggerEvent("pNotify:SendNotification",{
				  text = ('Przygotowujesz pizzaa'),
				  type = "info",
				  timeout = (Config.czasprzygotowanianajmniejszy * 999),
				  layout = "bottomCenter",
				  queue = "burgerownia",
				  animation = {
				  open = "gta_effects_fade_in",
				  close = "gta_effects_fade_out"
			  }})
		  repeat
		  przygotowanieczas = przygotowanieczas - 1
		  Citizen.Wait(1000)
		  until(przygotowanieczas == 0)
		   
			  TriggerServerEvent('esx_pizza:dajitemburger')
			  FreezeEntityPosition(pP, false)
			  Wait(1000)
		  ClearPedTasksImmediately(pP)
		  if as1 == true then
			  as1 = false
		  end
  
		  if as2 == true then
			  as2 = false
		  end
	  elseif PlayerData.job.grade > 1 and PlayerData.job.grade <= 4 then
		  local pP = GetPlayerPed(-1)  
		  SetEntityCoords(pP, -631.57, 224.85, 80.88)
		  SetEntityHeading(pP, 87.5)
		  TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
		  przygotowanieczas = Config.czasprzygotowaniasredni
		  FreezeEntityPosition(pP, true)
		  --DisableAllControlActions(pP,true)
					TriggerEvent("pNotify:SendNotification",{
				  text = ('Przygotowujesz pizzaa'),
				  type = "info",
				  timeout = (Config.czasprzygotowaniasredni * 999),
				  layout = "bottomCenter",
				  queue = "burgerownia",
				  animation = {
				  open = "gta_effects_fade_in",
				  close = "gta_effects_fade_out"
			  }})
		  repeat
		  przygotowanieczas = przygotowanieczas - 1
		  Citizen.Wait(1000)
		  until(przygotowanieczas == 0)
		   
			  TriggerServerEvent('esx_pizza:dajitemburger')
			  FreezeEntityPosition(pP, false)
			  Wait(1000)
		  ClearPedTasksImmediately(pP)
		  if as1 == true then
			  as1 = false
		  end
  
		  if as2 == true then
			  as2 = false
		  end
	  elseif  PlayerData.job.grade <= 1 then
		  local pP = GetPlayerPed(-1)  
		  SetEntityCoords(pP, -631.57, 224.85, 80.88)
		  SetEntityHeading(pP, 87.5)
		  TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
		  przygotowanieczas = Config.czasprzygotowania
		  FreezeEntityPosition(pP, true)
		  --DisableAllControlActions(pP,true)
					TriggerEvent("pNotify:SendNotification",{
				  text = ('Przygotowujesz pizzaa'),
				  type = "info",
				  timeout = (Config.czasprzygotowania * 999),
				  layout = "bottomCenter",
				  queue = "burgerownia",
				  animation = {
				  open = "gta_effects_fade_in",
				  close = "gta_effects_fade_out"
			  }})
		  repeat
		  przygotowanieczas = przygotowanieczas - 1
		  Citizen.Wait(1000)
		  until(przygotowanieczas == 0)
		   
			  TriggerServerEvent('esx_pizza:dajitemburger')
			  FreezeEntityPosition(pP, false)
			  Wait(1000)
		  ClearPedTasksImmediately(pP)
		  if as1 == true then
			  as1 = false
		  end
  
		  if as2 == true then
			  as2 = false
		  end
	  end	
  end 
  end)
  
  RegisterNetEvent('esx_pizza:falarm')
  AddEventHandler('esx_pizza:falarm', function()
	  if as1 == true then
		  as1 = false
	  end
  
  end)
  
  RegisterNetEvent('esx_pizza:animacjakrojenia')
  AddEventHandler('esx_pizza:animacjakrojenia', function()
	  if as2 == false then
		  as2 = true
  
	  local pP = GetPlayerPed(-1)
	  local cgracza = GetEntityCoords(pP)
  
	  SetEntityCoords(pP, -627.97, 223.51, 80.88)
	  SetEntityHeading(pP, 148.62)
	  FreezeEntityPosition(pP, true)
  
	  LoadDict(an)
	  TaskPlayAnim(pP, an, animacja, 3.5, -6, -1, 63, 0, 0, 0, 0 )
  
	  nozkuchenny = CreateObject(nozhash,cgracza.x, cgracza.y, cgracza.z, true, true, true)
	  AttachEntityToEntity(nozkuchenny, pP, GetPedBoneIndex(pP, 0xDEAD), 0.11, 0.16, 0.10, 39.7, 0.0, 0.0, false, false, false, false, 2, true)
  
  
	  krojenie = Config.czaskrojenia
				TriggerEvent("pNotify:SendNotification",{
			  text = ('Kroisz ser na pizze'),
			  type = "info",
			  timeout = (Config.czaskrojenia * 999),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
  
	  repeat
	  krojenie = krojenie - 1
	  Citizen.Wait(1000)
	  until(krojenie == 0) 
  
	  DeleteEntity(nozkuchenny)
  
	  TriggerServerEvent('esx_pizza:dajitemgpomidor')
  
	  FreezeEntityPosition(pP, false)
	  Wait(1000)
	  ClearPedTasksImmediately(pP)
	  if as1 == true then
		  as1 = false
	  end
  
	  if as2 == true then
		  as2 = false
	  end
  end
  
  end)
  
  function LoadDict(an)
	  RequestAnimDict(an)
	  while not HasAnimDictLoaded(an) do
			Citizen.Wait(10)
	  end
  end
  
  RegisterNetEvent('esx_pizza:animacjamycia')
  AddEventHandler('esx_pizza:animacjamycia', function()
	  if as2 == false then
		  as2 = true
	  local pP = GetPlayerPed(-1)  
	  SetEntityCoords(pP, -631.31, 223.52, 80.88) 
	  SetEntityHeading(pP, 145.23)
	  TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	  myciejeszcze = Config.czasmycia
	  FreezeEntityPosition(pP, true)
	  DisableAllControlActions(pP,true)
				TriggerEvent("pNotify:SendNotification",{
			  text = ('Wyrabiasz ciasto..'),
			  type = "info",
			  timeout = (Config.czasmycia * 999),
			  layout = "bottomCenter",
			  queue = "burgerownia",
			  animation = {
			  open = "gta_effects_fade_in",
			  close = "gta_effects_fade_out"
		  }})
	  repeat
	  myciejeszcze = myciejeszcze - 1
	  Citizen.Wait(1000)
	  until(myciejeszcze == 0) 
		  TriggerServerEvent('esx_pizza:dajitemgsalata')
		  FreezeEntityPosition(pP, false)
		  DisableAllControlActions(pP,false)
		  Wait(1000)
	  ClearPedTasksImmediately(pP)
	  if as1 == true then
		  as1 = false
	  end
  
	  if as2 == true then
		  as2 = false
	  end
  end
  
  end)
  ---- MMMM----

  function OpenKutasMenu()

	ESX.TriggerServerCallback('esx_pizza:getEmployees', function(gracze)
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
			title    = 'Pizza',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
		end)
	end)
end
  
  function OpenKursMenu()

	ESX.TriggerServerCallback('esx_pizza:getEmployeer', function(liczba)
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
			title    = 'Pizza',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
			end)
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
			TriggerServerEvent('esx_pizza:tak')
		end

	end, function(data, menu)
		menu.close()
	end)
end
  
  function OpenBurgerActions()
	local elements = {
		{ label = ('Liczba Kursów'), value = 'liczba' }
	}
  
	  if PlayerData.job ~= nil and PlayerData.job.name == 'pizza' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
		  table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'koza'})
		  table.insert(elements, {label = '<b style = color:lime>SZEFU WIE CO ROBI</b>', value = 'boss_actions'})
		  table.insert(elements, {label = ('Godziny ludzi'), value = 'pizda'})
		  table.insert(elements, {label = ('Wyczysc Godziny ludzi'), value = 'wyczysc'})
		  table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'chuj'})
	  end
  
	   ESX.UI.Menu.CloseAll()
  
	  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	  {
		  title    = ('<b style = color:gold>Pizzeria Pod Złotym Gnatem</b>'),
		  align    = 'center',
		  elements = elements
	  }, function(data, menu)
			  if data.current.value == 'boss_actions' then
			  if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
			TriggerEvent('esx_society:openBossMenu', 'pizza', function(data, menu)
				menu.close()
			end, { limit = true })
			  elseif PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
			  TriggerEvent('esx_society:openBossMenu', 'pizza', function(data, menu)
				  menu.close()
			  end, { withdraw = false }) -- wylacza wyplacanie monet
		  end
		elseif data.current.value == 'pizda' then
			OpenKutasMenu()
		elseif data.current.value == 'liczba' then
			OpenKursMenu()
		elseif data.current.value == 'wyczysc' then
			OpenWyczyscMenu()
		  end
  
		  end,
		  function(data, menu)
		menu.close()
	  end
	)
  end
  
  function OpenPutStocksMenu()
  
	  ESX.TriggerServerCallback('esx_pizza:getPlayerInventory', function(inventory)
  
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
					  TriggerServerEvent('esx_pizza:putStockItems', itemName, count)
  
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
  
	  ESX.TriggerServerCallback('esx_pizza:getStockItems', function(items)
  
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
					  TriggerServerEvent('esx_pizza:getStockItem', itemName, count)
  
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
  
  
  function MissionLivraisonSelect()
  
	  
	  if MissionRegion == 1 then -- Los santos
		  MissionNum = math.random(1, 10)
	  
		  if MissionNum == 1 then destination = Config.Dostawy.Delivery1LS namezone = "Delivery1LS" namezonenum = 1 namezoneregion = 1
		  elseif MissionNum == 2 then destination = Config.Dostawy.Delivery2LS namezone = "Delivery2LS" namezonenum = 2 namezoneregion = 1
		  elseif MissionNum == 3 then destination = Config.Dostawy.Delivery3LS namezone = "Delivery3LS" namezonenum = 3 namezoneregion = 1
		  elseif MissionNum == 4 then destination = Config.Dostawy.Delivery4LS namezone = "Delivery4LS" namezonenum = 4 namezoneregion = 1
		  elseif MissionNum == 5 then destination = Config.Dostawy.Delivery5LS namezone = "Delivery5LS" namezonenum = 5 namezoneregion = 1
		  elseif MissionNum == 6 then destination = Config.Dostawy.Delivery6LS namezone = "Delivery6LS" namezonenum = 6 namezoneregion = 1
		  elseif MissionNum == 7 then destination = Config.Dostawy.Delivery7LS namezone = "Delivery7LS" namezonenum = 7 namezoneregion = 1
		  elseif MissionNum == 8 then destination = Config.Dostawy.Delivery8LS namezone = "Delivery8LS" namezonenum = 8 namezoneregion = 1
		  elseif MissionNum == 9 then destination = Config.Dostawy.Delivery9LS namezone = "Delivery9LS" namezonenum = 9 namezoneregion = 1
		  elseif MissionNum == 10 then destination = Config.Dostawy.Delivery10LS namezone = "Delivery10LS" namezonenum = 10 namezoneregion = 1
		  end
	  end
	  print(MissionNum)
	  MissionLivraisonLetsGo()
  end
  
  function MissionLivraisonLetsGo()
	  if Blips['delivery'] ~= nil then
		  RemoveBlip(Blips['delivery'])
		  Blips['delivery'] = nil
	  end
	  
	  
	  Blips['delivery'] = AddBlipForCoord(destination.Pos.x,  destination.Pos.y,  destination.Pos.z)
	  SetBlipRoute(Blips['delivery'], true)
	  BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString(_U('blip_delivery'))
	  EndTextCommandSetBlipName(Blips['delivery'])
	  
  
	  if MissionRegion == 1 then -- Los santos
		  ESX.ShowNotification("Miejsce dostawy, Stacja LS")
	  end
  
	  MissionLivraison = true
  end
  
  function nouvelledestination()
	  hasPizza(function (hasPizza)
		  if hasPizza == true then
			  ESX.ShowNotification("Klient będzie mógł odebrać pizze za 25 sekund!")
			  MissionLivraisonSelect()
			  dostawa = true
			  cooldown = true
			  Wait(25000)
			  cooldown = false
		  else
			  ESX.ShowNotification("Nie masz już więcej placków, wracaj do pizzerii. ~n~Lokalizacja zaznaczona na ~G~GPS!")
				  SetNewWaypoint(Config.Szefu.Szef.Pos.x, Config.Szefu.Szef.Pos.y)
				  RemoveBlip(Blips['delivery'])
				  dostawa = false
		  end
	  end)	
  end
  
  RegisterNetEvent('mapizze')
  AddEventHandler('mapizze', function(count)
  pizze = count
  end)
  
  -----
  
  
  function OpenVehicleSpawnerMenu()
  
	  ESX.UI.Menu.CloseAll()
  
  
		  local elements = {}
  
		  local sharedVehicles = Config.AuthorizedVehicles.Shared
		  for i=1, #sharedVehicles, 1 do
			  table.insert(elements, { label = sharedVehicles[i].label, model = sharedVehicles[i].model})
		  end
  
		  local authorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]
		  for i=1, #authorizedVehicles, 1 do
			  table.insert(elements, { label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
		  end
		  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		  {
			  title    = _U('vehicle_menu'),
			  align    = 'center',
			  elements = elements
		  }, function(data, menu)
			  menu.close()
  
			  local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint()
  
			  if foundSpawnPoint then
				  if wyciagnal == false then
					  ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						  TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						  wyciagnal = true
					  end)
				  else
					  TriggerEvent("pNotify:SendNotification", {text = "Nie odstawiłeś poprzedniego auta, co ty odwalasz."})
				  end
			  end
  
		  end, function(data, menu)
			  menu.close()
  
			  Akt     = 'wezsamochod'
			  CurrentActionMsg  = _U('vehicle_spawner')
			  CurrentActionData = {}
		  end)
  end
  
  function GetAvailableVehicleSpawnPoint()
	  local spawnPoints = Config.Samochod.Samochody.SpawnPoints
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