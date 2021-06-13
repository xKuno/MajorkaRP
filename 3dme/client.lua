-- Settings
local color = { r = 255, g = 84, b = 50, alpha = 255 } --255, 84, 50,
local colordo = { r = 84, g = 252, b = 254, alpha = 255 } --84, 252, 254,
local colortry = { r= 0, g = 168, b = 8, alpha = 190} --255
local font = 0 -- Font of the text
local time = 7000 -- Duration of the display of the text : 1000ms = 1sec
local background = {
    enable = false,
    color = { r = 35, g = 35, b = 35, alpha = 200 },
}
local chatMessage = true
local dropShadow = false

-- Don't touch
local nbrDisplaying = 1

local fontopis = 4 -- Font of the text
local nbrDisplayingopis = -1

local opis_tekst = {}

RegisterCommand('opis', function(source, args)
    local text = ' '
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
	if not args[1] then
		opis_tekst[GetPlayerServerId(PlayerId())] = nil
		TriggerServerEvent('3dme:shareDisplayopis', "XXXXXXaok33333sd325jjdfs")
	else
		opis_tekst[GetPlayerServerId(PlayerId())] = nil
		local chatopis = text
		text = text .. ' '
		TriggerServerEvent('3dme:shareDisplayopis', text)
	end
end)

RegisterNetEvent('3dme:shareDisplayopis')
AddEventHandler('3dme:shareDisplayopis', function(text, source)
    local offset = 1 + (nbrDisplayingopis*0.10)
	opis_tekst[source] = nil
    local player = GetPlayerFromServerId(source)
	if text ~= "XXXXXXaok33333sd325jjdfs" and player ~= -1 then
		opis_tekst[source] = text
		local ped = GetPlayerPed(player)
		Displayopis(ped, text, offset, source)
	end
end)

function Displayopis(mePlayer, text, offset, source)
	Citizen.CreateThread(function()
		local coords = GetEntityCoords(PlayerPedId(), false)
		Citizen.CreateThread(function()
			while opis_tekst[source] do
				Wait(1000)
				coords = GetEntityCoords(PlayerPedId(), false)
			end
		end)
		while opis_tekst[source] do
			Wait(0)
			dist = #(GetEntityCoords(mePlayer) - GetEntityCoords(PlayerPedId()))
			if dist < 5 then
				local x, y, z = table.unpack(GetEntityCoords(mePlayer))
				z = z + offset
				DrawText3D(x,y,z, vector3(x,y,z),opis_tekst[source], typ, {0.003, 0.02, 325})
				--print(x,y,z)
			end
		end
	end)
end

function DrawText3D(x,y,z, gowno, text, typ, rect)
	rect = rect or {0.005, 0.03, 250}
    local onScreen,x3,y3 = World3dToScreen2d(x,y,z-0.65)
    if onScreen then
        SetTextScale(0.4, 0.4)
        SetTextFont(fontopis)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)

        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(x3, y3)
    end
end

RegisterNetEvent("roll:hahajp")
AddEventHandler("roll:hahajp", function()
    local die = math.random(1,6)
 
    loadAnimDict("anim@mp_player_intcelebrationmale@wank")
    TaskPlayAnim(GetPlayerPed(-1), "anim@mp_player_intcelebrationmale@wank", "wank", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Citizen.Wait(1500)
    ClearPedTasks(GetPlayerPed(-1))
    TriggerServerEvent('3dtry:shareDisplay', 'WYLOSOWAŁEŚ: ' .. die)
end)


function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict( dict )
        Citizen.Wait(5)
    end
end

RegisterCommand('me', function(source, args)
    local text = ' ' -- edit here if you want to change the language : EN: the person / FR: la personne
	for k,i in ipairs(args) do
        text = text .. ' ' .. i
    end
	text = GetPlayerServerId(PlayerId())..": ".. text .. '  '
    TriggerServerEvent('3dme:shareDisplay', text)
end)

RegisterCommand('med', function(source, args)
    local text = ' ' -- edit here if you want to change the language : EN: the person / FR: la personne
	for k,i in ipairs(args) do
        text = text .. ' ' .. i
    end
	text = GetPlayerServerId(PlayerId())..":  ".. text .. '  '
    TriggerServerEvent('3dmed:shareDisplay', text)
end)

RegisterCommand('do', function(source, args)
    local text = ' ' -- edit here if you want to change the language : EN: the person / FR: la personne
	for k,i in ipairs(args) do
        text = text .. ' ' .. i
    end
	text = GetPlayerServerId(PlayerId())..": ".. text .. ' '
    TriggerServerEvent('3ddo:shareDisplay', text)
end)

RegisterCommand('try', function(source, args)
    local text = '' -- edit here if you want to change the language : EN: the person / FR: la personne
	local udalo = 'try*'
	for k,i in ipairs(args) do
        text = text .. ' ' .. i
    end
	--text = GetPlayerServerId(PlayerId()).."".. text .. '  *'
   -- TriggerServerEvent('3dtry:shareDisplay', text)
	local losuj = math.random(1, 2)
	if losuj== 1 then
	udalo = GetPlayerServerId(PlayerId())..": ".. text  .. " | z powodzeniem - ✅" 
	--Citizen.Wait(2000)
	TriggerServerEvent('3dtry:shareDisplay', udalo)
	elseif losuj== 2 then
	udalo = GetPlayerServerId(PlayerId())..": ".. text  .. " | z niepowiedzeniem - ❌" 
	--Citizen.Wait(2000)
	TriggerServerEvent('3dtry:shareDisplay', udalo)
	end
end)

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.20)
    local player = GetPlayerFromServerId(source)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        Display(ped, text, offset)
    end
