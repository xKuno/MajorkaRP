local holstered = true

local krotka = false

local dluga = false

local weapons = {

	'WEAPON_KNUCKLE',

	'WEAPON_SNOWBALL',

	'WEAPON_BALL',

	'WEAPON_FLARE',

	'WEAPON_REVOLVER', 

	'WEAPON_PISTOL',

	'WEAPON_PISTOL_MK2',

	'WEAPON_COMBATPISTOL',

	'WEAPON_APPISTOL', 

	'WEAPON_PISTOL50',

	'WEAPON_SNSPISTOL', 

	'WEAPON_HEAVYPISTOL', 

	'WEAPON_VINTAGEPISTOL', 

	'WEAPON_STUNGUN', 

	'WEAPON_FLAREGUN',

	'WEAPON_MARKSMANPISTOL',

	'WEAPON_MICROSMG', 

	'WEAPON_MINISMG',

	'WEAPON_MACHINEPISTOL',

	'WEAPON_SAWNOFFSHOTGUN',

	'WEAPON_DBSHOTGUN'

}





local weaponsdluga = {

    'WEAPON_KNIFE', 

	'WEAPON_KNUCKLE',

	'WEAPON_NIGHTSTICK',

	'WEAPON_HAMMER', 

	'WEAPON_BAT',

	'WEAPON_GOLFCLUB', 

	'WEAPON_CROWBAR', 

	'WEAPON_BOTTLE', 

	'WEAPON_DAGGER',

	'WEAPON_HATCHET',

	'WEAPON_MACHETE',

	'WEAPON_POOLCUE',

	'WEAPON_PIPEWRENCH', 

	'WEAPON_FIREEXTINGUISHER', 

	'WEAPON_PETROLCAN',

	'WEAPON_SMG', 

	'WEAPON_SMG_MK2',

	'WEAPON_ASSAULTSMG',

	'WEAPON_ASSAULTRIFLE',

	'WEAPON_CARBINERIFLE', 

	'WEAPON_COMPACTRIFLE',

	'WEAPON_SNSPISTOL_MK2', 

	'WEAPON_REVOLVER_MK2', 

	'WEAPON_DOUBLEACTION',

}


Citizen.CreateThread(function()

    while true do

        Citizen.Wait(25)

        local ped = PlayerPedId()

        if DoesEntityExist( ped ) and not IsEntityDead( ped ) and not IsPedInAnyVehicle(PlayerPedId(), true) then   

            if CheckWeapon(ped) then

				if krotka then

					if holstered then

						animka()

					end

                elseif dluga then

					if holstered then

						drawWeapon()

					end

				end

            elseif not CheckWeapon(ped) then

				if krotka then

					if not holstered then

						animka2()

					end

				elseif dluga then

					if not holstered then

						drawWeaponB()

					end

				end

            end

		else
			Citizen.Wait(500)	
        end

    end

end)



function animka()

	local ped = PlayerPedId()

	loadAnimDict("rcmjosh4")

	loadAnimDict("weapons@pistol@")

	loadAnimDict("reaction@intimidation@cop@unarmed")

	TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )

	Citizen.Wait(300)

	ClearPedTasks(ped)

	holstered = false

	krotka = false

	dluga = false

end



function animka2()

	local ped = PlayerPedId()

	loadAnimDict( "weapons@pistol@" )

	TaskPlayAnim(ped, "weapons@pistol@", "aim_2_holster", 2.0, 1.9, -1, 50, 10, 0, 0, 0 )

	Citizen.Wait(950)

	ClearPedTasks(ped)

	holstered = true

	krotka = false

	dluga = false

end



function drawWeapon()

	local ped = PlayerPedId()

	pos = GetEntityCoords(ped, true)

	rot = GetEntityHeading(ped)

	loadAnimDict( "reaction@intimidation@1h" )

	TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)

	Citizen.Wait(1500)

	ClearPedTasks(ped)

	holstered = false

	krotka = false

	dluga = false

end



function drawWeaponB()

	local ped = PlayerPedId()

	pos = GetEntityCoords(ped, true)

	rot = GetEntityHeading(ped)

	loadAnimDict( "reaction@intimidation@1h" )

	TaskPlayAnimAdvanced(ped, "reaction@intimidation@1h", "intro", GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0.325, 0, 0)

	Citizen.Wait(600)

	ClearPedTasks(ped)

	holstered = true

	krotka = false

	dluga = false

end



function CheckWeapon(ped)

    for i = 1, #weapons do

        if GetHashKey(weapons[i]) == GetSelectedPedWeapon(ped) then

			krotka = true

            return true

        end

    end

    for i = 1, #weaponsdluga do

        if GetHashKey(weaponsdluga[i]) == GetSelectedPedWeapon(ped) then

			dluga = true

            return true

        end

    end

    return false

end



function loadAnimDict( dict )

    while ( not HasAnimDictLoaded( dict ) ) do

        RequestAnimDict( dict )

        Citizen.Wait(10)

    end

end