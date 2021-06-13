Keys = {
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

local IsBusy = false
local PlayerData              = {}
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local LastStation             = nil
local LastPart                = nil
local LastPartNum             = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local Blips                   = {}
local JobBlips 				  = {}
local wozektimer = false
local isCarry 				  = false
local hasRope 				  = true
local hasUsedRope 			  = true
local onDuty 				  = true

ESX                     	  = nil


function OpenAmbulanceActionsMenu()
	local elements = {
		{label = 'Ubrania z mieszkan', value = 'player_dressing'},
		{label = _U('cloakroom'), value = 'cloakroom'},
	}

	if Config.EnablePlayerManagement and ESX.PlayerData.job.grade_name == 'boss' and PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'zastepca' then
		table.insert(elements, {label = _U('boss_actions'), value = 'boss_actions'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions',
	{
		title		= _U('ambulance'),
		align		= 'center',
		elements	= elements
	}, function(data, menu)
		if data.current.value == 'cloakroom' then
			OpenCloakroomMenu()
		elseif data.current.value == 'boss_actions' then
			TriggerEvent('esx_societymordo:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
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
		
	end, function(data, menu)
		menu.close()
	end)
end

function OpenEmsMenu()
	local elements = {
		{label = _U('boss_actions'), value = 'boss_actions'},
		{label = 'Nadaj Identyfikator', value = 'identy'}
	}

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ambulance_actions',
	{
		title		= _U('ambulance'),
		align		= 'center',
		elements	= elements
	}, function(data, menu)
		if data.current.value == 'boss_actions' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {wash = false})
		elseif data.current.value == 'boss_actions' and PlayerData.job ~= nil and ESX.PlayerData.job.grade_name == 'zastepca' then
			TriggerEvent('esx_society:openBossMenu', 'ambulance', function(data, menu)
				menu.close()
			end, {withdraw = false})
		elseif data.current.value == 'identy' then
				OpenIdentyMenu()
		end
	end, function(data, menu)
		menu.close()

		CurrentAction		= 'ambulance_actions_menu'
		CurrentActionMsg	= _U('open_menu')
		CurrentActionData	= {} 
	end)
end

function OpenIdentyMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getEmployees', function(gracze)
		local elements = {}

				if #gracze == 0 then
					TriggerEvent('pNotify:SendNotification',{text ='<b style = color:purple>Twoja lista pracownikow jest pusta!</b>'})
					--ESX.ShowNotification("Twoja lista pracownikow jest pusta!")
					return
				end

				for i = 1, #gracze, 1 do
					table.insert(elements, {label = "Pracownik: " .. " | " .. gracze[i].name .. " | " .. gracze[i].odznaka .. " Identyfikator", value = gracze[i].identifier })
				end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'hahajp_menu',
		{
			title    = 'EMS',
			align    = 'center',
			elements = elements
		}, function(data, menu)
		local action = data.current.value
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
			title = 'Podaj Nowy Numer Identyfikatora';
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


function OpenMobileAmbulanceActionsMenu()
	local grade = ESX.PlayerData.job.grade_name
	ESX.UI.Menu.CloseAll()

	local elements = {
					{label = _U('ems_menu_revive'), value = 'revive'},
					{label = _U('ems_menu_small'), value = 'small'},
					{label = _U('ems_menu_big'), value = 'big'},
					{label = _U('ems_menu_usypiacz'), value = 'usypiacz'},
					{label = _U('ems_menu_takeonhand'), value = 'drag'},
					{label = ('Zakuj/Rozkuj Kajdanki'), value = 'handcuff'},
					{label = _U('ems_menu_putincar'), value = 'put_in_vehicle'},
					{label = _U('ems_menu_getoutcar'), value = 'out_the_vehicle'},
					{label = ('<span style = color:red>Menu Ubezpieczeń</span>'),	value = 'ubezpieczenia'},
					{label = ('<span style = color:orange>Posiadanie Licencje</span>'),	value = 'identity_card'},
					{label = 'Nosze szpitalne', value = 'bed'},
					{label = 'Usun nosze szpitalne', value = 'bed2'},
					{label = 'Wozek inwalidzki', value = 'wozek'},
					{label = 'Usun wozek inwalidzki', value = 'wozek2'},

				}

	if grade == "psycholog" or grade == "boss" then
		table.insert(elements, {label = ('<span style = color:red>Menu Zaswiadczen</span>'),	value = 'psycholog'})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'mobile_ambulance_actions',
	{
		title		= ('Medyk'),
		align		= 'center',
		elements	= {
			{label = _U('ems_menu'), value = 'citizen_interaction'}
		}
	}, function(data, menu)
		if data.current.value == 'citizen_interaction' then
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title		= '<b style = color:purple>EMS MENU</b>',
				align		= 'center',
				elements	= elements
			}, function(data, menu)

			if data.current.value == 'ubezpieczenia' then
			local elements1 = {
				{label = 'Wydaj Ubezpiecznie na <span style = color:aqua>7 Dni</span><span style = color:darkgreen>(20.000$)</span>',	value = 'zdrowotne7'},
				{label = 'Wydaj Ubezpiecznie na <span style = color:blue>14 Dni</span><span style = color:darkgreen>(35.000$)</span>',	value = 'zdrowotne14'},
				{label = 'Wydaj Ubezpiecznie na <span style = color:purple>30 Dni</span><span style = color:darkgreen>(60.000$)</span>',	value = 'zdrowotne30'},
				{label = 'Wydaj Ubezpiecznie <span style = color:red>Dożywotnie</span><span style = color:darkgreen>(500.000$)</span>',	value = 'zdrowotne999'},
			}
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'ubezpieczenia',
			{
				title    = '<b style = color:purple>Ubezpieczenia</b>',
				align    = 'center',
				elements = elements1
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data2.current.value

					if action == 'zdrowotne7' then
						ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.ShowNotification(('Ma juz Ubezpiecznie : ~b~') .. GetPlayerServerId(closestPlayer))
							else
								TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'zdrowotne', 7)
								TriggerServerEvent('esx_ambulancejob:buyLicense', GetPlayerServerId(closestPlayer), 7)
								ESX.ShowNotification(('Wydales ~b~7 dniowe~s~ ubezpieczenie osobie : ~b~') .. GetPlayerServerId(closestPlayer))
							end
						end, GetPlayerServerId(closestPlayer), 'zdrowotne')
				elseif action == 'zdrowotne14' then 
					ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.ShowNotification(('Ma juz Ubezpiecznie : ~b~') .. GetPlayerServerId(closestPlayer))
							else
								TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'zdrowotne', 14)
								TriggerServerEvent('esx_ambulancejob:buyLicense', GetPlayerServerId(closestPlayer), 14)
								ESX.ShowNotification(('Wydales ~p~14 dniowe~s~ ubezpieczenie osobie : ~b~') .. GetPlayerServerId(closestPlayer))
							end
						end, GetPlayerServerId(closestPlayer), 'zdrowotne')
				elseif action == 'zdrowotne30' then 
					ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.ShowNotification(('Ma juz Ubezpiecznie : ~b~') .. GetPlayerServerId(closestPlayer))
							else
								TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'zdrowotne', 30)
								TriggerServerEvent('esx_ambulancejob:buyLicense', GetPlayerServerId(closestPlayer), 30)
								ESX.ShowNotification(('Wydales ~o~30 dniowe~s~ ubezpieczenie osobie : ~b~') .. GetPlayerServerId(closestPlayer))
							end
						end, GetPlayerServerId(closestPlayer), 'zdrowotne')
				elseif action == 'zdrowotne999' then 
					ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
							if ma then
								ESX.ShowNotification(('Ma juz Ubezpiecznie : ~b~') .. GetPlayerServerId(closestPlayer))
							else
								TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'zdrowotne', 999)
								TriggerServerEvent('esx_ambulancejob:buyLicense', GetPlayerServerId(closestPlayer), 999)
								ESX.ShowNotification(('Wydales~r~Dożywotnie~s~ ubezpieczenia osobie : ~b~') .. GetPlayerServerId(closestPlayer))
							end
						end, GetPlayerServerId(closestPlayer), 'zdrowotne')
				else
					ESX.ShowNotification(_U('no_players'))
				end
			end
			end, function(data2, menu2)
				menu2.close()
			end)
			end
			
			if data.current.value == 'psycholog' then
			local elements3 = {
				{label = 'Wydaj Zaswiadczenie na <span style = color:aqua>14 Dni</span><span style = color:darkgreen>(50.000$)</span>',	value = 'zaswiadczenie'},
				{label = 'Zaświadczenie do Pracy EMS/LSC/LSPD<span style = color:darkgreen>(50.000$)</span>',	value = 'zaswiadczenierobota'},
				{label = ('<span style = color:blue>Usuń Licencje</span>'),	value = 'usun_licencje'},
			}
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'psycholog',
			{
				title    = '<b style = color:purple>Zaswiadczenia</b>',
				align    = 'center',
				elements = elements3
			}, function(data3, menu3)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				if closestPlayer ~= -1 and closestDistance <= 3.0 then
					local action = data3.current.value
						if data3.current.value == 'zaswiadczenie' then
							ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
								if ma then
									ESX.ShowNotification(('Ma juz licencje : ~b~') .. GetPlayerServerId(closestPlayer))
								else
									TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'psycholog', 14)
									TriggerServerEvent('esx_psychologKOZA:buyLicense', GetPlayerServerId(closestPlayer))
									ESX.ShowNotification(('Dales licencje osobie : ~b~') .. GetPlayerServerId(closestPlayer))
								end
							end, GetPlayerServerId(closestPlayer), 'psycholog')
						elseif data3.current.value == 'usun_licencje' then 
							ShowPlayerLicense(closestPlayer)	
						elseif data3.current.value == 'zaswiadczenierobota' then 
							ESX.TriggerServerCallback('esx_license:checkLicense', function(ma)
								if ma then
									ESX.ShowNotification(('Ma juz zaświadczenie do pracy : ~b~') .. GetPlayerServerId(closestPlayer))
								else
									TriggerServerEvent('esx_license:addLicensePsycholog', GetPlayerServerId(PlayerId()), GetPlayerServerId(closestPlayer), 'praca', 14)
									TriggerServerEvent('esx_psychologKOZA:buyLicense', GetPlayerServerId(closestPlayer))
									ESX.ShowNotification(('Dales zaświadczenie do pracy osobie : ~b~') .. GetPlayerServerId(closestPlayer))
								end
							end, GetPlayerServerId(closestPlayer), 'praca')		
						end
				else
					ESX.ShowNotification(_U('no_players'))
				end
			end, function(data3, menu3)
				menu3.close()
			end)
		end
			
			if IsBusy then return end
			if data.current.value == 'wozek' then
				if wozektimer == false then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)
					local forward   = GetEntityForwardVector(playerPed)
					local x, y, z   = table.unpack(coords + forward * 1.0)
					ESX.Game.SpawnObject('prop_wheelchair_01', {
						x = x,
						y = y,
						z = z
					}, function(obj)
						SetEntityHeading(obj, GetEntityHeading(playerPed))
						PlaceObjectOnGroundProperly(obj)
					end)
					stoper()
					return
				else
					ESX.ShowNotification('Nie możesz tak szybko wyciągać wózków!')
					return
				end
			elseif data.current.value == 'wozek2' then
				local wheelchair = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_wheelchair_01'))
				if DoesEntityExist(wheelchair) then
					DeleteEntity(wheelchair)
					return
				end
			end

			if data.current.value == 'bed' then
				if wozektimer == false then
					local playerPed = PlayerPedId()
					local coords    = GetEntityCoords(playerPed)
					local forward   = GetEntityForwardVector(playerPed)
					local x, y, z   = table.unpack(coords + forward * 1.0)
					ESX.Game.SpawnObject('v_med_emptybed', {
						x = x+0.7,
						y = y,
						z = z
					}, function(obj)
						SetEntityHeading(obj, GetEntityHeading(playerPed))
						PlaceObjectOnGroundProperly(obj)
					end)
					stoper()
					return
				else
					ESX.ShowNotification('Nie możesz tak szybko wyciągać noszy!')
					return
				end
				elseif data.current.value == 'handcuff' then
					local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
						if GetEntitySpeed(GetPlayerPed(-1)) > 0.5 or GetEntitySpeed(dupa) > 0.5 then
							ESX.ShowNotification('~r~Nie możesz zakuwac w ruchu')
						else
							--animacjazakuciarozkuciaxd()
							TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('Zostałeś Zakuty/Rozkuty : ~b~') .. GetPlayerServerId(PlayerId()))
							TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(closestPlayer))
							ESX.ShowNotification(('Zakuwasz/Rozkuwasz : ~b~') .. GetPlayerServerId(closestPlayer))
						end
			elseif data.current.value == 'bed2' then
				local lozko = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('v_med_emptybed'))
				if DoesEntityExist(lozko) then
					DeleteEntity(lozko)
					return
				end
			end

				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

				if data.current.value ~= 'ubezpieczenia' and( closestPlayer == -1 or closestDistance > 1.0 ) then
					ESX.ShowNotification(_U('no_players'))
				else

					if data.current.value == 'drag' then			
					TriggerServerEvent('esx_ambulancejob:checkRope')
					ESX.ShowNotification('Podniosles/Upusciles osobe ...')
					TriggerServerEvent('esx_ambulancejob:lyfteruppn', GetPlayerServerId(player))
					Citizen.Wait(2)
					if hasRope == true then
						local dict = "anim@heists@box_carry@"
				
						RequestAnimDict(dict)
						while not HasAnimDictLoaded(dict) do
							Citizen.Wait(100)
						end

						
						local player, distance = ESX.Game.GetClosestPlayer()
						local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
						
						if distance ~= -1 and distance <= 5.0 then
							local closestPlayer, distance = ESX.Game.GetClosestPlayer()
							TriggerServerEvent('esx_ambulancejob:lyfter', GetPlayerServerId(closestPlayer))		
					
							TaskPlayAnim(GetPlayerPed(-1), dict, "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
							isCarry = true
						else
							ESX.ShowNotification("Brak graczy w poblizu...")
						end
			end		
					elseif data.current.value == 'revive' then

						IsBusy = true

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)

								if IsPedDeadOrDying(closestPlayerPed, 1) then
									local playerPed = PlayerPedId()

									ESX.ShowNotification(_U('revive_inprogress'))

									local lib, anim = 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest'

									for i=1, 15, 1 do
										Citizen.Wait(900)
								
										ESX.Streaming.RequestAnimDict(lib, function()
											TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
										end)
									end

									--TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(closestPlayer))
									-- Show revive award?
									if Config.ReviveReward > 0 then
										ESX.ShowNotification(_U('revive_complete_award', GetPlayerName(closestPlayer), Config.ReviveReward))
									else
										ESX.ShowNotification(_U('revive_complete', GetPlayerName(closestPlayer)))
									end
								else
									ESX.ShowNotification(_U('player_not_unconscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end

							IsBusy = false

						end, 'medikit')

					elseif data.current.value == 'small' then

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									IsBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:removeItem', 'bandage')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'small')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									IsBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_bandage'))
							end
						end, 'bandage')

					elseif data.current.value == 'big' then

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									IsBusy = true
									ESX.ShowNotification(_U('heal_inprogress'))
									TaskStartScenarioInPlace(playerPed, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
									Citizen.Wait(10000)
									ClearPedTasks(playerPed)

									--TriggerServerEvent('esx_ambulancejob:removeItem', 'medikit')
									TriggerServerEvent('esx_ambulancejob:heal', GetPlayerServerId(closestPlayer), 'big')
									ESX.ShowNotification(_U('heal_complete', GetPlayerName(closestPlayer)))
									IsBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_medikit'))
							end
						end, 'medikit')
					elseif data.current.value == 'usypiacz' then

						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity > 0 then
								local closestPlayerPed = GetPlayerPed(closestPlayer)
								local health = GetEntityHealth(closestPlayerPed)

								if health > 0 then
									local playerPed = PlayerPedId()

									IsBusy = true
									TriggerServerEvent('3dme:shareDisplay', "*Wyciąga z kieszonki strzykawke i przygotowuje do aplikacji*")
									Citizen.Wait(2000)
									ESX.ShowNotification('Trwa podawanie srodka')
									TriggerServerEvent('3dme:shareDisplay', "*wbija strzykawke w ciało delikwenta*")
									TaskStartScenarioInPlace(playerPed, 'PROP_HUMAN_ATM', 0, false)
									Citizen.Wait(1500)
									TriggerServerEvent('esx_ambulancejob:removeItem', 'usypiacz')
									Citizen.Wait(1500)
									ClearPedTasks(playerPed)

									TriggerServerEvent('esx_ambulancejob:usypiacz', GetPlayerServerId(closestPlayer), 'usypiacz')
									ESX.ShowNotification(_U('usypiacz_complete', GetPlayerName(closestPlayer)))
									IsBusy = false
								else
									ESX.ShowNotification(_U('player_not_conscious'))
								end
							else
								ESX.ShowNotification(_U('not_enough_usypiacz'))
							end
						end, 'usypiacz')
					elseif data.current.value == 'identity_card' then
						OpenIdentityCardMenu(closestPlayer)	
					elseif data.current.value == 'put_in_vehicle' then
						TriggerServerEvent('esx_ambulancejob:putInVehicle', GetPlayerServerId(closestPlayer))
						TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('~r~Zostałeś wsadzony do pojazdu : ~b~') .. GetPlayerServerId(PlayerId()))
						ESX.ShowNotification(('~g~Wsadziłeś do pojazdu : ~b~') .. GetPlayerServerId(closestPlayer))
					elseif data.current.value == 'out_the_vehicle' then
						TriggerServerEvent('esx_ambulancejob:OutVehicle', GetPlayerServerId(closestPlayer))
						TriggerServerEvent('esx_policejob:message', GetPlayerServerId(closestPlayer), ('~r~Zostałeś Wyciągniety z pojazdu : ~b~') .. GetPlayerServerId(PlayerId()))
						ESX.ShowNotification(('~g~Wyciągnąłeś z pojazdu : ~b~') .. GetPlayerServerId(closestPlayer))
					end 
					end
			end, function(data, menu)
				menu.close()
			end)
		end
		

	end, function(data, menu)
		menu.close()
	end)
