local holdingUp = false
local store = ""
local blipRobbery = nil
local tabletEntity = nil
local tabletModel = "prop_cs_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"
local pos 
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyRobbing')
AddEventHandler('esx_holdup:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
end)

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip', function(position)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_holdup:robberyComplete')
AddEventHandler('esx_holdup:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_holdup:startTimer')
AddEventHandler('esx_holdup:startTimer', function()
	local timer = Stores[store].secondsRemaining
	
	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores) do
		if v.isbank == false and v.isother == false then
			local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
			SetBlipSprite(blip, 156)
			SetBlipScale(blip, 0.8)
			SetBlipAsShortRange(blip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('shop_robbery'))
			EndTextCommandSetBlipName(blip)
				elseif v.isbank == true then
			local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
			SetBlipSprite(blip, 255)--156
			SetBlipScale(blip, 0.8)
			SetBlipColour(blip, 75)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(_U('bank_robbery'))
			EndTextCommandSetBlipName(blip)
			elseif v.isother == true and v.isbank == false then
			local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
			SetBlipSprite(blip, 255)--156
			SetBlipScale(blip, 0.8)
			SetBlipColour(blip, 75)
			SetBlipAsShortRange(blip, true)
			
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(v.nameOfStore)
			EndTextCommandSetBlipName(blip)
		end
	end
end)

RegisterNetEvent('esx_holdup:animacja')
AddEventHandler('esx_holdup:animacja', function(animation, nazwa, czas)
	if nazwa == 'Napad na Elektroniczny' then

	  RequestAnimDict("missah_2_ext_altleadinout")
	  while not HasAnimDictLoaded("missah_2_ext_altleadinout") do
	    Citizen.Wait(0)
	  end
		TaskPlayAnim(GetPlayerPed(-1), "missah_2_ext_altleadinout", "hack_loop", 8.0, -8.0, -1, 50, 0, false, false, false)
		SetEntityHeading(PlayerPedId(), 331.75)
		FreezeEntityPosition(GetPlayerPed(-1), true)

	elseif nazwa == 'Napad na Muzeum' then
		RequestAnimDict('anim@heists@ornate_bank@grab_cash_heels')
		while not HasAnimDictLoaded('anim@heists@ornate_bank@grab_cash_heels') do
		Citizen.Wait(50)
		end
		local PedCoords = pos
		torba = CreateObject(GetHashKey('prop_cs_heist_bag_02'),PedCoords.x, PedCoords.y,PedCoords.z, true, true, true)
		AttachEntityToEntity(torba, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.0, 0.0, -0.16, 250.0, -30.0, 0.0, false, false, false, false, 2, true)
		TaskPlayAnim(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 8.0, -8.0, -1, 1, 0, false, false, false)
		FreezeEntityPosition(GetPlayerPed(-1), true)
		SetEntityHeading(PlayerPedId(), 331.4)
		Citizen.Wait(czas * 1000)
		DeleteEntity(torba)
		ClearPedTasks(GetPlayerPed(-1))
		FreezeEntityPosition(GetPlayerPed(-1), false)
		SetPedComponentVariation(GetPlayerPed(-1), 5, 45, 0, 2)

	else

		SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
		Citizen.Wait(1000)
		TaskStartScenarioInPlace(PlayerPedId(), animation, 0, true)

	end
end)

