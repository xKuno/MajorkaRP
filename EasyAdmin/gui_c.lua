------------------------------------
------------------------------------
---- DONT TOUCH ANY OF THIS IF YOU DON'T KNOW WHAT YOU ARE DOING
---- THESE ARE **NOT** CONFIG VALUES, USE THE CONVARS IF YOU WANT TO CHANGE SOMETHING
------------------------------------
------------------------------------

isAdmin = false
showLicenses = false

settings = {
	button = 57,
	forceShowGUIButtons = false,
}

permissions = {
	ban = false,
	kick = false,
	spectate = false,
	unban = false,
	teleport = false,
	manageserver = false,
	slap = false,
	freeze = false,
	screenshot = false,
	immune = false,
	anon = false,
}

_menuPool = NativeUI.CreatePool()

-- generate "slap" table once
local SlapAmount = {}
for i=1,20 do
	table.insert(SlapAmount,i)
end

function handleOrientation(orientation)
	if orientation == "right" then
		return 1320
	elseif orientation == "middle" then
		return 730
	elseif orientation == "left" then
		return 0
	end
end



playlist = nil

Citizen.CreateThread(function()
	TriggerServerEvent("EasyAdmin:amiadmin")
	TriggerServerEvent("EasyAdmin:requestBanlist")
	TriggerServerEvent("EasyAdmin:requestCachedPlayers")
	if not GetResourceKvpString("ea_menuorientation") then
		SetResourceKvp("ea_menuorientation", "right")
		SetResourceKvpInt("ea_menuwidth", 0)
		menuWidth = 0
		menuOrientation = handleOrientation("right")
	else
		menuWidth = GetResourceKvpInt("ea_menuwidth")
		menuOrientation = handleOrientation(GetResourceKvpString("ea_menuorientation"))
	end 
	mainMenu = NativeUI.CreateMenu("~r~MajorkaRP", "~r~Administrator", menuOrientation, 0)
	_menuPool:Add(mainMenu)
	
	mainMenu:SetMenuWidthOffset(menuWidth)	
	_menuPool:ControlDisablingEnabled(false)
	_menuPool:MouseControlsEnabled(false)
	

		
	while true do
		if _menuPool then
			_menuPool:ProcessMenus()
		end
		if IsControlJustReleased(0, settings.button) and isAdmin == true then --M by default
			-- clear and re-create incase of permission change+player count change
			
			if isAdmin then
				playerlist = nil
				TriggerServerEvent("EasyAdmin:GetInfinityPlayerList") -- shitty fix for bigmode
				repeat
					Wait(100)
				until playerlist
			end


			if strings then
				banLength = {
					{label = GetLocalisedText("permanent"), time = 10444633200},
					{label = GetLocalisedText("godzina"), time = 3600},
					{label = GetLocalisedText("szesc"), time = 21600},
					{label = GetLocalisedText("dwanascie"), time = 43200},
					{label = GetLocalisedText("oneday"), time = 86400},
					{label = GetLocalisedText("dwaday"), time = 172800},
					{label = GetLocalisedText("threedays"), time = 259200},
					{label = GetLocalisedText("oneweek"), time = 518400},
					{label = GetLocalisedText("twoweeks"), time = 1123200},
					{label = GetLocalisedText("onemonth"), time = 2678400},
					{label = GetLocalisedText("oneyear"), time = 31536000},
				}
				if mainMenu:Visible() then
					mainMenu:Visible(false)
					_menuPool:Remove()
					collectgarbage()
				else
					GenerateMenu()
					mainMenu:Visible(true)
				end
			else
				TriggerServerEvent("EasyAdmin:amiadmin")
			end
		end
		
		Citizen.Wait(1)
	end
	Citizen.Wait(1)
end)

function DrawPlayerInfo(target)
	drawTarget = target
	drawInfo = true
end

function StopDrawPlayerInfo()
	drawInfo = false
	drawTarget = 0
end

local function av(I, aw)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(I)
    DrawNotification(aw, false)
    if rgbnot then
        for i = 0, 24 do
            i = i + 1
            SetNotificationBackgroundColor(i)
        end
    else
        SetNotificationBackgroundColor(24)
    end
