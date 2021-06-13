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
local odprzodu = false
local odtylu = false
local IsHandcuffed            = false
local HandcuffTimer           = {}
local DragStatus              = {}
local JobBlips 					= {}
DragStatus.IsDragged          = false
local hasAlreadyJoined        = false
local blipsCops               = {}
local isDead                  = false
local playerInService         = false
local myJob 					= nil
local tackleLib					= 'mp_arresting'
local tackleAnim 				= 'a_uncuff'
local przeszukiwanieLib 		= 'rcmextreme3'
local przeszukiwanieAnim 		= 'idle'
local przeszukiwany 			= false 
--local plate = 'POL ' .. math.random(100, 900)
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	odswiezblipypracownika()
	PlayerData = ESX.GetPlayerData()
end)

function JestZakuty()
    return IsHandcuffed ~= false
end

function SetVehicleMaxMods(vehicle)
	ESX.TriggerServerCallback('esx_policejob:getPlayerData', function(data)
	local props = {
		SetVehicleNumberPlateText(vehicle, "POL"..data.odznaka),
		modEngine       = 3,
		modBrakes       = 3,
		modTransmission = 3,
		modSuspension   = 2,
		modTurbo        = true

	}
	ESX.Game.SetVehicleProperties(vehicle, props)
	end, GetPlayerServerId(PlayerId()))
end

function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end


function playCode99Sound()
	PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
	Wait(900)
	PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
	Wait(900)
	PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
  end
  
  RegisterNetEvent('rich:ShowInfo')
  AddEventHandler('rich:ShowInfo', function(notetext)
	ESX.ShowNotification(notetext)
  end)
  
  RegisterNetEvent('rich:BackupReq')
  AddEventHandler('rich:BackupReq', function(bk, s, kordy)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
	  local src = s
	  local bkLvl = bk
	  local bkLvlTxt = "N/A"
	  local coords = kordy
	  local street1 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
	  local streetName = (GetStreetNameFromHashKey(street1))
  
	  if bkLvl == "0" then
		bkLvlTxt = "~r~~h~KOD 0"
	  elseif bkLvl == "6A" then
		bkLvlTxt = "~y~KOD 6A"
	elseif bkLvl == "6G" then
		bkLvlTxt = "~y~KOD 6G"
	elseif bkLvl == "6M" then
		bkLvlTxt = "~y~KOD 6M"
	  end
  
	  ESX.ShowNotification("Oficer potrzebuje pomocy " .. bkLvlTxt .. "~s~ | ~o~Lokalizacja: ~s~" .. streetName .. "")
	  if bkLvl == "0" or bkLvl == "6A" or bkLvl == "6G" or bkLvl == "6M" then
		playCode99Sound()
		SetNewWaypoint(kordy)
	  end
  
	  local blip = AddBlipForCoord(kordy)
		  SetBlipSprite(blip,  280)
		  SetBlipColour(blip,  1)
		  SetBlipAlpha(blip, 250)
		  SetBlipScale(blip, 1.2)
		BeginTextCommandSetBlipName("STRING")
	  AddTextComponentString('# KOD: '..bkLvl..'')
	  EndTextCommandSetBlipName(blip)
	  Citizen.Wait(30000)
	  RemoveBlip(blip)
	end
  end)


function setUniform(job, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[job].male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 50)
			elseif job == 'kamizelka_wear' then
				SetPedArmour(playerPed, 50)
			elseif job == 'kask_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'doa_wear2' then 
				SetPedArmour(playerPed, 75)
			elseif job == 'bullet_wear' and 'kask_wear' then
				SetPedArmour(playerPed, 75)
			elseif job == 'doa_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'dtu_wear2' or job == 'highwaykamzkulodoporna_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'swat_wear' then 
				SetPedArmour(playerPed, 100)
			elseif job == 'swatso_wear' then 
				SetPedArmour(playerPed, 100)
			elseif job == 'crash_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'crash2_wear' then 			
				SetPedArmour(playerPed, 75)
			elseif job == 'correction_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'correction2_wear' then 
				SetPedArmour(playerPed, 50)
			end
		else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[job].female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

			if job == 'bullet_wear' then
				SetPedArmour(playerPed, 50)
			elseif job == 'kamizelka_wear' then
				SetPedArmour(playerPed, 50)
			elseif job == 'highwaykamzkulodoporna_wear' then
				SetPedArmour(playerPed, 50)
			elseif job == 'kask_wear' then 
				SetPedArmour(playerPed, 25)
			elseif job == 'doa_wear2' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'bullet_wear' and 'kask_wear' then
				SetPedArmour(playerPed, 75)
			elseif job == 'doa_wear' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'dtu_wear2' then 
				SetPedArmour(playerPed, 50)
			elseif job == 'swat_wear' then 
				SetPedArmour(playerPed, 100)
			end
		end
	end)
end



