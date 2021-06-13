-- ALE ZEM ODJEBAL OUHUHUHUH--

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
local JobBlips 					= {}
local JestWMarkerze 		= false
local OstStrefa          	= nil
local Czaspozostaly			= 0
local PlayerData         	= {}
local cd 					= false
local majuznoty				= false
local as1					= false
local as2					= false
local isPickingUp 			= false
local wyszedlzmarkera 		= false
local usluzb				= true
local onDuty 				= true
local wyciagnal 			= false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
		PlayerData = ESX.GetPlayerData()
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	odswiezblipypracownika()
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
   	deleteBlips()
   	odswiezblipypracownika()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
  	Citizen.Wait(200)
		odswiezblipypracownika()
	else
	Citizen.Wait(200)
  		deleteBlips()
  end
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

Citizen.CreateThread(function()


	blipypracy = AddBlipForCoord(736.74, -1298.16, 32.31)
    SetBlipSprite (blipypracy, 525)
    SetBlipDisplay(blipypracy, 4)
    SetBlipScale  (blipypracy, 0.6)
    SetBlipColour (blipypracy, 13)
    SetBlipAsShortRange(blipypracy, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Gruppe 6')
    EndTextCommandSetBlipName(blipypracy)

end)

function odswiezblipypracownika() 
 
if PlayerData.job ~= nil then

	if 'ochrona' == PlayerData.job.name and onDuty then

		for i=1, #Config.miejsca, 1 do
			jobLocations = Config.miejsca[i]
			local blip = AddBlipForCoord(jobLocations)

			SetBlipSprite (blip, 525)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 15)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(('#'..i..' Zbieranie Raportu'))
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
		end
	end
end
end


AddEventHandler('wojtek_ochrona:wmarkerze', function (zone)
if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then


  if zone == 'raport1' and onDuty == true  then
    Akt	  = 'raport1'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby napisać ~o~raport~w~')
	CurrentActionData = {}
  elseif zone == 'raport2' and onDuty == true  then
    Akt	  = 'raport2'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby napisać ~o~raport~w~')
	CurrentActionData = {}
  elseif zone == 'raport3' and onDuty == true then
    Akt	  = 'raport3'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby napisać ~o~raport~w~')
	CurrentActionData = {}
  elseif zone == 'raport4' and onDuty == true then
	Akt	  = 'raport4'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby napisać ~o~raport~w~')
	CurrentActionData = {}
elseif zone == 'raport5' and onDuty == true then
	Akt	  = 'raport5'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby napisać ~o~raport~w~')
	CurrentActionData = {}
  elseif zone == 'Sprzedaz' and onDuty == true then
	Akt	  = 'sell'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby oddać ~o~raporty~w~')
	CurrentActionData = {}
  elseif zone == 'Szef' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
	Akt	  = 'MenuSzefa'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~g~odpalic~w~ ~b~Menu~o~Szefa')
	CurrentActionData = {}
  elseif zone == 'Przebieralnia' then
    Akt	  = 'przeb'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby się ~b~przebrać~w~')
	CurrentActionData = {}
	elseif zone == 'Szafka' then 
	Akt	  = 'szafka'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby otworzyc magazyn')
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
  end
  end 
end)



AddEventHandler('wojtek_ochrona:pozamarkerem', function (zone)
  Akt = nil
end)