end)

RegisterNetEvent('3dmed:triggerDisplay')
AddEventHandler('3dmed:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.20)
    local player = GetPlayerFromServerId(source)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        DisplayMed(ped, text, offset)
    end
end)

RegisterNetEvent('3ddo:triggerDisplay')
AddEventHandler('3ddo:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.14)
    local player = GetPlayerFromServerId(source)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        DisplayDo(ped, text, offset)
    end
end)

RegisterNetEvent('3dtry:triggerDisplay')
AddEventHandler('3dtry:triggerDisplay', function(text, source)
    local offset = 1 + (nbrDisplaying*0.14)
    local player = GetPlayerFromServerId(source)
    if player ~= -1 then
        local ped = GetPlayerPed(player)
        DisplayTry(ped, text, offset)
    end
end)

function Display(mePlayer, text, offset)
    local displaying = true

    -- Chat message
    if chatMessage then
   	 	local playerPed = PlayerPedId()
    	local playerCoords = GetEntityCoords(playerPed)
    	local pedCoords = GetEntityCoords(mePlayer)
    	local dist = #(playerCoords - pedCoords)
        if dist < 5 then
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.1vw; margin: 0.5vw; font-size: 15px; background-color: rgba(245, 90, 66, 0.0); border-radius: 3px;"><i class="fas fa-sim-card"></i>&nbsp;[{0}] {1}</div>',
        args = {'^8𝙈𝙀^0',text }})
        end
    end

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        dist3 = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(mePlayer))
        while displaying do
            Wait(0)
            if dist3 < 5 then
                local x, y, z = table.unpack(GetEntityCoords(mePlayer))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayMed(mePlayer, text, offset)
    local displaying = true

    -- Chat message
    if chatMessage then
   	 	local playerPed = PlayerPedId()
    	local playerCoords = GetEntityCoords(playerPed)
    	local pedCoords = GetEntityCoords(mePlayer)
    	local dist = #(playerCoords - pedCoords)
        if dist < 5 then
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.1vw; margin: 0.5vw; font-size: 15px; background-color: rgba(255, 0, 0, 0.0); border-radius: 3px;"><i class="fas fa-sim-card"></i>&nbsp;[{0}] {1}</div>',
        args = { '^1𝙈𝙀𝘿^0', text }})
        end
    end

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        dist3 = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(mePlayer))
        while displaying do
            Wait(0)
            if dist3 < 5 then
                local x, y, z = table.unpack(GetEntityCoords(mePlayer))
                z = z + offset
                DrawText3DMED(vector3(x, y, z), text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayDo(mePlayer, text, offset)
    local displaying = true

    -- Chat message
    if chatMessage then
   	 	local playerPed = PlayerPedId()
    	local playerCoords = GetEntityCoords(playerPed)
    	local pedCoords = GetEntityCoords(mePlayer)
    	local dist = #(playerCoords - pedCoords)
        if dist < 5 then
	TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.1vw; margin: 0.5vw; font-size: 15px; background-color: rgba(66, 245, 221, 0.0); border-radius: 3px;"><i class="fas fa-sim-card"></i>&nbsp;[{0}] {1}</div>',
        args = {'^5𝘿𝙊^0', text }})
        end
    end

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        dist3 = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(mePlayer))
        while displaying do
            Wait(0)
            if dist3 < 5 then
                local x, y, z = table.unpack(GetEntityCoords(mePlayer))
                z = z + offset
                DrawText3DDo(vector3(x, y, z), text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DisplayTry(mePlayer, text, offset)
    local displaying = true

    -- Chat message
    if chatMessage then
   	 	local playerPed = PlayerPedId()
    	local playerCoords = GetEntityCoords(playerPed)
    	local pedCoords = GetEntityCoords(mePlayer)
    	local dist = #(playerCoords - pedCoords)
        if dist < 5 then
			TriggerEvent('chat:addMessage', {
				template = '<div style="padding: 0.1vw; margin: 0.5vw; font-size: 15px; background-color: rgba(0, 168, 8, 0.0); border-radius: 3px;"><i class="far fa-times-circle"></i>&nbsp;[{0}] {1}</div>',
				args = {'𝙏𝙍𝙔🎲', text }})
			end
		end

    Citizen.CreateThread(function()
        Wait(time)
        displaying = false
    end)
    Citizen.CreateThread(function()
        nbrDisplaying = nbrDisplaying + 1
        dist3 = #(GetEntityCoords(PlayerPedId()) - GetEntityCoords(mePlayer))
        while displaying do
            Wait(0)
            if dist3 < 5 then
                local x, y, z = table.unpack(GetEntityCoords(mePlayer))
                z = z + offset
                DrawText3DTry(vector3(x, y, z), text)
            end
        end
        nbrDisplaying = nbrDisplaying - 1
    end)
end

function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(color.r, color.g, color.b, color.alpha)
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function DrawText3DMED(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(color.r, color.g, color.b, color.alpha)
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function DrawText3DDo(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(colordo.r, colordo.g, colordo.b, colordo.alpha)
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function DrawText3DTry(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(255, 255, 255, 255)
    SetTextScale(0.0*scale, 0.55*scale)
    SetTextFont(font)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    -- Diplay the text
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local font = 4 -- Font of the text
local nbrDisplaying = -1


local opis_tekst = {}

RegisterCommand('opis', function(source, args)
    local text = ' '
    for i = 1,#args do
        text = text .. ' ' .. args[i]
    end
    if not args[1] then
        opis_tekst[GetPlayerServerId(PlayerId())] = nil
        TriggerServerEvent('3dme:shareDisplayopis', "XXXXXXaok33333sd325jjdfs")
    else
        opis_tekst[GetPlayerServerId(PlayerId())] = nil
        local chatopis = text
        text = text .. ' '
        TriggerServerEvent('3dme:shareDisplayopis', text)
    end
end)

RegisterNetEvent('3dme:shareDisplayopis')
AddEventHandler('3dme:shareDisplayopis', function(text, source)
    local offset = 1 + (nbrDisplaying*0.10)
    opis_tekst[source] = nil
    local player = GetPlayerFromServerId(source)
    if text ~= "XXXXXXaok33333sd325jjdfs" and player ~= -1 then
        opis_tekst[source] = text
        local ped = GetPlayerPed(player)
        Displayopis(ped, text, offset, source)
    end
end)

function Displayopis(mePlayer, text, offset, source)
    Citizen.CreateThread(function()
        local coords = GetEntityCoords(PlayerPedId(), false)
        Citizen.CreateThread(function()
            while opis_tekst[source] do
                Wait(1000)
                coords = GetEntityCoords(PlayerPedId(), false)
            end
        end)
        while opis_tekst[source] do
            Wait(0)
            dist = #(GetEntityCoords(mePlayer) - GetEntityCoords(PlayerPedId()))
            if dist < 5 then
                local x, y, z = table.unpack(GetEntityCoords(mePlayer))
                z = z + offset
                DrawText3DOpis(x,y,z, vector3(x,y,z),opis_tekst[source], typ, {0.003, 0.02, 325})
                --print(x,y,z)
            end
        end
    end)
end

function DrawText3DOpis(x,y,z, gowno, text, typ, rect)
    rect = rect or {0.005, 0.03, 250}
    local onScreen,x3,y3 = World3dToScreen2d(x,y,z-0.65)
    if onScreen then
        SetTextScale(0.4, 0.4)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)

        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(x3, y3)
    end
end