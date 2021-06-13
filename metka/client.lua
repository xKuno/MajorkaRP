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
local started = false
local displayed = false
local progress = 0
local CurrentVehicle 
local pause = false
local selection = 0
local quality = 0
local PlayerData		= {}
ESX = nil
local allowmarker = false
local Zones = {}
local meta = 0
local coords = 0

local LastCar

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('metka:setplayerdrugs')
AddEventHandler('metka:setplayerdrugs', function(pozycja)
	meta = pozycja
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx_methcar:stop')
AddEventHandler('esx_methcar:stop', function()
	started = false
	DisplayHelpText("~r~Produkcja zakończona...")
	FreezeEntityPosition(LastCar, false)
	StopParticleFxLooped(smoke, 0)
end)
RegisterNetEvent('esx_methcar:stopfreeze')
AddEventHandler('esx_methcar:stopfreeze', function(id)
	FreezeEntityPosition(id, false)
end)
RegisterNetEvent('esx_methcar:notify')
AddEventHandler('esx_methcar:notify', function(message)
	ESX.ShowNotification(message)
end)

RegisterNetEvent('esx_methcar:startprod')
AddEventHandler('esx_methcar:startprod', function()
	DisplayHelpText("~g~Zaczynamy produkcje")
	started = true
	FreezeEntityPosition(CurrentVehicle,true)
	displayed = false
	ESX.ShowNotification("~r~Gotowanie mety rozpoczęte")	
	SetPedIntoVehicle(GetPlayerPed(-1), CurrentVehicle, 3)
	SetVehicleDoorOpen(CurrentVehicle, 2)
end)

RegisterNetEvent('esx_methcar:blowup')
AddEventHandler('esx_methcar:blowup', function(posx, posy, posz)
	AddExplosion(posx, posy, posz + 2,23, 20.0, true, false, 1.0, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	local fire = StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", posx, posy, posz-0.8 , 0.0, 0.0, 0.0, 0.8, false, false, false, false)
	Citizen.Wait(6000)
	StopParticleFxLooped(fire, 0)
	
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(0)

		local coords = GetEntityCoords(GetPlayerPed(-1))
		if allowmarker then
			for k,v in pairs(Zones) do
				if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
					DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
				end
			end
		end
	end
end)



RegisterNetEvent('esx_methcar:smoke')
AddEventHandler('esx_methcar:smoke', function(posx, posy, posz, bool)

	if bool == 'a' then

		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Citizen.Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", posx, posy, posz + 1.7, 0.0, 0.0, 0.0, 2.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 0.8)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Citizen.Wait(12000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end

end)
RegisterNetEvent('esx_methcar:drugged')
AddEventHandler('esx_methcar:drugged', function()
	SetTimecycleModifier("drug_drive_blend01")
	SetPedMotionBlur(GetPlayerPed(1), true)
	SetPedMovementClipset(GetPlayerPed(1), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk(GetPlayerPed(1), true)

	Citizen.Wait(300000)
	ClearTimecycleModifier()
end)



Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		playerPed = GetPlayerPed(-1)
		local pos = GetEntityCoords(GetPlayerPed(-1))
		if IsPedInAnyVehicle(playerPed) then
			
			
			CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId())

			car = GetVehiclePedIsIn(playerPed, false)
			LastCar = GetVehiclePedIsUsing(playerPed)
	
			local model = GetEntityModel(CurrentVehicle)
			local modelName = GetDisplayNameFromVehicleModel(model)
			
			if modelName == Config.Zones.Samochod and car then
				
					if GetPedInVehicleSeat(car, -1) == playerPed then
						if started == false then

						end
						if IsControlJustReleased(0, Keys['G']) then
							TriggerServerEvent('metka:refreshdrugs')
							Wait(500)
							local coords = GetEntityCoords(PlayerPedId())
							if #(coords - meta) <= 100 then
								if IsVehicleSeatFree(CurrentVehicle, 3) then
									TriggerServerEvent('esx_methcar:start')	
									progress = 0
									pause = false
									selection = 0
									quality = 0
									
								else
									DisplayHelpText('~r~Ten samochód jest aktualnie zajęty')
								end
							else
								ESX.ShowNotification('~r~Jesteś za daleko od miejscówy, zgoda na gotowanie jest w okolicach latarnii morskiej')
							end
							
		
						end
					end
					
				
				
			
			end
			
		else

				
				if started then
					started = false
					displayed = false
					TriggerEvent('esx_methcar:stop')
					FreezeEntityPosition(LastCar,false)
				end
		end
		
		if started == true then
			
			if progress < 96 then
				Citizen.Wait(3500)
				if not pause and IsPedInAnyVehicle(playerPed) then
					progress = progress +  1
					Citizen.Wait(5000) 
				end

				--
				--   EVENT 1
				--
				if progress > 10 and progress < 13 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Wąż od butli z propanem przecieka, co robisz?')	
						ESX.ShowNotification('~o~1. Zaklej używajac taśmy')
						ESX.ShowNotification('~o~2. Nic ')
						ESX.ShowNotification('~o~3. Wymień wąż')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Taśma nieco uszczelniła wąż')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Butla z gazem wybuchła, zjebałeś...')
						TriggerServerEvent('esx_methcar:blow', pos.x, pos.y, pos.z)
						SetVehicleEngineHealth(CurrentVehicle, 0.0)
						quality = 0
						started = false
						displayed = false
						ApplyDamageToPed(GetPlayerPed(-1), 100, false)
					end
					if selection == 3 then
						ESX.ShowNotification('~r~Dobra robota! Wąż był już w złym stanie')
						pause = false
						quality = quality + 5
					end
				end
				--
				--   EVENT 5
				--
				if progress > 20 and progress < 23 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Wywróciłeś butle z acetonem na ziemie, co robisz?')	
						ESX.ShowNotification('~o~1. Otwórz okno aby pozbyć się zapachu')
						ESX.ShowNotification('~o~2. Nic')
						ESX.ShowNotification('~o~3. Załóż maskę z filtrem')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Otworzyłeś okno by choć trochę pozbyć się zapachu')
						quality = quality - 3
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Naćpałeś się wdychając aceton')
						pause = false
						TriggerEvent('esx_methcar:drugged')
					end
					if selection == 3 then
						ESX.ShowNotification('~r~To chyba najprostrze rozwiązane z możliwych...')
						SetPedPropIndex(playerPed, 1, 26, 7, true)
						pause = false
					end
				end
				--
				--   EVENT 2
				--
				if progress > 35 and progress < 38 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Meta zaczęła twardnieć zbyt szybko, co robisz? ')	
						ESX.ShowNotification('~o~1. Podnieś ciśnienie')
						ESX.ShowNotification('~o~2. Zwiększ temperature')
						ESX.ShowNotification('~o~3. Obniż ciśnienie')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Podniosłeś ciśnienie i propan zaczął uciekać, po zmniejszeniu ciśnienia jest okej')
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Podniesienie temperatury pomogło...')
						quality = quality + 5
						pause = false
					end
					if selection == 3 then
						ESX.ShowNotification('~r~Zmniejszenie ciśnienia pogorszyło tylko sprawe...')
						pause = false
						quality = quality -5
					end
				end
				--
				--   EVENT 8 - 3
				--
				if progress > 50 and progress < 53 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Przez przypadek dodałeś za dużo acetonu, co robisz?')	
						ESX.ShowNotification('~o~1. Nic')
						ESX.ShowNotification('~o~2. Spróbuj zebrać nadmiar strzykawką')
						ESX.ShowNotification('~o~3. Dodaj trochę litu aby zbalansować proporcje')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Meta nie powinna mieć zapachu acetonu')
						quality = quality - 5
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Trochę pomogło ale nadal jest za dużo acetonu')
						pause = false
						quality = quality - 1
					end
					if selection == 3 then
						ESX.ShowNotification('~r~Udało się cię wyrównać proporcje składników')
						pause = false
						quality = quality + 5
					end
				end
				--
				--   EVENT 3
				--
				if progress > 63 and progress < 66 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Znalazłeś jakiś wodny barwnik, co robisz?')	
						ESX.ShowNotification('~o~1. Dodaj')
						ESX.ShowNotification('~o~2. Wyrzuć')
						ESX.ShowNotification('~o~3. Wypij')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Dobry pomysł, ludzie lubią kolory!')
						quality = quality + 5
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Prawidłowo, może zniszczyć całą produkcje')
						pause = false
					end
					if selection == 3 then
						ESX.ShowNotification('~r~Czujesz się trochę dziwnie ale jest okej')
						pause = false
					end
				end
				--
				--   EVENT 4
				--
				if progress > 74 and progress < 77 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Filtr jest zapchany, co robisz?')	
						ESX.ShowNotification('~o~1. Wyczyść go sprężonym powietrzem')
						ESX.ShowNotification('~o~2. Wymień filtr')
						ESX.ShowNotification('~o~3. Wyczyść go przy użyciu szczoteczki do zębów')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Sprężone powietrze wydmuchało na ciebie płynną mete!')
						quality = quality - 5
						pause = false
						SeedTest()
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Wymiana filtra to chyba najlepsza opcja')
						pause = false
						quality = quality + 5
						SeedTest()
					end
					if selection == 3 then
						ESX.ShowNotification('~r~To podziałało całkiem nieźle ale jesteś cały ujebany')
						pause = false
						quality = quality - 2
						SeedTest()
					end

				end
				--
				--   EVENT 9
				--
				if progress > 84 and progress < 87 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Czujesz potrzebę wysrania się, co robisz?')	
						ESX.ShowNotification('~o~1. Zepnij poślady')
						ESX.ShowNotification('~o~2. Wyjdź na zewnątrz posadzić kloca')
						ESX.ShowNotification('~o~3. Sraj w kamperze')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Tak trzymaj, najpierw praca potem przyjemności')
						quality = quality + 5
						pause = false
						SeedTest()
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Kiedy srałeś, szkło z częścią płynu się wyjebało i wylało na podłodze...')
						pause = false
						quality = quality - 3
					end
					if selection == 3 then
						ESX.ShowNotification('~r~Wszystko w środku jebie gównem, łącznie z Metą')
						pause = false
						quality = quality - 2
						SeedTest()
					end
				end
				--
				--   EVENT 10
				--
				if progress > 90 and progress < 93 then
					pause = true
					if selection == 0 then
						ESX.ShowNotification('~o~Czy chcesz dodać trochę sproszkowanego szkła żeby zwiększyść objętość towaru?')	
						ESX.ShowNotification('~o~1. Tak!')
						ESX.ShowNotification('~o~2. Nie')
						ESX.ShowNotification('~o~3. A co jeśli dodać w chuj tego szkła?')
						ESX.ShowNotification('~c~Wciśnij numer opcji który wybierasz')
					end
					if selection == 1 then
						ESX.ShowNotification('~r~Teraz masz trochę więcej towaru')
						quality = quality + 7
						pause = false
					end
					if selection == 2 then
						ESX.ShowNotification('~r~Jesteś niezły gość, towar będzie najwyższej jakości')
						pause = false
					end
					if selection == 3 then
						ESX.ShowNotification('~r~To już trochę za dużo, jest więcej szkła niż mety ale okej...')
						pause = false
						quality = quality - 4
					end
				end
				
				
				
				
				
				
				
				if IsPedInAnyVehicle(playerPed) then
					TriggerServerEvent('esx_methcar:make', pos.x,pos.y,pos.z)
					if pause == false then
						selection = 0
						quality = quality + 1
						progress = progress +  math.random(1, 2)
						ESX.ShowNotification('~r~Produkcja Mety: ~g~~h~' .. progress .. '%')
					end
				else
					TriggerEvent('esx_methcar:stop')
				end

			else
				TriggerEvent('esx_methcar:stop')
				progress = 100
				ESX.ShowNotification('~r~Produkcja Mety: ~g~~h~' .. progress .. '%')
				ESX.ShowNotification('~g~~h~Produkcja zakończona')
				TriggerServerEvent('esx_methcar:finish', quality)
				FreezeEntityPosition(LastCar, false)
				StopParticleFxLooped(smoke, 0)
			end	
			
		end
		
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
			if IsPedInAnyVehicle(GetPlayerPed(-1)) then
			else
				if started then
					started = false
					displayed = false
					TriggerEvent('esx_methcar:stop')
					FreezeEntityPosition(LastCar,false)
				end		
			end
	end

end)

