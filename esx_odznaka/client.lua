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

ESX                           = nil
local PlayerData                = {}
local PlayerLoaded = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

  while ESX.GetPlayerData().job2 == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:setJob2')
AddEventHandler('esx:setJob2', function(job2)
	ESX.PlayerData.job2 = job2
end)

function PokazDokSwat(source)
  local xPlayer = ESX.GetPlayerFromId(_source)
  local _source = source
  if xPlayer ~= nil then
    local job2 = xPlayer.job2.name
    local name = getIdentity(source)
    local czy_wazna
    if job2.name == "swat"  or job2.name == 'adwokat' then
      czy_wazna = "~g~Tak"
    else 
      job.grade_label = "~r~Brak informacji"
      czy_wazna = "~r~Nie"
    end
    if job2.name == 'swat' then 
      TriggerClientEvent('esx:dowod_pokazOdznake', -1,  _source, "~h~~l~S.W.A.T","~b~Los Santos Police Department", "~l~Odznaka:~h~ ".. name.odznaka)
    elseif job2.name == 'adwokat' then
      TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~p~Licencja D.O.J~s~' , 'Poziom~p~ '..job.grade_label..'~s~~n~Licencja czy ważna '..czy_wazna)
    end
  end
end

function PokazDok(source)
  local xPlayer = ESX.GetPlayerFromId(_source)
  local _source = source
  if xPlayer ~= nil then
  local job = xPlayer.job.name
  local name = getIdentity(source)
  local czy_wazna
  if job.name == "police" or job.name == 'ambulance' or job.name =='adwokat' or job.name == 'news' then
    czy_wazna = "~g~Tak"
  else 
    job.grade_label = "~r~Brak informacji"
    czy_wazna = "~r~Nie"
  end
   if job.name_grade <= 21 and job.name == 'police' then 
  TriggerClientEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~b~Odznaka LSPD~s~' , 'Stopień ~b~'..job.grade_label..'~s~~n~Odznaka jest ważna '..czy_wazna)
  elseif job.name_grade >= 22 and job.name_grade <= 36 and job.name == 'police' then 
  TriggerClientEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~y~Odznaka SO~s~' , 'Stopień ~y~'..job.grade_label..'~s~~n~Odznaka jest ważna '..czy_wazna)
  elseif (job.name_grade >= 37 and job.name_grade ~= 45) and job.name == 'police' then
  TriggerClientEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~l~Identyfikator FIB~s~' , 'Ranga~l~ '..job.grade_label..'~s~~n~Identyfikator czy ważny '..czy_wazna)
  end 
    if job.name  == 'ambulance' then
        TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~r~Legitymacja EMS~s~' , '~r~Stanowisko'..job.grade_label..'~s~~n~Legitymacja jest ważna '..czy_wazna)
    end
    if job.name  == 'mecano' then
        TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~r~Legitymacja Los Santos Customs~s~' , '~r~Stanowisko'..job.grade_label..'~s~~n~Legitymacja jest ważna '..czy_wazna)
    end
    if job.name  == 'news' then
        TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~y~Identyfikator Majorka News~s~' , '~b~Stanowisko'..job.grade_label..'~s~~n~Identyfikator jest ważny '..czy_wazna)
    end
    --if job.name == 'adwokat' then
    -- TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~p~Licencja Adwokacka~s~' , 'Poziom~p~ '..job.grade_label..'~s~~n~Licencja czy ważna '..czy_wazna)
    --end
  end
  if job.name == 'cbd' then
     TriggerEvent('esx:dowod_pokazOdznake', -1,_source, '~h~'..name.firstname..' '..name.lastname, '~g~Wizytówka Coffe Shop~s~' , 'Ranga~p~ '..job.grade_label..'~s~~n~Licencja czy ważna '..czy_wazna)
  end
end 

RegisterNetEvent('esx:dowod_pokazdowod')
AddEventHandler('esx:dowod_pokazdowod', function(id, imie, data, dodatek, ubezpieczenie)
  local pid = GetPlayerFromServerId(id)
  if pid and pid ~= -1 then
    local ped = GetPlayerPed(pid)
    if ESX ~= nil then
      local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))
    if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(ped, true)) < 20 or PlayerId() == GetPlayerFromServerId(id) then
        ShowAdvancedNotification(imie, data, dodatek, mugshotStr, 8)
        end
          UnregisterPedheadshot(mugshot)
      end
    end
end)


    