end

function stoper()
	wozektimer = true
	Wait(100)
	wozektimer = true
end

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		
		Citizen.Wait(1)
	end
end

function FastTravel(coords, heading)
	local playerPed = PlayerPedId()

	DoScreenFadeOut(800)

	while not IsScreenFadedOut() do
		Citizen.Wait(500)
	end

	ESX.Game.Teleport(playerPed, coords, function()
		DoScreenFadeIn(800)

		if heading then
			SetEntityHeading(playerPed, heading)
		end
	end)
end

RegisterNetEvent('esx_ambulancejob:OutVehicle')
AddEventHandler('esx_ambulancejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)

--[[local WyswietlanieTekstu = {
[3] = { ["x"] = 335.8, ["y"] = -579.88, ["z"] = 43.29},
[4] = { ["x"] = 335.74, ["y"] = -580.43, ["z"] = 74.17},
[5] = { ["x"] = 331.29, ["y"] = -592.9, ["z"] = 43.28},
[6] = { ["x"] = 331.34, ["y"] = -592.68, ["z"] = 28.9},
[7] = { ['x'] = 69.02,['y'] = -1569.87,['z'] = 29.6},
}



Citizen.CreateThread(function()
while true do
	 Citizen.Wait(5)
 for k in pairs(WyswietlanieTekstu) do
	 local pedCoords = GetEntityCoords(PlayerPedId())
		local dist3 = #(pedCoords - vector3(WyswietlanieTekstu[3].x, WyswietlanieTekstu[3].y,  WyswietlanieTekstu[3].z))
		local dist4 = #(pedCoords - vector3(WyswietlanieTekstu[4].x, WyswietlanieTekstu[4].y,  WyswietlanieTekstu[4].z))
		local dist5 = #(pedCoords - vector3(WyswietlanieTekstu[5].x, WyswietlanieTekstu[5].y,  WyswietlanieTekstu[5].z))
		local dist6 = #(pedCoords - vector3(WyswietlanieTekstu[6].x, WyswietlanieTekstu[6].y,  WyswietlanieTekstu[6].z))
		local dist7 = #(pedCoords - vector3(WyswietlanieTekstu[7].x, WyswietlanieTekstu[7].y,  WyswietlanieTekstu[7].z))
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then 
			if dist3 <= 3.5 then
				DrawText3D(WyswietlanieTekstu[3].x, WyswietlanieTekstu[3].y,  WyswietlanieTekstu[3].z,'~g~ Nacisnij [E] ~y~Aby dostać się na dach')
			end
			if dist4 <= 3.5 then
				DrawText3D(WyswietlanieTekstu[4].x, WyswietlanieTekstu[4].y,  WyswietlanieTekstu[4].z,'~g~ Nacisnij [E] ~y~Aby zjechać na dół')
			end
			if dist5 <= 3.5 then
				DrawText3D(WyswietlanieTekstu[5].x, WyswietlanieTekstu[5].y,  WyswietlanieTekstu[5].z,'~g~ Nacisnij [E] ~y~Aby zjechać do garaży')
			end
			if dist6 <= 3.5 then
				DrawText3D(WyswietlanieTekstu[6].x, WyswietlanieTekstu[6].y,  WyswietlanieTekstu[6].z,'~g~ Nacisnij [E] ~y~Aby wyjechać do górnej części szpitala')
			end 
			end
			if dist7 <= 8.5 then
				DrawText3D(WyswietlanieTekstu[7].x, WyswietlanieTekstu[7].y,  WyswietlanieTekstu[7].z,'~g~ Nacisnij [E] Aby rozpocząć prace dorwyczą')
			end
	end 
	end
end)]]--

function DrawText3D(x, y, z, text)
    local onScreen,_x,_y=World3dToScreen2d(x, y, z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.4, 0.4)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 11, 11, 11, 90)
  
