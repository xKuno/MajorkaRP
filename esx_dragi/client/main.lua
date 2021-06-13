ESX = nil
local myJob = nil

local selling = false
local secondsRemaining
local sold = false
local playerHasDrugs = false
local dilowanie = false 
local pedIsTryingToSellDrugs = false
local currentped = nil
local PlayerData		= {}
local proponuje = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--TIME TO SELL
Citizen.CreateThread(function()
	while true do
		if selling then
			if secondsRemaining > 0 then
				secondsRemaining = secondsRemaining - 1
			end
			Citizen.Wait(1000)
		end
		Citizen.Wait(10)
	end
end)

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end


Citizen.CreateThread(function()
	while true do
		Wait(100)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name ~= 'police' then
			local handle, ped = FindFirstPed()
			repeat
			    success, ped = FindNextPed(handle)
			   	local pos = GetEntityCoords(ped)
				local player = GetPlayerPed(-1)
				local pid = PlayerPedId()
				local playerloc = GetEntityCoords(player, 0)
		 		local distance = #(pos - playerloc)
			if distance <= 3 and ped ~= GetPlayerPed(-1) and ped ~= oldped and IsControlJustReleased(1, 38) and not proponuje then
		 		if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
			 		if DoesEntityExist(ped)then
			 			if IsPedDeadOrDying(ped) == false then
				 			if IsPedInAnyVehicle(ped) == false then
				 				local pedType = GetPedType(ped)
				 				if pedType ~= 28 and IsPedAPlayer(ped) == false then
					 				currentped = pos
										TriggerServerEvent('sell:check')
										if playerHasDrugs and sold == false and selling == false then 
											--PED REJECT OFFER
											local random = math.random(1, 3)
											-- print(random)
											proponuje = true
											if random == 1 then
												TriggerServerEvent('informacja')
												LoadModel("prop_drug_package_02")
												local PackageObject = CreateObject(GetHashKey("prop_drug_package_02"), playerloc['x'], playerloc['y'], playerloc['z'], true)
													SetEntityAsMissionEntity(ped)
													FreezeEntityPosition(ped,true)
													AttachEntityToEntity(PackageObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
													RequestAnimDict("mp_common")
													while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(10) end
														TaskPlayAnim(pid,"mp_common","givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)
												Citizen.Wait(7000)
												TriggerEvent('pNotify:SendNotification',{text = _U('reject')})
												DeleteEntity(PackageObject)
												oldped = ped
												--PED CALLING COPS
												--if Config.CallCops then
												--	local randomReport = math.random(1, Config.CallCopsPercent)
												--	if randomReport == Config.CallCopsPercent then
														TriggerServerEvent('drugsNotify')
												--	end
												--end
												TriggerEvent("sold")
												SetPedAsNoLongerNeeded(ped)
												FreezeEntityPosition(ped,false)
													RequestAnimDict("avoids")
													while (not HasAnimDictLoaded("avoids")) do Citizen.Wait(10) end
														TaskPlayAnim(oldped,"avoids","frfront_toback", 8.0, -8.0, -1, 0, 0, false, false, false)
											--PED ACCEPT OFFER
												proponuje = false
											else
												TriggerServerEvent('informacja')
												SetEntityAsMissionEntity(ped)
												ClearPedTasks(ped)
												FreezeEntityPosition(ped,true)
												oldped = ped										
												TaskStandStill(ped, 9)
												pos1 = GetEntityCoords(ped)
														LoadModel("prop_drug_package_02")
												local PackageObject1 = CreateObject(GetHashKey("prop_drug_package_02"), playerloc['x'], playerloc['y'], playerloc['z'], true)
												AttachEntityToEntity(PackageObject1, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
												TriggerEvent("sellingdrugs")
												Citizen.Wait(7000)
												SetPedAsNoLongerNeeded(oldped)
												DeleteEntity(PackageObject1)
													RequestAnimDict("mp_common")
													while (not HasAnimDictLoaded("mp_common")) do Citizen.Wait(10) end
														TaskPlayAnim(oldped,"mp_common","givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)
												proponuje = false
											end
										end
									end
								end
							end
						end
					end
				end
			until not success

			EndFindPed(handle)
		end 
	end
end)


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(100)
		if proponuje then
    --[[DisableControlAction(2, 199, true) -- Disable pause screen
    DisableControlAction(2, 200, true) -- Disable pause screen alternate
    DisableControlAction(0, 44, true) -- Cover
    DisableControlAction(0, 37, true) -- Select Weapon
    DisableControlAction(0, 311, true) -- K
    DisableControlAction(0, 59, true) -- Disable steering in vehicle
    DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
    DisableControlAction(0, 72, true) -- Disable reversing in vehicle
    DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
    DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
    DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
    DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
    DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
    DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
    DisableControlAction(0, 257, true) -- INPUT_ATTACK2
    DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
    DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
    DisableControlAction(0, 24, true) -- INPUT_ATTACK
    DisableControlAction(0, 25, true) -- INPUT_AIM
    DisableControlAction(0, 21, true) -- SHIFT
    DisableControlAction(0, 22, true) -- SPACE
    DisableControlAction(0, 288, true) -- F1
    DisableControlAction(0, 289, true) -- F2
    DisableControlAction(0, 170, true) -- F3
    DisableControlAction(0, 57, true) -- F10
    DisableControlAction(0, 73, true) -- X
    DisableControlAction(0, 244, true) -- M
    DisableControlAction(0, 246, true) -- Y
    DisableControlAction(0, 74, true) -- H
    DisableControlAction(0, 29, true) -- B
    DisableControlAction(0, 243, true) -- ~
	DisableControlAction(0, 244, true) -- M
	DisableControlAction(0, 81, true) -- ,
	DisableControlAction(0, 82, true) -- .]]
	DisableAllControlActions()
		end
    end
end)

Citizen.CreateThread(function()
	while true do
		Wait(100)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name ~= 'police' then
			if selling then
				local player = GetPlayerPed(-1)
	  			local playerloc = GetEntityCoords(player, 0)

				local distance = #(pos1 - playerloc)
				--local distance = #(pos1 - vector3( layerloc['x'], playerloc['y'], playerloc['z']))
				local pid = PlayerPedId()
				--TOO FAR
				if distance > 4 then
					ESX.ShowNotification(_U('too_far_away'))
					selling = false
					SetEntityAsMissionEntity(oldped)
					SetPedAsNoLongerNeeded(oldped)
					FreezeEntityPosition(oldped,false)
				end
				--SUCCESS
				if secondsRemaining <= 1 then			
					SetEntityAsMissionEntity(oldped)
					SetPedAsNoLongerNeeded(oldped)
					FreezeEntityPosition(oldped,false)
					sold = true
					TriggerEvent('sold_drugs')
					StopAnimTask(pid, "mp_common","givetake1_a", 1.0)
				end	
				
				if secondsRemaining == 7 and Config.PlayAnimation then
						RequestAnimDict("mp_common","givetake1_a")
						while (not HasAnimDictLoaded("mp_common","givetake1_a")) do 
						Citizen.Wait(0) 
						end
						TaskPlayAnim(pid,"mp_common","givetake1_a", 8.0, -8.0, -1, 0, 0, false, false, false)
				end
			end	
		end
	end
end)	



--[[Citizen.CreateThread(function()
	while true do
		Wait(100)
		if sold then
			TriggerServerEvent('sell:sellDrugs')
			selling = false
			playerHasDrugs = false
			sold = false
		end
	end	
end)	]]--	

RegisterNetEvent('sold_drugs')
AddEventHandler('sold_drugs', function()
	
	if #(GetEntityCoords(GetPlayerPed(-1)) - vector3(-58.95, -1636.03, 27.96)) > 2225 then
		TriggerServerEvent("dragi:strefasell", 0.85)
	end
	if #(GetEntityCoords(GetPlayerPed(-1)) - vector3(-58.95, -1636.03, 27.96)) <= 2225 then
		TriggerServerEvent("dragi:strefasell", 1)
	end
	if 	#(GetEntityCoords(GetPlayerPed(-1)) - vector3(276.9,-1854.19,26.86)) <= 300 then
		TriggerServerEvent("dragi:strefasell", 0.75)
	end
	if #(GetEntityCoords(GetPlayerPed(-1)) - vector3(-627.14, 276.21, 81.43)) <= 825 or #(GetEntityCoords(GetPlayerPed(-1)) - vector3(-1298.44, -344.83, 36.31)) <= 800 then
		TriggerServerEvent("dragi:strefasell", 1.15)
	end
	if 	#(GetEntityCoords(GetPlayerPed(-1)) - vector3(444.67, -993.04, 30.69)) <= 200 then
		TriggerServerEvent("dragi:strefasell", 1.50)
	end
	if sold then
		TriggerServerEvent('sell:sellDrugs')
		selling = false
		playerHasDrugs = false
		sold = false
	end
end)

RegisterNetEvent('sellingdrugs')
AddEventHandler('sellingdrugs', function()
	secondsRemaining = Config.TimeToSell + 1
	selling = true
end)

RegisterNetEvent('sold')
AddEventHandler('sold', function()
	sold = false
	selling = false
	secondsRemaining = 0
end)

--Sold info
RegisterNetEvent('showSellInfo')
AddEventHandler('showSellInfo', function(count, blackMoney, drugType)
	if drugType == "rweed" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('weed_pooch') .. blackMoney .. '$'})
		
	elseif drugType == "rsativa" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('weed_pooch') .. blackMoney .. '$'})
		
	elseif drugType == "rhybrid" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('weed_pooch') .. blackMoney .. '$'})
			
	elseif drugType == "rhasz" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('hasz_pooch') .. blackMoney .. '$'})
			
	elseif drugType == "methm" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('meth_pooch') .. blackMoney .. '$'})
	
	elseif drugType == "ramfa" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('amfa_pooch') .. blackMoney .. '$'})

	elseif drugType == "rnitro" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('nitro_pooch') .. blackMoney .. '$'})

	elseif drugType == "rcoke30" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('coke_pooch') .. blackMoney .. '$'})

	elseif drugType == "rcoke70" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('coke_pooch') .. blackMoney .. '$'})
	
	elseif drugType == "rcoke100" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('coke_pooch') .. blackMoney .. '$'})
		
	elseif drugType == "rcokes100" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('coke_pooch') .. blackMoney .. '$'})
		
	elseif drugType == "opiumpooch" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('opium_pooch') .. blackMoney .. '$'})
		
	elseif drugType == "chujpooch" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('chuj_pooch') .. blackMoney .. '$'})
	
	elseif drugType == "aloes_pooch" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('aloes_pooch') .. blackMoney .. '$'})

	elseif drugType == "extazypooch" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('extazy_pooch') .. blackMoney .. '$'})
	
	elseif drugType == "moonshine" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('bimber_pooch') .. blackMoney .. '$'})
	
	elseif drugType == "acid" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('acid_pooch') .. blackMoney .. '$'})

	elseif drugType == "extazy" then
		TriggerEvent('pNotify:SendNotification', {text = _U('you_have_sold') .. count .. _U('extazy_pooch') .. blackMoney .. '$'})
	
	end