function OpenCloakroomMenu()

	local playerPed = PlayerPedId()
	local grade = PlayerData.job.grade_name

	local elements = {
		
		{ label = 'Ubrania z mieszkan', value = 'player_dressing' },
		{ label = _U('citizen_wear'), value = 'citizen_wear' },
		{ label = ('<b style = color:red>Stroje Przeznaczone dla LSPD</b>'), value = 'takwlasniev2' },
		{ label = ('SWAT'), value = 'swat_wear' },
		{ label = ('SWAT Drugi Wariant'), value = 'swat_wear2' },
		{ label = ('Motocyklista'), value = 'moto_wear' },
		{ label = ('Pilot'), value = 'pilot_wear' },
		{ label = ('SAHP Dowódca'), value = 'hpdowodca_wear' },
	    { label = ('SAHP Krótki'), value = 'hpshortchuj_wear' },	
	    { label = ('SAHP Kurtka'), value = 'hpjacketchuj_wear' },		
		{ label = ('SAHP Kamizelka Odblaskowa'), value = 'highwaykamz_wear' },
		{ label = ('SAHP Kamizelka Kuloodporna '), value = 'highwaykamzkulodoporna_wear' },
		{ label = ('Correction'), value = 'correction_wear' },			
		--{ label = ('Correction2'), value = 'correction2_wear' },
		{ label = ('Stroj rowerzysty'), value = 'rower_wear' },
		{ label = ('DOA'), value = 'doa_wear' },		
		{ label = ('DOA Drugi Wariant'), value = 'doa_wear2' },
		{ label = ('<b style = color:red>Stroje SO</b>'), value = 'doa_wear2' },
		{ label = ('SWAT SO'), value = 'swatso_wear' },
		{ label = ('<b style = color:red>Akcesoria</b>'), value = 'Takwlasnie' },
		{ label = _U('bullet_wear'), value = 'bullet_wear' },
		{ label = 'Kask Kuloodporny', value = 'kask_wear'},
		{ label = 'Torba', value = 'torba_wear'},
		{ label = _U('gilet_wear'), value = 'gilet_wear' },
		{ label = ('<b style = color:red>Stroje Przypisane Od Stopnia</b>'), value = 'gilet_wear' },

	}


	if grade == 'recruit' then
		table.insert(elements, {label = _U('police_wear'), value = 'recruit_wear'})
	elseif grade == 'officer' then
		table.insert(elements, {label = _U('police_wear'), value = 'officer_wear'})
	elseif grade == 'sergeant' then
		table.insert(elements, {label = _U('police_wear'), value = 'sergeant_wear'})
	elseif grade == 'lieutenant' then
		table.insert(elements, {label = _U('police_wear'), value = 'lieutenant_wear'})
	elseif grade == 'chef' then
		table.insert(elements, {label = _U('police_wear'), value = 'chef_wear'})
	elseif grade == 'recruit2' then
		table.insert(elements, {label = _U('police_wear'), value = 'recruit2_wear'})
	elseif grade == 'officer2' then
		table.insert(elements, {label = _U('police_wear'), value = 'officer2_wear'})
	elseif grade == 'officer3' then
		table.insert(elements, {label = _U('police_wear'), value = 'officer2_wear'})
	elseif grade == 'sergeant2' then
		table.insert(elements, {label = _U('police_wear'), value = 'sergeant2_wear'}) 
	elseif grade == 'intendent2' then
		table.insert(elements, {label = _U('police_wear'), value = 'intendent2_wear'})
	elseif grade == 'intendent' then
		table.insert(elements, {label = _U('police_wear'), value = 'intendent_wear'})
		elseif grade == 'boss' or grade == 'zastepca' or grade == 'agent' then
		table.insert(elements, {label = ('Stroj Szefa Policji'), value = 'boss_wear'})
		table.insert(elements, {label = ('Stroj Szefa Szeryfow'), value = 'szeryf_wear'})
		table.insert(elements, {label = ('<b style = color:red>PRZEZNACZONE DLA FIB</b>')})
		table.insert(elements, { label = ('<b style = color:red>Stroje Dzienne</b>'), value = 'nicwaznego' })
		table.insert(elements, { label = ('FIB - Windbreaker'), value = 'windbreaker_wear' })
		table.insert(elements, { label = ('FIB - Windbreaker2'), value = 'windbreaker_wear2' })
		table.insert(elements, { label = ('FIB - Garnitur'), value = 'garnitur_wear' })
		table.insert(elements, { label = ('FIB - Dzienny'), value = 'dzienny_wear' })
		--table.insert(elements, { label = ('<b style = color:red>Stroje Bojowe</b>'), value = 'nicwaznego' })
		--table.insert(elements, { label = ('FIB - Bojowy1'), value = 'bojowy_wear3' })
		--table.insert(elements, { label = ('FIB - Bojowy2'), value = 'bojowy_wear4' })	
		table.insert(elements, { label = ('<b style = color:blue>Dodatki</b>'), value = 'nicwaznego' })
		table.insert(elements, { label = ('FIB - Kamizelka'), value = 'kamizelka_wear' })
		table.insert(elements, { label = ('FIB - Identyfikator'), value = 'identy_wear' })
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = _U('cloakroom'),
		align    = 'center',
		elements = elements
	}, function(data, menu)

		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			
			if Config.EnableNonFreemodePeds then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local isMale = skin.sex == 0

					TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)
					end)

				end)
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			if Config.MaxInService ~= -1 then

				ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
					if isInService then

						playerInService = false

						local notification = {
							title    = _U('service_anonunce'),
							subject  = '',
							msg      = _U('service_out_announce', GetPlayerName(PlayerId())),
							iconType = 1
						}

						TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')

						TriggerServerEvent('esx_service:disableService', 'police')
						TriggerEvent('esx_policejob:updateBlip')
						ESX.ShowNotification(_U('service_out'))
					end
				end, 'police')
			end

		end

		if Config.MaxInService ~= -1 and data.current.value ~= 'citizen_wear' then
			local serviceOk = 'waiting'

			ESX.TriggerServerCallback('esx_service:isInService', function(isInService)
				if not isInService then

					ESX.TriggerServerCallback('esx_service:enableService', function(canTakeService, maxInService, inServiceCount)
						if not canTakeService then
							ESX.ShowNotification(_U('service_max', inServiceCount, maxInService))
						else

							serviceOk = true
							playerInService = true

							local notification = {
								title    = _U('service_anonunce'),
								subject  = '',
								msg      = _U('service_in_announce', GetPlayerName(PlayerId())),
								iconType = 1
							}
	
							TriggerServerEvent('esx_service:notifyAllInService', notification, 'police')
							TriggerEvent('esx_policejob:updateBlip')
							ESX.ShowNotification(_U('service_in'))
						end
					end, 'police')

				else
					serviceOk = true
				end
			end, 'police')

			while type(serviceOk) == 'string' do
				Citizen.Wait(5)
			end

			-- if we couldn't enter service don't let the player get changed
			if not serviceOk then
				return
			end
		end

		if
			data.current.value == 'identy_wear' or 
			data.current.value == 'kamizelka_wear' or 
			data.current.value == 'bojowy_wear' or
			data.current.value == 'windbreaker_wear' or
			data.current.value == 'windbreaker_wear2' or
			data.current.value == 'elegancki_wear' or
			data.current.value == 'dzienny_wear' or
		    data.current.value == 'dzienny_wear2' or
			data.current.value == 'bojowy_wear2' or 
			data.current.value == 'bojowy_wear3' or
			data.current.value == 'bojowy_wear4' or 
			data.current.value == 'officer2_wear' or 
			data.current.value == 'sergeant2_wear' or 
			data.current.value == 'intendent2_wear' or 
			data.current.value == 'swatso_wear' or 
			data.current.value == 'doa_wear' or
			data.current.value == 'doa_wear2' or
			data.current.value == 'crash_wear' or	
			data.current.value == 'crash2_wear' or				
			data.current.value == 'chef2_wear' or
			data.current.value == 'dtu_wear' or
			data.current.value == 'pilot_wear' or
			data.current.value == 'torba_wear' or
			data.current.value == 'correction_wear' or
			data.current.value == 'correction2_wear' or
			data.current.value == 'rower_wear' or
			data.current.value == 'dtu_wear2' or
			data.current.value == 'hp_wear' or
			data.current.value == 'moto_wear' or
			data.current.value == 'swat_wear' or
			data.current.value == 'hplongchuj_wear' or		
			data.current.value == 'hpshortchuj_wear' or
			data.current.value == 'hpjacketchuj_wear' or
			data.current.value == 'hpdowodca_wear' or
			data.current.value == 'highwaykamz_wear' or					
			data.current.value == 'swat_wear2' or
			data.current.value == 'recruit_wear' or
			data.current.value == 'officer_wear' or
			data.current.value == 'sergeant_wear' or
			data.current.value == 'recruit2_wear' or
			data.current.value == 'intendent_wear' or
			data.current.value == 'lieutenant_wear' or
			data.current.value == 'chef_wear' or
			data.current.value == 'boss_wear' or
			data.current.value == 'szeryf_wear' or
			data.current.value == 'detektyw_wear' or
			data.current.value == 'sierzant_wear' or
			data.current.value == 'posterunkowy_wear' or
			data.current.value == 'kask_wear' or
			data.current.value == 'bullet_wear' or
			data.current.value == 'highwaykamzkulodoporna_wear' or
			data.current.value == 'gilet_wear'
		then
			setUniform(data.current.value, playerPed)
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
				end)
      end)
    end
      
      if
        data.current.value == 'sheriff_wear_freemode' or
        data.current.value == 'lieutenant_wear_freemode' or
        data.current.value == 'commandant_wear_freemode'
      then
        local model = nil
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          if skin.sex == 0 then
            model = GetHashKey(data.current.maleModel)
          else
            model = GetHashKey(data.current.femaleModel)
          end
        end)
      
        RequestModel(model)
        while not HasModelLoaded(model) do
          RequestModel(model)
          Citizen.Wait(1000)
        end
      
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
      end

      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}

    end,
    function(data, menu)
      menu.close()
      CurrentAction     = 'menu_cloakroom'
      CurrentActionMsg  = _U('open_cloackroom')
      CurrentActionData = {}
    end
  )
end

function OpenArmoryMenu(station)
	local grade = PlayerData.job.grade_name
	if Config.EnableArmoryManagement then

		local elements = {
			{label =   '<span style =color:red>Wprowadzanie Pieniędzy w Obieg.</b>', value = 'wymiana'},
			{label = _U('put_weapon'),     value = 'put_weapon'},
			{label = _U('deposit_object'), value = 'put_stock'},
		}
	if grade == 'sergeant'  then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'lieutenant' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'sergeant2' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'intendent2' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'chef2' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = ('Kup Przedmioty'), value = 'zestaw'})
	elseif grade == 'chef' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = ('Wez przedmioty'), value = 'zestaw'})
	elseif grade == 'zastepca' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
		table.insert(elements, {label = ('Kup Przedmioty'), value = 'zestaw'})
		table.insert(elements, {label = 'Nadaj Odznake', value = '12313131'})
	elseif grade == 'intendent' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'detektyw' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'sierzant' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	elseif grade == 'boss' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
		table.insert(elements, {label = _U('buy_weapons'), value = 'buy_weapons'})
		table.insert(elements, {label = ('Kup Przedmioty'), value = 'zestaw'})
		table.insert(elements, {label = 'Nadaj Odznake', value = '12313131'})
	elseif grade == 'agent' then
		table.insert(elements, {label = _U('get_weapon'),     value = 'get_weapon'})
		table.insert(elements, {label = _U('remove_object'),  value = 'get_stock'})
	end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'get_weapon' then
				OpenGetWeaponMenu()
			elseif data.current.value == 'put_weapon' then
				OpenPutWeaponMenu()
			elseif data.current.value == 'buy_weapons' then
				OpenBuyWeaponsMenu(station)
			elseif data.current.value == 'put_stock' then
				OpenPutStocksMenu()
			elseif data.current.value == 'get_stock' then
				OpenGetStocksMenu()
			elseif data.current.value == 'zestaw' then
				OpenZestawMenu()
			elseif data.current.value == 'wymiana' then
				MenuWymianyPieniedzy()
			elseif data.current.value == '12313131' then
				OpenPoliceKarakany()
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionMsg  = _U('open_armory')
			CurrentActionData = {station = station}
		end)

	else

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]

			table.insert(elements, {
				label = ESX.GetWeaponLabel(weapon.name),
				value = weapon.name
			})
		end

		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory',
		{
			title    = _U('armory'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			local weapon = data.current.value
			TriggerServerEvent('esx_policejob:giveWeapon', weapon, 100)
		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_armory'
			CurrentActionMsg  = _U('open_armory')
			CurrentActionData = {station = station}
		end)

	end

end


function OpenLodzieSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']',
					value = garageVehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lodzie_spawner',
			{
				title    = ('Garaz Lodzi'),
				align    = 'center',
				elements = elements
			}, function(data, menu)
				menu.close()

				local vehicleProps = data.current.value
				local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint1(station, partNum)

				if foundSpawnPoint then
					ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint, spawnPoint.heading, function(vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'police', vehicleProps)
				end
			end, function(data, menu)
				menu.close()

				CurrentAction     = 'menu_lodzie_spawner'
				CurrentActionMsg  = ('Garaz Lodzi')
				CurrentActionData = {station = station, partNum = partNum}
			end)

		end, 'police')

	else

		local elements = {}

		local sharedVehicles1 = Config.AutoryzowaneLodzie.Shared
		for i=1, #sharedVehicles1, 1 do
			table.insert(elements, { label = sharedVehicles1[i].label, model = sharedVehicles1[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'lodzie_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint1(station, partNum)

			if foundSpawnPoint then
				if Config.MaxInService == -1 then
					ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						SetVehicleMaxMods(vehicle)
						--TriggerServerEvent("esx_policejob:maxmodsvehicle", vehicle)
					end)
				else

					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)

						if isInService then
							ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
								TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								SetVehicleMaxMods(vehicle)
								--TriggerServerEvent("esx_policejob:maxmodsvehicle", vehicle)
							end)
						else
							ESX.ShowNotification(_U('service_not'))
						end

					end, 'police')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_lodzie_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

	end
