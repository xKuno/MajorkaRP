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

ESX = nil

PlayerData = {}

local jailTime = 0
local a		   = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	LoadTeleporters()
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailTime", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			JailLogin()
		end
	end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	PlayerData["job"] = response
end)

RegisterNetEvent("esx-qalle-jail:openJailMenu")
AddEventHandler("esx-qalle-jail:openJailMenu", function()
if PlayerData.job.name == "police" then
	OpenJailMenu()
	end
end)

RegisterNetEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(newJailTime)
	jailTime = newJailTime

	Cutscene()
end)

RegisterNetEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function()
	jailTime = 0

	UnJail()
end)

function JailLogin()
	local JailPosition = Config.JailPositions["Cell"]
	SetEntityCoords(PlayerPedId(), JailPosition["x"], JailPosition["y"], JailPosition["z"] - 1)

	ESX.ShowNotification("Ostatnim razem, gdy byles w wiezieniu usnales, dlatego znow tutaj trafiasz!")

	InJail()
end

function UnJail()
	InJail()

	ESX.Game.Teleport(PlayerPedId(), Config.Teleports["Boiling Broke"])

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	ESX.ShowNotification("Wyszedles z wiezienia!")
end

function InJail()

	--Jail Timer--

	Citizen.CreateThread(function()

		while jailTime > 0 do
		local Ped = PlayerPedId()
		local PedCoords = GetEntityCoords(Ped)
		local JailPosition = Config.JailPositions["Cell"]
		local Dziecioly = Config.Dziecioly["Krzysztof"]
		local DystansCzek = #(GetEntityCoords(Ped) - vector3(Dziecioly["x"], Dziecioly["y"], Dziecioly["z"]))
		local DystansCzekDwa = #(GetEntityCoords(Ped) - vector3(JailPosition["x"], JailPosition["y"], JailPosition["z"]))


			jailTime = jailTime - 1

			ESX.ShowNotification("Zostales wsadzony do wiezienia na " .. jailTime .. " miesiecy!")

			TriggerServerEvent("esx-qalle-jail:updateJailTime", jailTime)

			if jailTime == 0 then
				UnJail()
				TriggerServerEvent("esx-qalle-jail:unJailPlayer33", GetPlayerServerId(PlayerId()))
				TriggerServerEvent("esx-qalle-jail:updateJailTime", 0)
			end
			
			if jailTime ~= 0 and DystansCzek > 100.0 and DystansCzekDwa > 100.0 then
				ESX.Game.Teleport(Ped, JailPosition)
				TriggerEvent('chat:addMessage', { args = { ('Sedzia'), ('Nie uciekniesz!') }, color = { 147, 196, 109 } })
			end
			
			Citizen.Wait(60000)
		end

	end)

	--Jail Timer--

	--Prison Work--

	Citizen.CreateThread(function()
		while jailTime > 0 do
			
			local sleepThread = 500

			local Packages = Config.PrisonWork123["Packages"]

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)

			for posId, v in pairs(Packages) do

				local DistanceCheck = #(PedCoords - vector3(v["x"], v["y"], v["z"]))

				if DistanceCheck <= 10.0 then

					sleepThread = 5

					local PackageText = "Zacznij pakowac"

					if not v["state"] then
						PackageText = "Wzieta"
					end

					ESX.Game.Utils.DrawText3D(v, "[E] " .. PackageText, 0.4)

					if DistanceCheck <= 1.5 then

						if IsControlJustPressed(0, 38) then

							if v["state"] then
								PackPackage(posId)
							else
								ESX.ShowNotification("Juz wziales ta paczke!")
							end

						end

					end

				end

			end

			Citizen.Wait(sleepThread)

		end
	end)

	--Prison Work--

end

function LoadTeleporters()
	Citizen.CreateThread(function()
		while true do
			
			local sleepThread = 500

			local Ped = PlayerPedId()
			local PedCoords = GetEntityCoords(Ped)

			for p, v in pairs(Config.Teleports) do

				local DistanceCheck = #(PedCoords - vector3(v["x"], v["y"], v["z"]))

				if DistanceCheck <= 7.5 then

					sleepThread = 5

					ESX.Game.Utils.DrawText3D(v, "[E] Otworz drzwi", 0.4)

					if DistanceCheck <= 1.0 then
						if IsControlJustPressed(0, 38) then
							TeleportPlayer(v)
						end
					end
				end
			end

			Citizen.Wait(sleepThread)

		end
	end)
