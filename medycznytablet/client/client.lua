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

ESX	= nil
local PlayerData = {}
local mdcOpened = false

local tabletEntity = nil
local tabletModel = "prop_cs_tablet"
local tabletDict = "amb@world_human_seat_wall_tablet@female@base"
local tabletAnim = "base"

-- load jobData
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('tabletems')
AddEventHandler('tabletems', function()
    PlayerData = ESX.GetPlayerData()
    if mdcOpened == false then
        if PlayerData.job ~= nil then
            local jobName = PlayerData.job.name
            if jobName == 'ambulance' then
                SetNuiFocus(true, true)
                startTabletAnimation()
                SendNUIMessage({event = 'ShowPoliceTablet', isVisible = true})
                mdcOpened = true
            end
        end
    end
end)

RegisterNetEvent('esx_mdc_ems_client:runMdcTablet')
AddEventHandler('esx_mdc_ems_client:runMdcTablet', function()
    PlayerData = ESX.GetPlayerData()
    if mdcOpened == false then
        if PlayerData.job ~= nil then
            local jobName = PlayerData.job.name
            if jobName == 'ambulance'  then
                SetNuiFocus(true, true)
                startTabletAnimation()
                SendNUIMessage({event = 'ShowPoliceTablet', isVisible = true})
                mdcOpened = true
            end
        end
    end
end)


Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(1)
		if IsControlJustPressed(0, Keys["DELETE"]) and PlayerData.job ~= nil and PlayerData.job.name == 'ambulance' then
			TriggerEvent('tabletems')
		end
	end
end)


RegisterNUICallback('policeTryToLoginems', function()
	ESX.TriggerServerCallback('esx_mdc_ems:getPlayerName', function(name, departmentGrade)
		SendNUIMessage({
			event = 'LoadConfig',
			departments = Config.departments
		})
		SendNUIMessage({
			event = 'LoggedInPoliceTablet', 
			user = {
				name = name,
				jobName = PlayerData.job.name,
				departmentGrade = departmentGrade
			}
		})
	end, GetPlayerServerId(PlayerId()), PlayerData.job.name, PlayerData.job.grade)
end)

RegisterNUICallback('addNewCitizenNoteems', function(data, cb)
	local citizenId = data.citizenId
	if citizenId ~= nil then	
		TriggerServerEvent('esx_mdc_ems:addNewCitizenNote', citizenId, data)
	end
end)

RegisterNUICallback('changeCitizenDataems', function(data)
	TriggerServerEvent('esx_mdc_ems:saveCitizen', data.citizen)
end) 

RegisterNUICallback('getCitizensWarrantsListems', function(data)
	ESX.TriggerServerCallback('esx_mdc_ems:getCitizensWarrantsList', function(warrantsData)
		SendNUIMessage({
			event = 'LoadCitizensWarrants',
			warrants = warrantsData
		})
	end)
end) 

RegisterNUICallback('addNewVehicleNoteems', function(data, cb)
	local vehicleId = data.vehicleId
	if vehicleId ~= nil then	
		TriggerServerEvent('esx_mdc_ems:addNewVehicleNote', vehicleId, data)
	end
end)

RegisterNUICallback('changeVehicleDataems', function(data)
	TriggerServerEvent('esx_mdc_ems:saveVehicle', data.vehicle)
end) 

RegisterNUICallback('getVehiclesWarrantsListems', function(data)
	ESX.TriggerServerCallback('esx_mdc_ems:getVehiclesWarrantsList', function(warrantsData)
		SendNUIMessage({
			event = 'LoadVehicleWarrants',
			warrants = warrantsData
		})
	end)
end) 

