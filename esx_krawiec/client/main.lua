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
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


ESX                      	= nil

local Akt         			= nil
local CurrentActionMsg  	= ''
local CurrentActionData  	= {}
local JobBlips 				= {}
local JestWMarkerze 		= false
local OstStrefa          	= nil
local Czaspozostaly			= 0
local PlayerData         	= {}
local cd 					= false
local majuznoty				= false
local pause 				= false
local wyszedlzmarkera 		= false
local showPro                = false
local usluzb				= false
local onDuty 				= false
local cooldownclick          = false
local wyciagnal 			= false
-----_
local selling				= false
local started 				= false
local progress 				= 0
local selection 			= 0
local quality 				= 0
local displayed 			= false


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
  if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
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

 	blipypracy = AddBlipForCoord(713.53, -963.31, 30.04)
    SetBlipSprite (blipypracy, 366)
    SetBlipDisplay(blipypracy, 4)
    SetBlipScale  (blipypracy, 0.6)
    SetBlipColour (blipypracy, 37)
    SetBlipAsShortRange(blipypracy, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Majorkowy Krawiec')
    EndTextCommandSetBlipName(blipypracy)

end)

function odswiezblipypracownika() 
 
if PlayerData.job ~= nil then

	if 'krawiec' == PlayerData.job.name and onDuty then
		for k,v in pairs(Config.miejsca.Blips) do
			jobLocations = v.Pos
			local blip = AddBlipForCoord(jobLocations)

			SetBlipSprite (blip, 366)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 37)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString((v.nazwa))
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
		end
	end
end
end

RegisterNetEvent('majorka_krawiec:stop')
AddEventHandler('majorka_krawiec:stop', function()
	ped = PlayerPedId()
	started = false
	ClearPedTasks(ped)
end)


