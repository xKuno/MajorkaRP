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

----============================================================================
local SekretneHaslo = "penris" --twoje haslo , speirdalaj kamil. Macius takie chcial i takie bedzie. Nikt nigdy nie zgadnie haha. Elo
local Bronia1 = {item="money", cena = 2137, nazwa = "MIREK HANDLARZ", max = 0} ---- bronie wedle tego schematu | weapon | cena | nazwa 
local Bronia2 = {weapon = "pistol_ammo_box", cena = 7500, nazwa = "Magazynek 9mm", max = 10}
local Bronia3 = {weapon = "pistol_ammo", cena = 7500, nazwa = "25 Amunicji 9mm", max = 95}
local Bronia4 = {weapon = "molotov", cena = 50000, nazwa = "Molotov", max = 15}
local Bronia5 = {weapon = "WEAPON_KNIFE", cena = 250000, nazwa = nil, max = 0}
local Bronia6 = {weapon = "WEAPON_ASSAULTRIFLE", cena = 500000, nazwa = nil, max = 0}
local Bronia7 = {weapon = "WEAPON_ASSAULTRIFLE_MK2", cena = 1000000, nazwa = nil, max = 0}
local Bronia8 = {weapon = "WEAPON_PUMPSHOTGUN", cena = 6500, nazwa = nil, max = 0}
local Bronia9 = {weapon = "WEAPON_PUMPSHOTGUN_MK2", cena = 9300, nazwa = nil, max = 0}
local Bronia10 = {weapon = "WEAPON_HEAVYPISTOL", cena = 3500, nazwa = nil, max = 0}
    --[[
            JEŻELI CHCESZ NP TYLKO 2 BRONIE TO W RESZCIE POD 'nazwa'
            DAJ WARTOŚĆ nil w ten sposób:

            local Bronia4 = {
                weapon = "WEAPON_BAT",
                cena = 500,
                nazwa = nil
            }

        ]
    ]]
local czas = false
local PojazdHandlarza = 'rumpo'
    -- -= === === === === === === Nie tykaj === === === === === === === === === === === === === === === === === ===
local Zakupiono = 0
local opened = 0
local drivingStyle = 1074528293
local spawnRadius = 160
local timer = 0
local zrespione = 0
local wybieranie = false
    -- -= === === === === === === === === === === === === === === === === === === === === === === === === === === ==
    ESX = nil
local PlayerData = {}

Citizen.CreateThread(function() while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0) end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData() end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer) PlayerData = xPlayer end)

    -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function WyborBroniek()