end

function OpenHelicopterSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()


		local elements = {}

		local sharedVehicles2 = Config.AutoryzowaneHelicopters.Shared
		for i=1, #sharedVehicles2, 1 do
			table.insert(elements, { label = sharedVehicles2[i].label, model = sharedVehicles2[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'helicopters_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			menu.close()

		local helicopters = Config.PoliceStations[station].Helicopters

		if not IsAnyVehicleNearPoint(helicopters[partNum].SpawnPoint.x, helicopters[partNum].SpawnPoint.y, helicopters[partNum].SpawnPoint.z,  3.0) then
			ESX.Game.SpawnVehicle(data.current.model, helicopters[partNum].SpawnPoint, helicopters[partNum].Heading, function(vehicle)
				TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, 0)
			end)
		else
			ESX.ShowNotification("Cos blokuje wylot.")
		end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_helicopter_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

end

function OpenVehicleSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

		local elements = {}
		local elements2 = {}

		local TypyAut = Config.TypyAut.Shared
		for i=1, #TypyAut, 1 do
			table.insert(elements, {  type = TypyAut[i].type, label = TypyAut[i].label, value = TypyAut[i].type})
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title    = _U('vehicle_menu'),
			align    = 'center',
			elements = elements
		}, function(data, menu)
			
			if not next(elements2) then
				local sharedVehicles = Config.AuthorizedVehicles.Shared
				for i=1, #sharedVehicles, 1 do
					if sharedVehicles[i].type == data.current.value then
						print(data.current.value)
						table.insert(elements2, { label = sharedVehicles[i].label, model = sharedVehicles[i].model, type = sharedVehicles[i].type})
					end
				end
				local AuthorizedVehicles = Config.AuthorizedVehicles[PlayerData.job.grade_name]
				for i=1, #AuthorizedVehicles, 1 do
					if AuthorizedVehicles[i].type == data.current.value then
						print(data.current.value)
						table.insert(elements2, { label = AuthorizedVehicles[i].label, model = AuthorizedVehicles[i].model, type = AuthorizedVehicles[i].type})
					end
				end
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner2',{
			title    = data.current.label..'',
			align    = 'center',
			elements = elements2
		}, function(data2, menu2)
			menu2.close()
			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

			if foundSpawnPoint then
				ESX.Game.SpawnVehicle(data2.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
					TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
						SetVehicleMaxMods(vehicle)
				end)
			end

		end, function(data2, menu2)
			menu2.close()
			elements2 = {}
			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

		end, function(data, menu)
			menu.close()
			
			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

end

--[[function OpenVehicleSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	if Config.EnableSocietyOwnedVehicles then

		local elements = {}

		ESX.TriggerServerCallback('esx_society:getVehiclesInGarage', function(garageVehicles)

			for i=1, #garageVehicles, 1 do
				table.insert(elements, {
					label = GetDisplayNameFromVehicleModel(garageVehicles[i].model) .. ' [' .. garageVehicles[i].plate .. ']',
					value = garageVehicles[i]
				})
			end

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
			{
				title    = _U('vehicle_menu'),
				align    = 'center',
				elements = elements
			}, function(data, menu)
				menu.close()

				local vehicleProps = data.current.value
				local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

				if foundSpawnPoint then
					ESX.Game.SpawnVehicle(vehicleProps.model, spawnPoint, spawnPoint.heading, function(vehicle)
						ESX.Game.SetVehicleProperties(vehicle, vehicleProps)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
					end)

					TriggerServerEvent('esx_society:removeVehicleFromGarage', 'police', vehicleProps)
				end
			end, function(data, menu)
				menu.close()

				CurrentAction     = 'menu_vehicle_spawner'
				CurrentActionMsg  = _U('vehicle_spawner')
				CurrentActionData = {station = station, partNum = partNum}f
			end)

		end, 'police')

	else

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

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)

			if foundSpawnPoint then
				if Config.MaxInService == -1 then
					ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
						TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								SetVehicleMaxMods(vehicle)
								--TriggerServerEvent("esx_policejob:maxmodsvehicle", vehicle)
					end)
				else

					ESX.TriggerServerCallback('esx_service:isInService', function(isInService)

						if isInService then
							ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
								TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
								SetVehicleMaxMods(vehicle)
								--TriggerServerEvent("esx_policejob:maxmodsvehicle", vehicle)
							end)
						else
							ESX.ShowNotification(_U('service_not'))
						end

					end, 'police')
				end
			end

		end, function(data, menu)
			menu.close()

			CurrentAction     = 'menu_vehicle_spawner'
			CurrentActionMsg  = _U('vehicle_spawner')
			CurrentActionData = {station = station, partNum = partNum}
		end)

	end
end]]--