AddEventHandler('majorka_krawiec:wmarkerze', function (zone)
if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then


  if zone == 'zbieranie_welna' and onDuty == true  then
    Akt	  = 'zbieranie_welna'
	CurrentActionMsg  = ('~y~Kliknij ~INPUT_CONTEXT~ aby zebrać ~w~wełne~w~')
	CurrentActionData = {}
  elseif zone == 'przerabianie_welna' and onDuty == true  then
    Akt	  = 'przerabianie_welna'
	CurrentActionMsg  = ('~y~Kliknij ~INPUT_CONTEXT~ aby przerobić ~o~wełne~w~ na ~p~tkanine')
	CurrentActionData = {}
  elseif zone == 'tworzenie_ubrania' and onDuty == true then
    Akt	  = 'tworzenie_ubrania'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby uszyć ~p~ubranie~w~')
	CurrentActionData = {}
  elseif zone == 'Sprzedaz' and onDuty == true then
	Akt	  = 'sell'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby sprzedać ~o~ubrania~w~')
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



AddEventHandler('majorka_krawiec:pozamarkerem', function (zone)
  Akt = nil
end)

function procent(time)
  TriggerEvent('majorka_krawiec:procenty')
  TimeLeft = 0
  repeat
  TimeLeft = TimeLeft + 1
  Citizen.Wait(time)
  until(TimeLeft == 100)
  showPro = false
  cooldownclick = false
end

RegisterNetEvent('majorka_krawiec:procenty')
AddEventHandler('majorka_krawiec:procenty', function()
  showPro = true
    while (showPro) do
      Citizen.Wait(5)
      local playerPed = PlayerPedId()
      local coords = GetEntityCoords(playerPed)
      DisableControlAction(0, 73, true) -- X
      DrawText3D(coords.x, coords.y, coords.z+0.1,'Pracuje...' , 0.4)
      DrawText3D(coords.x, coords.y, coords.z, TimeLeft .. '~g~%', 0.4)
    end
end)

Citizen.CreateThread(function()

  while true do

    Citizen.Wait(1)
	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
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
				if IsPedInAnyVehicle(playerPed, false) then
			  		if IsInAuthorizedVehicle() then
			  			if IsVehicleDriveable(CurrentActionData.vehicle, true) then	
				  				if not IsEntityDead(GetPlayerPed(0-1)) then
									ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
								if wyciagnal == true then
									TriggerServerEvent('majorka_krawiec:kaucja', 2)
								else
									TriggerEvent('pNotify:SendNotification', {text= '<b style = color:red>Order Dobrego Majorkowicza za odstawienie samohodu!</b>'})
								end
									wyciagnal = false
								else
								TriggerEvent('pNotify:SendNotification', {text= '<b style = color:red>Nie możesz schować samochodu będac nieprzytomnym!</b>'})
							end
						else
							TriggerEvent('pNotify:SendNotification', {text= '<b style = color:red>Nie możesz schować zepsutego samochodu!</b>'})
						end
					else
						TriggerEvent('pNotify:SendNotification', {text= '<b style = color:lime>Tu parkować mogą tylko samochody Gruppe-6-</b>'})
						--ESX.ShowNotification(_U('only_taxi'))
					end
			  end
		  end
		
		
		if Akt == 'zbieranie_welna' then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) and not IsEntityDead(GetPlayerPed(0-1)) then
				animacjazbieraniawelny()
				FreezeEntityPosition(PlayerPedId(), true)
				isPickingUp = true
       			procent(30)
				FreezeEntityPosition(PlayerPedId(), false)
				isPickingUp = false
				TriggerServerEvent('majorka_krawiec:dajitemwelna')
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie/będac martwym!'))	
			end
		end

		if Akt == 'przerabianie_welna'  then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) and not IsEntityDead(GetPlayerPed(0-1))  then
				animacjazbieraniawelny()
				FreezeEntityPosition(PlayerPedId(), true)
				isPickingUp = true
       			procent(30)
				FreezeEntityPosition(PlayerPedId(), false)
				isPickingUp = false
				TriggerServerEvent('majorka_krawiec:dajitemtkanina')
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie/będac martwym!'))
			end
		end
		
		if Akt == 'tworzenie_ubrania'  then
			if not IsPedInAnyVehicle(GetPlayerPed(0-1), false) and not IsEntityDead(GetPlayerPed(0-1)) then
				TriggerServerEvent('majorka_krawiec:czymozetworzyc')
			else
				ESX.ShowNotification(('Nie możesz tego robić będąc w ~b~samochodzie/będac martwym!'))	
			end
		end

		if Akt == 'sell'  then
			MenuSprzedaj()
		end	
				
 	    end
      end 
	else
		Citizen.Wait(2000)
    end
 end
end)


