ESX          = nil
local IsDead = false

--CONFIG--
local fov_max = 150.0
local fov_min = 7.0 -- max zoom level (smaller fov is more zoom)
local zoomspeed = 10.0 -- camera zoom speed
local speed_lr = 8.0 -- speed by which the camera pans left-right 
local speed_ud = 8.0 -- speed by which the camera pans up-down
local toggle_helicam = 51 -- control id of the button by which to toggle the helicam mode. Default: INPUT_CONTEXT (E)
local toggle_rappel = 154 -- control id to rappel out of the heli. Default: INPUT_DUCK (X)
local toggle_spotlight = 183 -- control id to toggle the front spotlight Default: INPUT_PhoneCameraGrid (G)
local toggle_lock_on = 22 -- control id to lock onto a vehicle with the camera. Default is INPUT_SPRINT (spacebar)

local helicam = false
local polmav_hash = GetHashKey("pcj")
local fov = (fov_max+fov_min)*0.5
local vision_state = 0 -- 0 is normal, 1 is nightmode, 2 is thermal vision

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer 
end)

				local used = 0
				
RegisterNetEvent('eden_accesories:silencieux')
AddEventHandler('eden_accesories:silencieux', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local silencieux = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'silencieux' then
						silencieux = i.count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used < silencieux then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
		  	
				 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
				 
		  			used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))  
				 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 

					 used = used + 1	

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 

					 used = used + 1	  

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'})
				 
					used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
				 
		  		 	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
				 
		  			used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'})
				 
		  		  	used = used + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
				 
		  		 	used = used + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
	
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'}) 
	used = used + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles tlumik'})


	used = used + 1
		  		
		  	else 
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz do takowej zamontować tłumika.'})
		
		  		
			end
		else

		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Ta bron nie ma zamontowanego tlumika'})
	end
end)

RegisterNetEvent('eden_accesories:silencieuxzdejmij')
AddEventHandler('eden_accesories:silencieuxzdejmij', function(duration)
				local inventory = ESX.GetPlayerData().inventory
				local silencieux = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'silencieux' then
						silencieux = i.count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
	if IsPedCurrentWeaponSilenced(ped) then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})

		  		 	used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  			used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  			used = used - 1
					
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))  
				 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'}) 

					used = used - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_SUPP_02"))  
				 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'}) 

					used = used - 1	

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  		 	used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  			used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  		  	used = used - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_PI_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
		  		 	used = used - 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_SR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})
					used = used - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SNIPERRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNIPERRIFLE"), GetHashKey("COMPONENT_AT_AR_SUPP_02"))
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Tlumik.'})

					used = used - 1
		  		
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz do takowej zamontować tłumika.'})
		
		  		
			end
	else

		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Ta bron nie ma zamontowanego tlumika'})
	end
end)


				local used2 = 0

RegisterNetEvent('eden_accesories:flashlight')
AddEventHandler('eden_accesories:flashlight', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'flashlight' then
						flashlight = i.count
					  end
					end


    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used2 < flashlight then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
		  		 	used2 = used2 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
					
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_03"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
		  		 	used2 = used2 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'})
					used2 = used2 + 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'})
					used2 = used2 + 1
				 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'})
					used2 = used2 + 1
		  			

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
			  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'})
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'})
						used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
					used2 = used2 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH")) 
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles latarke.'}) 
		  	
					used2 = used2 + 1
		  		
		  	else 
		  		ESX.ShowNotification(("Nie masz broni w ręku lub nie możesz do takowej zamontować latarki."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Nie masz latarki"))

		end
end)

RegisterNetEvent('eden_accesories:flashlightzdejmij')
AddEventHandler('eden_accesories:flashlightzdejmij', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local flashlight = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'flashlight' then
						flashlight = i.count
					  end
					end

    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
	if used2 > 0 then
			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'})
		  		 	used2 = used2 - 1
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_03"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_FLSH_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'})
					used2 = used2 - 1
		  
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'})
					used2 = used2 - 1
					
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
		  		 	used2 = used2 - 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_AT_PI_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
				

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSMG"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
				 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  			

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_PUMPSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'}) 
					used2 = used2 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales latarke.'})
					used2 = used2 - 1
		  		
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz do takowej zamontować latarki.'})
		  		
		end
	end
end)

				local used3 = 0

RegisterNetEvent('eden_accesories:grip')
AddEventHandler('eden_accesories:grip', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local grip = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'grip' then
						grip = i.count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used3 < grip then

			
			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
		  				used3 = used3 + 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		 
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zalozyles chwyt do broni")) 
	used3 = used3 + 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Nie masz broni w ręku lub nie możesz do takowej zamontować uchwytu."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Nie masz uchwytu"))
		end
end)