local a = {}
opened = 1;
  if Bronia1.nazwa~=nil then 
    table.insert(a,{label=''..Bronia1.nazwa..' | <font color=red>'..Bronia1.cena..'$</font>',value='111'})
    end;
    if Bronia2.nazwa~=nil then table.insert(a,{label=''..Bronia2.nazwa..' | <font color=red>'..Bronia2.cena..'$</font>',value='222'})
    end;
    if Bronia3.nazwa~=nil then table.insert(a,{label=''..Bronia3.nazwa..' | <font color=red>'..Bronia3.cena..'$</font>',value='333'})
    end;
    if Bronia4.nazwa~=nil then table.insert(a,{label=''..Bronia4.nazwa..' | <font color=red>'..Bronia4.cena..'$</font>',value='444'})
    end;
    if Bronia5.nazwa~=nil then table.insert(a,{label=''..Bronia5.nazwa..' | <font color=red>'..Bronia5.cena..'$</font>',value='555'})
    end;
    if Bronia6.nazwa~=nil then table.insert(a,{label=''..Bronia6.nazwa..' | <font color=red>'..Bronia6.cena..'$</font>',value='666'})
    end;
    if Bronia7.nazwa~=nil then table.insert(a,{label=''..Bronia7.nazwa..' | <font color=red>'..Bronia7.cena..'$</font>',value='777'})
    end;
    if Bronia8.nazwa~=nil then table.insert(a,{label=''..Bronia8.nazwa..' | <font color=red>'..Bronia8.cena..'$</font>',value='888'})
    end;
    if Bronia9.nazwa~=nil then table.insert(a,{label=''..Bronia9.nazwa..' | <font color=red>'..Bronia9.cena..'$</font>',value='999'})
    end;
    if Bronia10.nazwa~=nil then table.insert(a,{label=''..Bronia10.nazwa..' | <font color=red>'..Bronia10.cena..'$</font>',value='1010'})
    end;
ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tost_getwep', {
        title = 'Co chcesz zakupić?',
        align = 'center',
        elements = a
    },
    function(b, c) if b.current.value == '111' then
      -- c.close() 
       TriggerServerEvent("tostweapon:buyWeapon", Bronia1.weapon, Bronia1.cena, Bronia1.nazwa, Bronia1.max) 
       Citizen.Wait(200) 
    elseif b.current.value == '222' then
     --  c.close() 
       TriggerServerEvent("tostweapon:buyWeapon", Bronia2.weapon, Bronia2.cena, Bronia2.nazwa, Bronia2.max) 
       Citizen.Wait(200) 
    elseif b.current.value == '333' then 
     --  c.close()
       TriggerServerEvent("tostweapon:buyWeapon", Bronia3.weapon, Bronia3.cena, Bronia3.nazwa, Bronia3.max) 
       Citizen.Wait(200)
    elseif b.current.value == '444' then
      -- c.close()
       TriggerServerEvent("tostweapon:buyWeapon", Bronia4.weapon, Bronia4.cena, Bronia4.nazwa, Bronia4.max) 
       Citizen.Wait(200)
    elseif b.current.value == '555'then
      -- c.close()
       TriggerServerEvent("tostweapon:buyWeapon", Bronia5.weapon, Bronia5.cena, Bronia5.nazwa, Bronia5.max) 
       Citizen.Wait(200)
    elseif b.current.value == '666' then
      -- c.close()
       TriggerServerEvent("tostweapon:buyWeapon", Bronia6.weapon, Bronia6.cena, Bronia6.nazwa, Bronia6.max) 
       Citizen.Wait(200)
    elseif b.current.value == '777' then
       --c.close()
       TriggerServerEvent("tostweapon:buyWeapon", Bronia7.weapon, Bronia7.cena, Bronia7.nazwa, Bronia7.max) 
       Citizen.Wait(200)
    elseif b.current.value == '888' then
     -- c.close() 
      TriggerServerEvent("tostweapon:buyWeapon", Bronia8.weapon, Bronia8.cena, Bronia8.nazwa, Bronia8.max)
      Citizen.Wait(200)
    elseif b.current.value == '999' then
    --  c.close()
      TriggerServerEvent("tostweapon:buyWeapon", Bronia9.weapon, Bronia9.cena, Bronia9.nazwa, Bronia9.max)
      Citizen.Wait(200)
    elseif b.current.value == '1010' then
    -- c.close()
     TriggerServerEvent("tostweapon:buyWeapon", Bronia10.weapon, Bronia10.cena, Bronia10.nazwa, Bronia10.max)
     Citizen.Wait(200)
    end
   end,
 function(b, c)
 c.close()
end)
end

RegisterNetEvent('tostweapon:czasstart')
AddEventHandler('tostweapon:czasstart', function()
	czas = true
end)

RegisterNetEvent('tostweapon:czastop')
AddEventHandler('tostweapon:czastop', function()
	czas = false
end)
RegisterCommand("handlarz", function()
	if czas == false then
		TriggerServerEvent('tostweapon:handlarz')
	else
		 ESX.ShowAdvancedNotification('Handlarz', 'Powiadomienie', 'Możesz tu dzwonić co ~r~30~s~ minut!.', 'CHAR_BLANK_ENTRY', 1)
	end
end)