function GetAvailableVehicleSpawnPoint2(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Helicopters[partNum].SpawnPoint
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

function GetAvailableVehicleSpawnPoint1(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Lodzie[partNum].SpawnPoints
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

function GetAvailableVehicleSpawnPoint(station, partNum)
	local spawnPoints = Config.PoliceStations[station].Vehicles[partNum].SpawnPoints
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

function OpenPoliceActionsMenu()
	local grade = PlayerData.job.grade_name
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions',
	{
		title    = 'Menu policyjne',
		align    = 'center',
		elements = {
			{label = _U('citizen_interaction'),	value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'),	value = 'vehicle_interaction'},
			{label = _U('object_spawner'),		value = 'object_spawner'},
			{label = "Menu Wiezienia",               value = 'jail_menu'}
		}
	}, function(data, menu)

		if data.current.value == 'jail_menu' then
			TriggerEvent("esx-qalle-jail:openJailMenu")
end

		if data.current.value == 'citizen_interaction' then
			local elements = {
				{label = _U('id_card'),			value = 'identity_card'},
				{label = _U('search'),			value = 'body_search'},
				{label = _U('handcuff'),		value = 'handcuff'},
				{label = _U('drag'),			value = 'drag'},
				{label = _U('put_in_vehicle'),	value = 'put_in_vehicle'},
				{label = _U('out_the_vehicle'),	value = 'out_the_vehicle'},
				{label = _U('revive player'),   value = 'revive'},
				{label = _U('license_check'),  value = 'license' },
				{label = "Test prochu",			value = 'gsr_test'},
				{label = _U('Prace Spoleczne'),	value = 'communityservice'}
			}
		
			if grade == 'lieutenant' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
				elseif grade == 'intendent' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
			elseif grade == 'intendent2' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
			elseif grade == 'chef2' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
				elseif grade == 'chef' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
				
				elseif grade == 'zastepca' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
				elseif grade == 'boss' then
				table.insert(elements, { label = ('Daj licencje'), value = 'dajlicense' })
			end
			
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('citizen_interaction'),
				align    = 'center',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value
					
					if action == 'revive' then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					local closestPlayerPed = GetPlayerPed(closestPlayer)
					local health = GetEntityHealth(closestPlayerPed)
					if health == 0 then
					local playerPed = GetPlayerPed(-1)
					Citizen.CreateThread(function()
					ESX.ShowNotification(_U('revive_inprogress'))
									local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'

					for i=1, 15, 1 do
						Citizen.Wait(900)
								
						ESX.Streaming.RequestAnimDict(lib, function()
							TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
						end)
					end
					ClearPedTasks(playerPed)
					if GetEntityHealth(closestPlayerPed) == 0 then
						TriggerServerEvent('esx_ambulancejob:revive3', GetPlayerServerId(closestPlayer))
					else
						ESX.ShowNotification(_U('isdead'))
								end
							end)
						end
					elseif action == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)
					elseif action == 'gsr_test' then
						if IsPedCuffed(GetPlayerPed(closestPlayer)) then
						  ESX.ShowNotification("~y~Sprawdzanie dłoni pod kątem prochu...")
						  Citizen.Wait(1000)
						  TriggerServerEvent('GSR:Status2', GetPlayerServerId(closestPlayer))
						else
						  ESX.ShowNotification("~r~Najpierw musisz zakuć obywatela.")
						end
					elseif action == 'communityservice' then
						SendToCommunityService(GetPlayerServerId(closestPlayer))
				

					elseif action == 'body_search' then
						TriggerServerEvent('esx_policejob:przeszukuje')
						TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Jesteś przeszukiwany przez : ~b~') .. GetPlayerServerId(PlayerId()))
						ESX.ShowNotification(('Przeszukujesz : ~b~') .. GetPlayerServerId(closestPlayer))
						OpenBodySearchMenu(closestPlayer)
						
					elseif action == 'handcuff' and not isDead and not IsHandcuffed and not IsDragged  and not IsEntityDead(GetPlayerPed(-1)) and not IsPedFalling(GetPlayerPed(-1)) and not IsPedCuffed(GetPlayerPed(-1)) and not IsPedDiving(GetPlayerPed(-1)) and not IsPedInCover(GetPlayerPed(-1), false) and not IsPedInParachuteFreeFall(GetPlayerPed(-1)) and (GetPedParachuteState(GetPlayerPed(-1)) == 0 or GetPedParachuteState(GetPlayerPed(-1)) == -1) and not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then 
						if (GetEntitySpeed(GetPlayerPed(-1)) > 0.5 or GetEntitySpeed(dupa) > 0.5) then
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
					elseif action == 'license' then
						ShowPlayerLicense(closestPlayer)
		
					elseif action == 'dajlicense' then 
						ESX.TriggerServerCallback('esx_license:checkLicense', function(malicencje)
							if malicencje then
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.ShowNotification(('Ma juz licencje : ~b~') .. GetPlayerServerId(closestPlayer))
							else
							TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'weapon', 999)
							TriggerServerEvent('esx_policejob:buyLicense', GetPlayerServerId(closestPlayer))
							end
						end, GetPlayerServerId(closestPlayer), 'weapon')
						else
							ESX.ShowNotification("Obywatel "..GetPlayerServerId(closestPlayer).." Nie ma zaswiadczenia od psychologa.")
						end
						end, GetPlayerServerId(closestPlayer), 'psycholog')
					end

				else
					ESX.ShowNotification(_U('no_players_nearby'))
				end				
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == 'vehicle_interaction' then
			local elements  = {}
			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local vehicle   = ESX.Game.GetVehicleInDirection()
			
			if DoesEntityExist(vehicle) then
				--table.insert(elements, {label = _U('vehicle_info'),	value = 'vehicle_infos'})
				table.insert(elements, {label = _U('pick_lock'),	value = 'hijack_vehicle'})
			end
			
			--table.insert(elements, {label = _U('search_database'), value = 'search_database'})

			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'vehicle_interaction',
			{
				title    = _U('vehicle_interaction'),
				align    = 'center',
				elements = elements
			}, function(data2, menu2)
				coords  = GetEntityCoords(playerPed)
				vehicle = ESX.Game.GetVehicleInDirection()
				action  = data2.current.value
				
				if action == 'search_database' then
					LookupVehicle()
				elseif DoesEntityExist(vehicle) then
					local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
					if action == 'vehicle_infos' then
						OpenVehicleInfosMenu(vehicleData)
						
					elseif action == 'hijack_vehicle' then
						if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
							TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
							Citizen.Wait(20000)
							ClearPedTasksImmediately(playerPed)

							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ESX.ShowNotification(_U('vehicle_unlocked'))
						end
					end
				else
					ESX.ShowNotification(_U('no_vehicles_nearby'))
				end

			end, function(data2, menu2)
				menu2.close()
			end)

		elseif data.current.value == 'object_spawner' then
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('traffic_interaction'),
				align    = 'center',
				elements = {
					{label = _U('cone'),		value = 'prop_roadcone02a'},
					{label = _U('barrier'),		value = 'prop_barrier_work05'},
					{label = _U('spikestrips'),	value = 'p_ld_stinger_s'}
				}
			}, function(data2, menu2)
				local playerPed = PlayerPedId()
				local coords    = GetEntityCoords(playerPed)
				local forward   = GetEntityForwardVector(playerPed)
				local x, y, z   = table.unpack(coords + forward * 1.0)

				local model     = data2.current.value
				if model == 'prop_roadcone02a' then
					z = z - 1.0
				end

				ESX.Game.SpawnObject(model, {
					x = x,
					y = y,
					z = z
				}, function(obj)
					SetEntityHeading(obj, GetEntityHeading(playerPed))
          PlaceObjectOnGroundProperly(obj)
          if model == 'prop_barrier_work05' then
						FreezeEntityPosition(obj, true)
					end
				end)

			end, function(data2, menu2)
				menu2.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenIdentityCardMenu(player)

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

		local elements    = {}
		local nameLabel   = _U('name', data.name)
		local jobLabel    = nil
		local sexLabel    = nil
		local dobLabel    = nil
		local heightLabel = nil
		local idLabel     = nil
	
		if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
			jobLabel = _U('job', data.job.label .. ' - ' .. data.job.grade_label)
		else
			jobLabel = _U('job', data.job.label)
		end
	
		if Config.EnableESXIdentity then
	
			nameLabel = _U('name', data.firstname .. ' ' .. data.lastname)
	
			if data.sex ~= nil then
				if string.lower(data.sex) == 'm' then
					sexLabel = _U('sex', _U('male'))
				else
					sexLabel = _U('sex', _U('female'))
				end
			else
				sexLabel = _U('sex', _U('unknown'))
			end
	
			if data.dob ~= nil then
				dobLabel = _U('dob', data.dob)
			else
				dobLabel = _U('dob', _U('unknown'))
			end
	
			if data.height ~= nil then
				heightLabel = _U('height', data.height)
			else
				heightLabel = _U('height', _U('unknown'))
			end
	
			if data.name ~= nil then
				idLabel = _U('id', data.name)
			else
				idLabel = _U('id', _U('unknown'))
			end
	
		end
	
		local elements = {
			{label = nameLabel, value = nil},
		--	{label = jobLabel,  value = nil},
		}
	
		if Config.EnableESXIdentity then
			table.insert(elements, {label = sexLabel, value = nil})
			table.insert(elements, {label = dobLabel, value = nil})
			table.insert(elements, {label = heightLabel, value = nil})
			table.insert(elements, {label = idLabel, value = nil})
		end

			table.insert(elements, {label = _U('bac', data.drunk), value = nil})
	
		if data.licenses ~= nil then
	
			table.insert(elements, {label = _U('license_label'), value = nil})
	
			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label, value = nil})
			end
	
		end
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
		{
			title    = _U('citizen_interaction'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)
	
		end, function(data, menu)
			menu.close()
		end)
	
	end, GetPlayerServerId(player))

end

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

		table.insert(elements, {label = _U('guns_label'), value = nil})

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

		table.insert(elements, {label = _U('inventory_label'), value = nil})

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
					Citizen.Wait(2000)
					TriggerServerEvent('esx_policejob:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
					Citizen.Wait(100)
					OpenBodySearchMenu(player)
				else
					ESX.UI.Menu.CloseAll()
					ESX.ShowNotification("Obywatel jest za daleko, przestajesz przeszukiwać.")
				end
			end

			end, function(data, menu)
				menu.close()
				ESX.ShowNotification('~y~Przestajesz przeszukiwać')
				TriggerServerEvent('esx_policejob:nieprzeszukuje')
			end)

		end, GetPlayerServerId(player))
	else
		ESX.UI.Menu.CloseAll()
		ESX.ShowNotification("Obywatel jest za daleko, przestajesz przeszukiwać.")
	end