end


AddEventHandler('esx_ambulancejob:hasEnteredMarker', function(station, part, partNum)

	if part == 'AmbulanceActions'  then
		CurrentAction		= 'ambulance_actions_menu'
		CurrentActionMsg	= _U('open_menu')
		CurrentActionData	= {}
	elseif part == 'EmsMenu'  then
		CurrentAction		= 'boss_menu'
		CurrentActionMsg	= _U('open_menu')
		CurrentActionData	= {}
	elseif part == 'VehicleSpawner' then
		CurrentAction		= 'vehicle_spawner_menu'
		CurrentActionMsg	= _U('veh_spawn')
		CurrentActionData	= {station = station, partNum = partNum}
	elseif part == 'LodzieSpawner' then
		CurrentAction		= 'lodzie_spawner_menu'
		CurrentActionMsg	= _U('veh_spawn')
		CurrentActionData	= {station = station, partNum = partNum}
	elseif part == 'HelkaSpawner' then
		CurrentAction		= 'helka_spawner_menu'
		CurrentActionMsg	= _U('veh_spawn')
		CurrentActionData	= {station = station, partNum = partNum}
	elseif part == 'Pharmacy' then 
		CurrentAction		= 'pharmacy'
		CurrentActionMsg	= _U('open_pharmacy')
		CurrentActionData	= {}
	elseif part == 'VehicleDeleter' then
		local playerPed = PlayerPedId()
		local coords	= GetEntityCoords(playerPed)

		if IsPedInAnyVehicle(playerPed, false) then
			local vehicle, distance = ESX.Game.GetClosestVehicle({
				x = coords.x,
				y = coords.y,
				z = coords.z
			})

			if distance ~= -1 and distance <= 4.0 then
				CurrentAction		= 'delete_vehicle'
				CurrentActionMsg	= _U('store_veh')
				CurrentActionData	= {vehicle = vehicle}
			end
		end
	end
end)