RegisterNetEvent('tostweapon:ZakupionoDaj')
AddEventHandler('tostweapon:ZakupionoDaj', function(a)
GiveWeaponToPed(GetPlayerPed(-1),
 GetHashKey(a), 100, false, true)
  Citizen.Wait(500)
end)

function DrawText3D(a, b, c, d)
local e, f, g = World3dToScreen2d(a, b, c)
local h, i, j = table.unpack(GetGameplayCamCoords())
SetTextScale(0.35, 0.35)
SetTextFont(4)
SetTextProportional(1)
SetTextColour(255, 255, 255, 215)
SetTextEntry("STRING")
SetTextCentre(1)
AddTextComponentString(d)
DrawText(f, g)
local k = string.len(d) / 370;
DrawRect(f, g + 0.0125, 0.015 + k, 0.03, 41, 11, 41, 90)
end
RegisterNetEvent('tostweapon:AccesGranted') AddEventHandler('tostweapon:AccesGranted', function() if zrespione == 0 then
    else ESX.ShowAdvancedNotification('Handlarz', 'Połączenie', 'Co dzwonisz przecie już jade!', 'CHAR_BLANK_ENTRY', 1) return end; ESX.ShowAdvancedNotification('Handlarz', 'Połączenie', 'Pizzeria pod ciemną gwiazdą, czy mogę przyjąć', 'CHAR_BLANK_ENTRY', 1) Citizen.Wait(500) WpiszHaslo() end)

function WpiszHaslo() ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'tostmeniu', {
        title = 'Co chcesz mi powiedzieć?'
    }, function(a, b) b.close() if a.value == 'kurwa' or a.value == 'chuj' or a.value == 'spierdalaj' then
     ESX.ShowAdvancedNotification('Handlarz', 'Połączenie', 'O ty kurwo obrzydliwa pożałujesz tego.', 'CHAR_BLANK_ENTRY', 1) 
    return 
  end;
    if a.value == SekretneHaslo then
     ESX.ShowAdvancedNotification('Handlarz', 'Połączenie', 'Dobra, widze wiesz o co chodzi. Mam już twój GPS nie ruszaj się zaraz tam podjadę.', 'CHAR_BLANK_ENTRY', 1) 
     TypekSePrzylatuje()
    else 
      ESX.ShowAdvancedNotification('Handlarz', 'Połączenie', 'Sory nie wiem o czym mówisz, nie dzwoń więcej pod ten numer.', 'CHAR_BLANK_ENTRY', 1) 
      Citizen.Wait(500) 
    end 
  end,
        function(a, b) b.close() 
end) 
end

function TypekSePrzylatuje()
  player = GetPlayerPed(-1)
  playerPos = GetEntityCoords(player)
  local a = GetHashKey('ig_benny')
  RequestModel(a)
  local b = GetHashKey(PojazdHandlarza)
  RequestModel(b)
      while not HasModelLoaded(a) and RequestModel(a) or not HasModelLoaded(b) and RequestModel(b) do 
        RequestModel(a) RequestModel(b) Citizen.Wait(0)
      end;
    SpawnTowTruck(playerPos.x, playerPos.y, playerPos.x, b, a)
    GoToTarget(playerPos.x, playerPos.y, playerPos.z, towTruck, towTruckDriver, b, targetVeh)
end

function SpawnTowTruck(a, b, c, d, e)
 local f, g, h = GetClosestVehicleNodeWithHeading(a + math.random(-spawnRadius, spawnRadius), b + math.random(-spawnRadius, spawnRadius), c, 0, 3, 0)
 if f and HasModelLoaded(d) and HasModelLoaded(d) then
   zrespione = 1;
   towTruck = CreateVehicle(d, g, h, true, false)
   ClearAreaOfVehicles(GetEntityCoords(towTruck), 5000, false, false, false, false, false)
   SetVehicleOnGroundProperly(towTruck) SetVehicleColours(towTruck, 111, 111)
   towTruckDriver = CreatePedInsideVehicle(towTruck, 26, e, -1, true, false)
   SetEntityInvincible(towTruckDriver, true)
   SetBlockingOfNonTemporaryEvents(towTruckDriver, true)
   towTruckBlip = AddBlipForEntity(towTruck)
   SetBlipFlashes(towTruckBlip, true)
   SetBlipColour(towTruckBlip, 11)
   BeginTextCommandSetBlipName("STRING")
   AddTextComponentString('Handlarz')
  EndTextCommandSetBlipName(towTruckBlip)
 end 