--Config
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local blipTime = 35 --in second
local showcopsmisbehave = true --show notification when cops steal too
local pedIsTryingToMakeMeta = false
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
			if pedIsTryingToMakeMeta then
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
						TriggerServerEvent('metaInProgressPos', plyPos.x, plyPos.y, plyPos.z)
						if s2 == 0 then
							TriggerServerEvent('metaInProgressS1', street1, sex)
						elseif s2 ~= 0 then
							TriggerServerEvent('metaInProgress', street1, street2, sex)
						end
					end)
					Wait(3000)
					pedIsTryingToMakeMeta = false
				else
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						local sex = nil
						if skin.sex == 0 then
							sex = "mężczyznę"
						else
							sex = "kobietę"
						end
						TriggerServerEvent('metaInProgressPos', plyPos.x, plyPos.y, plyPos.z)
						if s2 == 0 then
							TriggerServerEvent('metaInProgressS1', street1, sex)
						elseif s2 ~= 0 then
							TriggerServerEvent('metaInProgress', street1, street2, sex)
						end
					end)
					Wait(3000)
					pedIsTryingToMakeMeta = false
			end
		end
	end
end)

RegisterNetEvent('metaPlace')
AddEventHandler('metaPlace', function(tx, ty, tz)

if ESX.PlayerData.job ~= nil then
	if ESX.PlayerData.job.name == 'police' then
		local cipabut = math.random(-20, 30)
		local alpha = 250
		local Blip = AddBlipForCoord(tx+cipabut, ty, tz)
			--print(tx+cipabut.." "..ty+cipabut.." "..tz)

	SetBlipSprite(Blip, 161)
	SetBlipScale(Blip, 2.0)
	SetBlipColour(Blip, 3)

	PulseBlip(Blip)

		while alpha ~= 0 do
			Citizen.Wait(blipTime * 4)
			alpha = alpha - 1

			if alpha == 0 then
				RemoveBlip(Blip)
				return
			end
		end
		end
	end
end)