function FastTravel(pos)
	TeleportFadeEffect(PlayerPedId(), pos)
end

AddEventHandler('esx_ambulancejob:hasExitedMarker', function(station, part, partNum)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

local sleepThread = 10
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(sleepThread)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
			local coords = GetEntityCoords(PlayerPedId())
			for k,v in pairs(Config.AmbulanceStations) do
					for i=1, #v.AmbulanceActions, 1 do
						if #(coords - vector3(v.AmbulanceActions[i].x, v.AmbulanceActions[i].y, v.AmbulanceActions[i].z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypeCloakroom, v.AmbulanceActions[i].x, v.AmbulanceActions[i].y, v.AmbulanceActions[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end
					if Config.EnablePlayerManagement and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'zastepca')then
						for i=1, #v.EmsMenu, 1 do
							if #(coords - vector3(v.EmsMenu[i].x, v.EmsMenu[i].y, v.EmsMenu[i].z)) < Config.DrawDistance  then
								sleepThread = 10
								DrawMarker(Config.MarkerTypeCloakroom, v.EmsMenu[i].x, v.EmsMenu[i].y, v.EmsMenu[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
							else
								--sleepThread = 500
							end
						end
					end 

					for i=1, #v.Pharmacy, 1 do
						if #(coords - vector3(v.Pharmacy[i].x, v.Pharmacy[i].y, v.Pharmacy[i].z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypePharmacy, v.Pharmacy[i].x, v.Pharmacy[i].y, v.Pharmacy[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end

					for i=1, #v.Lodzie, 1 do
						if #(coords - vector3(v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypeLodzie, v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end


					for i=1, #v.Helka, 1 do
						if #(coords - vector3(v.Helka[i].Spawner.x, v.Helka[i].Spawner.y, v.Helka[i].Spawner.z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypeHelka, v.Helka[i].Spawner.x, v.Helka[i].Spawner.y, v.Helka[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end

					for i=1, #v.Vehicles, 1 do
						if #(coords - vector3(v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypeVehicles, v.Vehicles[i].Spawner.x, v.Vehicles[i].Spawner.y, v.Vehicles[i].Spawner.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end


					for i=1, #v.VehicleDeleters, 1 do
						if #(coords - vector3( v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z)) < Config.DrawDistance then
							sleepThread = 10
							DrawMarker(Config.MarkerTypeDeleters, v.VehicleDeleters[i].x, v.VehicleDeleters[i].y, v.VehicleDeleters[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
						else
							--sleepThread = 500
						end
					end
			end
		else
			sleepThread = 2000	
		end
	end
end)

Citizen.CreateThread(function()
	for k,v in pairs(Config.AmbulanceStations) do
		local blip = AddBlipForCoord(v.Blip.Pos.x, v.Blip.Pos.y, v.Blip.Pos.z)

		SetBlipSprite (blip, v.Blip.Sprite)
		SetBlipDisplay(blip, v.Blip.Display)
		SetBlipScale  (blip, v.Blip.Scale)
		SetBlipColour (blip, v.Blip.Colour)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('blip'))
		EndTextCommandSetBlipName(blip)
	end
end)


Citizen.CreateThread(function()

if PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then 
	for k,v in pairs(Config.AmbulanceStations) do 
		local blipprywatny = AddBlipForCoord(v.Blipprywatny.Pos.x, v.Blipprywatny.Pos.y, v.Blipprywatny.Pos.z)

		SetBlipSprite (blipprywatny, v.Blipprywatny.Sprite)
		SetBlipDisplay(blipprywatny, v.Blipprywatny.Display)
		SetBlipScale  (blipprywatny, v.Blipprywatny.Scale)
		SetBlipColour (blipprywatny, v.Blipprywatny.Colour)
		SetBlipAsShortRange(blipprywatny, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Słoneczny Patrol')
		EndTextCommandSetBlipName(blipprywatny)
	end
end


end)

-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then
			local playerPed      = PlayerPedId()
			local coords         = GetEntityCoords(playerPed)
			local isInMarker     = false
			local currentStation = nil
			local currentPart    = nil
			local currentPartNum = nil

		for k,v in pairs(Config.AmbulanceStations) do
				for i=1, #v.AmbulanceActions, 1 do
					if #(coords - vector3(v.AmbulanceActions[i].x, v.AmbulanceActions[i].y, v.AmbulanceActions[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'AmbulanceActions'
						currentPartNum = i
					end
				end
				if Config.EnablePlayerManagement and (ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'zastepca') then
				for i=1, #v.EmsMenu, 1 do
					if #(coords - vector3(v.EmsMenu[i].x, v.EmsMenu[i].y, v.EmsMenu[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'EmsMenu'
						currentPartNum = i
					end
				end
			end

				for i=1, #v.Pharmacy, 1 do
					if #(coords - vector3(v.Pharmacy[i].x, v.Pharmacy[i].y, v.Pharmacy[i].z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'Pharmacy'
						currentPartNum = i
					end
				end

				for i=1, #v.Lodzie, 1 do
					if #(coords - vector3(v.Lodzie[i].Spawner.x, v.Lodzie[i].Spawner.y, v.Lodzie[i].Spawner.z)) < Config.MarkerSize.x then
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

				for i=1, #v.Helka, 1 do
					if #(coords - vector3(v.Helka[i].Spawner.x, v.Helka[i].Spawner.y, v.Helka[i].Spawner.z)) < Config.MarkerSize.x then
						isInMarker     = true
						currentStation = k
						currentPart    = 'HelkaSpawner'
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
		end

			local hasExited = false

			if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)) then

				if
					(LastStation ~= nil and LastPart ~= nil and LastPartNum ~= nil) and
					(LastStation ~= currentStation or LastPart ~= currentPart or LastPartNum ~= currentPartNum)
				then
					TriggerEvent('esx_ambulancejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
					hasExited = true
				end

				HasAlreadyEnteredMarker = true
				LastStation             = currentStation
				LastPart                = currentPart
				LastPartNum             = currentPartNum

				TriggerEvent('esx_ambulancejob:hasEnteredMarker', currentStation, currentPart, currentPartNum)
			end

			if not hasExited and not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_ambulancejob:hasExitedMarker', LastStation, LastPart, LastPartNum)
			end
		end
end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		if CurrentAction ~= nil then
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, Keys['E']) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' then

				if CurrentAction == 'ambulance_actions_menu' then
					OpenAmbulanceActionsMenu(CurrentActionData.station)
				elseif CurrentAction == 'boss_menu' then
					OpenEmsMenu(CurrentActionData.station)
				elseif CurrentAction == 'vehicle_spawner_menu' then
					OpenVehicleSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'lodzie_spawner_menu' then
					OpenLodzieSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'helka_spawner_menu' then
					OpenHelkaSpawnerMenu(CurrentActionData.station, CurrentActionData.partNum)
				elseif CurrentAction == 'pharmacy' then
					OpenPharmacyMenu(CurrentActionData.station)
				elseif CurrentAction == 'delete_vehicle' then
					if Config.EnableSocietyOwnedVehicles then
						local vehicleProps = ESX.Game.GetVehicleProperties(CurrentActionData.vehicle)
						TriggerServerEvent('esx_society:putVehicleInGarage', 'ambulance', vehicleProps)
					end
					ESX.Game.DeleteVehicle(CurrentActionData.vehicle)
				end

				CurrentAction = nil

			end

		end

		if IsControlJustReleased(0, Keys['F6']) and onDuty and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'ambulance' and not IsDead then
			OpenMobileAmbulanceActionsMenu()
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)

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
			end
		end
	end