end

function DeleteTowTruck(a, b)
 SetEntityAsMissionEntity(a, false, false)
 DeleteEntity(a)
 SetEntityAsMissionEntity(b, false, false)
 DeleteEntity(b)
 RemoveBlip(towTruckBlip)
end

function GoToTarget(a, b, c, d, e, f, g)
TaskVehicleDriveToCoord(e, d, a, b, c, 17.0, 0, f, drivingStyle, 1, true)
enroute = true;
  while enroute == true do 
  Citizen.Wait(500)
  dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(d).x, GetEntityCoords(d).y, GetEntityCoords(d).z, false)
   if dist < 15 then
     StartVehicleHorn(d, 5000, GetHashKey("HELDDDOWN"), false)
     TaskVehicleTempAction(e, d, 27, -1)
     SetVehicleDoorOpen(d, 5, false, false)
     RemoveBlip(towTruckBlip)
     timer = 50;
     enroute = false;
     ESX.ShowAdvancedNotification('Handlarz', 'Mówi', 'Masz '..math.floor(timer)..' sekund, po tym czasie zawijam biznes.', 'CHAR_BLANK_ENTRY', 1)
     OstatnieOpcje()
   elseif dist < 20 then
     Citizen.Wait(2000)
   end
  end
end

function OstatnieOpcje()
local a, b, c = table.unpack(GetOffsetFromEntityInWorldCoords(towTruck, 0.0, -3.3, -1.0))
wybieranie = true;
 while wybieranie do
  Citizen.Wait(2)
  local a, b, c = table.unpack(GetOffsetFromEntityInWorldCoords(towTruck, 0.0, -3.3, -1.0))
  DrawMarker(1, a, b, c, 0, 0, 0, 0, 0, 0, 0.90, 0.90, 0.90, 0, 205, 50, 100, 1, 0, 0, 0)
  local d = GetEntityCoords(GetPlayerPed(-1), false)
  local e = Vdist(d.x, d.y, d.z, a, b, c)
    if e <= 3.5 then
      DrawText3D(a, b, c + 1, 'Wciśnij ~y~[E]~w~ aby przejrzeć oferte')
        if IsControlJustPressed(0, Keys['E']) then
         WyborBroniek()
        end
    end
 end
end
Citizen.CreateThread(function()
 while true do
  Citizen.Wait(500)
  if opened == 1 then
    if IsPedStill(GetPlayerPed(-1)) then

    else
     ESX.UI.Menu.CloseAll()
      opened = 0
    end
  end;
  if timer >= 1 then
    if zrespione == 1 then
      timer = timer - 0.5;
       if timer <= 1 then
        wybieranie = false;
        zrespione = 0;
        TaskVehicleDriveWander(towTruckDriver, towTruck, 50.0, drivingStyle)
        SetVehicleDoorShut(towTruck, 5, false)
        timer = 0; ESX.ShowAdvancedNotification('Handlarz', 'Mówi', 'Dobra czas na mnie, zawijam stąd zanim pojawi się policja.', 'CHAR_BLANK_ENTRY', 1)
        ESX.UI.Menu.CloseAll()
        Citizen.Wait(60000)
        DeleteTowTruck(towTruck, towTruckDriver)
      end
      end
    end
  end
end)

function loadAnimDict(a)
 while not HasAnimDictLoaded(a) do
  RequestAnimDict(a) Citizen.Wait(0)
  end
end