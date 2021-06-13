ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AntiCheat = true
AntiCheatStatus = "~g~Active"
PedStatus = 0
wlaczone = false
--[[ BLACKLISTED CAR CHECK ]]--



BlacklistedWeapons = { -- weapons that will get people banned
	"WEAPON_RAILGUN",
	"WEAPON_RPG",
	"WEAPON_RAYPISTOL",
	"WEAPON_RAYCARBINE",
	"WEAPON_RAYMINIGUN",
}

Citizen.CreateThread(function()
	while true do
		Wait(30000)
		TriggerServerEvent("anticheese:timer")
	end
end)

--[[Citizen.CreateThread(function()
	Citizen.Wait(60000)
	while true do
		Citizen.Wait(5000)
		local ped = PlayerPedId()
		local posx,posy,posz = table.unpack(GetEntityCoords(ped,true))
		local still = IsPedStill(ped)
		local vel = GetEntitySpeed(ped)
		local ped = PlayerPedId()
	--	print(exports['EasyAdmin']:isAdmin1())
		if exports['EasyAdmin']:isAdmin1() == false or exports['EasyAdmin']:isAdmin1() == nil then
			SetEntityVisible(PlayerPedId(), true) -- make sure player is visible
		end
		Wait(3000) -- wait 3 seconds and check again

		if not IsEntityVisible(PlayerPedId()) and exports['EasyAdmin']:isAdmin1() == false or exports['EasyAdmin']:isAdmin1() == nil then
			SetEntityHealth(PlayerPedId(), -100) -- if player is invisible kill him!
		end

		newx,newy,newz = table.unpack(GetEntityCoords(ped,true))
		newPed = PlayerPedId() -- make sure the peds are still the same, otherwise the player probably respawned
		if #(vector3(posx,posy,posz) - vector3(newx,newy,newz)) > 200 and still == IsPedStill(ped) and vel == GetEntitySpeed(ped) and ped == newPed then
			TriggerServerEvent("AntiCheese:NoclipFlag", #(vector3(posx,posy,posz) - vector3(newx,newy,newz)))
		end
	end
end)]]--

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		local curPed = PlayerPedId()
		local curHealth = GetEntityHealth( curPed )
		SetEntityHealth( curPed, curHealth-2)
		local curWait = math.random(10,150)
		-- this will substract 2hp from the current player, wait 50ms and then add it back, this is to check for hacks that force HP at 200
		Citizen.Wait(curWait)

		if not IsPlayerDead(PlayerId()) then
			if PlayerPedId() == curPed and GetEntityHealth(curPed) == curHealth and GetEntityHealth(curPed) ~= 0 then
				TriggerServerEvent("AntiCheese:HealthFlag", false, curHealth-2, GetEntityHealth( curPed ),curWait )
			elseif GetEntityHealth(curPed) == curHealth-2 then
				SetEntityHealth(curPed, GetEntityHealth(curPed)+2)
			end
		end
		if GetEntityHealth(curPed) > 400 then
			TriggerServerEvent("AntiCheese:HealthFlag", false, GetEntityHealth( curPed )-200, GetEntityHealth( curPed ),curWait )
		end

		if GetPlayerInvincible( PlayerId() ) then -- if the player is invincible, flag him as a cheater and then disable their invincibility
			TriggerServerEvent("AntiCheese:HealthFlag", true, curHealth-2, GetEntityHealth( curPed ),curWait )
			SetPlayerInvincible( PlayerId(), false )
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		for _,theWeapon in ipairs(BlacklistedWeapons) do
			Wait(1)
			if HasPedGotWeapon(PlayerPedId(),GetHashKey(theWeapon),false) == 1 then
				RemoveWeaponFromPed(PlayerPedId(), theWeapon)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1500)
			if IsPedInAnyVehicle(GetPlayerPed(-1)) then
				v = GetVehiclePedIsIn(playerPed, false)
			end
			playerPed = GetPlayerPed(-1)
			
		if playerPed and v then
			if GetPedInVehicleSeat(v, -1) == playerPed then
				checkCar(GetVehiclePedIsIn(playerPed, false))
			end
		end
	end
end)

RegisterNetEvent('esx_anticheat:killPlayer')
AddEventHandler('esx_anticheat:killPlayer', function()
	print("ZABIJA")
	killPlayer()
end)

function killPlayer()
	SetEntityHealth(GetPlayerPed(-1),0)
end