end)


function OpenCloakroomMenu()
		local playerPed = PlayerPedId()

		local elements = {
			{label = _U('ems_clothes_civil'), value = 'citizen_wear'},
			--[[{label = _U('ems_clothes_ems'), value = 'ambulance_wear'},
			{label = ('<b style = color:blue>Stroj Zimowy</b>'), value = 'zimowy_wear'},
			{label = ('<b style = color:aqua>Stroj Pletwonorka</b>'), value = 'cipa_wear'},
			{label = ('<b style = color:red>Pelny Stroj EMS</b>'), value = 'pelny_wear'},
			{label = ('<b style = color:red>Pelny Stroj EMS Wariant 2</b>'), value = 'pelny_wear2'},
			{label = ('<b style = color:>COVID</b>'), value = 'COVID'},	
	]]
		}

		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.grade == 20 then
		table.insert(elements, {label = ('<b style = color:Teal>Stroj Ochroniarza</b>'), value = 'securo_wear'})
		else
		--table.insert(elements, {label = _U('ems_clothes_civil'), value = 'citizen_wear'})
		table.insert(elements, {label = _U('ems_clothes_ems'), value = 'ambulance_wear'})
		table.insert(elements, {label = ('<b style = color:blue>Stroj Zimowy</b>'), value = 'zimowy_wear'})
		table.insert(elements, {label = ('<b style = color:aqua>Stroj Pletwonorka</b>'), value = 'cipa_wear'})
		table.insert(elements, {label = ('<b style = color:red>Pelny Stroj EMS</b>'), value = 'pelny_wear'})
		table.insert(elements, {label = ('<b style = color:aqua>Stroj Chirurg</b>'), value = 'pelny_wear2'})
		table.insert(elements, {label = ('<b style = color:>KORONER</b>'), value = 'COVID'})
		end 

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = _U('cloakroom'),
		align    = 'center',
		elements = elements
	}, function(data, menu)



		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
				onDuty = false
			end)
		elseif data.current.value == 'ambulance_wear' then
					onDuty = true
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				if skin.sex == 0 then
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
				else
					TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
				end
			end)
		elseif data.current.value == 'cipa_wear' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.nurek.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nurek.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.nurek.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.nurek.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
		elseif data.current.value == 'zimowy_wear' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.zimowy.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zimowy.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.zimowy.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.zimowy.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
		elseif data.current.value == 'pelny_wear' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.pelny.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.pelny.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.pelny.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.pelny.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
		elseif data.current.value == 'COVID' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.COVID.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.COVID.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.COVID.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.COVID.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)

	elseif data.current.value == 'securo_wear' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.securo_wear.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.securo_wear.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.securo_wear.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.securo_wear.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)								
		elseif data.current.value == 'pelny_wear2' then
			onDuty = true
				TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms.pelny2.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.pelny2.male)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end

		else
			if Config.Uniforms.pelny2.female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.pelny2.female)
			else
				ESX.ShowNotification(_U('no_outfit'))
			end
		end
	end)