RegisterNetEvent('metaEnable')
AddEventHandler('metaEnable', function()
	pedIsTryingToMakeMeta = true
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)		
		if pause == true then
			if IsControlJustReleased(0, Keys['1']) then
				selection = 1
				ESX.ShowNotification('~g~Wybrałeś opcje numer 1')
			end
			if IsControlJustReleased(0, Keys['2']) then
				selection = 2
				ESX.ShowNotification('~g~Wybrałeś opcje numer 2')
			end
			if IsControlJustReleased(0, Keys['3']) then
				selection = 3
				ESX.ShowNotification('~g~Wybrałeś opcje numer 3')
			end
		end

	end
end)

RegisterNetEvent('sater:rozjebunda')
AddEventHandler('sater:rozjebunda', function()
	Citizen.Wait(15000)
	ApplyDamageToPed(GetPlayerPed(-1), 30, false)
	TriggerEvent("pNotify:SendNotification", { text = "ZACZYNA CIE ZJADAĆ OD ŚRODKA", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
	Citizen.Wait(15000)
	ApplyDamageToPed(GetPlayerPed(-1), 30, false)
	TriggerEvent("pNotify:SendNotification", { text = "ZACZYNA CIE ZJADAĆ OD ŚRODKA", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
	Citizen.Wait(15000)
	ApplyDamageToPed(GetPlayerPed(-1), 30, false)
	TriggerEvent("pNotify:SendNotification", { text = "ZACZYNA CIE ZJADAĆ OD ŚRODKA", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
	Citizen.Wait(15000)
	ApplyDamageToPed(GetPlayerPed(-1), 30, false)
	TriggerEvent("pNotify:SendNotification", { text = "ZACZYNA CIE ZJADAĆ OD ŚRODKA", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
	Citizen.Wait(60000)
	TriggerEvent("pNotify:SendNotification", { text = "ZJADLO CIE I CHUJ", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
	ApplyDamageToPed(GetPlayerPed(-1), 200, false)
	ClearTimecycleModifier()
end)



function SeedTest()
	local trigger = math.random(0, 100)
	if trigger > 85 then
			TriggerEvent("pNotify:SendNotification", { text = "~r~Ktos zauwazyl kleby dymu i zrobil ci zdjecie", type = "info", queue = "global", timeout = 5000, layout = "centerRight"})
			TriggerServerEvent('metaNotify')
			--TUTAJ KOZA MA BYC WYSYLANIE DO PSIARSKICH 
	end
end

RegisterNetEvent('sater:anim')
AddEventHandler('sater:anim', function()
	ClearPedTasks(PlayerPedId())
	Wait(750)
	animacjasprzedaz()
	FreezeEntityPosition(PlayerPedId(), true)
end)

RegisterNetEvent('sater:anim2')
AddEventHandler('sater:anim2', function()
	ClearPedTasks(PlayerPedId())
	Wait(750)
	animacjasprzedaz2()
	FreezeEntityPosition(PlayerPedId(), true)
	Wait(12000)
	animacjasprzedaz3()
end)

RegisterNetEvent('sater:stopanim')
AddEventHandler('sater:stopanim', function()
	ClearPedTasks(PlayerPedId())
	FreezeEntityPosition(PlayerPedId(), false)
end)

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(5)
	end
end

function animacjasprzedaz()
	local ad = "mini@repair"
	local anim = "fixing_a_ped"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
		end
	end
end

function animacjasprzedaz2()
	local ad = "amb@medic@standing@kneel@enter"
	local anim = "enter"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
		end
	end
end

function animacjasprzedaz3()
	local ad = "amb@medic@standing@tendtodead@base"
	local anim = "base"
	local player = PlayerPedId()


	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then
		loadAnimDict( ad )
		if ( IsEntityPlayingAnim( player, ad, anim, 8 ) ) then
			TaskPlayAnim( player, ad, "exit", 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
			ClearPedSecondaryTask(player)
		else
			SetCurrentPedWeapon( player, GetHashKey("WEAPON_UNARMED"), equipNow)
			Citizen.Wait(50)
			TaskPlayAnim( player, ad, anim, 8.0, -8.0, 0.2, 1, 0, 0, 0, 0 )
		end
	end
end
