RegisterNetEvent('child')
AddEventHandler('child', function()
local ped = 'Child'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('ballas2')
AddEventHandler('ballas2', function()
local ped = 'g_m_y_ballasout_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)


RegisterNetEvent('dante')
AddEventHandler('dante', function()
local ped = 'Dante'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

		RegisterNetEvent('gruby')
AddEventHandler('gruby', function()
local ped = 'g_m_y_korlieut_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)


		RegisterNetEvent('ballas')
AddEventHandler('ballas', function()
local ped = 'csb_ballasog'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

		RegisterNetEvent('grubas')
AddEventHandler('grubas', function()
local ped = 'a_c_boar'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

		RegisterNetEvent('trup')
AddEventHandler('trup', function()
local ped = 'a_c_cat_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('grubas2')
AddEventHandler('grubas2', function()
local ped = 's_m_m_bouncer_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
				end	
				SetPlayerModel(PlayerId(), hash)
			end)

RegisterNetEvent('menel')
AddEventHandler('menel', function()
local ped = 'a_c_cormorant'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
				end	
				SetPlayerModel(PlayerId(), hash)
			end)
RegisterNetEvent('grubas3')
AddEventHandler('grubas3', function()
local ped = 'u_f_m_drowned_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
			Citizen.Wait(0)
			end	
	SetPlayerModel(PlayerId(), hash)
	end)
		
				
		RegisterNetEvent('steryd')
AddEventHandler('steryd', function()
local ped = 'a_m_y_smartcaspat_01'
local hash = GetHashKey(ped)
print(hash)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

		RegisterNetEvent('pies')
	AddEventHandler('pies', function()
	local ped = 'a_c_shepherd'
	local hash = GetHashKey(ped)
	print(hash)
		RequestModel(hash)
		while not HasModelLoaded(hash)
					do RequestModel(hash)
						Citizen.Wait(0)
					end	
					SetPlayerModel(PlayerId(), hash)
				end)

RegisterNetEvent('shrek')
AddEventHandler('shrek', function()
local ped = 'shrek'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('baby')
AddEventHandler('baby', function()
local ped = 'Baby'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('alien')
AddEventHandler('alien', function()
local ped = 's_m_m_movalien_01'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('space')
AddEventHandler('space', function()
local ped = 'ig_orleans'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('muscle')
AddEventHandler('muscle', function()
local ped = 'a_m_y_musclbeac_01'
local hash = GetHashKey(ped)
print(hash.." "..PlayerId())
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('fat')
AddEventHandler('fat', function()
local ped = 'a_m_m_afriamer_01'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

RegisterNetEvent('swat')
AddEventHandler('swat', function()
local ped = 's_m_y_swat_01'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)
RegisterNetEvent('swat')
AddEventHandler('swat', function()
local ped = 's_m_y_swat_01'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
	     end)


RegisterNetEvent('karzel')
AddEventHandler('karzel', function()
local ped = 'a_m_m_taco_kid'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)

				RegisterNetEvent('lost')
AddEventHandler('lost', function()
local ped = 'lost'
local hash = GetHashKey(ped)
	RequestModel(hash)
	while not HasModelLoaded(hash)
			do RequestModel(hash)
				Citizen.Wait(0)
			end	
			SetPlayerModel(PlayerId(), hash)
		end)
		RegisterNetEvent('pantera')
		AddEventHandler('pantera', function()
		local ped = 'a_c_coyote'
		local hash = GetHashKey(ped)
			RequestModel(hash)
			while not HasModelLoaded(hash)
					do RequestModel(hash)
						Citizen.Wait(0)
					end	
					SetPlayerModel(PlayerId(), hash)
				end)

TriggerEvent('chat:addSuggestion', '/setped', 'Set ped to guy', {
    { name="id", help="Id of the player" },
    { name="Model", help="Peds: dante, child" }
})

local godmode = false
RegisterNetEvent('admin:c_godmode')
AddEventHandler('admin:c_godmode', function()
    local playerPed = GetPlayerPed(-1)

    if not godmode then
        godmode = true
        print("GodMode ON")
    elseif godmode then
        godmode = false
        print("GodMode OFF")
    end
end)

Citizen.CreateThread(function() --Godmode
    while true do
        Citizen.Wait(1)

        if godmode then
            SetEntityInvincible(GetPlayerPed(-1), true)
            SetPlayerInvincible(PlayerId(), true)
            SetPedCanRagdoll(GetPlayerPed(-1), false)
            ClearPedBloodDamage(GetPlayerPed(-1))
            ResetPedVisibleDamage(GetPlayerPed(-1))
            ClearPedLastWeaponDamage(GetPlayerPed(-1))
            SetEntityProofs(GetPlayerPed(-1), true, true, true, true, true, true, true, true)
            SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
            SetEntityCanBeDamaged(GetPlayerPed(-1), false)
        elseif not godmode then
            SetEntityInvincible(GetPlayerPed(-1), false)
            SetPlayerInvincible(PlayerId(), false)
            SetPedCanRagdoll(GetPlayerPed(-1), true)
            ClearPedLastWeaponDamage(GetPlayerPed(-1))
            SetEntityProofs(GetPlayerPed(-1), false, false, false, false, false, false, false, false)
            SetEntityOnlyDamagedByPlayer(GetPlayerPed(-1), false)
            SetEntityCanBeDamaged(GetPlayerPed(-1), true)
        end
    end
end)