RegisterNetEvent('majorka_krawiec:startprod')
AddEventHandler('majorka_krawiec:startprod', function()
	started = true
	displayed = false
	ESX.ShowNotification("~r~Tworzenie ubran rozpoczete")	
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
		local playerPed = PlayerPedId()
		if IsControlJustReleased(0, Keys['E']) then
			Wait(100)
			progress = 0
			pause = false
			selection = 0
			quality = 0
		end	
			if started == true then
				FreezeEntityPosition(playerPed, true)
				
				if progress <= 100 then
					Citizen.Wait(5000)
					if not pause then
						progress = progress +  1
						Citizen.Wait(5000) 
					end

					if pause == false and progress <= 100 then
							selection = 0
							quality = quality + 1
							progress = progress +  9
							ESX.ShowNotification('~y~Produkcja Ubrań: ~g~~h~' .. progress .. '%')
						end
					--   EVENT 1
					--
					if progress == 20 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('~o~Konczysz pierwsze ubranie co robisz z resztkami tkaniny?')	
							ESX.ShowNotification('~r~3. Wyrzucam do smieci')
							ESX.ShowNotification('~g~4. Używam jako przędzy do kolejnego ubrania')
							ESX.ShowNotification('~b~5. Rzucam gdzie kolwiek')
							ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
						end
						if selection == 1 then
							ESX.ShowNotification('~b~Zawsze to jakieś rozwiązanie')
							quality = quality
							pause = false
						end
						if selection == 2 then
							ESX.ShowNotification('~b~Zaoszczędziłeś na przędzy')
							quality = quality + 1
							pause = false
						end
						if selection == 3 then
							ESX.ShowNotification('~b~Przykryłeś nową tkaninę starą co skutkowało długotrwałym procesem szukania...')
							pause = false
							quality = quality - 2
						end
						if pause == false then
							selection = 0
							quality = quality + 1
							progress = progress + 10
							ESX.ShowNotification('~y~Produkcja Ubrań: ~g~~h~' .. progress .. '%')
						end
					end
					--
					--   EVENT 5
					--
					if progress == 50 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('~o~Widzisz, że nić się kończy co robisz?')	
							ESX.ShowNotification('~r~3. Sięgam po nową')
							ESX.ShowNotification('~g~4. Próbuje dokończyć ubranie resztką nici')
							ESX.ShowNotification('~b~5. Szyjesz robiąc wiekszę odstępy między ściegami')
							ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
						end
						if selection == 1 then
							ESX.ShowNotification('~b~Najprostrze rozwiązanie...')
							quality = quality 
							pause = false
						end
						if selection == 2 then
							ESX.ShowNotification('~b~Nici nie wystarczyło przez co ubranie nie nadaje się do sprzedaży')
							quality = quality - 2
							pause = false
						end
						if selection == 3 then
							ESX.ShowNotification('~b~Udało ci się dokończyć ubranie ale nie jest ono zbyt dobrej jakkości...')
							quality = quality - 1
							pause = false
						end
						if pause == false then
							selection = 0
							quality = quality + 1
							progress = progress +  10
							ESX.ShowNotification('~y~Produkcja Ubrań: ~g~~h~' .. progress .. '%')
						end
					end

					if progress == 80 then
						pause = true
						if selection == 0 then
							ESX.ShowNotification('~o~Maszyna się zacięła co robisz?')	
							ESX.ShowNotification('~r~3. Uderzam w nią')
							ESX.ShowNotification('~g~4. Zmieniam maszynę')
							ESX.ShowNotification('~b~5. Próbuje rozkręcic i sprawdzić co jest w środku')
							ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
						end
						if selection == 1 then
							ESX.ShowNotification('~b~Odziwo zadziałało...')
							quality = quality 
							pause = false
						end
						if selection == 2 then
							ESX.ShowNotification('~b~Dobre rozwiązane lecz czasochłonne')
							quality = quality - 1
							pause = false
						end
						if selection == 3 then
							ESX.ShowNotification('~b~Chyba się na tym nie znasz, straciłeś bardzo dużo czasu...')
							quality = quality - 3
							SetPedPropIndex(playerPed, 1, 26, 7, true)
							pause = false
						end
						if pause == false and progress <= 90 then
							selection = 0
							quality = quality + 1
							progress = progress + 10
							ESX.ShowNotification('~y~Produkcja Ubrań: ~g~~h~' .. progress .. '%')
						end
					end		
					
				else
					TriggerEvent('majorka_krawiec:stop')
					progress = 100
					--ESX.ShowNotification('~r~Produkcja ubrań: ~g~~h~' .. progress .. '%')
					ESX.ShowNotification('~g~~h~Produkcja zakończona')
					FreezeEntityPosition(playerPed, false)
					TriggerServerEvent('majorka_krawiec:finish', quality)
				end	
				
			end
		else
			Citizen.Wait(2000)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)		
		if pause == true then
			if IsControlJustReleased(0, Keys['3']) then
				selection = 1
				ESX.ShowNotification('~g~Wybrałeś opcje numer 3')
			end
			if IsControlJustReleased(0, Keys['4']) then
				selection = 2
				ESX.ShowNotification('~g~Wybrałeś opcje numer 4')
			end
			if IsControlJustReleased(0, Keys['5']) then
				selection = 3
				ESX.ShowNotification('~g~Wybrałeś opcje numer 5')
			end
		end

	end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
        local playerPed = PlayerPedId()
	    if isPickingUp then
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
        end

        if started then
            DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(0, Keys['='], true)  -- Bieganie
            DisableControlAction(1, Keys['='], true)  -- Bieganie
            DisableControlAction(2, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['='], true)  -- Bieganie
			DisableControlAction(0, 21, true)  -- Bieganie
			DisableControlAction(2, Keys['E'], true)
			DisableControlAction(2, Keys['Z'], true)
            DisableControlAction(0, Keys[','], true)  -- Bieganie
            DisableControlAction(1, Keys[','], true)  -- Bieganie
            DisableControlAction(2, Keys[','], true)  -- Bieganie
             if not (IsEntityPlayingAnim(playerPed, 'amb@prop_human_seat_sewing@female@idle_a', 'idle_a', 3) == 1) then
                ESX.Streaming.RequestAnimDict('amb@prop_human_seat_sewing@female@idle_a', function()
                    TaskPlayAnim(playerPed, 'amb@prop_human_seat_sewing@female@idle_a', 'idle_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
                end)
            end 	
        end	

        if selling then 
        	DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            DisableControlAction(0, Keys['='], true)  -- Bieganie
            DisableControlAction(1, Keys['='], true)  -- Bieganie
            DisableControlAction(2, Keys['='], true)  -- Bieganie
			DisableControlAction(3, Keys['='], true)  -- Bieganie
			DisableControlAction(0, 21, true)  -- Bieganie
			DisableControlAction(2, Keys['E'], true)
			DisableControlAction(2, Keys['Z'], true)
            DisableControlAction(0, Keys[','], true)  -- Bieganie
            DisableControlAction(1, Keys[','], true)  -- Bieganie
            DisableControlAction(2, Keys[','], true)  -- Bieganie
        	 if not (IsEntityPlayingAnim(playerPed, 'anim@heists@keycard@', 'idle_a', 3) == 1) then
                ESX.Streaming.RequestAnimDict('anim@heists@keycard@', function()
                    TaskPlayAnim(playerPed, 'anim@heists@keycard@', 'idle_a', 8.0, -8, -1, 49, 0, 0, 0, 0)
                end)
            end 	
        
		end
	else
		Citizen.Wait(2000)
	end
    end
end)

	