RegisterNetEvent('esx_odpal')
AddEventHandler('esx_odpal', function()
	Citizen.CreateThread(function()
		while wlaczone do
			Citizen.Wait(0)
			local handle, object = FindFirstObject()
			local finished = false
			repeat
				for _,Obiekty in ipairs(Config.ObjectsBL) do
					if GetEntityModel(object) == GetHashKey(Obiekty) then
						if IsEntityAttached(object) then
							DeleteObjects(object, true)
						elseif not IsEntityAttached(object) then
							DeleteObjects(object, false)
						end
					end
				end
			finished, object = FindNextObject(handle)

			until not finished
			EndFindObject(handle)
		end
	end)
end)
--[[ BLACKLISTED CAR CHECK ]]--
RegisterNetEvent('esx_odpal1')
AddEventHandler('esx_odpal1', function()
	Citizen.CreateThread(function()
		while wlaczone do
			Citizen.Wait(0)
			local handle, object = FindFirstVehicle()
			local finished = false
			repeat
				for _,Obiekty in ipairs(Config.CarsBL) do
					checkCarv2(object)
				end
			finished, object = FindNextVehicle(handle)

			until not finished
			EndFindVehicle(handle)
		end
	end)
end)

function DeleteObjects(object, detach)
	NetworkRequestControlOfEntity(object)
	while not NetworkHasControlOfEntity(object) do
		Citizen.Wait(1)
	end
	if detach then
		DetachEntity(object, 0, false)
	end

	SetEntityAsMissionEntity(object, true, true)
	_DeleteEntity(object)
	SetEntityAsNoLongerNeeded(object)
end

RegisterNetEvent('esx_anticheat:mafiaszef')
AddEventHandler('esx_anticheat:mafiaszef', function(object)
	DeleteObjects(object, true)
end)