end


function PackPackage(packageId)
	local Package = Config.PrisonWork123["Packages"][packageId]

	LoadModel("prop_cs_cardbox_01")

	local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), Package["x"], Package["y"], Package["z"], true)

	PlaceObjectOnGroundProperly(PackageObject)

	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)

	local Packaging = true
	local StartTime = GetGameTimer()

	while Packaging do
		
		Citizen.Wait(1)

		local TimeToTake = 60000 * 2.20 -- Minutes
		local PackPercent = (GetGameTimer() - StartTime) / TimeToTake * 100

		if not IsPedUsingScenario(PlayerPedId(), "PROP_HUMAN_BUM_BIN") then
			DeleteEntity(PackageObject)

			ESX.ShowNotification("Anulowano!")

			Packaging = false
		end

		if PackPercent >= 100 then

			Packaging = false

			DeliverPackage(PackageObject)

			Package["state"] = false
		else
			ESX.Game.Utils.DrawText3D(Package, "Pakowanie w toku... " .. math.ceil(tonumber(PackPercent)) .. "%", 0.4)
		end
		
	end
end

function DeliverPackage(packageId)
	if DoesEntityExist(packageId) then
		AttachEntityToEntity(packageId, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)

		ClearPedTasks(PlayerPedId())
	else
		return
	end

	local Packaging = true

	LoadAnim("anim@heists@box_carry@")

	while Packaging do

		Citizen.Wait(5)

		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
			TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
		end

		if not IsEntityAttachedToEntity(packageId, PlayerPedId()) then
			Packaging = false
			DeleteEntity(packageId)
		else
			local DeliverPosition = Config.PrisonWork123["DeliverPackage"]
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = #(PedPosition - vector3(DeliverPosition["x"], DeliverPosition["y"], DeliverPosition["z"]))

			ESX.Game.Utils.DrawText3D(DeliverPosition, "[E] Dostarcz paczke", 0.4)

			if DistanceCheck <= 2.0 then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(packageId)
					ClearPedTasksImmediately(PlayerPedId())
					Packaging = false

					if jailTime > 15 then
					local ile = math.random(1, 10)
						jailTime = jailTime - ile
						TriggerServerEvent("esx-qalle-jail:prisonWorkReward", jailTime)
					else
						ESX.ShowNotification("Masz mniej niz 20 miesiecy, odczekaj je i nie wykonuj pracy, wystarczy Ci!")
					end
				end
			end
		end
	end
end

function OpenJailMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'jail_prison_menu',
		{
			title    = "Menu wiezienia",
			align    = 'center',
			elements = {
				--{ label = "Wsadz do wiezienia najblizsza osobe", value = "jail_closest_player" },
				{ label = "Wyciagnij z wiezienia", value = "unjail_player" }
			}
		}, 
	function(data, menu)

		local action = data.current.value

		if action == "jail_closest_player" then

			menu.close()

			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Czas (miesiace)"
          		},
          	function(data2, menu2)

            	local jailTime = tonumber(data2.value)

            	if jailTime == nil then
              		ESX.ShowNotification("Czas musi byc w miesiacach!")
            	else
              		menu2.close()

              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()

              		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("Brak obywateli w poblizu!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Powod"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Musisz podac powod!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("Brak graczy w poblizu!")
								else
									if PlayerData.job.name == "police" and jailTime < 3000 then
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason)
									end
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "unjail_player" then

			local elements = {}
				if PlayerData.job.name == "police" then
			ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(playerArray)

				if #playerArray == 0 then
					ESX.ShowNotification("Twoje wiezienie jest puste!")
					return
				end

					for k,i in ipairs(playerArray) do
					table.insert(elements, {label = "Wiezien: " .. i.name .. " | na Czas: " .. i.jailTime .. " miesiecy", value = i.identifier })
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'jail_unjail_menu',
					{
						title = "Wyciagnij z wiezienia ",
						align = "center",
						elements = elements
					},
				function(data2, menu2)

					local action = data2.current.value
					if PlayerData.job.name == "police"  then
						TriggerServerEvent("esx-qalle-jail:unJailPlayer", action)
					end
					menu2.close()

				end, function(data2, menu2)
					menu2.close()
				end)
			end)
			end

		end

	end, function(data, menu)
		menu.close()
	end)	
end