function startTabletAnimation1()
	Citizen.CreateThread(function()
	  RequestAnimDict(tabletDict)
	  while not HasAnimDictLoaded(tabletDict) do
	    Citizen.Wait(0)
	  end
		attachObject1()
		TaskPlayAnim(GetPlayerPed(-1), tabletDict, tabletAnim, 8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function attachObject1()
	if tabletEntity == nil then
		Citizen.Wait(380)
		RequestModel(tabletModel)
		while not HasModelLoaded(tabletModel) do
			Citizen.Wait(1)
		end
		tabletEntity = CreateObject(GetHashKey(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

function stopTabletAnimation1()
	if tabletEntity ~= nil then
		StopAnimTask(GetPlayerPed(-1), tabletDict, tabletAnim ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tabletEntity)
		tabletEntity = nil
	end
end

Citizen.CreateThread(function()
Citizen.Wait(1000)
    while true do
       Citizen.Wait(0)
       playerPed = GetPlayerPed(-1)
		
		if pos then
			if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 and not sprzedaje then
				ESX.ShowHelpNotification(_U('press_to_pendrajf'))
				if IsControlJustReleased(1, 51) and not sprzedaje and #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
					ESX.TriggerServerCallback('esx_holdup:sprawdzitemy', function(ilosc)
					if ilosc > 0 and ilosc ~= false then
						sprzedaje = true
						startTabletAnimation1(GetPlayerPed(-1))
						FreezeEntityPosition(GetPlayerPed(-1), false)
						ESX.ShowNotification('Poszukiwanie w toku: 0%')
						if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
							Citizen.Wait(20000)
							if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
								ESX.ShowNotification('Poszukiwanie w toku: 20%')
								Citizen.Wait(20000)
								if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
									ESX.ShowNotification('Poszukiwanie w toku: 40%')
									Citizen.Wait(20000)
									if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
										ESX.ShowNotification('Poszukiwanie w toku: 60%')
										Citizen.Wait(20000)
										RequestModel(1092080539)
											while not HasModelLoaded(1092080539) do
											Wait(10)
										end
										dealer = CreatePed(26, 1092080539, 3049.0, 2131.58, 14.57, 320.61, false, false)
										SetBlockingOfNonTemporaryEvents(dealer, true)
										TaskGoStraightToCoord(dealer,3064.15, 2209.68, 3.82, 218.07, 1.0,  -1,  0.0,  0.0)
										if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
											ESX.ShowNotification('Znaleziono, poczekaj az do Ciebie przyjdzie. Poczekaj 3 minuty.')
											stopTabletAnimation1(GetPlayerPed(-1))
											Citizen.Wait(180000)
												if IsPedFatallyInjured(dealer) then
													ESX.ShowNotification('Ochotnik umarł, spróbuj ponownie.')
													sprzedaje = false
													return
												end
												if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
													ESX.ShowNotification('Znaleziono, sprzedawanie: 100%')
													if #(pos - vector3(3064.15, 2209.68, 3.82)) <= 5 then
														TriggerServerEvent('esx_holdup:sprzedawanie')
														FreezeEntityPosition(GetPlayerPed(-1), false)
														sprzedaje = false
													end	
												end
											end
										end
									end
								end
							end
						else
							TriggerEvent('esx:showNotification', "Nie posiadasz ~r~probowki~s~")
						end
					end, 'probowka')
				end
		else
			end
		end
    end
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		Citizen.Wait(1)

		for k,v in pairs(Stores) do
			local storePos = v.position
			local distance = #(pos - vector3(storePos.x, storePos.y, storePos.z))

			if distance < Config.Marker.DrawDistance then
				if not holdingUp then
					DrawMarker(Config.Marker.Type, storePos.x, storePos.y, storePos.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Marker.x, Config.Marker.y, Config.Marker.z, Config.Marker.r, Config.Marker.g, Config.Marker.b, Config.Marker.a, false, false, 2, false, false, false, false)

					if distance < 0.5 then
						ESX.ShowHelpNotification(_U('press_to_rob', v.nameOfStore))

						if IsControlJustReleased(0, 38) then
							TriggerServerEvent('esx_holdup:robberyStarted', k)
						end
					end
				end
			end

		if holdingUp then
		 	DisableControlAction(0, 19, true)
		end

		if holdingUp and IsControlJustReleased(0, 73)then
		 	FreezeEntityPosition(GetPlayerPed(-1), false)
		 	TriggerServerEvent('esx_holdup:tooFar', store)
		 	DeleteEntity(torba)
		end

		if holdingUp then
			local storePos = Stores[store].position
			local hahajp = Stores[store].animation
			local nazwasklepu = Stores[store].nameOfStore
			if #(pos - vector3(storePos.x, storePos.y, storePos.z)) > Config.MaxDistance then
				TriggerServerEvent('esx_holdup:tooFar', nazwasklepu)
				FreezeEntityPosition(GetPlayerPed(-1), false)
			end
				if not IsPedUsingScenario(PlayerPedId(), hahajp) and nazwasklepu ~= 'Napad na Elektroniczny' and nazwasklepu ~= 'Napad na Muzeum' then
					Citizen.Wait(2000)
					if not IsPedUsingScenario(PlayerPedId(), hahajp) and nazwasklepu ~= 'Napad na Elektroniczny' and nazwasklepu ~= 'Napad na Muzeum' then
						TriggerServerEvent('esx_holdup:tooFar', nazwasklepu)
						FreezeEntityPosition(GetPlayerPed(-1), false)
					end
				end
				if IsControlJustReleased(0, 73)then
					FreezeEntityPosition(GetPlayerPed(-1), false)
					TriggerServerEvent('esx_holdup:tooFar', nazwasklepu)
					DeleteEntity(torba)
			end
		   end
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
	   		pos = GetEntityCoords(GetPlayerPed(-1), true)
    end
end)

Citizen.CreateThread(function()

    while true do
       Citizen.Wait(0)
		
		if pos then
			if #(pos - vector3(-1037.39, -2737.26, 20.17)) <= 25 or #(pos - vector3(-265.19, -963.21, 31.22)) <= 15  then
				spawn = true
			else
				spawn = false
			end
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
 
        if spawn then
            DisableControlAction(2, 24, true) -- Attack
            DisableControlAction(2, 257, true) -- Attack 2
            DisableControlAction(2, 25, true) -- Aim
            DisableControlAction(2, 263, true) -- Melee Attack 1
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
        end
    end
end)