Citizen.CreateThread(function()

  while true do

    Citizen.Wait(1)
if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
  if Akt ~= nil then

    SetTextComponentFormat('STRING')
    AddTextComponentString(CurrentActionMsg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)

    if IsControlJustReleased(0,  Keys['E']) then
		
		if Akt == 'przeb' then
			MenuPrzebieralnia()
		end

		if Akt == 'MenuSzefa' then
            OpenBurgerActions()	
        end

		if Akt == 'szafka' then
			Menuszafka()
		end

		  if Akt == 'WezSamochod' then
			  OpenVehicleSpawnerMenu()
		  end

		  if Akt == 'SamochodUsun' then
			  local playerPed = PlayerPedId()
				if IsPedInAnyVehicle(playerPed,  false) then
			  		if IsInAuthorizedVehicle() then
			  			if IsVehicleDriveable(CurrentActionData.vehicle, true) then	
						ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
							if wyciagnal == true then
								TriggerServerEvent('wojtek_ochrona:kaucja', 2)
							else
								TriggerEvent('pNotify:SendNotification', {text= '<b style = color:red>Order Dobrego Majorkowicza za odstawienie samohodu!</b>'})
							end
						wyciagnal = false
						else
							TriggerEvent('pNotify:SendNotification', {text= '<b style = color:red>Nie możesz schować zepsutego samochodu!</b>'})
						end
					else
						TriggerEvent('pNotify:SendNotification', {text= '<b style = color:lime>Tu parkować mogą tylko samochody Gruppe-6-</b>'})
						--ESX.ShowNotification(_U('only_taxi'))
					end
  
			  end
		  end
		
		
		if Akt == 'raport1' and as1 == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				TriggerEvent('wojtek_ochrona:zbieranieraportu1')
				if as1 == false then
					as1 = true
				end
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie!'))	
			end
		end

		if Akt == 'raport2' and as1 == false  then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				TriggerEvent('wojtek_ochrona:zbieranieraportu2')
				if as1 == false then
					as1 = true
				end
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie!'))	
			end
		end
		
		if Akt == 'raport3' and as1 == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				TriggerEvent('wojtek_ochrona:zbieranieraportu3')
				if as1 == false then
					as1 = true
				end
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie!'))	
			end
		end

		if Akt == 'raport4' and not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				TriggerEvent('wojtek_ochrona:zbieranieraportu4')
				if as1 == false then
					as1 = true
				end
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie!'))	
			end	
		end	

		if Akt == 'raport5' and not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				TriggerEvent('wojtek_ochrona:zbieranieraportu5')
				if as1 == false then
					as1 = true
				end
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie!'))	
			end	
		end	


		if Akt == 'sell'  then
			MenuSprzedaj()
			isPickingUp = true
		end	
				
 	 end
  end
else
	Citizen.Wait(2000) 
end
end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
		if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
			if isPickingUp then
				TaskPlayAnim(ped, "amb@world_human_clipboard@male@idle_a", "idle_c", 8.0, -8.0, -1, 1, 0.0, false, false, false)
				DisableControlAction(2, 24, true) -- Attack
				DisableControlAction(2, 257, true) -- Attack 2
				DisableControlAction(2, 25, true) -- Aim
				DisableControlAction(2, 263, true) -- Melee Attack 1
				DisableControlAction(2, Keys['R'], true) -- Reload
				DisableControlAction(2, Keys['SPACE'], true) -- Jump
				DisableControlAction(2, Keys['Q'], true) -- Cover
				DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
				DisableControlAction(2, Keys['F1'], true) -- Disable phone
				DisableControlAction(2, Keys['F2'], true) -- Inventory
				DisableControlAction(2, Keys['F3'], true) -- Animations
				DisableControlAction(2, Keys['F6'], true) -- Animations
				DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
				DisableControlAction(2, Keys['P'], true) -- Disable pause screen
				DisableControlAction(2, Keys['F9'], true) -- Disable pause screen
				DisableControlAction(2, Keys['E'], true)
				DisableControlAction(2, 59, true) -- Disable steering in vehicle
				DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
				DisableControlAction(0, 47, true)  -- Disable weapon
				DisableControlAction(0, 264, true) -- Disable melee
				DisableControlAction(0, 257, true) -- Disable melee
				DisableControlAction(0, 140, true) -- Disable melee
				DisableControlAction(0, 141, true) -- Disable melee
				DisableControlAction(0, 142, true) -- Disable melee
				DisableControlAction(0, 143, true) -- Disable melee
				---[DisableControlAction(0, 75, true)  -- Disable exit vehicle
				--DisableControlAction(27, 75, true) -- Disable exit vehicle
				DisableControlAction(0, 21, true)  -- Bieganie
				DisableControlAction(0, Keys[','], true)  -- Bieganie
				DisableControlAction(1, Keys[','], true)  -- Bieganie
				DisableControlAction(2, Keys[','], true)  -- Bieganie
				DisableControlAction(1, Keys['B'], true) -- Disable going stealth
				DisableControlAction(0, Keys['B'], true) -- Disable going stealth
				DisableControlAction(3, Keys['B'], true) -- Disable going stealth
				DisableControlAction(0, Keys['='], true)  -- Bieganie
				DisableControlAction(1, Keys['='], true)  -- Bieganie
				DisableControlAction(2, Keys['='], true)  -- Bieganie
				DisableControlAction(3, Keys['='], true)  -- Bieganie
			else
				Citizen.Wait(500)
			end
		else
			Citizen.Wait(2000)
		end
    end
end)

	

RegisterNetEvent('wojtek_ochrona:runTask')
AddEventHandler('wojtek_ochrona:runTask', function()
	local ped = PlayerPedId()
	local dict = 'amb@world_human_clipboard@male@idle_a'
	local prop = 'p_cs_clipboard'
	RequestAnimDict(dict)
	RequestModel(prop)
	for k,v in pairs(Config.ochronaStations) do
		for i = 1,#v.Sprzedaz do
			isPickingUp = true
			HidePedWeaponForScriptedCutscene(ped, true)
			local coords = GetEntityCoords(ped)
			--SetEntityCoords(ped, 739.64, -1297.87, 26.0 - 0.5, 0.0, 0.0, 0.0, true)
			SetEntityHeading(ped, 180.32)
			ESX.Game.SpawnObject('p_cs_clipboard', {
				x = coords.x,
				y = coords.y,
				z = coords.z + 2
			}, function(object)
				AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 36029), 0.1, 0.015, 0.12, 45.0, -130.0, 180.0, true, false, false, false, 0, true)
				Prop = object
			end)
			if isPickingUp then
				TaskPlayAnim(ped, dict, "idle_c", 8.0, -8.0, -1, 1, 0.0, false, false, false)
			end
			Citizen.Wait(12000)
			DeleteEntity(Prop)
			ClearPedTasks(ped)
			TriggerServerEvent('wojtek_ochrona:hajs')
			isPickingUp = false
		end
	end