RegisterNetEvent('eden_accesories:gripzdejmij')
AddEventHandler('eden_accesories:gripzdejmij', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local grip = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'grip' then
						grip = i.count
					  end
					end
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used3 > 0 then

			
			if currentWeaponHash == GetHashKey("WEAPON_COMBATPDW") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPDW"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
		  				used3 = used3 - 1


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SPECIALCARBINE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SPECIALCARBINE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_BULLPUPSHOTGUN") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_BULLPUPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		 
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MARKSMANRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MARKSMANRIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP"))  
		  		 ESX.ShowNotification(("Zdjales chwyt z broni")) 
	used3 = used3 - 1
		  		
		  	else 
		  		  ESX.ShowNotification(("Nie masz broni w ręku lub nie możesz do takowej zamontować uchwytu."))
		  		
			end
		else
				  		  ESX.ShowNotification(("Nie masz uchwytu"))
		end
end)

				local used4 = 0

RegisterNetEvent('eden_accesories:yusuf')
AddEventHandler('eden_accesories:yusuf', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'yusuf' then
						yusuf = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used4 < yusuf then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
		  			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used4 = used4 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
				


		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		  	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		  		 	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'})
	used4 = used4 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:yusufzdejmij')
AddEventHandler('eden_accesories:yusufzdejmij', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local yusuf = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'yusuf' then
						yusuf = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used4 > 0 then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
		  		 	used4 = used4 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1

				elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_IND_01"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used4 = used4 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_IND_01"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used4 = used4 - 1
		  		
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1
		  		 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1
		  		 

		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1
		  		
		  	elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'})
	used4 = used4 - 1
		  		
		  	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used5 = 0
RegisterNetEvent('eden_accesories:magazynek')
AddEventHandler('eden_accesories:magazynek', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local powiekszonymagazynek = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'powiekszonymagazynek' then
						powiekszonymagazynek = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used5 < powiekszonymagazynek then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})

		  		 	used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})

					used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))  
		  		 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})

					used5 = used5 + 1
					
			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})

				    used5 = used5 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02"))  
				 TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 

					 used5 = used5 + 1	

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 

					 used5 = used5 + 1	

			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
					used5 = used5 + 1
					
			elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
					used5 = used5 + 1					

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
		  		 	used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
		  			used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
		  			used5 = used5 + 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
		  			used5 = used5 + 1
		  	
				elseif currentWeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))  
		  		  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'}) 
		  			used5 = used5 + 1
					
		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"))
		  		   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})
		  		  	used5 = used5 + 1

				elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
					  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!.'})
						 used5 = used5 + 1
	 
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!'})
 used5 = used5 - 1
				

		   elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!'})
 used5 = used5 - 1

		   elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!'})
 used5 = used5 - 1
			   
		   elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!'})
 used5 = used5 - 1
			   
		   elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Zalozyles Magazynek!'})
 used5 = used5 - 1
		  	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub magazynek nie pasuje.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych magazynkow.!'})

		end
end)

