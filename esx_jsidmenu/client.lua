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

ESX             				 = nil

local cardOpen 					= false
local playerData 				= {}
local windowavg					= false
local windowavd					= false
local windowarg					= false
local windoward					= false
local window 					= false
local engineOn 					= true
local Vehicle 					= GetVehiclePedIsIn(ped, false)
local inVehicle 				= IsPedSittingInAnyVehicle(ped)
local speedkm 					= 0
local forceon 					= false


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

function OpenTrashCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      end)
    end)
end

function OpenAttansCan()
  local pP = GetPlayerPed(-1)

  Citizen.CreateThread(function()

    local pP = GetPlayerPed(-1)
    FreezeEntityPosition(playerPed, true)
    Citizen.CreateThread(function()
      Citizen.Wait(2000)
      FreezeEntityPosition(playerPed, false)
      end)
    end)
end

function OpenShowGiveID()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = ('Menu Dowodu'),
        align    = 'bottom-right',
		elements = {
			{label = _U('show_id'), value = 'show'},
			{label = 'Pokaż Wizytówkę', value = 'show1'},
		}
	},
	function(data2, menu2)
		if data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			--if distance ~= -1 and distance <= 3.0 then
				--TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				TriggerServerEvent('esx_dowod:pokazdowod', GetPlayerServerId(PlayerId()))
			--	TriggerEvent('esx_dowod:pokazdowod', GetPlayerServerId(PlayerId()))
				OpenTrashCan()
			--	OpenTrashCan()
			--else
			--	OpenAttansCan()
			--	ESX.ShowNotification(_U('nobody_near'))
			--end
		elseif data2.current.value == 'show1' then
			TriggerServerEvent('esx_dowod:pokazdowod1', GetPlayerServerId(PlayerId()))
			OpenTrashCan()
		end
	end,
	function(data2, menu2)
		menu2.close()
	end
)

end
----------------------------------------------
function OpenShowGiveDL()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('dl_menu'),
        align    = 'bottom-right',
		elements = {
			{label = _U('show_id2'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			--if distance ~= -1 and distance <= 3.0 then
				--TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				OpenTrashCan()
			--else
			--	OpenAttansCan()
			--	ESX.ShowNotification(_U('nobody_near'))
			--end
		end
	end,
	function(data2, menu2)
		menu2.close()
	end
)

end
----------------------------------------------
function OpenShowGiveGL()

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'id_card_menu',
	{
		title    = _U('gl_menu'),
        align    = 'bottom-right',
		elements = {
			{label = _U('check_id3'), value = 'check'},
			{label = _U('show_id3'), value = 'show'}
		}
	},
	function(data2, menu2)
		if data2.current.value == 'check' then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		elseif data2.current.value == 'show' then
			local player, distance = ESX.Game.GetClosestPlayer()

			if distance ~= -1 and distance <= 3.0 then
				TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				OpenTrashCan()
			else
				OpenAttansCan()
				ESX.ShowNotification(_U('nobody_near'))
			end
		end
	end,
	function(data2, menu2)
		menu2.close()
	end
)

end
----------------------------------------------

function ResetHUD()
		TriggerEvent('esx_status:setDisplay', 1.0)
		TriggerEvent('ui:toggle', 1.0)
		forceon = true
end

function WylaczHUD()
	TriggerEvent('esx_status:setDisplay', 0.0)
		TriggerEvent('ui:toggle', 0.0)
	forcenon = false
end



function OpenHudActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions',
	{
		title    = 'Interakcje z HUDEM',
		align    = 'bottom-right',
		elements = {
			{label = ('Menu HUDU'),	value = 'citizen_interaction'}
		}
	}, function(data, menu)

		if data.current.value == 'citizen_interaction' then
			local elements = {
				{ label = ('Wlacz HUD'),  value = 'wlacz' },
				{ label = ('Wylacz HUD'),  value = 'wylacz' }
			}
		
		
			ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'citizen_interaction',
			{
				title    = _U('citizen_interaction'),
				align    = 'bottom-right',
				elements = elements
			}, function(data2, menu2)
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					local action = data2.current.value
					
					if action == 'wlacz' then
						ResetHUD()
					elseif action == 'wylacz' then
						WylaczHUD()	
					end

			end, function(data2, menu2)
				menu2.close()
			end)
		end

	end, function(data, menu)
		menu.close()
	end)