end

function LookupVehicle()
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'lookup_vehicle',
	{
		title = _U('search_database_title'),
	}, function(data, menu)
		local length = string.len(data.value)
		if data.value == nil or length < 2 or length > 13 then
			ESX.ShowNotification(_U('search_database_error_invalid'))
		else
			ESX.TriggerServerCallback('esx_policejob:getVehicleFromPlate', function(owner, found)
				if found then
					ESX.ShowNotification(_U('search_database_found', owner))
				else
					ESX.ShowNotification(_U('search_database_error_not_found'))
				end
			end, data.value)
			menu.close()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function ShowPlayerLicense(player)
	local elements = {}
	local targetName
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		if data.licenses ~= nil then
			for i=1, #data.licenses, 1 do
				if data.licenses[i].label ~= nil and data.licenses[i].type ~= nil then
					table.insert(elements, {label = data.licenses[i].label, value = data.licenses[i].type})
				end
			end
		end
		
		if Config.EnableESXIdentity then
			targetName = data.firstname .. ' ' .. data.lastname
		else
			targetName = data.name
		end
		
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_license',
		{
			title    = _U('license_revoke'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)
			ESX.ShowNotification(_U('licence_you_revoked', data.current.label, targetName))
			TriggerServerEvent('esx_policejob:message', GetPlayerServerId(player), _U('license_revoked', data.current.label))
			
			TriggerServerEvent('esx_license:removeLicense', GetPlayerServerId(player), data.current.value)
			
			ESX.SetTimeout(300, function()
				ShowPlayerLicense(player)
			end)
		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))
end

function OpenVehicleInfosMenu(vehicleData)

	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(retrivedInfo)

		local elements = {}

		table.insert(elements, {label = _U('plate', retrivedInfo.plate), value = nil})

		if retrivedInfo.owner == nil then
			table.insert(elements, {label = _U('owner_unknown'), value = nil})
		else
			table.insert(elements, {label = _U('owner', retrivedInfo.owner), value = nil})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_infos',
		{
			title    = _U('vehicle_info'),
			align    = 'center',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)

	end, vehicleData.plate)

end