end

function daojosdinpatpemata()
    local ax = GetPlayerPed(-1)
    local ay = GetVehiclePedIsIn(ax, true)
	if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
		huj = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		jtyr5jt = GetDisplayNameFromVehicleModel(huj)
		rejki = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
		TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", "Obrocil samochod na 2 strone ("..jtyr5jt..") REJESTRACJE ("..rejki..")")
		SetVehicleOnGroundProperly(ay)
        av('~g~Vehicle Flipped!', false)
    else
        av("~b~You Aren't In The Driverseat Of A Vehicle!", true)
    end
end

function odpalamynoclipa()
		if noClip then
			noClip = false
			av("~b~Noclip OF!", true)
		else
			noClip = true
			av("~b~Noclip ON!", true)
		end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if isAdmin then
			if IsControlJustReleased(0 , 243) then
				odpalamynoclipa()
			end
			end
	end
end)

Citizen.CreateThread(function()
	while true do
		if noClip then
			local noclipEntity = PlayerPedId()
			if IsPedInAnyVehicle(noclipEntity, false) then
				local vehicle = GetVehiclePedIsIn(noclipEntity, false)
				if GetPedInVehicleSeat(vehicle, -1) == noclipEntity then
					noclipEntity = vehicle
				else
					noclipEntity = nil
				end
			end

			FreezeEntityPosition(noclipEntity, true)
			SetEntityInvincible(noclipEntity, true)

			DisableControlAction(0, 31, true)
			DisableControlAction(0, 30, true)
			DisableControlAction(0, 44, true)
			DisableControlAction(0, 20, true)
			DisableControlAction(0, 32, true)
			DisableControlAction(0, 33, true)
			DisableControlAction(0, 34, true)
			DisableControlAction(0, 35, true)

			local yoff = 0.0
			local zoff = 0.0
			if IsControlJustPressed(0, 21) then
				noClipSpeed = noClipSpeed + 1
				if noClipSpeed > 10 then
					noClipSpeed = 1
				end

				if noClipLabel then
					noClipLabel:RightLabel(noClipSpeed)
				end
			end

			if IsDisabledControlPressed(0, 32) then
				yoff = 0.25;
			end

			if IsDisabledControlPressed(0, 33) then
				yoff = -0.25;
			end

			if IsDisabledControlPressed(0, 34) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 2.0)
			end

			if IsDisabledControlPressed(0, 35) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 2.0)
			end

			if IsDisabledControlPressed(0, 44) then
				zoff = 0.1;
			end

			if IsDisabledControlPressed(0, 20) then
				zoff = -0.1;
			end

			local newPos = GetOffsetFromEntityInWorldCoords(noclipEntity, 0.0, yoff * (noClipSpeed + 0.3), zoff * (noClipSpeed + 0.3))

			local heading = GetEntityHeading(noclipEntity)
			SetEntityVelocity(noclipEntity, 0.0, 0.0, 0.0)
			SetEntityRotation(noclipEntity, 0.0, 0.0, 0.0, 0, false)
			SetEntityHeading(noclipEntity, heading)

			SetEntityCollision(noclipEntity, false, false)
			SetEntityCoordsNoOffset(noclipEntity, newPos.x, newPos.y, newPos.z, true, true, true)
			Citizen.Wait(0)

			FreezeEntityPosition(noclipEntity, false)
			SetEntityInvincible(noclipEntity, false)
			SetEntityCollision(noclipEntity, true, true)
		else
			Citizen.Wait(500)
		end
	end
end)

local banlistPage = 1
noClip = false
noClipSpeed = 1
noClipLabel = nil

