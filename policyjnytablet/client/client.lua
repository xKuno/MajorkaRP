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
local otworzyl = false
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

RegisterNetEvent('tabletpol')
AddEventHandler('tabletpol', function()
    PlayerData = ESX.GetPlayerData()
    if mdcOpened == false then
        if PlayerData.job ~= nil then
            local jobName = PlayerData.job.name
            if jobName == 'police' then
                SetNuiFocus(true, true)
                startTabletAnimation()
                SendNUIMessage({event = 'ShowPoliceTablet', isVisible = true})
                mdcOpened = true
            end
        end
    end
end)

RegisterNetEvent('esx_mdc_client:runMdcTablet')
AddEventHandler('esx_mdc_client:runMdcTablet', function()
    PlayerData = ESX.GetPlayerData()
    if mdcOpened == false then
        if PlayerData.job ~= nil then
            local jobName = PlayerData.job.name
            if jobName == 'police' or jobName == 'IAA' then
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
		if IsControlJustPressed(0, Keys["DELETE"]) and otworzyl == false and PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		    otworzyl = true
			TriggerEvent('tabletpol')
			Citizen.Wait(1000)
			otworzyl = false
		end
	end
end)

RegisterCommand('tabletpol', function()
    Citizen.CreateThread(function()
		TriggerEvent('tabletpol')
	end)
end, false)

RegisterCommand('tdel', function()
    Citizen.CreateThread(function()
		DeleteEntity(tabletEntity)
	end)
end, false)


RegisterNUICallback('policeTryToLogin', function()
	ESX.TriggerServerCallback('esx_mdc:getPlayerName', function(name, departmentGrade)
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

RegisterNUICallback('addNewCitizenNote', function(data, cb)
	local citizenId = data.citizenId
	if citizenId ~= nil then	
		TriggerServerEvent('esx_mdc:addNewCitizenNote', citizenId, data)
	end
end)

RegisterNUICallback('changeCitizenData', function(data)
	TriggerServerEvent('esx_mdc:saveCitizen', data.citizen)
end) 

RegisterNUICallback('getCitizensWarrantsList', function(data)
	ESX.TriggerServerCallback('esx_mdc:getCitizensWarrantsList', function(warrantsData)
		SendNUIMessage({
			event = 'LoadCitizensWarrants',
			warrants = warrantsData
		})
	end)
end) 

RegisterNUICallback('addNewVehicleNote', function(data, cb)
	local vehicleId = data.vehicleId
	if vehicleId ~= nil then	
		TriggerServerEvent('esx_mdc:addNewVehicleNote', vehicleId, data)
	end
end)

RegisterNUICallback('changeVehicleData', function(data)
	TriggerServerEvent('esx_mdc:saveVehicle', data.vehicle)
end) 

RegisterNUICallback('getVehiclesWarrantsList', function(data)
	ESX.TriggerServerCallback('esx_mdc:getVehiclesWarrantsList', function(warrantsData)
		SendNUIMessage({
			event = 'LoadVehicleWarrants',
			warrants = warrantsData
		})
	end)
end) 

RegisterNUICallback('policeMdcSearchForVehicle', function(data)
	ESX.TriggerServerCallback('esx_mdc:getAllTags', function(tagsData)
		SendNUIMessage({
			event = 'LoadMdcAllTags', 
			tags = tagsData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc:getVehicleByPlate', function(vehicleData)
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

RegisterNUICallback('addNewCitizenConviction', function(data)
	local citizenId = data.id
    local playerJobName = PlayerData.job.name
    if citizenId ~= nil then
        local citizenServerId = getPlayerIdByHex(citizenId)
        TriggerServerEvent('esx_mdc:addNewCitizenConviction', GetPlayerServerId(PlayerId()) , playerJobName, citizenId, data)
		
    end
end)

RegisterNetEvent('projektsantos:jailnotify')
AddEventHandler('projektsantos:jailnotify', function(jailtime, id, powod, przedrostek, name)
		local nazwa = name
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { przedrostek, (nazwa..' ^7został/a skazany/a na: ^2'..jailtime..' miesiecy ^7Powód: '..powod) }
		})

end)

RegisterNetEvent('projektsantos:prace')
AddEventHandler('projektsantos:prace', function(jailtime, przedrostek, name, type)
	local nazwa = name
	if type == 1 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { przedrostek, (nazwa..' ^7został/a skazany/a na: ^2'..jailtime..' miesiecy prac spolecznych') }
		})
	elseif type == 2 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { przedrostek, (nazwa..' ^7wyszedł/wyszła z ^2więzienia!') }
		})
	end
end)

RegisterNetEvent('projektsantos:jailnotify33')
AddEventHandler('projektsantos:jailnotify33', function(imie, nazwisko)
	name = imie..' '..nazwisko
	TriggerEvent('chat:addMessage', {
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
		args = { '^2SĘDZIA^7', (name..' ^7wyszedł/wyszła z ^2więzienia!') }
	})
end)

RegisterNetEvent('projektsantos:mandatnotify')
AddEventHandler('projektsantos:mandatnotify', function(fine, id, powod, name)
		local nazwa = name
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { '^2MANDAT^7', (nazwa..' otrzymał/a mandat karny w wysokości: ^2'..fine..'$ ^7Powód: '..powod) }
		})
end)

RegisterNUICallback('policeMdcSearchForCitizen', function(data)
	ESX.TriggerServerCallback('esx_mdc:getAllTags', function(tagsData)
		SendNUIMessage({
			event = 'LoadMdcAllTags', 
			tags = tagsData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc:getConvictionCategories', function(convictionData)
		SendNUIMessage({
			event = 'LoadConvictionCategories', 
			convictions = convictionData
		})
	end)
	ESX.TriggerServerCallback('esx_mdc:getCitizenByName', function(userData)
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
					lspdTags = userData.lspdTags,
					notes = userData.mdcNotes,
					houses = userData.houses,
					convictions= userData.convictions,
				}
			})
		end
	end, data.citizenName, data.citizenId)
end)

RegisterNUICallback('closePoliceMdc', function()
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
		attachObject()
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
	DeleteEntity(tabletEntity)
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