function OpenGetWeaponMenu()

	ESX.TriggerServerCallback('esx_policejob:getArmoryWeaponsupdated', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == 'snspistol' or weapons[i].name == 'pistol' or weapons[i].name == 'combatpistol' or weapons[i].name == 'vintagepistol' or weapons[i].name == 'pistol_mk2' or  weapons[i].name == 'snspistol_mk2' or weapons[i].name == 'revolver' or weapons[i].name == 'pistol50' or weapons[i].name == 'heavypistol'
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
		  ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
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

		ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
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
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}

		for i=1, #items, 1 do
		if items[i].count > 0  and (items[i].name ~= 'snspistol' and items[i].name ~= 'pistol' and items[i].name ~= 'combatpistol' and items[i].name ~= 'vintagepistol' and items[i].name ~= 'pistol_mk2' and  items[i].name ~= 'snspistol_mk2' and items[i].name ~= 'revolver' and items[i].name ~= 'pistol50' and items[i].name ~= 'heavypistol'
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
					TriggerServerEvent('esx_policejob:getStockItem',itemName, count)

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
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
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
					TriggerServerEvent('esx_policejob:putStockItems', itemName, count)
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

function OpenBuyWeaponsMenu(station)

	ESX.TriggerServerCallback('esx_policejob:getArmoryWeaponsupdated', function(weapons)

		local elements = {}

		for i=1, #Config.PoliceStations[station].AuthorizedWeapons, 1 do
			local weapon = Config.PoliceStations[station].AuthorizedWeapons[i]
			local count  = 0

			for i=1, #weapons, 1 do
				if weapons[i].name == weapon.name then
					count = weapons[i].count
					break
				end
			end

			local gowno  = string.upper(weapon.name)
			local nazwabroni = 'WEAPON_'..gowno
			if weapon.name == 'parachute'then
				nazwabroni = 'GADGET_'..gowno
			end
			table.insert(elements, {
				label = 'x' .. count .. ' <span style = color:gold>' .. ESX.GetWeaponLabel(nazwabroni) .. '</span> <span style = color:green>' .. ESX.Math.GroupDigits(weapon.price) .. ' $ </span>',
				mefedron = ESX.GetWeaponLabel(nazwabroni),
				value = weapon.name,
				price = weapon.price
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_buy_weapons',
		{
			title    = _U('buy_weapon_menu'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)

			ESX.TriggerServerCallback('esx_policejob:buy', function(hasEnoughMoney)
				if hasEnoughMoney then
					ESX.TriggerServerCallback('esx_policejob:buyWeapon', function()
					end, data.current.value, data.current.mefedron, data.current.price)
				 	OpenBuyWeaponsMenu(station)
				else
					ESX.ShowNotification(_U('not_enough_money'))
				end
			end, data.current.price)

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenZestawMenu()


	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'zestaw',
	{
		title		= ('Magazyn przedmiotów'),
		align		= 'center',
		elements = {
			{label = 'Kup Zestaw Naprawczy - <span style = color:green> 1000$</span>', label2 ='Zestawy Naprawcze', value = 'fixkit' , price = 1000},
			{label = 'Kup Magazynek 9mm - <span style = color:green> 500$</span>', label2 = 'Magazynek 9mm', value = 'pistol_ammo_box' , price = 500},
			{label = 'Kup Latarke - <span style = color:green> 500$</span>', label2 = 'Latarka', value = 'flashlight' , price = 500},
			{label = 'Kup Tlumik - <span style = color:green> 3000$</span>', label2 = 'Tłumik', value = 'silencieux' , price = 3000},
			{label = 'Kup GPS LPSD - <span style = color:green> 2500$</span>', label2 = 'Policyjny GPS', value = 'gpslspd' , price = 2500},
			{label = 'Kup Radio - <span style = color:green> 2500$</span>', label2 = 'Radio', value = 'radio2' , price = 2500},
			{label = 'Kup GoPro - <span style = color:green> 2500$</span>',label2 = 'GoPro', value = 'gopro' , price = 2500},
			{label = 'Kup Redbullka - <span style = color:green> 100$</span>', label2 = 'Redbull', value = 'redgull' , price = 100},
			{label = 'Kup Maska tlenowa - <span style = color:green> 1250$</span>', label2 = 'Maska tlenowa', value = 'oxygen_mask' , price = 1250}
		}


	}, function(data, menu)
		TriggerServerEvent('esx_policejob:giveItem', data.current.value, data.current.price)
		ESX.ShowNotification('Do magazynu ~b~LSPD~s~ został* zakupion* ~o~'.. data.current.label2 .. "~s~ za cenę ~g~" .. data.current.price .." $")
	end, function(data, menu)
		menu.close()
	end)
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(500)
	if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
		odswiezblipypracownika()
		TriggerServerEvent('badBlips:server:getplayersonclientstart', GetPlayerServerId(PlayerId()))
	end
end)

RegisterNetEvent('esx_phone:loaded')
AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	local specialContact = {
		name       = _U('phone_police'),
		number     = 'police',
		base64Icon = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFGQTJDRkI0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFGQTJDRkM0QUJCMTFFN0JBNkQ5OENBMUI4QUEzM0YiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUZBMkNGOTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUZBMkNGQTRBQkIxMUU3QkE2RDk4Q0ExQjhBQTMzRiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PoW66EYAAAjGSURBVHjapJcLcFTVGcd/u3cfSXaTLEk2j80TCI8ECI9ABCyoiBqhBVQqVG2ppVKBQqUVgUl5OU7HKqNOHUHU0oHamZZWoGkVS6cWAR2JPJuAQBPy2ISEvLN57+v2u2E33e4k6Ngz85+9d++95/zP9/h/39GpqsqiRYsIGz8QZAq28/8PRfC+4HT4fMXFxeiH+GC54NeCbYLLATLpYe/ECx4VnBTsF0wWhM6lXY8VbBE0Ch4IzLcpfDFD2P1TgrdC7nMCZLRxQ9AkiAkQCn77DcH3BC2COoFRkCSIG2JzLwqiQi0RSmCD4JXbmNKh0+kc/X19tLtc9Ll9sk9ZS1yoU71YIk3xsbEx8QaDEc2ttxmaJSKC1ggSKBK8MKwTFQVXRzs3WzpJGjmZgvxcMpMtWIwqsjztvSrlzjYul56jp+46qSmJmMwR+P3+4aZ8TtCprRkk0DvUW7JjmV6lsqoKW/pU1q9YQOE4Nxkx4ladE7zd8ivuVmJQfXZKW5dx5EwPRw4fxNx2g5SUVLw+33AkzoRaQDP9SkFu6OKqz0uF8yaz7vsOL6ycQVLkcSg/BlWNsjuFoKE1knqDSl5aNnmPLmThrE0UvXqQqvJPyMrMGorEHwQfEha57/3P7mXS684GFjy8kreLppPUuBXfyd/ibeoS2kb0mWPANhJdYjb61AxUvx5PdT3+4y+Tb3mTd19ZSebE+VTXVGNQlHAC7w4VhH8TbA36vKq6ilnzlvPSunHw6Trc7XpZ14AyfgYeyz18crGN1Alz6e3qwNNQSv4dZox1h/BW9+O7eIaEsVv41Y4XeHJDG83Nl4mLTwzGhJYtx0PzNTjOB9KMTlc7Nkcem39YAGU7cbeBKVLMPGMVf296nMd2VbBq1wmizHoqqm/wrS1/Zf0+N19YN2PIu1fcIda4Vk66Zx/rVi+jo9eIX9wZGGcFXUMR6BHUa76/2ezioYcXMtpyAl91DSaTfDxlJbtLprHm2ecpObqPuTPzSNV9yKz4a4zJSuLo71/j8Q17ON69EmXiPIlNMe6FoyzOqWPW/MU03Lw5EFcyKghTrNDh7+/vw545mcJcWbTiGKpRdGPMXbx90sGmDaux6sXk+kimjU+BjnMkx3kYP34cXrFuZ+3nrHi6iDMt92JITcPjk3R3naRwZhpuNSqoD93DKaFVU7j2dhcF8+YzNlpErbIBTVh8toVccbaysPB+4pMcuPw25kwSsau7BIlmHpy3guaOPtISYyi/UkaJM5Lpc5agq5Xkcl6gIHkmqaMn0dtylcjIyPThCNyhaXyfR2W0I1our0v6qBii07ih5rDtGSOxNVdk1y4R2SR8jR/g7hQD9l1jUeY/WLJB5m39AlZN4GZyIQ1fFJNsEgt0duBIc5GRkcZF53mNwIzhXPDgQPoZIkiMkbTxtstDMVnmFA4cOsbz2/aKjSQjev4Mp9ZAg+hIpFhB3EH5Yal16+X+Kq3dGfxkzRY+KauBjBzREvGN0kNCTARu94AejBLMHorAQ7cEQMGs2cXvkWshYLDi6e9l728O8P1XW6hKeB2yv42q18tjj+iFTGoSi+X9jJM9RTxS9E+OHT0krhNiZqlbqraoT7RAU5bBGrEknEBhgJks7KXbLS8qERI0ErVqF/Y4K6NHZfLZB+/wzJvncacvFd91oXO3o/O40MfZKJOKu/rne+mRQByXM4lYreb1tUnkizVVA/0SpfpbWaCNBeEE5gb/UH19NLqEgDF+oNDQWcn41Cj0EXFEWqzkOIyYekslFkThsvMxpIyE2hIc6lXGZ6cPyK7Nnk5OipixRdxgUESAYmhq68VsGgy5CYKCUAJTg0+izApXne3CJFmUTwg4L3FProFxU+6krqmXu3MskkhSD2av41jLdzlnfFrSdCZxyqfMnppN6ZUa7pwt0h3fiK9DCt4IO9e7YqisvI7VYgmNv7mhBKKD/9psNi5dOMv5ZjukjsLdr0ffWsyTi6eSlfcA+dmiVyOXs+/sHNZu3M6PdxzgVO9GmDSHsSNqmTz/R6y6Xxqma4fwaS5Mn85n1ZE0Vl3CHBER3lUNEhiURpPJRFdTOcVnpUJnPIhR7cZXfoH5UYc5+E4RzRH3sfSnl9m2dSMjE+Tz9msse+o5dr7UwcQ5T3HwlWUkNuzG3dKFSTbsNs7m/Y8vExOlC29UWkMJlAxKoRQMR3IC7x85zOn6fHS50+U/2Untx2R1voinu5no+DQmz7yPXmMKZnsu0wrm0Oe3YhOVHdm8A09dBQYhTv4T7C+xUPrZh8Qn2MMr4qcDSRfoirWgKAvtgOpv1JI8Zi77X15G7L+fxeOUOiUFxZiULD5fSlNzNM62W+k1yq5gjajGX/ZHvOIyxd+Fkj+P092rWP/si0Qr7VisMaEWuCiYonXFwbAUTWWPYLV245NITnGkUXnpI9butLJn2y6iba+hlp7C09qBcvoN7FYL9mhxo1/y/LoEXK8Pv6qIC8WbBY/xr9YlPLf9dZT+OqKTUwfmDBm/GOw7ws4FWpuUP2gJEZvKqmocuXPZuWYJMzKuSsH+SNwh3bo0p6hao6HeEqwYEZ2M6aKWd3PwTCy7du/D0F1DsmzE6/WGLr5LsDF4LggnYBacCOboQLHQ3FFfR58SR+HCR1iQH8ukhA5s5o5AYZMwUqOp74nl8xvRHDlRTsnxYpJsUjtsceHt2C8Fm0MPJrphTkZvBc4It9RKLOFx91Pf0Igu0k7W2MmkOewS2QYJUJVWVz9VNbXUVVwkyuAmKTFJayrDo/4Jwe/CT0aGYTrWVYEeUfsgXssMRcpyenraQJa0VX9O3ZU+Ma1fax4xGxUsUVFkOUbcama1hf+7+LmA9juHWshwmwOE1iMmCFYEzg1jtIm1BaxW6wCGGoFdewPfvyE4ertTiv4rHC73B855dwp2a23bbd4tC1hvhOCbX7b4VyUQKhxrtSOaYKngasizvwi0RmOS4O1QZf2yYfiaR+73AvhTQEVf+rpn9/8IMAChKDrDzfsdIQAAAABJRU5ErkJggg=='
	}

	TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
end)

-- don't show dispatches if the player isn't in service
AddEventHandler('esx_phone:cancelMessage', function(dispatchNumber)
	if type(PlayerData.job.name) == 'string' and PlayerData.job.name == 'police' and PlayerData.job.name == dispatchNumber then
		-- if esx_service is enabled
		if Config.MaxInService ~= -1 and not playerInService then
			CancelEvent()
		end
	end
end)


AddEventHandler('esx_policejob:hasEnteredMarker', function(station, part, partNum)

	if part == 'Cloakroom' then
		CurrentAction     = 'menu_cloakroom'
		CurrentActionMsg  = _U('open_cloackroom')
		CurrentActionData = {}

	elseif part == 'Armory' then

		CurrentAction     = 'menu_armory'
		CurrentActionMsg  = _U('open_armory')
		CurrentActionData = {station = station} 

	elseif part == 'LodzieSpawner' then

		CurrentAction     = 'menu_lodzie_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'VehicleSpawner' then

		CurrentAction     = 'menu_vehicle_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'HelicopterSpawner' then

		CurrentAction     = 'menu_helicopter_spawner'
		CurrentActionMsg  = _U('vehicle_spawner')
		CurrentActionData = {station = station, partNum = partNum}

	elseif part == 'VehicleDeleter' then

		local playerPed = PlayerPedId()

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

AddEventHandler('esx_policejob:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

AddEventHandler('esx_policejob:hasEnteredEntityZone', function(entity)
	local playerPed = PlayerPedId()

	if PlayerData.job ~= nil and PlayerData.job.name == 'police' and IsPedOnFoot(playerPed) then
		CurrentAction     = 'remove_entity'
		CurrentActionMsg  = _U('remove_prop')
		CurrentActionData = {entity = entity}
	end

	if GetEntityModel(entity) == GetHashKey('p_ld_stinger_s') then
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle = GetVehiclePedIsIn(playerPed)

			for i=0, 7, 1 do
				SetVehicleTyreBurst(vehicle, i, true, 1000)
			end
		end
	end
end)

AddEventHandler('esx_policejob:hasExitedEntityZone', function(entity)
	if CurrentAction == 'remove_entity' then
		CurrentAction = nil
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

RegisterNetEvent('esx_policejob:handcuff')
AddEventHandler('esx_policejob:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()
  SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player

	Citizen.CreateThread(function()
		if IsHandcuffed then
      local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
      local dupa = GetPlayerPed(closestPlayer)
      local xd11 = GetEntityHeading(GetPlayerPed(-1))
      local xd22 = GetEntityHeading(dupa)
      local roznica = math.abs(xd11 - xd22)



      if roznica > 90 then
			ClearPedTasks(playerPed)
			loadAnimDict('rcmme_amanda1')
  			TaskPlayAnim(playerPed, 'rcmme_amanda1', 'stand_loop_ama', 8.0, 3.0, -1, 50, 0, 0, 0, 0)


			SetEnableHandcuffs(playerPed, true)
  			DisablePlayerFiring(playerPed, true)

  			SetPedCanPlayGestureAnims(playerPed, true)

			odprzodu = true
  	



	
      elseif not FastHandcuffed then
			ClearPedTasks(playerPed)
			loadAnimDict('mp_arresting')
  			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 3.0, -1, 50, 0, 0, 0, 0)
			SetEnableHandcuffs(playerPed, true)
  			DisablePlayerFiring(playerPed, true)

  			SetPedCanPlayGestureAnims(playerPed, true)

			odtylu = true



      end
		else

			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			odprzodu = false
			odtylu = false
			FastHandcuffed = false
		end
	end)

end)

RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		ClearPedTasks(playerPed)
		odprzodu = false
		odtylu = false
		FastHandcuffed = false

	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copID)
	if not IsHandcuffed then
		return
	end

	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
end)


Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if DragStatus.IsDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))

				-- undrag if target is in an vehicle
				if not IsPedSittingInAnyVehicle(targetPed) then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				else
					DragStatus.IsDragged = true
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
			local freeSeat = nil

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat ~= nil then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				DragStatus.IsDragged = false
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