end)

--Info that you dont have drugs
RegisterNetEvent('nomoredrugs')
AddEventHandler('nomoredrugs', function()
	TriggerEvent('pNotify:SendNotification', {text = _U('no_more_drugs')})
	playerHasDrugs = false
	sold = false
	selling = false
	secondsRemaining = 0
end)

--Show help notification ("PRESS E...")
RegisterNetEvent('playerhasdrugs')
AddEventHandler('playerhasdrugs', function()
	ESX.ShowHelpNotification(_U('input'))
	playerHasDrugs = true
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end


--Config
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local blipTime = 35 --in second
local showcopsmisbehave = true --show notification when cops steal too
--End config

local timing = timer * 60000 --Don't touche it

Citizen.CreateThread(function()
    while true do
        Wait(100)
        if NetworkIsSessionStarted() then
            DecorRegister("IsOutlaw",  3)
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 1)
            return
        end
    end
end)

Citizen.CreateThread( function()
    while true do
		Wait(1)
			if pedIsTryingToSellDrugs then
			local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
			local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
			local street1 = GetStreetNameFromHashKey(s1)
			local street2 = GetStreetNameFromHashKey(s2)
				DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
				if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' and showcopsmisbehave == false then
				elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' and showcopsmisbehave then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						local sex = nil
						if skin.sex == 0 then
							sex = "mężczyznę" --male/change it to your language
						else
							sex = "kobietę" --female/change it to your language
						end
						TriggerServerEvent('drugsInProgressPos', plyPos.x, plyPos.y, plyPos.z)
						if s2 == 0 then
							TriggerServerEvent('drugsInProgressS1', street1, sex)
						elseif s2 ~= 0 then
							TriggerServerEvent('drugsInProgress', street1, street2, sex)
						end
					end)
					Wait(3000)
					pedIsTryingToSellDrugs = false
				else
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						local sex = nil
						if skin.sex == 0 then
							sex = "mężczyznę"
						else
							sex = "kobietę"
						end
						TriggerServerEvent('drugsInProgressPos', plyPos.x, plyPos.y, plyPos.z)
						if s2 == 0 then
							TriggerServerEvent('drugsInProgressS1', street1, sex)
						elseif s2 ~= 0 then
							TriggerServerEvent('drugsInProgress', street1, street2, sex)
						end
					end)
					Wait(3000)
					pedIsTryingToSellDrugs = false
			end
		end
	end
end)

RegisterNetEvent('drugsPlace')
AddEventHandler('drugsPlace', function(tx, ty, tz)
if ESX and ESX.PlayerData.job ~= nil then
	if ESX.PlayerData.job.name == 'police' then
		local transT = 250
		local Blip = AddBlipForCoord(tx, ty, tz)
		SetBlipSprite(Blip,  51)
		SetBlipColour(Blip,  1)
		SetBlipAlpha(Blip,  transT)
		SetBlipAsShortRange(Blip,  false)
		while transT ~= 0 do
			Wait(blipTime * 4)
			transT = transT - 1
			SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				return
				end
			end
		end
	end
end)


RegisterNetEvent('drugsEnable')
AddEventHandler('drugsEnable', function()
	pedIsTryingToSellDrugs = true
end)