RegisterNUICallback('policeMdcSearchForVehicleems', function(data)
	ESX.TriggerServerCallback('esx_mdc_ems:getAllTags', function(tagsData)
		SendNUIMessage({
			event = 'LoadMdcAllTags', 
			tags = tagsData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc_ems:getVehicleByPlate', function(vehicleData)
		SendNUIMessage({
			event = 'FoundVehicle',
			vehicle = {
				id = vehicleData.id,
				owner = vehicleData.owner,
				ownerName = vehicleData.ownerName,
				shared = vehicleData.shared,
				sharedName = vehicleData.sharedName,
				plateText = vehicleData.plate,
				vehicleModel = vehicleData.modelname,
				lspdTags = vehicleData.lspdTags,
				notes = vehicleData.mdcNotes
			}
		})
	end, data.vehiclePlateText)
end)

RegisterNUICallback('addNewCitizenConvictionems', function(data)
	local citizenId = data.id
    local playerJobName = PlayerData.job.name
    if citizenId ~= nil then
        local citizenServerId = getPlayerIdByHex(citizenId)
        TriggerServerEvent('esx_mdc_ems:addNewCitizenConviction', GetPlayerServerId(PlayerId()) , playerJobName, citizenId, data)
		
    end
end)

--[[RegisterNetEvent('projektsantos:jailnotify')
AddEventHandler('projektsantos:jailnotify', function(jailtime, id, powod, przedrostek)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local name = data.firstname .. ' ' .. data.lastname	
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { '^2SĘDZIA^7', (name..' ^7został/a skazany/a na: ^2'..jailtime..' miesiecy ^7Powód: '..powod) }
		})
	end, id)

end)]]


RegisterNetEvent('projektsantosems:mandatnotify')
AddEventHandler('projektsantosems:mandatnotify', function(fine, id, powod)
	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)
		local name = data.firstname .. ' ' .. data.lastname
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.3); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { 'FAKTURA', (name..' otrzymał/a fakturę wysokości: ^2'..fine..'^7$ Usługi: '..powod) }
		})
		
	end, id)
end)

RegisterNUICallback('policeMdcSearchForCitizenems', function(data)
	ESX.TriggerServerCallback('esx_mdc_ems:getAllTags', function(tagsData)
		SendNUIMessage({
			event = 'LoadMdcAllTags', 
			tags = tagsData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc_ems:getConvictionCategories', function(convictionData)
		SendNUIMessage({
			event = 'LoadConvictionCategories', 
			convictions = convictionData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc_ems:getCitizenByName', function(userData)
		if #userData > 1 then
			SendNUIMessage({
				event = 'FoundManyCitizens',
				citizens = userData
			});
		else
			SendNUIMessage({
				event = 'FoundCitizen', 
				citizen = {
					id = userData.identifier,
					name = userData.fullName,
					birthdate = userData.dateofbirth,
					gender = userData.sex,
					driverLicenseA = userData.driverLicenseA,
					driverLicenseB = userData.driverLicenseB,
					driverLicenseC = userData.driverLicenseC,
					weaponLicense = userData.weaponLicense,
					zdrowotneLicense = userData.zdrowotneLicense,
					lspdTags = userData.lspdTags,
					notes = userData.mdcNotes,
					houses = userData.houses,
					convictions= userData.convictions,
				}
			})
		end
	end, data.citizenName, data.citizenId)
end)

RegisterNUICallback('closePoliceMdcems', function()
	SetNuiFocus(false, false)
	mdcOpened = false
	stopTabletAnimation()
end)

RegisterNetEvent('stoptablet')
AddEventHandler('stoptablet', function()
	SetNuiFocus(false, false)
	mdcOpened = false
	stopTabletAnimation()
end)

function startTabletAnimation()
	Citizen.CreateThread(function()
	  RequestAnimDict( )
	  while not HasAnimDictLoaded(tabletDict) do
	    Citizen.Wait(0)
	  end
		--attachObject()
		TaskPlayAnim(GetPlayerPed(-1), tabletDict, tabletAnim, 8.0, -8.0, -1, 50, 0, false, false, false)
	end)
end

function attachObject()
	if tabletEntity == nil then
		Citizen.Wait(380)
		RequestModel(tabletModel)
		while not HasModelLoaded(tabletModel) do
			Citizen.Wait(1)
		end
		tabletEntity = CreateObject(GetHashKey(tabletModel), 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(tabletEntity, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.12, 0.10, -0.13, 25.0, 170.0, 160.0, true, true, false, true, 1, true)
	end
end

function stopTabletAnimation()
	if tabletEntity ~= nil then
		StopAnimTask(GetPlayerPed(-1), tabletDict, tabletAnim ,8.0, -8.0, -1, 50, 0, false, false, false)
		DeleteEntity(tabletEntity)
		tabletEntity = nil
	end
end

function getPlayerIdByHex(playerHexToFind)
	for _,playerId in ipairs(GetActivePlayers()) do
		local userid = GetPlayerServerId(playerId)
		local playerData = ESX.GetPlayerData(userid)
		local playerHex = playerData.identifier
		if playerHex == playerHexToFind then
			return userid
		end
	end
	return nil
end