function MenuSprzedaj()

	 local elements = {
				{label = 'Sprzedaj ubrania', value = 'ubraniasell'}

			}


ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	{
		title    = ('Sklep u Zochy'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
			if data.current.value == 'ubraniasell' then
				selling = true
				FreezeEntityPosition(PlayerPedId(), true)
				ESX.ShowNotification('Trwa sprzedawanie ubrań...')
				Citizen.Wait(8000)
				FreezeEntityPosition(PlayerPedId(), false)
				TriggerServerEvent('majorka_krawiec:hajs')
				selling = false
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
			queue = "krawiec",
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
        	TriggerServerEvent("majorka_krawiec:dupa123", 2)
		    TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie cywilne'),
			type = "error",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "krawiec",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		 TriggerServerEvent('majorka_krawiec:pow2')
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
			queue = "krawiec",
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
        TriggerServerEvent("majorka_krawiec:dupa123", 1)
			TriggerEvent("pNotify:SendNotification",{
			text = ('Zakładasz ubranie robocze'),
			type = "success",
			timeout = (3000),
			layout = "bottomCenter",
			queue = "krawiec",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
		majuznoty = false
		  TriggerServerEvent('majorka_krawiec:pow')
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'czlonek' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.recruit_wear.female)
          end
          end
        end)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'szwacz' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.szwacz_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.szwacz_wear.female)
          end
          end
        end)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'krawiec' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.krawiec_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.krawiec_wear.female)
          end
          end
        end)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'starczykrawiec' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.starczykrawiec_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.starczykrawiec_wear.female)
          end
          end
        end)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        	if PlayerData.job.grade_name == 'mistrzkrawiec' then
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.mistrzkrawiec_wear.male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.mistrzkrawiec_wear.female)
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
	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
		for k,v in pairs(Config.StrefyJesliPrzebrany) do
		if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' and onDuty == true then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end
		for k,v in pairs(Config.StrefyJesliMaPrace) do
		if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end

		for k,v in pairs(Config.Szafka) do
			if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end

		for k,v in pairs(Config.Szefu) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' and  (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end

		for k,v in pairs(Config.Samochod)  do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' and onDuty == true then
				DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end
		for k,v in pairs(Config.SamochodUsun) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' and onDuty == true then
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
		if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' then
    
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
				TriggerEvent('majorka_krawiec:wmarkerze', currentZone)
				end

				if not isInMarker and JestWMarkerze then
				TriggerEvent('majorka_krawiec:pozamarkerem', OstStrefa)
				JestWMarkerze = false
				wyszedlzmarkera = true
				end
		else
			Citizen.Wait(2000)
  		end
  end 