RegisterNetEvent('AntiCheat:Wyczysc')
AddEventHandler('AntiCheat:Wyczysc', function()
	local playerPed = GetPlayerPed(-1)
	local playerLocalisation = GetEntityCoords(playerPed)
	
	for vehicle in EnumerateVehicles() do
		SetVehicleHasBeenOwnedByPlayer(vehicle, false)
		SetEntityAsMissionEntity(vehicle, true, true)
		DeleteVehicle(vehicle)
	end

	ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfPeds(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfVehicles(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0, false, false, false, false, false)
	ClearAreaOfObjects(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfProjectiles(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0, true)
end)

RegisterNetEvent('AntiCheat:Wyczyscv2')
AddEventHandler('AntiCheat:Wyczyscv2', function()
	local playerPed = GetPlayerPed(-1)
	local playerLocalisation = GetEntityCoords(playerPed)

	ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
    ClearAreaOfPeds(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfVehicles(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0, false, false, false, false, false)
	ClearAreaOfObjects(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfProjectiles(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0, true)
end)

RegisterNetEvent('AntiCheat:Wyczyscv3')
AddEventHandler('AntiCheat:Wyczyscv3', function()
	local playerPed = GetPlayerPed(-1)
	local playerLocalisation = GetEntityCoords(playerPed)

	ClearAreaOfCops(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfPeds(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	
	ClearAreaOfObjects(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0)
	ClearAreaOfProjectiles(playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, 24000.0, true)
end)

function KillAllPeds()
    local pedweapon
    local pedid
	for ped in EnumeratePeds() do 
         pedid = GetEntityModel(ped)
         pedweapon = GetSelectedPedWeapon(ped)
        for _,Obiektyv2 in ipairs(Config.PedyBL) do
			if GetEntityModel(ped) == GetHashKey(Obiektyv2) and not IsPedAPlayer(ped) and not IsPedInAnyHeli(ped)then
                _DeleteEntity(ped)
			end
		end
        if pedweapon == -1312131151  and not IsPedAPlayer(ped) or pedweapon == 1119849093  and not IsPedAPlayer(ped) or pedweapon == 1834241177  and not IsPedAPlayer(ped) or pedweapon == -1074790547  and not IsPedAPlayer(ped) or pedweapon == 1198879012 and not IsPedAPlayer(ped) or pedweapon == 0xBD248B55 and not IsPedAPlayer(ped) then 
            ApplyDamageToPed(ped, 1000, false)
            _DeleteEntity(ped)
    	end
    end
end

function checkCar(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
			TriggerServerEvent('AntiCheat:Cars',carName )
        end
	end
end

function checkCarv2(car)
	if car then
		carModel = GetEntityModel(car)
		carName = GetDisplayNameFromVehicleModel(carModel)
		if isCarBlacklisted(carModel) then
			_DeleteEntity(car)
        end
	end
end

function isCarBlacklisted(model)
	for _, blacklistedCar in pairs(Config.CarsBL) do
		if model == GetHashKey(blacklistedCar) then
			return true
		end
	end

	return false
end

function _DeleteEntity(entity)
	NetworkRequestControlOfEntity(entity)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(25000)
        for _, bcmd in ipairs(GetRegisteredCommands()) do
			for _, bcmds in ipairs(Config.Zablokowanekomendy) do
                if bcmd.name == bcmds then
                    TriggerServerEvent("cipeczka", "Menu Inject Detected")
				end
			end
        end
    end
end)

--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPedInfiniteAmmoClip(PlayerPedId(), false)
        SetEntityCanBeDamaged(PlayerPedId(), true)
        ResetEntityAlpha(PlayerPedId())
        local fallin = IsPedFalling(PlayerPedId())
        local ragg = IsPedRagdoll(PlayerPedId())
        local parac = GetPedParachuteState(PlayerPedId())
        if parac >= 0 or ragg or fallin then
            SetEntityMaxSpeed(PlayerPedId(), 80.0)
        else
            SetEntityMaxSpeed(PlayerPedId(), 7.1)
        end
		if exports['EasyAdmin']:isAdmin1() == false or exports['EasyAdmin']:isAdmin1() == nil then
			SetEntityInvincible(PlayerPedId(), false)
		end
    end
end)]]--

local function collectAndSendResourceList()
	local resourceList = {}
    for i=0,GetNumResources()-1 do
		resourceList[i+1] = GetResourceByFindIndex(i)
		Wait(500)
	end
	Wait(5000)
    TriggerServerEvent("ANTICHEAT:CHECKRESOURCES", resourceList)
end

CreateThread(function()
    while true do
	    Wait(15000)
		collectAndSendResourceList()      
    end
end)

--[[
Citizen.CreateThread(function()
	Citizen.Wait(5000)
	while true do
		Citizen.Wait(15000)
		if Plane.CreateMenu ~= nil then
			acDetected()
		elseif e.debug ~= nil then
            acDetected()
		elseif Lynx8.CreateMenu ~= nil then
            acDetected()
		elseif LynxEvo.CreateMenu ~= nil then
			acDetected()
		elseif MaestroMenu.CreateMenu ~= nil then
			acDetected()
		elseif Motion.CreateMenu ~= nil then
			acDetected()
		elseif TiagoMenu.CreateMenu ~= nil then
			acDetected()
		elseif gaybuild.CreateMenu ~= nil then
			acDetected()
		elseif Cience.CreateMenu ~= nil then
			acDetected()
		elseif LynxSeven.CreateMenu ~= nil then
			acDetected()
		elseif MMenu.CreateMenu ~= nil then
			acDetected()
		elseif FantaMenuEvo.CreateMenu ~= nil then
			acDetected()
		elseif GRubyMenu.CreateMenu ~= nil then
			acDetected()
		elseif LR.CreateMenu ~= nil then
			acDetected()
		elseif BrutanPremium.CreateMenu ~= nil then
			acDetected()
		elseif HamMafia.CreateMenu ~= nil then
			acDetected()
		elseif InSec.Logo ~= nil then
			acDetected()
		elseif AlphaVeta.CreateMenu ~= nil then
			acDetected()
		elseif KoGuSzEk.CreateMenu ~= nil then
			acDetected()
		elseif ShaniuMenu.CreateMenu ~= nil then
			acDetected()
		elseif LynxRevo.CreateMenu ~= nil then
			acDetected()
		elseif ariesMenu.CreateMenu ~= nil then
			acDetected()
		elseif WarMenu.InitializeTheme ~= nil then
			acDetected()
		elseif dexMenu.CreateMenu ~= nil then
			acDetected()
		elseif MaestroEra ~= nil then
			acDetected()
		elseif HamHaxia.CreateMenu ~= nil then
			acDetected()
		elseif Ham.CreateMenu ~= nil then
			acDetected()
		elseif HoaxMenu ~= nil then
			acDetected()
		elseif Biznes.CreateMenu ~= nil then
			acDetected()
		elseif FendinXMenu.CreateMenu ~= nil then
			acDetected()
		elseif AlphaV.CreateMenu ~= nil then
			acDetected()
		elseif Deer.CreateMenu ~= nil then
			acDetected()
		elseif NyPremium.CreateMenu ~= nil then
			acDetected()
		elseif nukeserver ~= nil then
			acDetected()
		elseif esxdestroyv2 ~= nil then
			acDetected()
		elseif teleportToNearestVehicle ~= nil then
			acDetected()
		elseif AddTeleportMenu ~= nil then
			acDetected()
		elseif AmbulancePlayers ~= nil then
			acDetected()
		elseif Aimbot ~= nil then
			acDetected()
		elseif RapeAllFunc ~= nil then
			acDetected()
		elseif CrashPlayer ~= nil then
            acDetected()
        elseif scroll ~= nil or zzzt ~= nil or werfvtghiouuiowrfetwerfio ~= nil or llll4874 ~= nil or KAKAAKAKAK ~= nil or udwdj ~= nil or Ggggg ~= nil or jd366213 ~= nil or KZjx ~= nil or ihrug ~= nil or WADUI ~= nil or Crusader ~= nil or FendinX ~= nil or oTable ~= nil or LeakerMenu ~= nil then
            acDetected()
		end
	end
end)

function acDetected()
	TriggerServerEvent('cipeczka', 'Injector Detected')
end]]--