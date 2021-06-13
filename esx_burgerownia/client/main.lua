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
local an 					= 'anim@amb@business@coc@coc_unpack_cut_left@'
local animacja 				= "coke_cut_v4_coccutter"
local nozhash				= GetHashKey('prop_knife')




Citizen.CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
	if PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
  	odswiezblipy()
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
  if PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
  	odswiezblipy()
	end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  if PlayerData.job ~= nil and PlayerData.job.name == 'burgerownia' then
  	odswiezblipy()
	end
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
  PlayerData.job2 = job2
  if PlayerData.job2 ~= nil and PlayerData.job2.name == 'burgerownia' then
  	odswiezblipy()
	end
end)

function odswiezblipy() 


 blipypracy = AddBlipForCoord(-1837.61, -1178.14, 13)
    SetBlipSprite (blipypracy, 472)
    SetBlipDisplay(blipypracy, 4)
    SetBlipScale  (blipypracy, 1.0)
    SetBlipColour (blipypracy, 57)
    SetBlipAsShortRange(blipypracy, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Pearls Restauracja')
    EndTextCommandSetBlipName(blipypracy)

end



AddEventHandler('wojtek_burgerownia:wmarkerze', function (zone)
if PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then

  if zone == 'Lodowka' and onDuty == true and sprzataj == false then
    Akt     = 'lod'
    CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby otworzyć ~g~lodówkę')
    CurrentActionData = {}
  elseif zone == 'Smaz' and onDuty == true and sprzataj == false then
    Akt	  = 'smazenie'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~smażyć~w~ rybke')
	CurrentActionData = {}
  elseif zone == 'Przebieralnia' and PlayerData.job.name == 'burgerownia'  then
    Akt	  = 'przeb'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby się ~b~przebrać~w~')
	CurrentActionData = {}
  elseif zone == 'Kroj' and onDuty == true and sprzataj == false then
    Akt	  = 'krojenie'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~pokroić ~w~ziemniaczki')
	CurrentActionData = {}
  elseif zone == 'Myj' and onDuty == true and sprzataj == false then
    Akt	  = 'myju'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~umyć~w~ sałatę')
	CurrentActionData = {}
  elseif zone == 'Przyg' and onDuty == true and sprzataj == false then
	Akt	  = 'przygotuj'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~przygotować~w~ wybrany posilek/napój')
	CurrentActionData = {}
  elseif zone == 'Sprzatanie' and onDuty == true and sprzataj == true then
	Akt	  = 'sprz'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~popsrzątać~w~ toaletę')
	CurrentActionData = {}
  elseif zone == 'Sprzedaz' and onDuty == true and sprzataj == false then
	Akt	  = 'sell'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~o~sprzedać~w~ zamowienie')
	CurrentActionData = {}
  elseif zone == 'Szef' and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name =='zastepca') then
	Akt	  = 'MenuSzefa'
	CurrentActionMsg  = ('Kliknij ~INPUT_CONTEXT~ aby ~g~odpalic~w~ ~b~Menu Szefa')
	CurrentActionData = {}
  end
  end 
end)



AddEventHandler('wojtek_burgerownia:pozamarkerem', function (zone)
  Akt = nil
end)



Citizen.CreateThread(function()

  while true do

    Citizen.Wait(1)
	if PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
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
				
				if Akt == 'smazenie' and as1 == false then
						TriggerServerEvent('wojtek_burgerownia:czymozesmazyc')
						if as1 == false then
							as1 = true
						end
				end

				if Akt == 'krojenie' and as1 == false then
					TriggerServerEvent('wojtek_burgerownia:czymozekroic')
					if as1 == false then
						as1 = true
					end
				end
				
				if Akt == 'myju' and as1 == false then
					TriggerServerEvent('wojtek_burgerownia:czymozemyc')
					if as1 == false then
						as1 = true
					end
				end	

				if Akt == 'sprz' and sprzataj == true and as1 == false then
					TriggerEvent('wojtek_burgerownia:sprzatanie')
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
				else
				end
			end
    	end
	else
		Citizen.Wait(2000)
  	end
  end 
end)

