RegisterNetEvent('rlUpdateNames')

AddEventHandler('rlUpdateNames', function()
    local names = {}

	for _,i in ipairs(GetActivePlayers()) do
		if NetworkIsPlayerActive(i) then
			names[i] = { id = i, name = GetPlayerName(i) }
		end
	end

    TriggerServerEvent('rlUpdateNamesResult', names)
end)

Citizen.CreateThread(function()
	while true do
		Wait(0)

		if NetworkIsSessionStarted() then
			TriggerServerEvent('rlPlayerActivated')

			return
		end
	end
end)