-- Handcuff
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        local playerPed = PlayerPedId()
 
        if IsHandcuffed then
            DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(2, Keys['R'], true) -- Reload
            DisableControlAction(2, Keys['SPACE'], true) -- Jump
            DisableControlAction(2, Keys['Q'], true) -- Cover
            DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
            DisableControlAction(2, Keys['E'], true) -- Select Weapon
            DisableControlAction(2, Keys['F1'], true) -- Disable phone
            DisableControlAction(2, Keys['F2'], true) -- Inventory
            DisableControlAction(2, Keys['F3'], true) -- Animations
            DisableControlAction(2, Keys['F6'], true) -- Animations
            DisableControlAction(2, Keys['X'], true) -- Disable clearing animation
            --DisableControlAction(2, Keys['P'], true) -- Disable pause screen
            DisableControlAction(2, Keys['F9'], true) -- Disable pause screen
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
			if odtylu then
            if not (IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) == 1) then
                ESX.Streaming.RequestAnimDict('mp_arresting', function()
                    TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
                end)
            end
			elseif odprzodu then
            if not (IsEntityPlayingAnim(playerPed, 'rcmme_amanda1', 'stand_loop_ama', 3) == 1) then
                ESX.Streaming.RequestAnimDict('rcmme_amanda1', function()
                    TaskPlayAnim(playerPed, 'rcmme_amanda1', 'stand_loop_ama', 8.0, -8, -1, 49, 0, 0, 0, 0)
                end)
            end
			end
		else
			Citizen.Wait(500)
        end
    end
end)

-- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.PoliceStations) do
		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('map_blip'))
		EndTextCommandSetBlipName(blip)
	end

end)

Citizen.CreateThread(function()


 	blipypracy = AddBlipForCoord(-236.74, -922.31, 32.31)
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

	if 'police' == PlayerData.job.name then

		for i=1, #Config.Lodzie, 1 do
			jobLocations = Config.Lodzie[i]
			local blip = AddBlipForCoord(jobLocations)

			SetBlipSprite (blip, 471)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 1.0)
			SetBlipColour (blip, 63)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(('Wyciąganie Lodek LSPD/BCSO'))
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
		end
	end
end
end
local leetSleep = 10
-- Display markers
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(leetSleep)

		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if #(coords - vector3(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerType, v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Armories, 1 do
					if #(coords - vector3(v.Armories[i].x, v.Armories[i].y, v.Armories[i].z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerType, v.Armories[i].x, v.Armories[i].y, v.Armories[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Lodzie, 1 do
					if #(coords - vector3(v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerType, v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Vehicles, 1 do
					if #(coords - vector3(v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerTypeTake, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.Helicopters, 1 do
					if #(coords - vector3(v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerTypeHeli, v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z + 1 , 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				for i=1, #v.VehicleDeleters, 1 do
					if #(coords - vector3(v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z)) < Config.DrawDistance then
						leetSleep = 10
						DrawMarker(Config.MarkerTypeDeleters, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
					end
				end

				if Config.EnablePlayerManagement and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') then
					for i=1, #v.BossActions, 1 do
						if not v.BossActions[i].disabled and #(coords - vector3(v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z)) < Config.DrawDistance then
							leetSleep = 10
							DrawMarker(Config.MarkerType, v.BossActions[i].x, v.BossActions[i].y, v.BossActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						end
					end
				end

			end
			letSleep = 500
		else
			leetSleep = 2000
		end

	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()

	while true do

		Citizen.Wait(200)

		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then

			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

			for k,v in pairs(Config.PoliceStations) do

				for i=1, #v.Cloakrooms, 1 do
					if #(coords - vector3(v.Cloakrooms[i].x, v.Cloakrooms[i].y, v.Cloakrooms[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Cloakroom'
						currentPartNum = i
					end
				end

				for i=1, #v.Armories, 1 do
					if #(coords - vector3(v.Armories[i].x, v.Armories[i].y, v.Armories[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Armory'
						currentPartNum = i
					end
				end

				for i=1, #v.Lodzie, 1 do
					if  #(coords - vector3(v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z)) < Config.MarkerSize.x then			
						isInMarker     = true
						currentStation = k
						currentPart    = 'LodzieSpawner'
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

				for i=1, #v.Helicopters, 1 do
					if #(coords - vector3(v.Helicopters[i].Spawner.x, v.Helicopters[i].Spawner.y, v.Helicopters[i].Spawner.z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'HelicopterSpawner'
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

				if Config.EnablePlayerManagement and (PlayerData.job.grade_name == 'boss' or PlayerData.job.grade_name == 'zastepca') then
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
					TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_policejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_policejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end
		end

	end
end)

-- Enter / Exit entity zone events
Citizen.CreateThread(function()

	local trackedEntities = {
		'prop_roadcone02a',
		'prop_barrier_work05',
		'p_ld_stinger_s',
		'prop_boxpile_07d',
		'hei_prop_cash_crate_half_full'
	}
	
	while true do
		Citizen.Wait(85)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		local closestDistance = -1
		local closestEntity   = nil
		
		for i=1, #trackedEntities, 1 do
			local object = GetClosestObjectOfType(playerCoords, 3.0, GetHashKey(trackedEntities[i]), false, false, false)
			if DoesEntityExist(object) then
				local objCoords = GetEntityCoords(object)
				local distance = #(playerCoords - objCoords)

				if closestDistance == -1 or closestDistance > distance then
					closestDistance = distance
					closestEntity   = object
				end
			end
		end

		if closestDistance ~= -1 and closestDistance <= 3.0 then
			if LastEntity ~= closestEntity then
				TriggerEvent('esx_policejob:hasEnteredEntityZone', closestEntity)
				LastEntity = closestEntity
			end
		else
			if LastEntity then
				TriggerEvent('esx_policejob:hasExitedEntityZone', LastEntity)
				LastEntity = closestEntity
			end
		end
	end
end)

RegisterNetEvent("esx_policejob:Deleteentitiesc")
AddEventHandler("esx_policejob:Deleteentitiesc", function(object)
	DeleteObjects(object, false)
end)
function DeleteObjects(object, detach)
		if DoesEntityExist(object) then
			NetworkRequestControlOfEntity(object)
			while not NetworkHasControlOfEntity(object) do
				Citizen.Wait(1)
			end
			if detach then
				DetachEntity(object, 0, false)
			end

			SetEntityCollision(object, false, false)
			SetEntityAlpha(object, 0.0, true)
			SetEntityAsMissionEntity(object, true, true)
			SetEntityAsNoLongerNeeded(object)
			_DeleteEntity(object)

		end
end


function _DeleteEntity(entity)
	NetworkRequestControlOfEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

-- Key Controls
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and PlayerData.job ~= nil and PlayerData.job.name == 'police' then

				if CurrentAction == 'menu_cloakroom' then
					OpenCloakroomMenu()
				elseif CurrentAction == 'menu_armory' then
					if Config.MaxInService == -1 then
						OpenArmoryMenu(CurrentActionData.station)
					elseif playerInService then
						OpenArmoryMenu(CurrentActionData.station)
					else
						ESX.ShowNotification(_U('service_not'))
					end
				elseif CurrentAction == 'remove_entity' then
					SetEntityAsMissionEntity(CurrentActionData.entity, true, true)
					NetworkRequestControlOfEntity(CurrentActionData.entity)
					DeleteEntity(CurrentActionData.entity)
					SetEntityAsNoLongerNeeded(CurrentActionData.entity)
				elseif CurrentAction == 'menu_lodzie_spawner' then
					OpenLodzieSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'menu_vehicle_spawner' then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'menu_helicopter_spawner' then
					OpenHelicopterSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'police', vehicleProps)
					end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				elseif CurrentAction == 'menu_boss_actions' then
					if PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss'then
						TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
						menu.close()
						end)
					elseif PlayerData.job ~= nil and PlayerData.job.grade_name == 'zastepca' then
						TriggerEvent('esx_society:openBossMenu', 'police', function(data, menu)
						menu.close()
					end, { withdraw = true })
				end
			end 
				
				CurrentAction = nil
			end
		end -- CurrentAction end
		
		if IsControlJustReleased(0, Keys['F6']) and not isDead and PlayerData.job ~= nil and( PlayerData.job.name == 'police' or PlayerData.job.name == 'IAA') and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
			if Config.MaxInService == -1 then
				OpenPoliceActionsMenu()
			elseif playerInService then
				OpenPoliceActionsMenu()
			else
				ESX.ShowNotification(_U('service_not'))
			end
		end
		if IsControlJustReleased(0, Keys['H']) and PlayerData.job ~= nil and (PlayerData.job.name == 'police' ) and not isDead and not IsHandcuffed and not IsDragged  and not IsEntityDead(GetPlayerPed(-1)) and not IsPedFalling(GetPlayerPed(-1)) and not IsPedCuffed(GetPlayerPed(-1)) and not IsPedDiving(GetPlayerPed(-1)) and not IsPedInCover(GetPlayerPed(-1), false) and not IsPedInParachuteFreeFall(GetPlayerPed(-1)) and (GetPedParachuteState(GetPlayerPed(-1)) == 0 or GetPedParachuteState(GetPlayerPed(-1)) == -1) and not IsPedInAnyVehicle(GetPlayerPed(0-1), false) then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 1.0 then
					TriggerServerEvent('esx_policejob:animacja', GetPlayerServerId(closestPlayer))
					SetEntityAsMissionEntity(closestPlayer)
					TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Zostałeś Zakuty/Rozkuty : ~b~') .. GetPlayerServerId(PlayerId()))
					ESX.ShowNotification(('Zakuwasz/Rozkuwasz : ~b~') .. GetPlayerServerId(closestPlayer))
					TriggerServerEvent('3dme:shareDisplay', 'Zakuwa/Rozkuwa')
					Citizen.Wait(3000)
					TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
					SetPedAsNoLongerNeeded(closestPlayer)
			else
					ESX.ShowNotification(('Brak graczy w poblizu!'))
				end
			end
		
	   end