function MenuPrzygotuj()

	 local elements = {
				{label = 'Przygotuj Danie', value = 'burgerek'},
				{label = 'Przygotuj Owocki', value = 'owocki'},
				{label = 'Przygotuj Drinka', value = 'drink'}
			}


ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	{
		title    = ('Przygotowywanie Dan'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
			if data.current.value == 'burgerek' then
			TriggerServerEvent('wojtek_burgerownia:czymozeprzygotowac', 1)
			elseif data.current.value == 'owocki' then
			TriggerServerEvent('wojtek_burgerownia:czymozeprzygotowac', 2)
		elseif data.current.value == 'drink' then
			TriggerServerEvent('wojtek_burgerownia:czymozeprzygotowac', 3)
      end
		end,
		function(data, menu)
      menu.close()
    end
  )
end

function MenuSprzedaj()

	 local elements = {
				{label = 'Sprzedaj Danie', value = 'burgereksell'},
				{label = 'Sprzedaj Owocki', value = 'owockisell'},
				{label = 'Sprzedaj Drinka', value = 'drinksell'}

			}


ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'dania',
	{
		title    = ('Przygotowywanie Dan'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
			if data.current.value == 'burgereksell' then
			TriggerServerEvent('wojtek_burgerownia:hajs', 1)
			elseif data.current.value == 'owockisell' then
			TriggerServerEvent('wojtek_burgerownia:hajs', 2)
			elseif data.current.value == 'drinksell' then
			TriggerServerEvent('wojtek_burgerownia:hajs', 3)
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
        {label = 'Ubranie cywilne', value = 'citizen_wear'},
        {label = 'Liczba kursów', value = 'liczba'},
      }
    },
    function(data, menu)
    		if data.current.value == 'liczba' then
    			OpenKursMenu()
    		end

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
        	TriggerServerEvent("wojtek_burgerownia:dupa123", 2)
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
		 TriggerServerEvent('wojtek_burgerownia:pow2')
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
		  TriggerServerEvent('wojtek_burgerownia:pow')
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin.sex == 0 then
              TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)   
          else
              TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
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
				{label = 'Weź zupę', value = 'bulka'},
				{label = 'Weź frytki', value = 'pomidor'},
                {label = 'Weź sałatę', value = 'salata'},
                {label = 'Weź rybę', value = 'mieso'},
                {label = 'Weź ketchup', value = 'ketchup'},
                {label = 'Weź Whisky', value = 'whisky'},
                {label = 'Weź Vodke z Energetykiem', value = 'vodkaenergy'},
                {label = 'Weź Tequile', value = 'tequila'},
                {label = 'Weź Szklanke', value = 'szklanka'},

	}

 ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = ('Lodowka'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
			if data.current.value == 'bulka' then
			TriggerServerEvent('wojtek_burgerownia:dajitembulka')
			elseif data.current.value == 'pomidor' then
			TriggerServerEvent('wojtek_burgerownia:dajitempomidor')
			elseif data.current.value == 'salata' then
			TriggerServerEvent('wojtek_burgerownia:dajitemsalata')
			elseif data.current.value == 'mieso' then
			TriggerServerEvent('wojtek_burgerownia:dajitemmieso')
			elseif data.current.value == 'ketchup' then
			TriggerServerEvent('wojtek_burgerownia:dajitemketchup')
			elseif data.current.value == 'whisky' then
			TriggerServerEvent('wojtek_burgerownia:dajitemydodrinka', 1)
			elseif data.current.value == 'vodkaenergy' then
			TriggerServerEvent('wojtek_burgerownia:dajitemydodrinka', 2)
			elseif data.current.value == 'tequila' then
			TriggerServerEvent('wojtek_burgerownia:dajitemydodrinka', 3)
			elseif data.current.value == 'szklanka' then
			TriggerServerEvent('wojtek_burgerownia:dajitemydodrinka', 4)  
      end
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
	if PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
		for k,v in pairs(Config.StrefyJesliPrzebrany) do
		if(v.Type ~= -1 and  #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') and onDuty == true and sprzataj == false then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end
		for k,v in pairs(Config.StrefyJesliMaPrace) do
		if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
		end
		end
		for k,v in pairs(Config.Strefysprzatanko) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') and sprzataj == true and onDuty == true then
			DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 300, false, true, 2, false, false, false, false)
			end
		end

		for k,v in pairs(Config.Szefu) do
			if(v.Type ~= -1 and #(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < 100.0) and PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') and ((PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') or (PlayerData.job2.grade_name == 'boss' or PlayerData.job2.grade_name == 'zastepca')) then
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
	if (PlayerData.job ~= nil or PlayerData.job2 ~= nil) and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') then
    
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

			for k,v in pairs(Config.Strefysprzatanko) do
				if (#(coords - vector3(v.Pos.x, v.Pos.y, v.Pos.z)) < v.Size.x) then
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

			if (isInMarker and not JestWMarkerze) or (isInMarker and OstStrefa ~= currentZone) then
			JestWMarkerze = true
			OstStrefa                = currentZone
			TriggerEvent('wojtek_burgerownia:wmarkerze', currentZone)
			end

			if not isInMarker and JestWMarkerze then
			TriggerEvent('wojtek_burgerownia:pozamarkerem', OstStrefa)
			JestWMarkerze = false
			end
		else
			Citizen.Wait(2000)
  		end
 	 end 
end)


RegisterNetEvent('wojtek_burgerownia:animacjasmazenia')
AddEventHandler('wojtek_burgerownia:animacjasmazenia', function()
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
		TriggerServerEvent('wojtek_burgerownia:dajitemgmieso')
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

RegisterNetEvent('wojtek_burgerownia:losowanko')
AddEventHandler('wojtek_burgerownia:losowanko', function()
	local zrzygalsie = math.random(1,100)

	if zrzygalsie < Config.szansa  then
		TriggerServerEvent('wojtek_burgerownia:pow3')

		if sprzataj == false then
			sprzataj = true
		end

		if hardblock == false then
			hardblock = true
		end
	end
	
end)

RegisterNetEvent('wojtek_burgerownia:ochuj')
AddEventHandler('wojtek_burgerownia:ochuj', function()

	local pP = GetPlayerPed(-1)
	local zdedales = math.random(1,500)

	if zdedales < Config.bw  then
		TriggerServerEvent('wojtek_burgerownia:powliee')
		SetEntityHealth(pP, 0)
	else
		TriggerEvent("pNotify:SendNotification", {text="<b style = color:gold>Poprawnie pokroiles ziemniaczka :)</b>"})
	end
	
end)

RegisterNetEvent('wojtek_burgerownia:sprzatanie')
AddEventHandler('wojtek_burgerownia:sprzatanie', function() 

	if as1 == false then
		as1 = true
	end
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(pP, -1834.35, -1177.46, 13.33)
	SetEntityHeading(pP, 331.2)
    TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	sprzatajjeszcze = Config.czassprzatania
	FreezeEntityPosition(pP, true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Sprzatasz toalete'),
			type = "info",
			timeout = (Config.czassprzatania * 999),
			layout = "bottomCenter",
			queue = "burgerownia",
			animation = {
			open = "gta_effects_fade_in",
			close = "gta_effects_fade_out"
		}})
	repeat
	sprzatajjeszcze = sprzatajjeszcze - 1
	Citizen.Wait(1000)
	until(sprzatajjeszcze == 0) 
	TriggerServerEvent('wojtek_burgerownia:pow4')
		FreezeEntityPosition(pP, false)
		Wait(1000)
	ClearPedTasksImmediately(pP)

	if as1 == true then
		as1 = false
	end

	if sprzataj == true then
		sprzataj = false
	end

	if hardblock == true then
		hardblock = false
	end
	
end)

RegisterNetEvent('wojtek_burgerownia:animacjaprzygotowania')
AddEventHandler('wojtek_burgerownia:animacjaprzygotowania', function(cipunia)
if cipunia == 1 then
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(pP, -1837.54, -1186.12, 13.32)
	SetEntityHeading(pP, 236.76)
    TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	przygotowanieczas = Config.czasprzygotowania
	FreezeEntityPosition(pP, true)
	--DisableAllControlActions(pP,true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przygotowujesz Dania Głowne'),
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
	 
		TriggerServerEvent('wojtek_burgerownia:dajitemburger')
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
elseif cipunia == 2 then
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(pP, -1837.54, -1186.12, 13.32)
	SetEntityHeading(pP, 236.76)
    TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	przygotowanieczas = Config.czasprzygotowaniamax
	FreezeEntityPosition(pP, true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przygotowujesz Przystawkę'),
			type = "info",
			timeout = (Config.czasprzygotowaniamax * 999),
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
	 
		TriggerServerEvent('wojtek_burgerownia:dajitemowoce')
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
elseif cipunia == 3 then
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(pP, -1837.54, -1186.12, 13.32)
	SetEntityHeading(pP, 236.76)
    TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	przygotowanieczas = Config.czasprzygotowanidrinka
	FreezeEntityPosition(pP, true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przygotowujesz Drinka'),
			type = "info",
			timeout = (Config.czasprzygotowanidrinka * 999),
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
		TriggerServerEvent('wojtek_burgerownia:dajitemdrink')
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

RegisterNetEvent('wojtek_burgerownia:falarm')
AddEventHandler('wojtek_burgerownia:falarm', function()
	if as1 == true then
		as1 = false
	end

end)

RegisterNetEvent('wojtek_burgerownia:animacjakrojenia')
AddEventHandler('wojtek_burgerownia:animacjakrojenia', function()
	if as2 == false then
		as2 = true

	local pP = GetPlayerPed(-1)
	local cgracza = GetEntityCoords(pP)

	SetEntityCoords(pP, -1843.57, -1187.69, 13.3)
	SetEntityHeading(pP, 55.61)
	FreezeEntityPosition(pP, true)

	LoadDict(an)
	TaskPlayAnim(pP, an, animacja, 3.5, -6, -1, 63, 0, 0, 0, 0 )

	nozkuchenny = CreateObject(nozhash,cgracza.x, cgracza.y, cgracza.z, true, true, true)
	AttachEntityToEntity(nozkuchenny, pP, GetPedBoneIndex(pP, 0xDEAD), 0.11, 0.16, 0.10, 39.7, 0.0, 0.0, false, false, false, false, 2, true)


	krojenie = Config.czaskrojenia
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Przygotowujesz frytki'),
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

	TriggerServerEvent('wojtek_burgerownia:dajitemgpomidor')

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

RegisterNetEvent('wojtek_burgerownia:animacjamycia')
AddEventHandler('wojtek_burgerownia:animacjamycia', function()
	if as2 == false then
		as2 = true
    local pP = GetPlayerPed(-1)  
	SetEntityCoords(pP, -1841.71, -1184.13, 13.33)
	SetEntityHeading(pP, 55.6)
    TaskStartScenarioInPlace(pP, "PROP_HUMAN_BUM_BIN", 0, true) 
	myciejeszcze = Config.czasmycia
	FreezeEntityPosition(pP, true)
	DisableAllControlActions(pP,true)
		  	TriggerEvent("pNotify:SendNotification",{
			text = ('Myjesz salate..'),
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
		TriggerServerEvent('wojtek_burgerownia:dajitemgsalata')
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

	ESX.TriggerServerCallback('wojtek_burgerownia:getEmployees', function(gracze)
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
			title    = ('<b style = color:gold>Perełki</b>'),
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

	ESX.TriggerServerCallback('wojtek_burgerownia:getEmployeer', function(liczba)
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
			title    = ('<b style = color:gold>Perełki</b>'),
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
			TriggerServerEvent('wojtek_burgerownia:tak')
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenBurgerActions()
	local elements = {}

	if  PlayerData.job ~= nil and PlayerData.job2 ~= nil and (PlayerData.job.name == 'burgerownia' or PlayerData.job2.name == 'burgerownia') and ((PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') or (PlayerData.job2.grade_name == 'boss' or PlayerData.job2.grade_name == 'zastepca')) then
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'koza'})
		table.insert(elements, {label = '<b style = color:lime>HAJS I MURZYNY</b>', value = 'boss_actions'})
		table.insert(elements, {label = '<b style = color:green>LICZBA KURSOW PRACOWNIKOWY</b>', value = 'pizda'})
		table.insert(elements, {label = '<b style = color:red>WYCZYSC KURSY</b>', value = 'wyczysc'})
		table.insert(elements, {label = '<b style = color:red>---------------------------</b>', value = 'chuj'})
	end
  

 	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = ('<b style = color:gold>Perełki</b>'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		 	if data.current.value == 'pizda' then
			OpenKutasMenu()
		    elseif data.current.value == 'wyczysc' then
			OpenWyczyscMenu()
			end
			if data.current.value == 'boss_actions' then
			if (PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss') or (PlayerData.job2 ~= nil and PlayerData.job2.grade_name == 'boss') then
			TriggerEvent('esx_society:openBossMenu', 'burgerownia', function(data, menu)
				menu.close()
			end, { limit = true })
			elseif (PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca') or (PlayerData.job2 ~= nil and PlayerData.job2.grade_name == 'zastepca') then
			TriggerEvent('esx_society:openBossMenu', 'burgerownia', function(data, menu)
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