RegisterNetEvent('eden_accesories:magazynekzdejmij')
AddEventHandler('eden_accesories:magazynekzdejmij', function(duration)
					local inventory = ESX.GetPlayerData().inventory
					local powiekszonymagazynek = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'powiekszonymagazynek' then
						powiekszonymagazynek = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used5 > 0 then

			if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 
		  		 	used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 
				used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 
				used5 = used5 - 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 
				used5 = used5 - 1				
				
			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), GetHashKey("COMPONENT_SNSPISTOL_CLIP_02"))  
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

				 used5 = used5 - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CLIP_02"))  
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

				used5 = used5 - 1	

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
				RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CLIP_02"))  
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

				used5 = used5 - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_COMBATPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_COMBATPISTOL_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

				used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

		  		 used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

		  		used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

		  		used5 = used5 - 1

		  	elseif currentWeaponHash == GetHashKey("WEAPON_COMPACTRIFLE") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMPACTRIFLE"), GetHashKey("COMPONENT_COMPACTRIFLE_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

		  		used5 = used5 - 1
					
		  	elseif currentWeaponHash == GetHashKey("WEAPON_SMG_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG_MK2"), GetHashKey("COMPONENT_SMG_MK2_CLIP_02"))  
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'}) 

		  		used5 = used5 - 1
				
		  	elseif currentWeaponHash == GetHashKey("WEAPON_VINTAGEPISTOL") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), GetHashKey("COMPONENT_VINTAGEPISTOL_CLIP_02"))  
				  TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciagnales Magazynek!'})
				 
		  		  used5 = used5 - 1		
		  							  	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub magazynek nie pasuje.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych magazynkow.!'})

		end
end)