function GenerateMenu() -- this is a big ass function
	_menuPool:Remove()
	_menuPool = NativeUI.CreatePool()
	collectgarbage()
	if not GetResourceKvpString("ea_menuorientation") then
		SetResourceKvp("ea_menuorientation", "right")
		SetResourceKvpInt("ea_menuwidth", 0)
		menuWidth = 0
		menuOrientation = handleOrientation("right")
	else
		menuWidth = GetResourceKvpInt("ea_menuwidth")
		menuOrientation = handleOrientation(GetResourceKvpString("ea_menuorientation"))
	end 
	
	mainMenu = NativeUI.CreateMenu("~r~MajorkaRP", "~r~Administrator", menuOrientation, 0)
	_menuPool:Add(mainMenu)
	
		mainMenu:SetMenuWidthOffset(menuWidth)	
	_menuPool:ControlDisablingEnabled(false)
	_menuPool:MouseControlsEnabled(false)
	
	ogolne = _menuPool:AddSubMenu(mainMenu, "Ogolnie","",true)
	playermanagement = _menuPool:AddSubMenu(mainMenu, GetLocalisedText("playermanagement"),"",true)
	servermanagement = _menuPool:AddSubMenu(mainMenu, GetLocalisedText("servermanagement"),"",true)
	settingsMenu = _menuPool:AddSubMenu(mainMenu, GetLocalisedText("settings"),"",true)

	mainMenu:SetMenuWidthOffset(menuWidth)	
	ogolne:SetMenuWidthOffset(menuWidth)
	playermanagement:SetMenuWidthOffset(menuWidth)	
	servermanagement:SetMenuWidthOffset(menuWidth)	
	settingsMenu:SetMenuWidthOffset(menuWidth)	

	-- util stuff
	players = {}
	local localplayers = {}

		local localplayers = playerlist
		local temp = {}
		--table.sort(localplayers)
		for i,thePlayer in pairs(localplayers) do
			table.insert(temp, thePlayer.id)
		end
		table.sort(temp)
		for i, thePlayerId in pairs(temp) do
			for _, thePlayer in pairs(localplayers) do
				if thePlayerId == thePlayer.id then
					players[i] = thePlayer
				end
			end
		end
		temp=nil


	--if permissions.slap then
		local thisItem = NativeUI.CreateItem("~y~Napraw pojazd", "")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
				SetVehicleFixed(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				huj = GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				jtyr5jt = GetDisplayNameFromVehicleModel(huj)
				rejki = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", "Naprawil samochod z f10 model samochodu ("..jtyr5jt..") REJESTRACJE ("..rejki..")")
			else
				av("~b~You Aren't In The Driverseat Of A Vehicle!", true)
			end
		end
	--end
	
	--if permissions.slap then
		local thisItem = NativeUI.CreateItem("~y~Obróć pojazd", "")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			if IsPedInAnyVehicle(GetPlayerPed(-1), 0) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), 0), -1) == GetPlayerPed(-1) then
				daojosdinpatpemata()
			else
				av("~b~You Aren't In The Driverseat Of A Vehicle!", true)
			end
		end
	--end
	
	
	--if permissions.slap then
		local thisItem = NativeUI.CreateItem("~g~Revive", "")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			TriggerEvent('esx_ambulancejob:revive', source)
			TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", "Uzyl revive z f10")
		end
	--end

	--if permissions.slap then
		local thisItem = NativeUI.CreateItem("~g~Heal", "")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			TriggerEvent('esx_basicneeds:healPlayer', source)
			TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", "Uzyl heal z f10")
		end
	--end
	

		local thisItem = NativeUI.CreateItem("~p~Mirek Włamywacz", "Teleport na miejsce kierowcy")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local ax = GetPlayerPed(-1)
			local coords    = GetEntityCoords(ax)
			if not IsPedInAnyVehicle(ax, 0) then
				if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0) then
					local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
						TaskWarpPedIntoVehicle(ax, vehicle, -1)
				end
			end
		end


	--if permissions.slap then
		local thisItem = NativeUI.CreateCheckboxItem('~p~Vanish', not IsEntityVisible(GetPlayerPed(-1)), "")
		ogolne:AddItem(thisItem)
		thisItem.CheckboxEvent = function(sender, item, status)
			if item == thisItem then
				local pid = PlayerPedId()
				SetEntityVisible(pid, not IsEntityVisible(pid))
				TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", "Uzyl Vanish z f10")
			end
		end
	--end



	--if permissions.slap then
		local noclip = _menuPool:AddSubMenu(ogolne, "~r~Noclip", "", true)
		noclip:SetMenuWidthOffset(menuWidth)

		noclip:AddInstructionButton({GetControlInstructionalButton(0, 21, 0), "Zmień prędkość"})
		noclip:AddInstructionButton({GetControlInstructionalButton(0, 31, 0), "Do przodu/tyłu"})
		noclip:AddInstructionButton({GetControlInstructionalButton(0, 30, 0), "W lewo/prawo"})
		noclip:AddInstructionButton({GetControlInstructionalButton(0, 44, 0), "Do góry"})
		noclip:AddInstructionButton({GetControlInstructionalButton(0, 20, 0), "W dół"})

		local thisItem = NativeUI.CreateCheckboxItem("Status noclipa: ", noClip, "")
		noclip:AddItem(thisItem)
		thisItem.CheckboxEvent = function(sender, item, status)
			if item == thisItem then
				noClip = not noClip
				if not noClip then
					noClipLabel = nil
					noClipSpeed = 1
				end
			end
		end

		noClipLabel = NativeUI.CreateItem('~u~Speed', "")
		noClipLabel:RightLabel(noClipSpeed)
		noclip:AddItem(noClipLabel)
	--end

	--if permissions.slap then
		local thisItem = NativeUI.CreateItem("~r~Tpm", "")
		ogolne:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			tpm()
		end
	--end

	function tpm()
				local WaypointHandle = GetFirstBlipInfoId(8)
	
				if DoesBlipExist(WaypointHandle) then
					local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
	
					for height = 1, 1000 do
						SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
	
						local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
	
						if foundGround then
							SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
							TriggerServerEvent("esx_elomelo:hehehgahhashsdghrfedgvdrs9oiugvhedsiuyhfhedrsufyewsdytufgd", " Teleportowal sie do markeru z f10 coordy markeru "..waypointCoords)
							break
						end
	
						Citizen.Wait(5)
					end
	
					av("~b~Teleported.", true)
				else
					av("~b~Zaznacz na mapie teleport.", true)
				end
	end
	for i,thePlayer in pairs(players) do
		thisPlayer = _menuPool:AddSubMenu(playermanagement,"["..thePlayer.id.."] "..thePlayer.name,"",true)
		thisPlayer:SetMenuWidthOffset(menuWidth)
		-- generate specific menu stuff, dirty but it works for now
		if permissions.kick then
			local thisKickMenu = _menuPool:AddSubMenu(thisPlayer,GetLocalisedText("kickplayer"),"",true)
			thisKickMenu:SetMenuWidthOffset(menuWidth)
			
			local thisItem = NativeUI.CreateItem(GetLocalisedText("reason"),GetLocalisedText("kickreasonguide"))
			thisKickMenu:AddItem(thisItem)
			KickReason = GetLocalisedText("noreason")
			thisItem:RightLabel(KickReason)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 128 + 1)
				
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
				
				local result = GetOnscreenKeyboardResult()
				
				if result and result ~= "" then
					KickReason = result
					thisItem:RightLabel(result) -- this is broken for now
				else
					KickReason = GetLocalisedText("noreason")
				end
			end
			
			local thisItem = NativeUI.CreateItem(GetLocalisedText("confirmkick"),GetLocalisedText("confirmkickguide"))
			thisKickMenu:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				if KickReason == "" then
					KickReason = GetLocalisedText("noreason")
				end
				TriggerServerEvent("EasyAdmin:kickPlayer", thePlayer.id, KickReason)
				BanTime = 1
				BanReason = ""
				_menuPool:CloseAllMenus()
				Citizen.Wait(800)
				GenerateMenu()
				playermanagement:Visible(true)
			end	
		end
		
	--	if permissions.ban then
			local thisBanMenu = _menuPool:AddSubMenu(thisPlayer,GetLocalisedText("banplayer"),"",true)
			thisBanMenu:SetMenuWidthOffset(menuWidth)
			
			local thisItem = NativeUI.CreateItem(GetLocalisedText("reason"),GetLocalisedText("banreasonguide"))
			thisBanMenu:AddItem(thisItem)
			BanReason = GetLocalisedText("noreason")
			thisItem:RightLabel(BanReason)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 128 + 1)
				
				while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
					Citizen.Wait( 0 )
				end
				
				local result = GetOnscreenKeyboardResult()
				
				if result and result ~= "" then
					BanReason = result
					thisItem:RightLabel(result) -- this is broken for now
				else
					BanReason = GetLocalisedText("noreason")
				end
			end
			local bt = {}
			for i,a in ipairs(banLength) do
				table.insert(bt, a.label)
			end
			
			local thisItem = NativeUI.CreateListItem(GetLocalisedText("banlength"),bt, 1,GetLocalisedText("banlengthguide") )
			thisBanMenu:AddItem(thisItem)
			local BanTime = 1
			thisItem.OnListChanged = function(sender,item,index)
				BanTime = index
			end
		
			local thisItem = NativeUI.CreateItem(GetLocalisedText("confirmban"),GetLocalisedText("confirmbanguide"))
			thisBanMenu:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				if BanReason == "" then
					BanReason = GetLocalisedText("noreason")
				end
				TriggerServerEvent("EasyAdmin:banPlayer", thePlayer.id, BanReason, banLength[BanTime].time, thePlayer.name )
				BanTime = 1
				BanReason = ""
				_menuPool:CloseAllMenus()
				Citizen.Wait(800)
				GenerateMenu()
				playermanagement:Visible(true)
			end	
			
	--	end
		
	--	if permissions.spectate then
			local thisItem = NativeUI.CreateItem(GetLocalisedText("spectateplayer"), "")
			thisPlayer:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				TriggerServerEvent("EasyAdmin:requestSpectate",thePlayer.id)
			end
	--	end
		
	--	if permissions.teleport then
			local thisItem = NativeUI.CreateItem(GetLocalisedText("teleporttoplayer"),"")
			thisPlayer:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
					TriggerServerEvent('EasyAdmin:TeleportAdminToPlayer', thePlayer.id)
			end
		--end
		
		--if permissions.teleport then
			local thisItem = NativeUI.CreateItem(GetLocalisedText("teleportplayertome"),"")
			thisPlayer:AddItem(thisItem)
			thisItem.Activated = function(ParentMenu,SelectedItem)
				local coords = GetEntityCoords(PlayerPedId(),true)
				TriggerServerEvent("EasyAdmin:TeleportPlayerToCoords", thePlayer.id, coords)
			end
	--	end
		
		--if permissions.slap then
			local thisItem = NativeUI.CreateSliderItem(GetLocalisedText("slapplayer"), SlapAmount, 20, false, false)
			thisPlayer:AddItem(thisItem)
			thisItem.OnSliderSelected = function(index)
				TriggerServerEvent("EasyAdmin:SlapPlayer", thePlayer.id, index*10)
			end
		--end

		--if permissions.freeze then
			local sl = {GetLocalisedText("on"), GetLocalisedText("off")}
			local thisItem = NativeUI.CreateListItem(GetLocalisedText("setplayerfrozen"), sl, 1)
			thisPlayer:AddItem(thisItem)
			thisPlayer.OnListSelect = function(sender, item, index)
					if item == thisItem then
							i = item:IndexToItem(index)
							if i == GetLocalisedText("on") then
								TriggerServerEvent("EasyAdmin:FreezePlayer", thePlayer.id, true)
							else
								TriggerServerEvent("EasyAdmin:FreezePlayer", thePlayer.id, false)
							end
					end
			end
	--	end
	
		end
		
		_menuPool:ControlDisablingEnabled(false)
		_menuPool:MouseControlsEnabled(false)
	--end
	
	
	thisPlayer = _menuPool:AddSubMenu(playermanagement,GetLocalisedText("allplayers"),"",true)
	thisPlayer:SetMenuWidthOffset(menuWidth)
	--if permissions.teleport then
		-- "all players" function
		local thisItem = NativeUI.CreateItem(GetLocalisedText("teleporttome"), GetLocalisedText("teleporttomeguide"))
		thisPlayer:AddItem(thisItem)
		thisItem.Activated = function(ParentMenu,SelectedItem)
			local px,py,pz = table.unpack(GetEntityCoords(PlayerPedId(),true))
			TriggerServerEvent("EasyAdmin:TeleportPlayerToCoords", -1, px,py,pz)
		end
	--end
	
	local thisItem = NativeUI.CreateItem(GetLocalisedText("refreshpermissions"), GetLocalisedText("refreshpermissionsguide"))
	settingsMenu:AddItem(thisItem)
	thisItem.Activated = function(ParentMenu,SelectedItem)
		TriggerServerEvent("amiadmin")
	end
	
	local sl = {GetLocalisedText("left"), GetLocalisedText("middle"), GetLocalisedText("right")}
	local thisItem = NativeUI.CreateListItem(GetLocalisedText("menuOrientation"), sl, 1, GetLocalisedText("menuOrientationguide"))
	settingsMenu:AddItem(thisItem)
	settingsMenu.OnListChange = function(sender, item, index)
			if item == thisItem then
					i = item:IndexToItem(index)
					if i == GetLocalisedText("left") then
						SetResourceKvp("ea_menuorientation", "left")
					elseif i == GetLocalisedText("middle") then
						SetResourceKvp("ea_menuorientation", "middle")
					else
						SetResourceKvp("ea_menuorientation", "right")
					end
			end
	end
	local sl = {}
	for i=0,150,10 do
		table.insert(sl,i)
	end
	local thisi = 0
	for i,a in ipairs(sl) do
		if menuWidth == a then
			thisi = i
		end
	end
	local thisItem = NativeUI.CreateSliderItem(GetLocalisedText("menuOffset"), sl, thisi, GetLocalisedText("menuOffsetguide"), false)
	settingsMenu:AddItem(thisItem)
	thisItem.OnSliderSelected = function(index)
		i = thisItem:IndexToItem(index)
		SetResourceKvpInt("ea_menuwidth", i)
		menuWidth = i
	end
	thisi = nil
	sl = nil


	local thisItem = NativeUI.CreateItem(GetLocalisedText("resetmenuOffset"), "")
	settingsMenu:AddItem(thisItem)
	thisItem.Activated = function(ParentMenu,SelectedItem)
		SetResourceKvpInt("ea_menuwidth", 0)
		menuWidth = 0
	end
	
	
	_menuPool:RefreshIndex() -- refresh indexes
