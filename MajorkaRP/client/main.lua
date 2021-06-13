local disableShuffle = true
local showPlayerBlips = false
local ignorePlayerNameDistance = false
local playerNamesDist = 17
local displayIDHeight = 1.15 --Height of ID above players head(starts at center body mass)
--Set Default Values for Colors
local red = 255
local green = 255
local blue = 255

ESX                           = nil

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

function startUI(time, text) 
	SendNUIMessage({
	  type = "ui",
	  display = true,
	  time = time,
	  text = text
	})
  end
  
  function closeUI(...) 
	SendNUIMessage({
	  type = "ui",
	  display = false,
	})
  end

Citizen.CreateThread(function()
	SetRichPresence(GetPlayerName(PlayerId()) .. " na MajorkaRP | ID: " .. GetPlayerServerId(PlayerId()))
end)
 
 Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		id = PlayerId()
		DisablePlayerVehicleRewards(id)	
	end
end)

Citizen.CreateThread(function()
	while true do
		Wait(3000)

		TriggerServerEvent("checkMyPingBro")
	end
end)

RegisterNetEvent('reportSys:recieveRespond')
AddEventHandler('reportSys:recieveRespond', function(name, message)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(61, 45, 26, 0.4); border-radius: 3px;"><i class="fas fa-user-shield"style="font-size:13px;color:rgb(38,38,38,0.5)"></i>&ensp;<font color="FFFFFF">[TICKET] {0}:</font>&ensp;<font color="white">{1}</font></div>',
         args = { name, message }
    })
end)

RegisterNetEvent('reportSys:sendTicket')
AddEventHandler('reportSys:sendTicket', function(name, message)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(150, 107, 57, 0.4); border-radius: 3px;"><i class="fas fa-user-shield"style="font-size:13px;color:rgb(38,38,38,0.5)"></i>&ensp;<font color="FFFFFF">[TICKET] {0}:</font>&ensp;<font color="white">{1}</font></div>',
         args = { name, message }
    })
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/reply',  'Odpowiedz na Ticketa',  { { name = 'ID zgłoszenia', help = 'Wpisz ID gracza który wysyłał zgłoszenie.' }, { name = 'Wiadomość', help = 'Treść odpowiedzi.' } } )
	TriggerEvent('chat:addSuggestion', '/report',   'Wyślij zgłoszenie Administratorowi. (Bezsensowne tickety będą równały się z banem)',   { { name = 'Wiadomość', help = 'Opisz tutaj dokładnie swój problem.' } } )
	TriggerEvent('chat:addSuggestion', '/warn',  'Wystaw ostrzeżenie',  { { name = 'ID Gracza', help = 'Wpisz ID gracza który ma dostać ostrzeżenie.' }, { name = 'Wiadomość', help = 'Treść ostrzeżenia.' } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/reply')
		TriggerEvent('chat:removeSuggestion', '/report')
		TriggerEvent('chat:removeSuggestion', '/warn')
	end
end)

Citizen.CreateThread(function()
	while true do
	
	Citizen.Wait(500)
	
		local playerPed = PlayerPedId()
		local playerLocalisation = GetEntityCoords(playerPed)
		
		ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 400.0)

	end
end)

Citizen.CreateThread(function()
	while true do
	
	Citizen.Wait(3000)
		local playerPed = PlayerPedId()
		local playerLocalisation = GetEntityCoords(playerPed)
		DistanceCheck = #(playerLocalisation - vector3(0,0,0))
		if DistanceCheck <= 50 then
			SetEntityCoords(playerPed, 0.64, 0.87, 75.0, 0.0, 0.0, 0.0, true)
		end
	end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		SetVehicleDensityMultiplierThisFrame(0.0)

		SetPedDensityMultiplierThisFrame(0.5)

		SetCreateRandomCops(false)
	    SetCreateRandomCopsNotOnScenarios(false)
		SetCreateRandomCopsOnScenarios(false)
	    SetNumberOfParkedVehicles(0.15)
    end 
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing
		SetCanAttackFriendly(GetPlayerPed(-1), true, false)
		NetworkSetFriendlyFireOption(true)
	end
end)

function RemoveWeaponDrops()
	DisablePlayerVehicleRewards(PlayerId())	
    RemoveAllPickupsOfType(0xDF711959)
    RemoveAllPickupsOfType(0xF9AFB48F)
    RemoveAllPickupsOfType(0xA9355DCD)
	RemoveAllPickupsOfType(0x6C5B941A)
	RemoveAllPickupsOfType(0x3A4C2AD2)
    RemoveAllPickupsOfType(0x88EAACA7)
    RemoveAllPickupsOfType(0xBD248B55)
	RemoveAllPickupsOfType(0xD205520E)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for i = 1, 15 do
			EnableDispatchService(i, false)
		end
		RemoveWeaponDrops()
	end
end)

function disableSeatShuffle(flag)
	disableShuffle = flag
end
local sleepThread = 10
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(sleepThread)
		if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		sleepThread = 10
			if disableShuffle then
				if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
					if GetIsTaskActive(GetPlayerPed(-1), 165) then
						SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
					end
				end
			end
		else
			sleepThread = 500
		end
	end
end)

RegisterNetEvent("SeatShuffle")
AddEventHandler("SeatShuffle", function()
	if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
		disableSeatShuffle(false)
		Citizen.Wait(5000)
		disableSeatShuffle(true)
	else
		CancelEvent()
	end
end)