end)

function MenuSprzedaj()

	 local elements = {
				{label = 'Zdaj raporty', value = 'raportsell'}

			}


ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	{
		title    = ('Komputer Pani Basii'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
			if data.current.value == 'raportsell' then
			    TriggerEvent('wojtek_ochrona:runTask')
   			end
   			menu.close()
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
			queue = "ochrona",
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
        deleteBlips()
        	TriggerServerEvent("wojtek_ochrona:dupa123", 2)
		    TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie cywilne'),
			type = "error",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		 TriggerServerEvent('wojtek_ochrona:pow2')
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
			queue = "ochrona",
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
        odswiezblipypracownika()
        TriggerServerEvent("wojtek_ochrona:dupa123", 1)
			TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie robocze'),
			type = "success",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		  TriggerServerEvent('wojtek_ochrona:pow')
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'recruit' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.female)
          end
          end
        end)

         ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'guard' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.guard_waer.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.guard_waer.female)
          end
          end
        end)

          ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'nightwatch' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nightwatch_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nightwatch_wear.female)
          end
          end
        end)

          ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'manager' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.manager_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.manager_wear.female)
          end
          end
        end)

          ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'zastepca' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zastepca_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zastepca_wear.female)
          end
          end
        end)

          ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'boss' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.boss_wear.female)
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