end)

RegisterNetEvent('esx_policejob:zakuty')
AddEventHandler('esx_policejob:zakuty', function(target)
	isGettingTackled = true

	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

	RequestAnimDict(tackleLib)

	while not HasAnimDictLoaded(tackleLib) do
		Citizen.Wait(10)
	end
	AttachEntityToEntity(PlayerPedId(), targetPed, 11816, 0.25, 0.5, 0.0, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
	Citizen.Wait(500)
	TaskPlayAnim(playerPed, tackleLib, tackleVictimAnim, 8.0, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(3000)
	DetachEntity(GetPlayerPed(-1), true, false)
end)

RegisterNetEvent('esx_policejob:zakujanim')
AddEventHandler('esx_policejob:zakujanim', function(target)
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(tackleLib)

	while not HasAnimDictLoaded(tackleLib) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, tackleLib, tackleAnim, 8.0, -8.0, 3000, 0, 0, false, false, false)
end)

RegisterNetEvent('esx_policejob:animacjaprzeszukiwania')
AddEventHandler('esx_policejob:animacjaprzeszukiwania', function(target)
	local playerPed = GetPlayerPed(-1)

	RequestAnimDict(przeszukiwanieLib)

	while not HasAnimDictLoaded(przeszukiwanieLib) do
		Citizen.Wait(10)
	end

	TaskPlayAnim(playerPed, przeszukiwanieLib, przeszukiwanieAnim, 8.0, -8.0, 3000, 0, 0, false, false, false)
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
	TriggerEvent('esx_policejob:unrestrain')
	
	if not hasAlreadyJoined then
		TriggerServerEvent('esx_policejob:spawned')
	end
	hasAlreadyJoined = true
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)

-- Create blip for colleagues
function createBlip(id)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then -- Add blip and create head display on player
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true) -- Player Blip indicator
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped))) -- update rotation
		SetBlipNameToPlayerName(blip, id) -- update blip name
		SetBlipScale(blip, 0.85) -- set scale
		SetBlipAsShortRange(blip, true)

		table.insert(blipsCops, blip) -- add blip to array so we can remove it later
	end
end

RegisterNetEvent('esx_policejob:updateBlip')
AddEventHandler('esx_policejob:updateBlip', function()

	-- Refresh all blips
	for k, existingBlip in pairs(blipsCops) do
		RemoveBlip(existingBlip)
	end

	-- Clean the blip table
	blipsCops = {}

	if not Config.EnableJobBlip then
		return
	end

	-- Is the player a cop? In that case show all the blips for other cops
	if PlayerData.job and (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance') then
		ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
			for i=1, #players, 1 do
				if players[i].job.name == 'police' or players[i].job.name == 'ambulance' then
					local id = GetPlayerFromServerId(players[i].source)
					if NetworkIsPlayerActive(id) and GetPlayerPed(id) ~= PlayerPedId() then
						createBlip(id)
					end
				end
			end
		end)
	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('esx_policejob:unrestrain')
		TriggerEvent('esx_phone:removeSpecialContact', 'police')

	end
end)

function MenuWymianyPieniedzy()

	 local elements = {
				{label = 'Oddaj Pani Reni milosc, brudne pienądze', value = 'wymiana'}
			}


ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Wymiana',
	{
		title    = ('Wymiana Brudnych'),
		align    = 'center',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'wymiana' then
			TriggerServerEvent('esx_policejob:czymabrudne')
     	 end
		end,
		function(data, menu)
      menu.close()
    end
  )
end

RegisterNetEvent('esx_policejob:otworzbodyserch')
AddEventHandler('esx_policejob:otworzbodyserch', function()
	local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
	local closestPlayerPed = GetPlayerPed(closestPlayer)
		OpenBodySearchMenu(closestPlayer)
		TriggerServerEvent('esx_policejob:animacjaprzeszukiwania')
end)


RegisterNetEvent('esx_policejob:czyprawidlowe')
AddEventHandler('esx_policejob:czyprawidlowe', function()

	local szansa = math.random(1,5)

	if szansa < Config.Prawidlowe  then
		TriggerEvent('pNotify:SendNotification', {text='<span style = color:red>Te pieniądze nie nadawały się w obieg.</span>'})
		TriggerServerEvent('esx_policejob:zamiana', 2)
	else
		TriggerEvent('pNotify:SendNotification', {text='<span style = color:gold>Pieniądze Zostaną Wprowadzone w Obieg i dodane na konto LSPD :)</span>'})
		TriggerServerEvent('esx_policejob:zamiana', 1)
	end
end)




function OpenPoliceKarakany()

	ESX.TriggerServerCallback('esx_policejob:getEmployees', function(gracze)
		local elements = {}

		if #gracze == 0 then
			TriggerEvent('pNotify:SendNotification',{text ='<b style = color:purple>Twoja lista pracownikow jest pusta!</b>'})
			return
		end

		for i = 1, #gracze, 1 do
			table.insert(elements, {label = "Pracownik: " .. " | " .. gracze[i].name .. " | " .. gracze[i].odznaka .. " Odznaka", value = gracze[i].identifier })
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hahajp_menu',
		{
			title    = 'Policja',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
			title = 'Podaj Nowy Numer Odznaki';
			}, function(data3, menu3)
					menu3.close()
					TriggerServerEvent('esx_policejob:odznaka123', action, data3.value)
					end, function(data3, menu3)
				menu3.close()
				end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function SendToCommunityService(player)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'Community Service Menu', {
		title = "Community Service Menu",
	}, function (data2, menu)
		local community_services_count = tonumber(data2.value)
		
		if community_services_count == nil then
			ESX.ShowNotification('Nieprawidłowa ilość.')
		else
			TriggerServerEvent("esx_communityservice:sendToCommunityService", player, community_services_count)
			menu.close()
		end
	end, function (data2, menu)
		menu.close()
	end)
end