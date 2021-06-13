ESX = nil

local alert = nil
local alertOwner = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('genesis-alert:callNumber')
AddEventHandler('genesis-alert:callNumber', function(data)
  local playerPed   = GetPlayerPed(-1)
  local coords      = GetEntityCoords(playerPed)
  local message     = data.message
  local number      = data.number
  if message == nil then
    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "", "", "", "", 200)
    while (UpdateOnscreenKeyboard() == 0) do
      DisableAllControlActions(0);
      Citizen.Wait(0);
    end
    if (GetOnscreenKeyboardResult()) then
      message =  GetOnscreenKeyboardResult()
    end
  end
  if message ~= nil and message ~= "" then
    TriggerServerEvent('genesis-alert:startCall', number, message, {
      x = coords.x,
      y = coords.y,
      z = coords.z
    })
  end
end)


RegisterNetEvent('genesis-alert:callNumberD')
AddEventHandler('genesis-alert:callNumberD', function(data)
  local playerPed   = GetPlayerPed(-1)
  local coords      = GetEntityCoords(playerPed)
  local message     = data.message
  local number      = data.number
  local playerPed3 = PlayerPedId()
  PedPosition		= GetEntityCoords(playerPed3)
  local PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z }

  if message ~= nil and message ~= "" then
    TriggerServerEvent('genesis-alert:startCall', number, message, {
      x = coords.x,
      y = coords.y,
      z = coords.z
    }, GetPlayerServerId(PlayerId()))

	TriggerServerEvent('esx_addons_gcphone:startCall', number, message, PlayerCoords, {
		PlayerCoords = { x = PedPosition.x, y = PedPosition.y, z = PedPosition.z },
	})
  end
  
  ESX.ShowNotification('Zgłoszenie wysłane.')
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if alert ~= nil then	
			ESX.ShowHelpNotification('Naciśnij ~INPUT_VEH_DUCK~ aby, zaakceptować zgłoszenie lub ~INPUT_INTERACTION_MENU~ aby, odrzucić zgłoszenie.')
			if IsControlJustReleased(2, 120) then
				AcceptAlert(alert, alertOwner)		
				Citizen.Wait(10)
				alert = nil	
				alertOwner = nil
			end
			
			if IsControlJustReleased(2, 244) then
				alert = nil	
			end
		end
	end
end)

function AcceptAlert(data, aO)
	ClearGpsPlayerWaypoint()
	SetNewWaypoint(data.coords.x, data.coords.y)
	TriggerServerEvent('genesis-alert:acceptedAlert', data, aO)
end

RegisterNetEvent('genesis-alert:sendAlert')
AddEventHandler('genesis-alert:sendAlert', function(data, id)
	if data.number == 'police' then
		alert = data
		alertOwner = id
		if not HasStreamedTextureDictLoaded('WEB_LOSSANTOSPOLICEDEPT') then
			RequestStreamedTextureDict('WEB_LOSSANTOSPOLICEDEPT', true)
			while not HasStreamedTextureDictLoaded('WEB_LOSSANTOSPOLICEDEPT') do
				Wait(50)
			end
		end
		Notif(data.message, 'WEB_LOSSANTOSPOLICEDEPT', 'LSPD | Dyspozytornia', 'Alert policyjny', 40)
		Citizen.Wait(100)
		--SetStreamedTextureDictAsNoLongerNeeded(charimg)
	elseif data.number == 'ambulance' then
		alert = data
		alertOwner = id
		Notif(data.message, 'CHAR_CALL911', 'EMS | Dyspozytornia', 'Alert', 90)
	elseif data.number == 'fire' then
		alert = data
		alertOwner = id
		Notif(data.message, 'CHAR_CALL911', 'LSFD | Dyspozytornia', 'Alert straz', 90)
	elseif data.number == 'mecano' then
		alert = data
		alertOwner = id
		Notif(data.message, 'CHAR_LS_CUSTOMS', "Los Santos Customs", 'Zlecenie', 90)
	elseif data.number == 'taxi' then
		alert = data
		alertOwner = id
		Notif(data.message, 'CHAR_TAXI', "Taxify", 'Klient', 120)
	elseif data.number == 'psycholog' then
		alert = data
		alertOwner = id
		if not HasStreamedTextureDictLoaded('WEB_SORRYCOMMODEBAND') then
			RequestStreamedTextureDict('WEB_SORRYCOMMODEBAND', true)
			while not HasStreamedTextureDictLoaded('WEB_SORRYCOMMODEBAND') do
				Wait(50)
			end
		end
		Notif(data.message, 'WEB_SORRYCOMMODEBAND', "Psycholog", 'Klient', 140)
	end
end)

function Notif(text, charimg, text2, text3, bgcol)
	SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
	Citizen.InvokeNative(0x92F0DA1E27DB96DC, bgcol)
	Citizen.InvokeNative(0x1E6611149DB3DB6B, charimg, charimg, true, 7, text2, text3, 2.0)
    DrawNotification_4(true, true)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
    Citizen.Wait(300)
    PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
end