Citizen.CreateThread(function ()
  	while true do
    Citizen.Wait(5)

    local ped = GetPlayerPed(-1)
	local coords = GetEntityCoords(ped)
	if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
		for k,v in pairs(Config.StrefyJesliPrzebrany) do
		if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and onDuty == true then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end
		for k,v in pairs(Config.StrefyJesliMaPrace) do
		if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end

		for k,v in pairs(Config.Szafka) do
			if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end

		for k,v in pairs(Config.Szefu) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and  (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end

		for k,v in pairs(Config.Samochod)  do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and onDuty == true then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end
		for k,v in pairs(Config.SamochodUsun) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and onDuty == true then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end
	else
		Citizen.Wait(2000)
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
		if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' then	
    
			for k,v in pairs(Config.StrefyJesliPrzebrany) do
				if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
				isInMarker  = true
				currentZone = k
				end
			end
	
			for k,v in pairs(Config.StrefyJesliMaPrace) do
				if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
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


			for k,v in pairs(Config.Szefu) do
				if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
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
				TriggerEvent('wojtek_ochrona:wmarkerze', currentZone)
				end

				if not isInMarker and JestWMarkerze then
				TriggerEvent('wojtek_ochrona:pozamarkerem', OstStrefa)
				JestWMarkerze = false
				wyszedlzmarkera = true
				end
		else
			Citizen.Wait(2000)
  		end
  end 
end)


RegisterNetEvent('wojtek_ochrona:zbieranieraportu1')
AddEventHandler('wojtek_ochrona:zbieranieraportu1', function()
	if as2 == false then
	wyszedlzmarkera = false	
	as2 = true
    local pP = GetPlayerPed(-1)  
	raportpozostalo = Config.czas_raportu
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Zbierasz Raport'),
			type = "info",
			timeout = (Config.czas_raportu * 999),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	raportpozostalo = raportpozostalo - 1
	Citizen.Wait(1000)
	until(raportpozostalo == 0) 
		if raportpozostalo == 0 and JestWMarkerze == true and wyszedlzmarkera == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				if not IsPedDeadOrDying(GetPlayerPed(-1)) then
				TriggerServerEvent('wojtek_ochrona:dajitemraport1')
				else
				ESX.ShowNotification('~r~Ze względu na to, że straciłeś przytomnośc raport nie został napisany')
				end
			else
				ESX.ShowNotification('~r~Ze względu na to, że siedziałeś w samochodzie raport nie został napisany')
			end
		else
			ESX.ShowNotification('Raport się nie nadaje ponieważ ~r~opuściłeś~s~ miejsce swojej pracy')
		end
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end

end)


RegisterNetEvent('wojtek_ochrona:falarm')
AddEventHandler('wojtek_ochrona:falarm', function()
	if as1 == true then
		as1 = false
	end

end)

RegisterNetEvent('wojtek_ochrona:zbieranieraportu2')
AddEventHandler('wojtek_ochrona:zbieranieraportu2', function()
	if as2 == false then
	wyszedlzmarkera = false	
	as2 = true
    local pP = GetPlayerPed(-1)  
	raportpozostalo = Config.czas_raportu
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Zbierasz Raport'),
			type = "info",
			timeout = (Config.czas_raportu * 999),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	raportpozostalo = raportpozostalo - 1
	Citizen.Wait(1000)
	until(raportpozostalo == 0) 
		if raportpozostalo == 0 and JestWMarkerze == true and wyszedlzmarkera == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				if not IsPedDeadOrDying(GetPlayerPed(-1)) then
				TriggerServerEvent('wojtek_ochrona:dajitemraport2')
				else
				ESX.ShowNotification('~r~Ze względu na to, że straciłeś przytomnośc raport nie został napisany')
				end
			else
				ESX.ShowNotification('~r~Ze względu na to, że siedziałeś w samochodzie raport nie został napisany')
			end
		else
			ESX.ShowNotification('Raport się nie nadaje ponieważ ~r~opuściłeś~s~ miejsce swojej pracy')
		end
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

RegisterNetEvent('wojtek_ochrona:zbieranieraportu3')
AddEventHandler('wojtek_ochrona:zbieranieraportu3', function()
	if as2 == false then
	wyszedlzmarkera = false	
	as2 = true
    local pP = GetPlayerPed(-1)  
	raportpozostalo = Config.czas_raportu
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Zbierasz Raport'),
			type = "info",
			timeout = (Config.czas_raportu * 999),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	raportpozostalo = raportpozostalo - 1
	Citizen.Wait(1000)
	until(raportpozostalo == 0) 
		if raportpozostalo == 0 and JestWMarkerze == true and wyszedlzmarkera == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				if not IsPedDeadOrDying(GetPlayerPed(-1)) then
				TriggerServerEvent('wojtek_ochrona:dajitemraport3')
				else
				ESX.ShowNotification('~r~Ze względu na to, że straciłeś przytomnośc raport nie został napisany')
				end
			else
				ESX.ShowNotification('~r~Ze względu na to, że siedziałeś w samochodzie raport nie został napisany')
			end
		else
			ESX.ShowNotification('Raport się nie nadaje ponieważ ~r~opuściłeś~s~ miejsce swojej pracy')
		end
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end


end)

RegisterNetEvent('wojtek_ochrona:zbieranieraportu4')
AddEventHandler('wojtek_ochrona:zbieranieraportu4', function()
	if as2 == false then
	wyszedlzmarkera = false	
	as2 = true
    local pP = GetPlayerPed(-1)  
	raportpozostalo = Config.czas_raportu
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Zbierasz Raport'),
			type = "info",
			timeout = (Config.czas_raportu * 999),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	raportpozostalo = raportpozostalo - 1
	Citizen.Wait(1000)
	until(raportpozostalo == 0) 
		if raportpozostalo == 0 and JestWMarkerze == true and wyszedlzmarkera == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				if not IsPedDeadOrDying(GetPlayerPed(-1)) then
				TriggerServerEvent('wojtek_ochrona:dajitemraport4')
				else
				ESX.ShowNotification('~r~Ze względu na to, że straciłeś przytomnośc raport nie został napisany')
				end
			else
				ESX.ShowNotification('~r~Ze względu na to, że siedziałeś w samochodzie raport nie został napisany')
			end
		else
			ESX.ShowNotification('Raport się nie nadaje ponieważ ~r~opuściłeś~s~ miejsce swojej pracy')
		end
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end


end)

RegisterNetEvent('wojtek_ochrona:zbieranieraportu5')
AddEventHandler('wojtek_ochrona:zbieranieraportu5', function()
	if as2 == false then
	wyszedlzmarkera = false	
	as2 = true
    local pP = GetPlayerPed(-1)  
	raportpozostalo = Config.czas_raportu
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Zbierasz Raport'),
			type = "info",
			timeout = (Config.czas_raportu * 999),
			layout = "bottomCenter",
			queue = "ochrona",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	raportpozostalo = raportpozostalo - 1
	Citizen.Wait(1000)
	until(raportpozostalo == 0) 
		if raportpozostalo == 0 and JestWMarkerze == true and wyszedlzmarkera == false then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
				if not IsPedDeadOrDying(GetPlayerPed(-1)) then
				TriggerServerEvent('wojtek_ochrona:dajitemraport5')
				else
				ESX.ShowNotification('~r~Ze względu na to, że straciłeś przytomnośc raport nie został napisany')
				end
			else
				ESX.ShowNotification('~r~Ze względu na to, że siedziałeś w samochodzie raport nie został napisany')
			end
		else
			ESX.ShowNotification('Raport się nie nadaje ponieważ ~r~opuściłeś~s~ miejsce swojej pracy')
		end
	if as1 == true then
		as1 = false
	end

	if as2 == true then
		as2 = false
	end
end


end)
---- 
---- MMMM----


function OpenBurgerActions()
	local elements = {
		{ label = ('Liczba Kursów'), value = 'liczba' }
	}

	if PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'koza'})
		table.insert(elements, {label = '<b style = color:blue>BAZA DANYCH</b>', value = 'boss_actions'})
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'chuj'})
	end
	if Config.Kutas and PlayerData.job ~= nil and PlayerData.job.name == 'ochrona' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
		table.insert(elements, {label = ('Godziny ludzi'), value = 'pizda'})
		table.insert(elements, {label = ('Wyczysc Godziny ludzi'), value = 'wyczysc'})
	end

 	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = ('<b style = color:white>Securo</b>'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'boss_actions' then
			if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
				TriggerEvent('esx_society:openBossMenu', 'ochrona', function(data, menu)
					menu.close()
				end, { limit = true })
			elseif PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
				TriggerEvent('esx_society:openBossMenu', 'ochrona', function(data, menu)
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
			TriggerServerEvent('wojtek_ochrona:tak')
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenKutasMenu()

	ESX.TriggerServerCallback('wojtek_ochrona:getEmployees', function(gracze)
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
			title    = 'Ochrona',
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

	ESX.TriggerServerCallback('wojtek_ochrona:getEmployeer', function(liczba)
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
			title    = 'Ochrona',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
			end)
	end)
end

function Menuszafka()

	local elements = {
		{label = ('Schowaj Broń'),     value = 'put_weapon'},
		{label = ('Schowaj Przedmiot'), value = 'put_stock'},

	}

	if PlayerData.job.grade_name == 'boss' or  PlayerData.job.grade_name == 'zastepca' or  PlayerData.job.grade_name == 'manager' then
		table.insert(elements, {label = ('Wyciągnij Broń'), value = 'get_weapon'})
		table.insert(elements,	{label = ('Wyciągnij Przedmiot'), value = 'get_stock'})
	elseif PlayerData.job.grade_name == 'nightwatch'  then
		table.insert(elements,	{label = ('Wyciągnij Przedmiot'), value = 'get_stock'})
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
			elseif data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			elseif data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			menu.close()
      end
		end,
		function(data, menu)
      menu.close()
    end
  )
end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('wojtek_ochrona:getArmoryWeaponsupdated', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == 'pistol' or weapons[i].name == 'combatpistol' or weapons[i].name == 'vintagepistol' or weapons[i].name == 'pistol_mk2' or  weapons[i].name == 'snspistol_mk2' or weapons[i].name == 'revolver' or weapons[i].name == 'pistol50' or weapons[i].name == 'heavypistol'
	    or weapons[i].name == 'knife'  or weapons[i].name == 'knuckle'  or weapons[i].name == 'nightstick'  or weapons[i].name == 'hammer'  or weapons[i].name == 'bat'  or weapons[i].name == 'golfclub' or weapons[i].name == 'crowbar' or weapons[i].name == 'bottle' or weapons[i].name == 'dagger' or weapons[i].name == 'hatchet' or weapons[i].name == 'machete'
	    or weapons[i].name == 'flashlight' or weapons[i].name == 'switchblade' or weapons[i].name == 'poolcue' or weapons[i].name == 'pipewrench' or weapons[i].name == 'ball'or weapons[i].name == 'stungun' then	
	       table.insert(elements, {label = ' x'..weapons[i].count..' '..ESX.GetWeaponLabel('weapon_'..weapons[i].name), value = weapons[i]})
		end
	  end

	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
		  title    = 'Wyciąganie broni',
		  align    = 'center',
		  elements = elements
		},
		function(data, menu)
  
		  menu.close()
		  ESX.TriggerServerCallback('wojtek_ochrona:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
		  end, data.current.value.name, 1)
  
		end,
		function(data, menu)
		  menu.close()
		end
	  )
  
	end)
  
  end