end)




function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function animacjazbieraniawelny()
	local ad = "amb@prop_human_bum_bin@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, 8.0, 1.0, 1, 1, 0, 0, 0 )
		end
	end
end

function OpenBurgerActions()
	local elements = {}

	if PlayerData.job ~= nil and PlayerData.job.name == 'krawiec' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'koza'})
		table.insert(elements, {label = '<b style = color:blue>BAZA DANYCH</b>', value = 'boss_actions'})
		table.insert(elements, {label = '<b style = color:red>Wyczysc Kursy</b>', value = 'wyczysc'})
		table.insert(elements, {label = '<b style = color:green>Ilosc Kursów Pracowników</b>', value = 'pizda'})
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'chuj'})
	end
  

 	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = ('<b style = color:white>KRAWCOWA</b>'),
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
			TriggerEvent('esx_society:openBossMenu', 'krawiec', function(data, menu)
				menu.close()
			end, { limit = true })
			elseif PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
			TriggerEvent('esx_society:openBossMenu', 'krawiec', function(data, menu)
				menu.close()
			end, { withdraw = false }) -- wylacza wyplacanie monet
		end
		end

		end,
		function(data, menu)
      menu.close()
    end
  )
end


function Menuszafka()

	local elements = {
		{label = ('Schowaj Przedmiot'), value = 'put_stock'},
		{label = ('Sprawdz Liczbę Kursów'), value = 'liczba'},


	}

	if PlayerData.job.grade_name == 'boss' or  PlayerData.job.grade_name == 'zastepca' then
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
			elseif data.current.value == 'liczba' then
			OpenKursMenu()
			menu.close()
      end
		end,
		function(data, menu)
      menu.close()
    end
  )
end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('majorka_krawiec:getPlayerInventory', function(inventory)

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
			title    = ('Magazyn'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = ('Ilość')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(('Nieprawidłowa ilość'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('majorka_krawiec:putStockItems', itemName, count)

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

	ESX.TriggerServerCallback('majorka_krawiec:getStockItems', function(items)

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = ('Magazyn'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = ('Ilość')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
						ESX.ShowNotification(('Nieprawidłowa ilość'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('majorka_krawiec:getStockItem', itemName, count)

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
						  TriggerServerEvent('majorka_krawiec:kaucja', 1)
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

function OpenKursMenu()

	ESX.TriggerServerCallback('majorka_krawiec:getEmployeer', function(liczba)
		local elements = {}

		 if #liczba == 0 then 
			TriggerEvent('pNotify:SendNotification', {text='Nie posiadasz żadnych wykonanych kursów'})
			return
		end

		for i = 1, #liczba, 1 do
			table.insert(elements, {label = "Pracownik: " .. " | " .. liczba[i].name .. " | " .. liczba[i].kursy .. " kursow"})	
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'liczba_menu',
		{
			title    = 'Majorkowy Krawiec',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		end, function(data, menu)
			menu.close()
			end)
	end)
end

function OpenKutasMenu()

	ESX.TriggerServerCallback('majorka_krawiec:getEmployees', function(gracze)
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
			title    = 'Majrkowy Krawiec',
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
			TriggerServerEvent('majorka_krawiec:tak')
			ESX.ShowNotification("Kursy zostały wyczyszczone")
		end

	end, function(data, menu)
		menu.close()
	end)
end

function DrawText3D(x, y, z, text, scale)
  local onScreen, _x, _y = World3dToScreen2d(x, y, z)
  local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

  SetTextScale(scale, scale)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextEntry("STRING")
  SetTextCentre(1)
  SetTextColour(255, 255, 255, 255)
  SetTextOutline()

  AddTextComponentString(text)
  DrawText(_x, _y)

  local factor = (string.len(text)) / 270
  DrawRect(_x, _y + 0.015, 0.005 + factor, 0.03, 31, 31, 31, 155)
end

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end