end
local armor = 0
local health = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2750)
		if drawInfo then
			local targetPed = GetPlayerPed(drawTarget)
             health = GetEntityHealth(targetPed)
             armor = GetPedArmour(targetPed)
   	 	end
	end
end)


Citizen.CreateThread( function()
	while true do
		Citizen.Wait(1)
		local letsleep = true
		if drawInfo then
			letsleep = false
			local text = {}
			-- cheat checks
			local targetPed = GetPlayerPed(drawTarget)
			-- health info
			table.insert(text,GetLocalisedText("health")..": "..health.."/ 200")
			table.insert(text,GetLocalisedText("armor")..": "..armor)
			-- misc info
			
			for i,theText in pairs(text) do
				SetTextFont(0)
				SetTextProportional(1)
				SetTextScale(0.0, 0.30)
				SetTextDropshadow(0, 0, 0, 0, 255)
				SetTextEdge(1, 0, 0, 0, 255)
				SetTextDropShadow()
				SetTextOutline()
				SetTextEntry("STRING")
				AddTextComponentString(theText)
				EndTextCommandDisplayText(0.3, 0.7+(i/30))
			end
			
			if IsControlJustPressed(0,103) then
				targetheh = GetEntityCoords(PlayerPedId(), false)
				RequestCollisionAtCoord(targetheh.x,targetheh.y,targetheh.z)
				NetworkSetInSpectatorMode(false, targetPed1)
				--SetEntityCoords(PlayerPedId(), oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
				TriggerEvent('EasyAdmin:FreezePlayer', false)
				if not RedM then
					TriggerEvent('EasyAdmin:FreezePlayer', false)
				end
	
				StopDrawPlayerInfo()
				ShowNotification(GetLocalisedText("stoppedSpectating"))
				drawinfo = false
			end
		end

		if letsleep then
			Citizen.Wait(1000)
		end

	end
end)