end
		menu.close()
		CurrentAction		= 'ambulance_actions_menu'
		CurrentActionMsg	= _U('open_menu')
		CurrentActionData	= {} 
	end, function(data, menu)
		menu.close()
	end)
end

function GetAvailableVehicleSpawnPoint1(station, partNum)
	local spawnPoints = Config.AmbulanceStations[station].Lodzie[partNum].SpawnPoints
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

function GetAvailableVehicleSpawnPoint2(station, partNum)
	local spawnPoints = Config.AmbulanceStations[station].Helka[partNum].SpawnPoints
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
	local spawnPoints = Config.AmbulanceStations[station].Vehicles[partNum].SpawnPoints
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

function SetVehicleMaxMods(vehicle)
	ESX.TriggerServerCallback('esx_policejob:getPlayerData', function(data)
		--print('elo')
	local props = {
		SetVehicleNumberPlateText(vehicle, "EMS"..data.odznaka),
		SetVehicleDirtLevel(vehicle, 0.1),
		modTurbo        = true
	}
	ESX.Game.SetVehicleProperties(vehicle, props)
	end, GetPlayerServerId(PlayerId()))
end

function OpenVehicleSpawnerMenu(station, partNum)
	ESX.UI.Menu.CloseAll()

		local elements = {}

		local sharedVehicles = Config.AuthorizedVehicles.Shared
		for i=1, #sharedVehicles, 1 do
			table.insert(elements, { label = sharedVehicles[i].label, model = sharedVehicles[i].model})
		end

		local authorizedVehicles = Config.AuthorizedVehicles[ESX.PlayerData.job.grade_name]
		for i=1, #authorizedVehicles, 1 do
			table.insert(elements, { label = authorizedVehicles[i].label, model = authorizedVehicles[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('veh_menu'),
			align		= 'center',
			elements	= elements
		}, function(data, menu)
			menu.close()
	local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint(station, partNum)	

			ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
				SetVehicleMaxMods(vehicle)
			end)
		end, function(data, menu)
			menu.close()
			CurrentAction		= 'vehicle_spawner_menu'
			CurrentActionMsg	= _U('veh_spawn')
			CurrentActionData = {station = station, partNum = partNum}
		end)

