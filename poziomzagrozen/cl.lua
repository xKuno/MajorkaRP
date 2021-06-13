ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
  while true do
  Citizen.Wait(5)
      if PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'boss' then
          local player = GetPlayerPed(-1)
          if GetDistanceBetweenCoords(GetEntityCoords(player, true), 365.54, -1590.37, 29.29-0.90, true) < 10 then
              DrawMarker(1, 365.54, -1590.37, 29.29-0.90, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 216, 12, 239, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(player, true), 365.54, -1590.37, 29.29-0.90, true) < 1.5 then
              wolfi_pomoc("Naciśnij ~INPUT_CONTEXT~, aby zarządzać statusem zagrożenia.")
          
                 if IsControlJustReleased(1, 51) then
                    MenuKod()
              end
          end
      end
    end
end
end)


Citizen.CreateThread(function()
  while true do
  Citizen.Wait(5)
      if PlayerData.job ~= nil and PlayerData.job.name == 'police' and PlayerData.job.grade_name == 'zastepca' then
          local player = GetPlayerPed(-1)
          if GetDistanceBetweenCoords(GetEntityCoords(player, true), 1852.09, 3687.85, 34.27, true) < 10 then
              DrawMarker(1, 1852.09, 3687.85, 33.27, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.0, 216, 12, 239, 155, 0, 0, 2, 0, 0, 0, 0)
            if GetDistanceBetweenCoords(GetEntityCoords(player, true), 1852.09, 3687.85, 34.27, true) < 1.5 then
              wolfi_pomoc("Naciśnij ~INPUT_CONTEXT~, aby zarządzać statusem zagrożenia.")
          
                 if IsControlJustReleased(1, 51) then
                    MenuKod()
              end
          end
      end
    end
end
end)

function wolfi_pomoc(mesydz)
  SetTextComponentFormat("STRING")
  AddTextComponentString(mesydz)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

function MenuKod()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'kod',
    {
      title    = 'Poziom Zagrożenia',
      align    = 'right',
      elements = {
        {label = '🟢', value = '0'},
        {label = '🟠', value = '1'},
        {label = '🔴', value = '2'},
        {label = '⚫', value = '3'}
      }
    },
    function(data, menu)
      local ped = PlayerPedId()
      if data.current.value == '0' then
        TriggerServerEvent('wolfi_log', "Aktualny poziom zagrożenia 🟢.", "1821722")
        ExecuteCommand("lspd Aktualnie na miasto wprowadzony został kod 🟢")
      end
      if data.current.value == '1' then
        TriggerServerEvent('wolfi_log', "Aktualny poziom zagrożenia 🟠.", "15105570")
        ExecuteCommand("lspd Aktualnie na miasto wprowadzony został kod 🟠")
      end
      if data.current.value == '2' then
        TriggerServerEvent('wolfi_log', "Aktualny poziom zagrożenia 🔴.", "15158332")
        ExecuteCommand("lspd Aktualnie na miasto wprowadzony został kod 🔴")
      end
      if data.current.value == '3' then
        TriggerServerEvent('wolfi_log', "Aktualny poziom zagrożenia ⚫.", "1")
        ExecuteCommand("lspd Aktualnie na miasto wprowadzony został kod ⚫")
      end
      menu.close()
    end,
    function(data, menu)
      menu.close()
    end
  )
end