end


function OpenMenuDowodu(player)
		ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'civilian_actions',
	{
    title    = _U('citizen_interactions'),
    align    = 'bottom-right',
    elements = {
			{label = _U('id_card'), value = 'id_kort'},
			{label = ('Menu Pojazdów'), value = 'vehiclemenu'},
		}
	},
    
    function(data, menu)

      if data.current.value == 'id_kort' then
      	OpenShowGiveID()
      end

      if data.current.value == 'vehiclemenu' then
        local playerPed = GetPlayerPed(-1)
        if IsPedSittingInAnyVehicle(playerPed) then
            local playerVeh = GetVehiclePedIsIn(playerPed, false)
            local drivingPed = GetPedInVehicleSeat(playerVeh, -1)
            if drivingPed == playerPed then
                OpenVehicleMenu()
            end
        end
      end

    end,
    function(data, menu)
      menu.close()
    end
  )
end

function OpenVehicleMenu()

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'vehicle_actions',
    {
      title    = ('Menu Pojazdów'),
      align    = 'bottom-right',
      elements = {
        {label = ('Drzwi'),        value = 'door'},
        {label = ('Okna'),         value = 'window'},
      }
    },
    function(data, menu)
      if data.current.value == 'engine' then
        local playerPed = GetPlayerPed(-1)
          local playerVeh = GetVehiclePedIsIn(playerPed, false)
        if engineOn == true then
                SetVehicleUndriveable(playerVeh, true)
            SetVehicleEngineOn(playerVeh, false, false, false)
            engineOn = false
            TriggerEvent("pNotify:SendNotification", {text = _U('turned_off_engine'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
        else
          SetVehicleUndriveable(playerVeh, false)
            SetVehicleEngineOn(playerVeh, true, false, false)       
                engineOn = true
            TriggerEvent("pNotify:SendNotification", {text = _U('turned_on_engine'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
        end
      end

      if data.current.value == 'door' then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'door_actions',
          {
            title    = ('Menu Drzwi'),
            align    = 'bottom-right',
            elements = {
              {label = ('Maska'),        value = 'hood'},
              {label = ('Bagaznik'),           value = 'trunk'},
              {label = ('Lewe Przednie Drzwi'),   value = 'dooravg'},
              {label = ('Prawe Przednie Drzwi'),     value = 'dooravd'},
              {label = ('Lewe Tylnie Drzwi'),      value = 'doorarg'},
              {label = ('Prawe Tylnie Drzwi'),      value = 'doorard'}
            }
          },
          function(data, menu)
            if data.current.value == 'hood' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if (IsPedSittingInAnyVehicle(playerPed)) then
                  if GetVehicleDoorAngleRatio(playerVeh, 4) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 4, false)
                      TriggerEvent("pNotify:SendNotification", {text = "Otworzyles maske!", type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                   else
                      SetVehicleDoorOpen(playerVeh, 4, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = "Zamknales maske!", type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    end
                end
            end
            if data.current.value == 'trunk' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 5) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 5, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_hood'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    else
                      SetVehicleDoorOpen(playerVeh, 5, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_hood'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})    
                   end
                end
            end
            if data.current.value == 'dooravg' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 0) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 0, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    else
                      SetVehicleDoorOpen(playerVeh, 0, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                   end
                end
            end
            if data.current.value == 'dooravd' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 1) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 1, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    else
                      SetVehicleDoorOpen(playerVeh, 1, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})  
                   end
                end
            end
            if data.current.value == 'doorarg' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 2) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 2, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    else
                      SetVehicleDoorOpen(playerVeh, 2, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})     
                   end
                end
            end
            if data.current.value == 'doorard' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if ( IsPedSittingInAnyVehicle( playerPed ) ) then
                   if GetVehicleDoorAngleRatio(playerVeh, 3) > 0.0 then 
                      SetVehicleDoorShut(playerVeh, 3, false)
                      TriggerEvent("pNotify:SendNotification", {text = _U('closed_door'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                    else
                      SetVehicleDoorOpen(playerVeh, 3, false)
                      frontleft = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_door'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                   end
                end
            end
          end,
        function(data, menu)
          menu.close()
          OpenVehicleMenu()
        end
        )
      end
      if data.current.value == 'window' then
        ESX.UI.Menu.CloseAll()

        ESX.UI.Menu.Open(
          'default', GetCurrentResourceName(), 'window_actions',
          {
            title    = ('Menu Okien'),
            align    = 'bottom-right',
            elements = {
              {label = ('Przednie Lewe Okno'),   value = 'windowavga'},
              {label = ('Przednie Prawe Okno'),   value = 'windowavdr'},
              {label = ('Tylne Lewe Okno'),   value = 'windowarga'},
              {label = ('Tylne Prawe Okno'),   value = 'windowardr'}
            }
          },
          function(data, menu)
            if data.current.value == 'windowavga' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowavg == false then
                      RollDownWindow(playerVeh, 0)
                      windowavg = true
                      TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                else
                  RollUpWindow(playerVeh, 0)
                      windowavg = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                end
            end
            if data.current.value == 'windowavdr' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowavd == false then
                      RollDownWindow(playerVeh, 1)
                      windowavd = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                else
                  RollUpWindow(playerVeh, 1)
                      windowavd = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                end
            end
            if data.current.value == 'windowarga' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windowarg == false then
                      RollDownWindow(playerVeh, 2)
                      windowarg = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                else
                  RollUpWindow(playerVeh, 2)
                      windowarg = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                end
            end
            if data.current.value == 'windowardr' then
              local playerPed = GetPlayerPed(-1)
                local playerVeh = GetVehiclePedIsIn(playerPed, false)
                if windoward == false then
                      RollDownWindow(playerVeh, 3)
                      windoward = true
                  TriggerEvent("pNotify:SendNotification", {text = _U('opened_window'), type = "error", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                else
                  RollUpWindow(playerVeh, 3)
                      windoward = false
                  TriggerEvent("pNotify:SendNotification", {text = _U('closed_wondow'), type = "success", queue = "vehiclemenu", timeout = 1000, layout = "bottomLeft"})
                end
            end
          end,
        function(data, menu)
          menu.close()
          OpenVehicleMenu()
        end
        )
      end
    end,
  function(data, menu)
    menu.close()
  end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

    	if IsControlJustReleased(0, Keys["F7"]) then
      		OpenMenuDowodu()
    	end
	end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local drivingPed = GetPedInVehicleSeat(playerVeh, -1)

    if IsControlJustReleased(0, 207) then
	if drivingPed == playerPed then
	
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
	if drivingPed == playerPed then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
					if windowarg == false and windowavg== false and windoward == false and windowavd== false then
				if drivingPed == playerPed then
			RollDownWindow(vehicle, 0)
			RollDownWindow(vehicle, 1)
			RollDownWindow(vehicle, 2)
			RollDownWindow(vehicle, 3)
			RollDownWindow(vehicle, 4)
			RollDownWindow(vehicle, 5)
windowavg					= true
windowavd					= true
 windowarg					= true
 windoward					= true
								end
							end
						end
					end
				end
			end
		end
	end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
	local playerPed = GetPlayerPed(-1)
	local playerVeh = GetVehiclePedIsIn(playerPed, false)
    local drivingPed = GetPedInVehicleSeat(playerVeh, -1)
    if IsControlJustReleased(0, 208) then
	if drivingPed == playerPed then
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
	
    if vehicle ~= nil and vehicle ~= 0 and GetPedInVehicleSeat(vehicle, 0) then
	if drivingPed == playerPed then
		local frontLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lf')
		local frontRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rf')
		local rearLeftWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lr')
		local rearRightWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rr')
		local frontMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_lm')
		local rearMiddleWindow = GetEntityBoneIndexByName(GetVehiclePedIsIn(GetPlayerPed(-1), false), 'window_rm')
		if frontLeftWindow ~= -1 or frontRightWindow ~= -1 or rearLeftWindow ~= -1 or rearRightWindow ~= -1 or frontMiddleWindow ~= -1 or rearMiddleWindow ~= -1 then
		if windowarg == true and windowavg== true and windoward == true and windowavd== true then
            if drivingPed == playerPed then
			RollUpWindow(vehicle, 0)
			RollUpWindow(vehicle, 1)
			RollUpWindow(vehicle, 2)
			RollUpWindow(vehicle, 3)
			RollUpWindow(vehicle, 4)
			RollUpWindow(vehicle, 5)
windowavg					= false
windowavd					= false
 windowarg					= false
 windoward					= false
								end
							end
						end
					end
				end
			end
		end
	end
end)