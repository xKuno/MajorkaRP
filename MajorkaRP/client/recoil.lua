-- Script by Lyrad for LEFR

local scopedWeapons = 
{
    100416529,  -- WEAPON_SNIPERRIFLE
    205991906,  -- WEAPON_HEAVYSNIPER
    3342088282, -- WEAPON_MARKSMANRIFLE
	177293209,   -- WEAPON_HEAVYSNIPER MKII
	1785463520  -- WEAPON_MARKSMANRIFLE_MK2
}

function HashInTable( hash )
    for k, v in pairs( scopedWeapons ) do 
        if ( hash == v ) then 
            return true7
        end 
    end 

    return false 
end 

Citizen.CreateThread(function()
    while true do
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.3)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"), 0.5)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.5)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_GOLFCLUB"), 0.5)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.25)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.35)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.5)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMOKEGRENADE"), 0.05)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMBATPISTOL"), 1.20)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL"), 1.2) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_snspistol"), 0.70) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_snspistol_mk2"), 0.90) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL_mk2"), 1.05) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PISTOL50"), 0.9) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_HEAVYPISTOL"), 1.03) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BZGAS"), 0.30)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MARKSMANPISTOL"), 0.25)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DOUBLEACTION"), 0.15)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_STUNGUN"), 15.4)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTSMG"), 1.42)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_ASSAULTRIFLE"), 0.85) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_CARBINERIFLE"), 0.90)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_PUMPSHOTGUN"), 0.60) 
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_REVOLVER"), 0.30)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_REVOLVER_MK2"), 0.26)  
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_APPISTOL"), 0.45)  		 	
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_VINTAGEPISTOL"), 1.05)	
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SAWNOFFSHOTGUN"), 1.30)		
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_COMPACTRIFLE"), 0.84)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MICROSMG"), 1.30)	
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHINEPISTOL"), 0.97)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DBSHOTGUN"), 3.0)	
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG_MK2"), 0.45)
		N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SMG"), 0.50)											            
	Wait(0)
    end
end)

local isTaz = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if IsPedBeingStunned(GetPlayerPed(-1)) then
			
			SetPedToRagdoll(GetPlayerPed(-1), 5000, 5000, 0, 0, 0, 0)
			
		end
		
		if IsPedBeingStunned(GetPlayerPed(-1)) and not isTaz then
			
			isTaz = true
			SetTimecycleModifier("REDMIST_blend")
			ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 2.0)
			
		elseif not IsPedBeingStunned(GetPlayerPed(-1)) and isTaz then
			isTaz = false
			Wait(5000)
			
			SetTimecycleModifier("hud_def_desat_Trevor")
			
			Wait(10000)
			
      SetTimecycleModifier("")
			SetTransitionTimecycleModifier("")
			StopGameplayCamShaking()
		end
	end
end)

function ManageReticle()
    local ped = GetPlayerPed( -1 )
    local _, hash = GetCurrentPedWeapon( ped, true )
    if not HashInTable( hash ) then 
        HideHudComponentThisFrame( 14 )
	end 
end 


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()
			local weapon = GetSelectedPedWeapon(ped)
			-- Disable melee while aiming (may be not working)
			if IsPedArmed(ped, 6) then
				DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			end

			-- Disable ammo HUD
			ManageReticle()
		
			DisplayAmmoThisFrame(false)

			-- Infinite FireExtinguisher
			if weapon == GetHashKey("WEAPON_FIREEXTINGUISHER") then
				SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_FIREEXTINGUISHER"))
			end
			if weapon == GetHashKey("WEAPON_PETROLCAN") then
				SetPedInfiniteAmmo(ped, true, GetHashKey("WEAPON_PETROLCAN"))
			end
		end
end)

-- recoil script by bluethefurry / Blumlaut https://forum.fivem.net/t/betterrecoil-better-3rd-person-recoil-for-fivem/82894
-- I just added some missing weapons because of the doomsday update adding some MK2.
-- I can't manage to make negative hashes works, if someone make it works, please let me know =)

local recoils = {
	[453432689] = 0.5, -- PISTOL | USED
	[3219281620] = 0.4, -- PISTOL MK2 | USED
	[1593441988] = 0.4, -- COMBAT PISTOL | USED
	[736523883] = 0.1, -- SMG | USED
	[2024373456] = 0.1, -- SMG MK2 | USED
	[3220176749] = 0.1, -- ASSAULT RIFLE | USED
	[1627465347] = 0.4, -- GUSENBERG
	[487013001] = 0.4, -- PUMP SHOTGUN | USED
	[1432025498] = 0.5, -- PUMP SHOTGUN MK2 | USED
	[2017895192] = 0.5, -- SAWNOFF SHOTGUN
	[911657153] = 0.1, -- STUN GUN | USED
	[100416529] = 0.5, -- SNIPER RIFLE | USED
	[3218215474] = 0.3, -- SNS PISTOL | USED
	[2285322324] = 0.05, -- SNS PISTOL MK2 | USED (2009644972)
	[3231910285] = 0.2, -- SPECIAL CARBINE | USED
	[-771403250] = 0.2, -- HEAVY PISTOL | USED
	[137902532] = 0.1, -- VINTAGE PISTOL | USED
	[-1716589765] = 0.4, -- PISTOL50 | USED
	[2548703416] = 0.35, -- DOUBLE ACTION REVOLVER | USED (-1746263880)
	[2828843422] = 0.7, -- MUSKET | USED
	[1198879012] = 0.9, -- FLARE GUN | USED
	[4019527611] = 0.7 -- DOUBLE BARREL SHOTGUN | USED
}



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
		ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.15)
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if recoils[wep] and recoils[wep] ~= 0 then
				tv = 0
				if GetFollowPedCamViewMode() ~= 4 then
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						SetGameplayCamRelativePitch(p+0.1, 0.2)
						tv = tv+0.1
					until tv >= recoils[wep]
				else
					repeat 
						Wait(0)
						p = GetGameplayCamRelativePitch()
						if recoils[wep] > 0.1 then
							SetGameplayCamRelativePitch(p+0.6, 1.1)
							tv = tv+0.6
						else
							SetGameplayCamRelativePitch(p+0.016, 0.333)
							tv = tv+0.1
						end
					until tv >= recoils[wep]
				end
			end
		end
	end
end)