end

function OpenLodzieSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('veh_menu'),
			align		= 'center',
			elements	= Config.Lodzie
		}, function(data, menu)
			menu.close()

			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint1(station, partNum)

			ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
				local playerPed = PlayerPedId()
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)		
			end)
		end, function(data, menu)
			menu.close()
			CurrentAction		= 'lodzie_spawner_menu'
			CurrentActionMsg	= _U('veh_spawn')
			CurrentActionData	= {}
		end)
end

function OpenHelkaSpawnerMenu(station, partNum)

	ESX.UI.Menu.CloseAll()

	local elements = {}

		local sharedHelka = Config.AuthorizedHelka.Shared
		for i=1, #sharedHelka, 1 do
			table.insert(elements, { label = sharedHelka[i].label, model = sharedHelka[i].model})
		end

		local authorizedHelka = Config.AuthorizedHelka[ESX.PlayerData.job.grade_name]
		for i=1, #authorizedHelka, 1 do
			table.insert(elements, { label = authorizedHelka[i].label, model = authorizedHelka[i].model})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_spawner',
		{
			title		= _U('veh_menu'),
			align		= 'center',
			elements	= elements
		}, function(data, menu)
			menu.close()


			local foundSpawnPoint, spawnPoint = GetAvailableVehicleSpawnPoint2(station, partNum)

			ESX.Game.SpawnVehicle(data.current.model, spawnPoint, spawnPoint.heading, function(vehicle)
				local playerPed = PlayerPedId()
				SetVehicleModKit(vehicle, 0)
				SetVehicleLivery(vehicle, 1)
				TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			end)
		end, function(data, menu)
			menu.close()
			CurrentAction		= 'helka_spawner_menu'
			CurrentActionMsg	= _U('veh_spawn')
			CurrentActionData	=  {station = station, partNum = partNum}
		end)
end

function OpenPharmacyMenu()

	local elements = {
			--{label = _U('put_weapon'),     value = 'get_stock'}
			{label = '<b style = color:aqua>Magazyn</b>', _U('medikit'), value = 'takwlasnie'},
			{label = _U('pharmacy_take', _U('medikit')), value = 'medikit'},
			{label = _U('pharmacy_take', _U('bandage')), value = 'bandage'},
			{label = _U('pharmacy_take', ('Zestaw do nurkowania')), value = 'oxygen_mask'},		
			{label = _U('pharmacy_take', ('Zestaw Naprawczy')), value = 'fixkit'},		
			{label = _U('pharmacy_take', ('Zestaw Szpitalny')), value = 'zestaw'},
			{label = _U('pharmacy_take', ('Srodek uspokajajacy')), value = 'usypiacz'},
			{label = '<b style = color:red>Szafka Pracownikow</b>', _U('medikit'), value = 'takwlasnie'},
			{label = 'Zdeponuj <span style = color:blue>Przedmiot</span>', value = 'put_stock'},
		}


	if ESX.PlayerData.job.grade ~= nil and  ESX.PlayerData.job.grade >= 7  then
		table.insert(elements, {label = 'Wyciągnnij <span style = color:blue>Przedmiot</span>',     value = 'get_stock'})
		--table.insert(elements, {label = _U('deposit_object'),  value = 'put_stock'})
	end 
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'pharmacy',
	{
		title		= _U('pharmacy_menu_title'),
		align		= 'center',
		elements = elements
			--[[{label = '<b style = color:red>Szafka Pracownikow</b>', _U('medikit'), value = 'takwlasnie'},
			{label = _U('put_weapon', _U('medikit')),  value = 'get_stock'},
			{label = _U('deposit_object',_U('medikit')), value = 'put_stock'},
			{label = '<b style = color:red>Magazyn</b>', _U('medikit'), value = 'takwlasnie'},
			{label = _U('pharmacy_take', _U('medikit')), value = 'medikit'},
			{label = _U('pharmacy_take', _U('bandage')), value = 'bandage'},
			{label = _U('pharmacy_take', ('Zestaw do nurkowania')), value = 'oxygen_mask'},		
			{label = _U('pharmacy_take', ('Zestaw Naprawczy')), value = 'fixkit'},		
			{label = _U('pharmacy_take', ('Zestaw Szpitalny')), value = 'zestaw'},

		--]]
	}, function(data, menu)
	if data.current.value == 'put_stock' then
		OpenPutStocksMenu()
	elseif data.current.value == 'get_stock' then
		OpenGetStocksMenu()
	else
		TriggerServerEvent('esx_ambulancejob:giveItem', data.current.value)
	end 
	end, function(data, menu)
		menu.close()

		CurrentAction		= 'pharmacy'
		CurrentActionMsg	= _U('open_pharmacy')
		CurrentActionData	= {}
	end) 
end