RegisterNetEvent('esx:dowod_pokazOdznake')
AddEventHandler('esx:dowod_pokazOdznake', function(id, imie, data, dodatek)
  local pid = GetPlayerFromServerId(id)
  if pid and pid ~= -1 then
    local ped = GetPlayerPed(pid)
    if ESX ~= nil then
      local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))
    if #(GetEntityCoords(PlayerPedId(), true) - GetEntityCoords(ped, true)) < 20 or PlayerId() == GetPlayerFromServerId(id) then
        PokazDokument(imie, data, dodatek, mugshotStr, 8, 80)
        end
      UnregisterPedheadshot(mugshot)
      end
    end
end)

function ShowAdvancedNotification(title, subject, msg, icon, iconType)


	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)

end

function PokazDokument(title, subject, msg, icon, iconType, color)
    SetNotificationTextEntry('STRING')
    SetNotificationBackgroundColor(color)
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)
end
local plateModelid = "prop_cs_business_card"
local plateModel = "prop_fib_badge"
local animDict = "missfbi_s4mop"
local animName = "swipe_card"
local plate_net = nil

RegisterNetEvent("esx_dowod:plateanim")
AddEventHandler("esx_dowod:plateanim", function()
local myjob = ESX.PlayerData.job.name
if  myjob == "police" or myjob == 'hitman' then
  RequestModel(GetHashKey(plateModel))
  while not HasModelLoaded(GetHashKey(plateModel)) do
    Citizen.Wait(100)
  end

  RequestAnimDict(animDict)
  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(100)
  end

  local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
  local platespawned = CreateObject(GetHashKey(plateModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
  Citizen.Wait(1000)
  local netid = ObjToNet(platespawned)
  SetNetworkIdExistsOnAllMachines(netid, true)
  SetNetworkIdCanMigrate(netid, false)
  TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0)
  TaskPlayAnim(GetPlayerPed(PlayerId()), animDict, animName, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
  Citizen.Wait(800)
  AttachEntityToEntity(platespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
  plate_net = netid
  Citizen.Wait(3000)
  ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
  DetachEntity(NetToObj(plate_net), 1, 1)
  DeleteEntity(NetToObj(plate_net))
  plate_net = nil
  elseif   myjob =='adwokat' or myjob =='ambulance' or myjob =='mecano' or myjob == 'news' then 
	RequestModel(GetHashKey(plateModelid))
  while not HasModelLoaded(GetHashKey(plateModelid)) do
    Citizen.Wait(100)
  end

  RequestAnimDict(animDict)
  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(100)
  end

  local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
  local platespawned = CreateObject(GetHashKey(plateModelid), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
  Citizen.Wait(1000)
  local netid = ObjToNet(platespawned)
  SetNetworkIdExistsOnAllMachines(netid, true)
  SetNetworkIdCanMigrate(netid, false)
  TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0)
  TaskPlayAnim(GetPlayerPed(PlayerId()), animDict, animName, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
  Citizen.Wait(800)
  AttachEntityToEntity(platespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
  plate_net = netid
  Citizen.Wait(3000)
  ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
  DetachEntity(NetToObj(plate_net), 1, 1)
  DeleteEntity(NetToObj(plate_net))
  plate_net = nil
	
	else 
  TriggerEvent('pNotify:SendNotification', {text = '<b style = color:red>Nie masz uprawnien by to uczynić</b>'})
  end 
   
end)

RegisterNetEvent("esx_dowod:pokazdowod123")
AddEventHandler("esx_dowod:pokazdowod123", function()
	RequestModel(GetHashKey(plateModelid))
  while not HasModelLoaded(GetHashKey(plateModelid)) do
    Citizen.Wait(100)
  end

  RequestAnimDict(animDict)
  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(100)
  end

  local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
  local platespawned = CreateObject(GetHashKey(plateModelid), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
  Citizen.Wait(1000)
  local netid = ObjToNet(platespawned)
  SetNetworkIdExistsOnAllMachines(netid, true)
  SetNetworkIdCanMigrate(netid, false)
  TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0)
  TaskPlayAnim(GetPlayerPed(PlayerId()), animDict, animName, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
  Citizen.Wait(800)
  AttachEntityToEntity(platespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
  plate_net = netid
  Citizen.Wait(3000)
  ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
  DetachEntity(NetToObj(plate_net), 1, 1)
  DeleteEntity(NetToObj(plate_net))
  plate_net = nil
end)