function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()
  
	for i=1, #weaponList, 1 do
  
	  local weaponHash = GetHashKey(weaponList[i].name)
	  if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		table.insert(elements, {label = weaponList[i].label , value = weaponList[i].name})
	  end
  
	end
  
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'armory_put_weapon',
	  {
		title    = ('Chowanie broni'),
		align    = 'center',
		elements = elements
	  },
	  function(data, menu)
		menu.close()

		ESX.TriggerServerCallback('wojtek_ochrona:addArmoryWeapon', function()
			menu.close()
			Citizen.Wait(300)
		  OpenPutWeaponMenu()
		 end, data.current.value, true, 1)
	  end,
	  function(data, menu)
		menu.close()
	  end
	)
  end

function OpenGetStocksMenu()
	ESX.TriggerServerCallback('wojtek_ochrona:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
		if items[i].count > 0  and ( items[i].name ~= 'snspistol' and items[i].name ~= 'pistol' and items[i].name ~= 'combatpistol' and items[i].name ~= 'vintagepistol' and items[i].name ~= 'pistol_mk2' and  items[i].name ~= 'snspistol_mk2' and items[i].name ~= 'revolver' and items[i].name ~= 'pistol50' and items[i].name ~= 'heavypistol'
	    and items[i].name ~= 'knife'  and items[i].name ~= 'knuckle'  and items[i].name ~= 'nightstick'  and items[i].name ~= 'hammer'  and items[i].name ~= 'bat'  and items[i].name ~= 'golfclub' and items[i].name ~= 'crowbar' and items[i].name ~= 'bottle' and items[i].name ~= 'dagger' and items[i].name ~= 'hatchet' and items[i].name ~= 'machete'
	    and items[i].name ~= 'flashlight' and items[i].name ~= 'switchblade' and items[i].name ~= 'poolcue' and items[i].name ~= 'pipewrench' and items[i].name ~= 'ball'and items[i].name ~= 'stungun') then		
	    		table.insert(elements, {
					label = 'x' .. items[i].count .. ' ' .. items[i].label,
					value = items[i].name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = ('Wyciągnij przedmiot'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = ('Ilość')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Nieprawidłowa ilość')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('wojtek_ochrona:getStockItem',itemName, count)

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

function OpenPutStocksMenu()
	ESX.TriggerServerCallback('wojtek_ochrona:getPlayerInventory', function(inventory)
		local elements = {}

		for i=1, #inventory.items, 1 do
		local item = inventory.items[i]
		if item.count > 0  and  (item.name ~= 'snspistol' and item.name ~= 'pistol' and item.name ~= 'combatpistol' and item.name ~= 'vintagepistol' and item.name ~= 'pistol_mk2' and  item.name ~= 'snspistol_mk2' and item.name ~= 'revolver' and item.name ~= 'pistol50' and item.name ~= 'heavypistol'
	    and item.name ~= 'knife'  and item.name ~= 'knuckle'  and item.name ~= 'nightstick'  and item.name ~= 'hammer'  and item.name ~= 'bat'  and item.name ~= 'golfclub' and item.name ~= 'crowbar' and item.name ~= 'bottle' and item.name ~= 'dagger' and item.name ~= 'hatchet' and item.name ~= 'machete'
	    and item.name ~= 'flashlight' and item.name ~= 'switchblade' and item.name ~= 'poolcue' and item.name ~= 'pipewrench' and item.name ~= 'ball'and item.name ~= 'stungun') then			
	    	table.insert(elements, {
					label = item.label .. ' x' .. item.count,
					type = 'item_standard',
					value = item.name
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu', {
			title    = ('Twoje kieszenie'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = ('Ilość')
			}, function(data2, menu2)
				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification('Błędna ilość')
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('wojtek_ochrona:putStockItems', itemName, count)
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
			  title    = ('Garaż'),
			  align    = 'center',
			  elements = elements
		  }, function(data, menu)
			  menu.close()
  
			  local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint()
  
			  if foundSpawnPoint then
				  if wyciagnal == false then
					  ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						  TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						  TriggerServerEvent('wojtek_ochrona:kaucja', 1)
						  wyciagnal = true
					  end)
				  else
					  TriggerEvent("pNotify:SendNotification", {text = "Nie odstawiłeś poprzedniego auta, co ty odwalasz."})
				  end
			  end
  
		  end, function(data, menu)
			  menu.close()
  
			  Akt     = 'wezsamochod'
			  CurrentActionMsg  = ('Garaż')
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
		  ESX.ShowNotification(('Coś blokuje miejsce pojazdu'))
		  return false
	  end
  end

  function IsInAuthorizedVehicle()
	local playerPed = PlayerPedId()
	local vehModel  = GetEntityModel(GetVehiclePedIsIn(playerPed, false))

	for i=1, #Config.AuthorizedVehiclesSprawdzmy, 1 do
		if vehModel == GetHashKey(Config.AuthorizedVehiclesSprawdzmy[i].model) then
			return true
		end
	end
	
	return false
end

