ESX = nil
local HaveBagOnHead = false
local helmet = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function NajblizszyGracz() --This function send to server closestplayer

local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
local player = GetPlayerPed(-1)

if closestPlayer == -1 or closestDistance > 2.0 then 
    ESX.ShowNotification('~r~Brak graczy w poblizu')
else
  if not HaveBagOnHead then
    TriggerServerEvent('esx_worek:sendclosest', GetPlayerServerId(closestPlayer))
    ESX.ShowNotification('~g~Zalozyles worek na glowe ~w~' .. GetPlayerServerId(closestPlayer))
    TriggerServerEvent('esx_worek:closest')
  else
    ESX.ShowNotification(GetPlayerServerId(closestPlayer) .. '~r~Ma juz worek na glowie')
  end
end

end

RegisterNetEvent('esx_worek:naloz') --This event open menu
AddEventHandler('esx_worek:naloz', function()
    OpenBagMenu()
end)

RegisterNetEvent('chuj:bag')
AddEventHandler('chuj:bag', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
		if helmet then
    
		else 
			local clothesSkin = {
				['mask_1'] = 49, ['mask_2'] = 18
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			
			helmet = true
			SetNuiFocus(false,false)
			SendNUIMessage({type = 'openGeneral'})
			HaveBagOnHead = true
		end
	end)
end)

RegisterNetEvent('chuj:bagoff')
AddEventHandler('chuj:bagoff', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
		if helmet then
			local clothesSkin = {
				['mask_1'] = 0, ['mask_2'] = 0
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
			helmet = false
			SendNUIMessage({type = 'closeAll'})
			HaveBagOnHead = false
		else
		
		end
	end)
end)

function OpenBagMenu() --This function is menu function

    local elements = {
          {label = 'Zaloz na glowe', value = 'puton'},
          {label = 'Zdejmij z glowy', value = 'putoff'}
          
        }
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'headbagging',
      {
        title    = 'MENU',
        align    = 'center',
        elements = elements
        },
  
            function(data2, menu2)
  
  
              local player, distance = ESX.Game.GetClosestPlayer()
  
              if distance ~= -1 and distance <= 2.0 then
  
                if data2.current.value == 'puton' then
                    NajblizszyGracz()
					menu2.close()
                end
  
                if data2.current.value == 'putoff' then
                  TriggerServerEvent('esx_worek:zdejmij')
				  menu2.close()
                end
              else
                ESX.ShowNotification('~r~Brak graczy w poblizu.')
              end
            end,
      function(data2, menu2)
        menu2.close()
      end
    )
  
  end

