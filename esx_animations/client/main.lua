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

ragdoll = false
isDead = false
prop = nil
loop = {
	status = nil,
	current = nil,
	finish = nil,
	delay = 0,
	dettach = false,
	last = 0
}

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('playerSpawned', function(spawn)
	isDead = false
end)

AddEventHandler('esx:onPlayerDeath', function()
	isDead = true
end)

RegisterNetEvent('esx_animations:trigger')
AddEventHandler('esx_animations:trigger', function(anim)
		if anim.type == 'ragdoll' then
			ragdoll = true
		elseif anim.type == 'attitude' then
			startAttitude(anim.data.lib, anim.data.anim)
		elseif anim.type == 'scenario' then
			startScenario(anim.data.anim, anim.data.offset)
		elseif anim.type == 'anim' then
			startAnim(anim.data.lib, anim.data.anim, anim.data.mode)
		elseif anim.type == 'facial' then
			TriggerEvent('esx_voice:facial', anim.data)
		else
			startAnimLoop(anim.data)
		end
end)

function startAttitude(lib, anim)
	Citizen.CreateThread(function()
		RequestAnimSet(anim)
		while not HasAnimSetLoaded(anim) do
			Citizen.Wait(1)
		end

		SetPedMovementClipset(PlayerPedId(), anim, true)
	end)
end

function startScenario(anim, offset)
	if loop.status == true then
		finishLoop(function()
			startScenario(anim, offset)
		end)
	else
		local ped = PlayerPedId()
		if offset then
			local coords = GetEntityCoords(ped, true)
			TaskStartScenarioAtPosition(ped, anim, coords.x, coords.y, coords.z + offset, GetEntityHeading(ped), 0, true, true)
		else
			TaskStartScenarioInPlace(ped, anim, 0, false)
		end
	end
end

function startAnim(lib, anim, mode)
	if loop.status == true then
		finishLoop(function()
			startAnim(lib, anim, mode)
		end)
	else
		mode = mode or 0
		Citizen.CreateThread(function()
			RequestAnimDict(lib)
			while not HasAnimDictLoaded(lib) do
				Citizen.Wait(1)
			end

			TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, mode, 0, false, false, false)
		end)
	end
end

function startAnimLoop(data)
	if loop.status == true then
		finishLoop(function()
			startAnimLoop(data)
		end)
	else
		Citizen.CreateThread(function()
			while loop.status ~= nil do
				Citizen.Wait(1)
			end

			RequestAnimDict(data.base.lib)
			while not HasAnimDictLoaded(data.base.lib) do
				Citizen.Wait(1)
			end

			RequestAnimDict(data.idle.lib)
			while not HasAnimDictLoaded(data.idle.lib) do
				Citizen.Wait(1)
			end

			RequestAnimDict(data.finish.lib)
			while not HasAnimDictLoaded(data.finish.lib) do
				Citizen.Wait(1)
			end

			local playerPed = PlayerPedId()
			if data.prop then
				local coords	= GetEntityCoords(playerPed)
				local boneIndex = GetPedBoneIndex(playerPed, data.prop.bone)

				ESX.Game.SpawnObject(data.prop.object, {
					x = coords.x,
					y = coords.y,
					z = coords.z + 2
				}, function(object)
					AttachEntityToEntity(object, playerPed, boneIndex, data.prop.offset.x, data.prop.offset.y, data.prop.offset.z, data.prop.rotation.x, data.prop.rotation.y, data.prop.rotation.z, true, true, false, true, 1, true)
					prop = object
				end)
			end

			TaskPlayAnim(PlayerPedId(), data.base.lib, data.base.anim, 8.0, -8.0, -1, data.mode, 0, false, false, false)
			loop = {status = true, current = nil, finish = data.finish, delay = (GetGameTimer() + 100), last = 0}

			loop.finish.mode = data.mode
			if data.prop then
				loop.dettach = data.prop.dettach
			else
				loop.dettach = false
			end

			Citizen.Wait(data.base.length)
			while loop.status do
				local rng
				repeat
					rng = math.random(0, #data.idle.anims)
				until rng ~= loop.last

				loop.delay = GetGameTimer() + 100
				loop.last = rng
				if rng == 0 then
					TaskPlayAnim(PlayerPedId(), data.base.lib, data.base.anim, 8.0, -8.0, -1, data.mode, 0, false, false, false)
					loop.current = data.base
					Citizen.Wait(data.base.length)
				else
					TaskPlayAnim(PlayerPedId(), data.idle.lib, data.idle.anims[rng][1], 8.0, -8.0, -1, data.mode, 0, false, false, false)
					loop.current = {lib = data.idle.lib, anim = data.idle.anims[rng][1]}
					Citizen.Wait(data.idle.anims[rng][2])
				end
			end
		end)
	end
end

function finishLoop(cb)
	loop.status = false
	Citizen.CreateThread(function()
		TaskPlayAnim(PlayerPedId(), loop.finish.lib, loop.finish.anim, 8.0, 8.0, -1, loop.finish.mode, 0, false, false, false)

		Citizen.Wait(loop.finish.length)
		if loop.status == false and prop then
			if loop.dettach then
				DetachEntity(prop, true, false)
			else
				DeleteObject(prop)
			end

			prop = nil
		end

		loop.status = nil
		if cb then
			cb()
		end
	end)
end

function OpenAnimationsMenu(ped)
	local elements = {
		{label = "- PRZERWIJ -", value = "cancel"}
	}
	for _, group in ipairs(Config.Animations) do
		if not group.resource or GetResourceState(group.resource) == 'started' then
			table.insert(elements, {label = group.label, value = group.name})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations', {
		title    = 'Animacje',
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		if data.current.value ~= "cancel" then
			OpenAnimationsSubMenu(data.current.value)
		else
			clearTask()
		end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenAnimationsSubMenu(menu)
	local title, elements = nil, {}
	for _, group in ipairs(Config.Animations) do
		if group.name == menu then
			for _, item in ipairs(group.items) do
				table.insert(elements, {label = item.label .. (item.keyword and ' <span style="font-size: 11px; color: #fff000;">/e ' .. item.keyword .. '</span>' or ''), type = item.type, data = item.data})
			end

			title = group.label
			break
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'animations_' .. menu, {
		title    = title,
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		TriggerEvent('esx_animations:trigger', data.current)
	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if ragdoll then
			SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		end

		if loop.status and loop.current and loop.delay < GetGameTimer() and (not IsEntityPlayingAnim(PlayerPedId(), loop.current.lib, loop.current.anim, 3)) then
			loop.status = nil
			if prop then
				if loop.dettach then
					DetachEntity(prop, true, false)
				else
					DeleteObject(prop)
				end

				prop = nil
			end
		end

		if IsControlJustReleased(0, Keys['F3']) and not isDead then
			OpenAnimationsMenu(PlayerPedId())
		elseif IsControlJustReleased(0, Keys['X']) and not isDead then
			clearTask()
		end
	end
end)

function clearTask()
	if loop.status == true then
		finishLoop()
	elseif ragdoll then
		ragdoll = false
	else
		ClearPedTasks(PlayerPedId())
		if loop.status ~= nil then
			loop.status = nil
			if prop then
				if loop.dettach then
					DetachEntity(prop, true, false)
				else
					DeleteObject(prop)
				end

				prop = nil
			end
		end
	end
end