---- SKORKI DO MK2 ----
local used6 = 0
RegisterNetEvent('eden_accesories:skorka1')
AddEventHandler('eden_accesories:skorka1', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka1 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka1' then
						skorka1 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used6 < skorka1 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used6 = used6 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used6 = used6 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka1')
AddEventHandler('eden_accesories:zdejmijskorka1', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka1 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka1' then
						skorka1 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used6 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used6 = used6 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used6 = used6 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used7 = 0
RegisterNetEvent('eden_accesories:skorka2')
AddEventHandler('eden_accesories:skorka2', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka2 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka2' then
						skorka2 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used7 < skorka2 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used7 = used7 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used7 = used7 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka2')
AddEventHandler('eden_accesories:zdejmijskorka2', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka2 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka2' then
						skorka2 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used7 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_02"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used7 = used7 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_02"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used7 = used7 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used8 = 0
RegisterNetEvent('eden_accesories:skorka3')
AddEventHandler('eden_accesories:skorka3', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka3 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka3' then
						skorka3 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used8 < skorka3 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used8 = used8 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used8 = used8 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka3')
AddEventHandler('eden_accesories:zdejmijskorka3', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka3 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka3' then
						skorka3 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used8 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_03"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used8 = used8 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_03"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used8 = used8 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used9 = 0
RegisterNetEvent('eden_accesories:skorka4')
AddEventHandler('eden_accesories:skorka4', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka4 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka4' then
						skorka4 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used9 < skorka4 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used9 = used9 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used9 = used9 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka4')
AddEventHandler('eden_accesories:zdejmijskorka4', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka4 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka4' then
						skorka4 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used9 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_04"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used9 = used9 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_04"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used9 = used9 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)


local used10 = 0
RegisterNetEvent('eden_accesories:skorka5')
AddEventHandler('eden_accesories:skorka5', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka5 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka5' then
						skorka5 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used10 < skorka5 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used10 = used10 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used10 = used10 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka5')
AddEventHandler('eden_accesories:zdejmijskorka5', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka5 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka5' then
						skorka5 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used10 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_05"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used10 = used10 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_05"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used10 = used10 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used11 = 0
RegisterNetEvent('eden_accesories:skorka6')
AddEventHandler('eden_accesories:skorka6', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka6 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka6' then
						skorka6 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used11 < skorka6 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used11 = used11 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used11 = used11 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka6')
AddEventHandler('eden_accesories:zdejmijskorka6', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka6 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka6' then
						skorka6 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used11 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_06"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used11 = used11 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_06"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used11 = used11 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used12 = 0
RegisterNetEvent('eden_accesories:skorka7')
AddEventHandler('eden_accesories:skorka7', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka7 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka7' then
						skorka7 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used12 < skorka7 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used12 = used12 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used12 = used12 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_07"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
		used12 = used12 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka7')
AddEventHandler('eden_accesories:zdejmijskorka7', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka7 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka7' then
						skorka7 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used12 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_07"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used12 = used12 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_07"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used12 = used12 - 1

		elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_07"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used12 = used12 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used13 = 0
RegisterNetEvent('eden_accesories:skorka8')
AddEventHandler('eden_accesories:skorka8', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka8 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka8' then
						skorka8 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used13 < skorka8 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used13 = used13 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used13 = used13 + 1


			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_08"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used13 = used13 + 1

		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka8')
AddEventHandler('eden_accesories:zdejmijskorka8', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka8 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka8' then
						skorka8 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used13 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_08"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used13 = used13 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_08"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used13 = used13 - 1

			elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_08"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used13 = used13 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used14 = 0
RegisterNetEvent('eden_accesories:skorka9')
AddEventHandler('eden_accesories:skorka9', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka9 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka9' then
						skorka9 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used14 < skorka9 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used14 = used14 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used14 = used14 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijskorka9')
AddEventHandler('eden_accesories:zdejmijskorka9', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka9 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka9' then
						skorka9 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used14 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_09"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used14 = used14 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_09"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used14 = used14 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used15 = 0
RegisterNetEvent('eden_accesories:skorka10')
AddEventHandler('eden_accesories:skorka10', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka10 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka10' then
						skorka10 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used15 < skorka10 then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	 used15 = used15 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used15 = used15 + 1

		elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_10"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Pomalowałeś swoją broń!'}) 
	used15 = used15 + 1

		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)


RegisterNetEvent('eden_accesories:zdejmijskorka10')
AddEventHandler('eden_accesories:zdejmijskorka10', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local skorka10 = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'skorka10' then
						skorka10 = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used15 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_SNSPISTOL_MK2_CAMO_10"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used15 = used15 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_PISTOL_MK2_CAMO_10"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used15 = used15 - 1

				elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), GetHashKey("COMPONENT_ASSAULTRIFLE_MK2_CAMO_10"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Odbarwiles swoją broń!'}) 
	used15 = used15 - 1
		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz takiej pomalowac.'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz zadnych luksusowych skór.'})

		end
end)

local used16 = 0
RegisterNetEvent('eden_accesories:compensator')
AddEventHandler('eden_accesories:compensator', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local compensator = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'compensator' then
						compensator = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used16 < compensator then

	
			if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_COMP_02"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Założyłeś Kompensator!'}) 
	 used16 = used16 + 1

			elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_COMP"))  
					TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Założyłeś Kompensator!'}) 
	used16 = used16 + 1
		  		
		  	
		  	else 
				TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz na niej zalożyć Kompensatora'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie Kompensatora.'})

		end
end)

RegisterNetEvent('eden_accesories:zdejmijcompensator')
AddEventHandler('eden_accesories:zdejmijcompensator', function(duration)
					local inventory = ESX.GetPlayerData().inventory
				local compensator = 0
					for k,i in ipairs(inventory) do
					  if i.name == 'compensator' then
						compensator = i.count
					  end
					end
					
    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
		if used16 > 0 then
				if currentWeaponHash == GetHashKey("WEAPON_SNSPISTOL_MK2") then
		  		 RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_COMP_02"))  
				   TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciągnąłeś Kompensator!'}) 
		used16 = used16 - 1

				 elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
					RemoveWeaponComponentFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), GetHashKey("COMPONENT_AT_PI_COMP"))  
				   	TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Sciągnąłeś Kompensator!'}) 
		used16 = used16 - 1

		  								  			   	
		  	else 
		  		TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie masz broni w ręku lub nie możesz na niej zalożyć Kompensatora'})
		  		
			end
		else
			TriggerEvent("pNotify:SendNotification", {text = '<b style = color:white>Nie Kompensatora.'})

		end
end)


-------------------------


AddEventHandler('playerSpawned', function()
  used = 0
  used2 = 0
  used3 = 0
  used4 = 0
  used5 = 0
  used7 = 0
  used8 = 0
  used9 = 0
  used10 = 0
  used11 = 0
  used12 = 0
  used13 = 0
  used14 = 0
  used15 = 0
  used16 = 0 
end)

RegisterNetEvent('eden_accesories:tlumik')
AddEventHandler('eden_accesories:tlumik', function()
tlumik()
end)

function tlumik()

		local elements = {
			{label = ('<b style = color:white>Zaloz tlumik'),  value = 'zaloz'},
			{label = ('<b style = color:white>Sciagnij tlumik'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:grey>Menu tlumikow'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:silencieux')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:silencieuxzdejmij')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:latarka')
AddEventHandler('eden_accesories:latarka', function()
latarka()
end)

function latarka()

		local elements = {
			{label = ('<b style = color:white>Zaloz latarke'),  value = 'zaloz'},
			{label = ('<b style = color:white>Sciagnij latarke'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:aqua>Menu Latarek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:flashlight')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:flashlightzdejmij')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:chwyt')
AddEventHandler('eden_accesories:chwyt', function()
Chwyt()
end)

function Chwyt()

		local elements = {
			{label = ('Zaloz chwyt'),  value = 'zaloz'},
			{label = ('Sciagnij chwyt'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('Menu Chwytow'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:grip')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:gripzdejmij')
			end

		end, function(data, menu)
			menu.close()
		end)
end


RegisterNetEvent('eden_accesories:skin')
AddEventHandler('eden_accesories:skin', function()
Skin()
end)

function Skin()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:yusuf')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:yusufzdejmij')
			end

		end, function(data, menu)
			menu.close()
		end)
end



RegisterNetEvent('eden_accesories:pmagazynek')
AddEventHandler('eden_accesories:pmagazynek', function()
Magazynek()
end)

function Magazynek()

		local elements = {
			{label = ('<b style = color:white>Wloz wiekszy magazynek'),  value = 'zaloz'},
			{label = ('<b style = color:white>Wyciagnij wiekszy magazynek'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'magazynki',
		{
			title    = ('<b style = color:purple>Menu Magazynkow'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:magazynek')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:magazynekzdejmij')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin1')
AddEventHandler('eden_accesories:skin1', function()
Skin1()
end)

function Skin1()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka1')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka1')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin2')
AddEventHandler('eden_accesories:skin2', function()
Skin2()
end)

function Skin2()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka2')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka2')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin3')
AddEventHandler('eden_accesories:skin3', function()
Skin3()
end)

function Skin3()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka3')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka3')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin4')
AddEventHandler('eden_accesories:skin4', function()
Skin4()
end)

function Skin4()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka4')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka4')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin5')
AddEventHandler('eden_accesories:skin5', function()
Skin5()
end)

function Skin5()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka5')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka5')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin6')
AddEventHandler('eden_accesories:skin6', function()
Skin6()
end)

function Skin6()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka6')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka6')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin7')
AddEventHandler('eden_accesories:skin7', function()
Skin7()
end)

function Skin7()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka7')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka7')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin8')
AddEventHandler('eden_accesories:skin8', function()
Skin8()
end)

function Skin8()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka8')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka8')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin9')
AddEventHandler('eden_accesories:skin9', function()
Skin9()
end)

function Skin9()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka9')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka9')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:skin10')
AddEventHandler('eden_accesories:skin10', function()
Skin10()
end)

function Skin10()

		local elements = {
			{label = ('<b style = color:white>Pomaluj swoja bron'),  value = 'zaloz'},
			{label = ('<b style = color:white>Odbarw swoja bron'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tlumiki',
		{
			title    = ('<b style = color:gold>Menu Skorek'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:skorka10')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijskorka10')
			end

		end, function(data, menu)
			menu.close()
		end)
end

RegisterNetEvent('eden_accesories:kompensator')
AddEventHandler('eden_accesories:kompensator', function()
kompensator()
end)

function kompensator()

		local elements = {
			{label = ('<b style = color:white>Załóż Kompensator'),  value = 'zaloz'},
			{label = ('<b style = color:white>Sciągnij Kompensator'),  value = 'zdejmij'}
		}
		
		ESX.UI.Menu.CloseAll()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'compensator',
		{
			title    = ('<b style = color:gold>Menu Kompensatorów'),
			align    = 'center',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'zaloz' then
			TriggerEvent('eden_accesories:compensator')
			elseif data.current.value == 'zdejmij' then
			TriggerEvent('eden_accesories:zdejmijcompensator')
			end

		end, function(data, menu)
			menu.close()
		end)
end

Citizen.CreateThread(function()
	while true do

        Citizen.Wait(10)

		local lPed = GetPlayerPed(-1)
		local heli = GetVehiclePedIsIn(lPed)
		
		if helicam then

			if not ( IsPedSittingInAnyVehicle( lPed ) ) then

						Citizen.CreateThread(function()

		                    TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, 1)
							PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")

						end)

					else
					end	

					Wait(2000)

					SetTimecycleModifier("heliGunCam")

			SetTimecycleModifierStrength(0.3)

			local scaleform = RequestScaleformMovie("HELI_CAM")

			while not HasScaleformMovieLoaded(scaleform) do

				Citizen.Wait(10)

			end

			local lPed = GetPlayerPed(-1)
			local heli = GetVehiclePedIsIn(lPed)
			local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)

			AttachCamToEntity(cam, lPed, 0.0,0.0,1.0, true)
			SetCamRot(cam, 0.0,0.0,GetEntityHeading(lPed))
			SetCamFov(cam, fov)
			RenderScriptCams(true, false, 0, 1, 0)
			PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
			PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
			PopScaleformMovieFunctionVoid()

			local locked_on_vehicle = nil

			while helicam and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == heli) and true do

				if IsControlJustPressed(0, 177) then -- Toggle Helicam

					PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
					ClearPedTasks(GetPlayerPed(-1))
					helicam = false

				end

				if locked_on_vehicle then
					
				else
					local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)

					CheckInputRotation(cam, zoomvalue)

					local vehicle_detected = GetVehicleInView(cam)

				end

				HandleZoom(cam)
				HideHUDThisFrame()

				DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
				Citizen.Wait(10)

			end

			helicam = false

			ClearTimecycleModifier()

			fov = (fov_max+fov_min)*0.5

			RenderScriptCams(false, false, 0, 1, 0)

			SetScaleformMovieAsNoLongerNeeded(scaleform)

			DestroyCam(cam, false)
			SetNightvision(false)
			SetSeethrough(false)
		end
	end
end)

--EVENTS--

RegisterNetEvent('jumelles:Active') --Just added the event to activate the binoculars
AddEventHandler('jumelles:Active', function()
	helicam = not helicam
end)

--FUNCTIONS--

function IsPlayerInPolmav()
	local lPed = GetPlayerPed(-1)
	local vehicle = GetVehiclePedIsIn(lPed)
	return IsVehicleModel(vehicle, polmav_hash)
end


function ChangeVision()
	if vision_state == 0 then
		SetNightvision(true)
		vision_state = 1
	elseif vision_state == 1 then
		SetNightvision(false)
		SetSeethrough(true)
		vision_state = 2
	else
		SetSeethrough(false)
		vision_state = 0
	end
end

function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudComponentThisFrame(19) -- weapon wheel
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
end

function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5) -- Clamping at top (cant see top of heli) and at bottom (doesn't glitch out in -90deg)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

function HandleZoom(cam)
	local lPed = GetPlayerPed(-1)
	if not ( IsPedSittingInAnyVehicle( lPed ) ) then

		if IsControlJustPressed(0,32) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,8) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown		
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05) -- Smoothing of camera zoom
	else
		if IsControlJustPressed(0,241) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,242) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown		
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05) -- Smoothing of camera zoom
	end
end

function GetVehicleInView(cam)
	local coords = GetCamCoord(cam)
	local forward_vector = RotAnglesToVec(GetCamRot(cam, 2))
	--DrawLine(coords, coords+(forward_vector*100.0), 255,0,0,255) -- debug line to show LOS of cam
	local rayhandle = CastRayPointToPoint(coords, coords+(forward_vector*200.0), 10, GetVehiclePedIsIn(GetPlayerPed(-1)), 0)
	local _, _, _, _, entityHit = GetRaycastResult(rayhandle)
	if entityHit>0 and IsEntityAVehicle(entityHit) then
		return entityHit
	else
		return nil
	end
end

function RotAnglesToVec(rot) -- input vector3
	local z = math.rad(rot.z)
	local x = math.rad(rot.x)
	local num = math.abs(math.cos(x))
	return vector3(-math.sin(z)*num, math.cos(z)*num, math.sin(x))
end