function OpenPutStocksMenu()

	ESX.TriggerServerCallback('esx_ambulancejob:getPlayerInventory', function(inventory)

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
			title    = ('<b style = color:purple>Twoje Przedmioty</b>'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count', {
				title = ('Ilosc')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ambulancejob:putStockItems', itemName, count)

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

	ESX.TriggerServerCallback('esx_ambulancejob:getStockItems', function(items)

		local elements = {}

		for i=1, #items, 1 do
			table.insert(elements, {
				label = 'x' .. items[i].count .. ' ' .. items[i].label,
				value = items[i].name
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
			title    = ('<b style = color:purple>Magazyn EMS</b>'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count', {
				title = ('Ilosc')
			}, function(data2, menu2)

				local count = tonumber(data2.value)

				if count == nil then
					ESX.ShowNotification(_U('quantity_invalid'))
				else
					menu2.close()
					menu.close()
					TriggerServerEvent('esx_ambulancejob:getStockItem', itemName, count)

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

function WarpPedInClosestVehicle(ped)
	local coords = GetEntityCoords(ped)

	local vehicle, distance = ESX.Game.GetClosestVehicle({
		x = coords.x,
		y = coords.y,
		z = coords.z
	})

	if distance ~= -1 and distance <= 5.0 then
		local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
		local freeSeat = nil

		for i=maxSeats - 1, 0, -1 do
			if IsVehicleSeatFree(vehicle, i) then
				freeSeat = i
				break
			end
		end

		if freeSeat ~= nil then
			TaskWarpPedIntoVehicle(ped, vehicle, freeSeat)
		end
	else
		ESX.ShowNotification(_U('no_vehicles'))
	end
end

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 8))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	ESX.ShowNotification(_U('healed'))
end)

RegisterNetEvent('esx_ambulancejob:jebaj')
AddEventHandler('esx_ambulancejob:jebaj', function(healType)

	local playerPed = PlayerPedId()

	if  healType == 'usypiacz' then
		SetPedToRagdoll(playerPed, 60000, 60000, 0, 0, 0, 0) 
	end

	ESX.ShowNotification('Zaaplikowano strzykawke')
end)

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


function OpenActionMenuInteraction(target)

	local elements = {}

	table.insert(elements, {label = ('Menu Przenoszenia'), value = 'drag'})
  
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'action_menu',
		{
			title    = ('Lift up'),
			align    = 'center',
			elements = elements
		},
    function(data, menu)

		local player, distance = ESX.Game.GetClosestPlayer()

		ESX.UI.Menu.CloseAll()	
		
		if data.current.value == 'drag' then			
			TriggerServerEvent('esx_ambulancejob:checkRope')
			ESX.ShowNotification('Podniosles/Upusciles osobe ...')
			TriggerServerEvent('esx_ambulancejob:lyfteruppn', GetPlayerServerId(player))
			Citizen.Wait(2)
			if hasRope == true then
				local dict = "anim@heists@box_carry@"
				
				RequestAnimDict(dict)
				while not HasAnimDictLoaded(dict) do
					Citizen.Wait(100)
				end
				
				local player, distance = ESX.Game.GetClosestPlayer()
				local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
				
				if distance ~= -1 and distance <= 3.0 then
					local closestPlayer, distance = ESX.Game.GetClosestPlayer()
					TriggerServerEvent('esx_ambulancejob:lyfter', GetPlayerServerId(closestPlayer))		
					
					TaskPlayAnim(GetPlayerPed(-1), dict, "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
					isCarry = true
				else
					ESX.ShowNotification("Brak graczy w poblizu...")
				end
      end
			menu.close()
		end

  end)

end

function LoadAnimationDictionary(animationD)
	while(not HasAnimDictLoaded(animationD)) do
		RequestAnimDict(animationD)
		Citizen.Wait(1)
	end
end

RegisterNetEvent('esx_ambulancejob:upplyft')
AddEventHandler('esx_ambulancejob:upplyft', function(target)
	local playerPed = GetPlayerPed(-1)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	local lPed = GetPlayerPed(-1)
	local dict = "amb@code_human_in_car_idles@low@ps@"
	
	if isCarry == false then
		LoadAnimationDictionary("amb@code_human_in_car_idles@generic@ps@base")
		TaskPlayAnim(lPed, "amb@code_human_in_car_idles@generic@ps@base", "base", 8.0, -8, -1, 33, 0, 0, 40, 0)
		
		AttachEntityToEntity(GetPlayerPed(-1), targetPed, 9816, 0.015, 0.38, 0.11, 0.9, 0.30, 90.0, false, false, false, false, 2, false)
		
		isCarry = true
	else
		DetachEntity(GetPlayerPed(-1), true, false)
		ClearPedTasksImmediately(targetPed)
		ClearPedTasksImmediately(GetPlayerPed(-1))
		
		isCarry = false
	end
end)


function OpenIdentityCardMenu(player)

	ESX.TriggerServerCallback('esx_ambulancejob:getOtherPlayerData', function(data)

		local elements    = {
			--{label = jobLabel,  value = nil}
		}
	
		if data.licenses ~= nil then
		

		if data.job.grade_label ~= nil and  data.job.grade_label ~= '' then
			jobLabel = _U('job', data.job.label .. ' - ' .. data.job.grade_label)
		else
			jobLabel = _U('job', data.job.label)
		end
		table.insert(elements, {label = jobLabel,  value = nil})
			for i=1, #data.licenses, 1 do
				table.insert(elements, {label = data.licenses[i].label, value = nil})
			end
	
		end
	
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction',
		{
			title    = ('<b style = color:purple>Posiadane Licencję</b>'),
			align    = 'center',
			elements = elements,
		}, function(data, menu)
	
		end, function(data, menu)
			menu.close()
		end)
	
	end, GetPlayerServerId(player))

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

RegisterNetEvent('esx_ambulancejob:damagedwalkmode')
AddEventHandler('esx_ambulancejob:damagedwalkmode', function()
	damagedwalk()
end)

function damagedwalk()
	RequestAnimSet("move_injured_generic")
	while not HasAnimSetLoaded("move_injured_generic") do
		Citizen.Wait(0)
	end
	SetPedMovementClipset(GetPlayerPed(-1), "move_injured_generic", 1 )
	xinjured = true
	damagedwalktimer()
end

function damagedwalktimer()
	if xinjured and not damagetimer then
		damagetimer = true
		Wait(60000)
		xinjured = false
		damagetimer = false
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
		if xinjured then
			SetPedMovementClipset(GetPlayerPed(-1), "move_injured_generic", 1 )
			if IsPedSprinting(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
			if IsPedJumping(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
			if IsPedArmed(PlayerPedId(), 7) and not IsPedRagdoll(PlayerPedId()) then
				SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), equipNow)
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
			if IsPedInMeleeCombat(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
			if IsPedHurt(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
			if IsPedClimbing(PlayerPedId()) and not IsPedRagdoll(PlayerPedId()) then
				local ForwardVector = GetEntityForwardVector(PlayerPedId())
				SetPedToRagdollWithFall(PlayerPedId(), 3000, 3000, 0, ForwardVector, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
			end
		end
	end
end)