RegisterCommand("zmien", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

RegisterCommand("shuff", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

RegisterCommand("z", function(source, args, raw) --change command here
    TriggerEvent("SeatShuffle")
end, false) --False, allow everyone to run it

RegisterNetEvent('ps:zacmienie')
AddEventHandler('ps:zacmienie', function(left)
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("breaking_news")
		while not HasScaleformMovieLoaded(scaleform) do
			Citizen.Wait(0)
		end

		PushScaleformMovieFunction(scaleform, "SET_TEXT")
		PushScaleformMovieFunctionParameterString("UWAGA: Zaćmienie wyspy za " .. left .. " minut" .. (left == 1 and "ę" or (left < 5 and "y" or "")) .. "!")
		PushScaleformMovieFunctionParameterString("Zabierz ze sobą <b>bilet</b> powrotny!")
		PopScaleformMovieFunctionVoid()

		PushScaleformMovieFunction(scaleform, "SET_SCROLL_TEXT")
		PushScaleformMovieFunctionParameterInt(0)
		PushScaleformMovieFunctionParameterInt(0)
		PushScaleformMovieFunctionParameterString("MajorkaRP")
		PopScaleformMovieFunctionVoid()

		PushScaleformMovieFunction(scaleform, "DISPLAY_SCROLL_TEXT")
		PushScaleformMovieFunctionParameterInt(0)
		PushScaleformMovieFunctionParameterInt(0)
		PopScaleformMovieFunctionVoid()

		local passed = GetGameTimer() + 15000
		while passed > GetGameTimer() do
			Citizen.Wait(1)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
		end
	end)
end)


--[[function DrawText3D(x,y,z, text) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz) - vector3(x,y,z))

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
    
    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(red, green, blue, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
		World3dToScreen2d(x,y,z, 0) --Added Here
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlPressed(1, 48) then
            for i=0,99 do
                N_0x31698aa80e0223f8(i)
            end
                for k,v in ipairs(GetActivePlayers()) do
                    if  NetworkIsPlayerActive( v ) then
     
                    x1, y1, z1 = table.unpack( GetEntityCoords( PlayerPedId(), true ) )
                    x2, y2, z2 = table.unpack( GetEntityCoords( GetPlayerPed( v ), true ) )
                    distance = math.floor(#(vector3(x1,  y1,  z1) - vector3(x2,  y2,  z2)))

                    if(ignorePlayerNameDistance) then
    					if NetworkIsPlayerTalking(v) then
    						red = 0
    						green = 0
    						blue = 255
    						DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(v))
    					else
    						red = 255
    						green = 255
    						blue = 255
    						DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(v))
    					end
                    end

                    if ((distance < playerNamesDist)) then
                        if not (ignorePlayerNameDistance) then
    						if NetworkIsPlayerTalking(v) then
    							red = 0
    							green = 0
    							blue = 255
    							DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(v))
    						else
    							red = 255
    							green = 255
    							blue = 255
    							DrawText3D(x2, y2, z2 + displayIDHeight, GetPlayerServerId(v))
    						end
                        end
                    end  
                end
            end
        end
    end
end)]]--
--[[
local disPlayerNames = 10
local playerDistances = {}

local function DrawText3D(position, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(position.x,position.y,position.z+1)
    local dist = #(GetGameplayCamCoords()-position)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if not useCustomScale then
            SetTextScale(0.0*scale, 0.55*scale)
        else 
            SetTextScale(0.0*scale, customScale)
        end
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

Citizen.CreateThread(function()
	Wait(500)
    while true do
    	        if IsControlPressed(1, 48) then
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= PlayerPedId() then
                if playerDistances[id] then
                    if playerDistances[id] < disPlayerNames then
                        local targetPedCords = GetEntityCoords(targetPed)
                        if NetworkIsPlayerTalking(id) then
                            DrawText3D(targetPedCords, GetPlayerServerId(id), 247,124,24)
                            DrawMarker(27, targetPedCords.x, targetPedCords.y, targetPedCords.z-0.97, 0, 0, 0, 0, 0, 0, 1.001, 1.0001, 0.5001, 173, 216, 230, 100, 0, 0, 0, 0)
                        else
                            DrawText3D(targetPedCords, GetPlayerServerId(id), 255,255,255)
                        end
                    end
                end
            end
        end
    end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for _, id in ipairs(GetActivePlayers()) do
            local targetPed = GetPlayerPed(id)
            if targetPed ~= playerPed then
                local distance = #(playerCoords-GetEntityCoords(targetPed))
				playerDistances[id] = distance
            end
        end
        Wait(1000)
    end
end)]]


Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(544403316550139911)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('logo3')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Rezerwuj bilet na Majorke!')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('logo3')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('MajorkaRP')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)

RegisterNetEvent("MajorkaRP:receiveWarn")
AddEventHandler("MajorkaRP:receiveWarn",function(message)
	TriggerEvent("chat:addMessage",{color={255,255,0},multiline=true,args={"MajorkaRP","Otrzymałeś ostrzeżenie: "..message}})
	Citizen.CreateThread(function()
		local scaleform = RequestScaleformMovie("mp_big_message_freemode")
		while not HasScaleformMovieLoaded(scaleform) do Citizen.Wait(0) end
		BeginScaleformMovieMethod(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
		PushScaleformMovieMethodParameterString("~y~OSTRZEŻENIE!")
		PushScaleformMovieMethodParameterString(message)
		PushScaleformMovieMethodParameterInt(5)
		EndScaleformMovieMethod()
		PlaySoundFrontend(-1, "LOSER", "HUD_AWARDS")
		local drawing = true
		Citizen.SetTimeout((Config.warning_screentime * 1000),function() drawing = false end)
		while drawing do
			Citizen.Wait(0)
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end
		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end)