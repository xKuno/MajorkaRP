local mozna = true
RegisterCommand("10-13", function(source, args, raw)
	if mozna then
		mozna = false
		TriggerServerEvent("top_1013:server", 1, GetEntityCoords(PlayerPedId()))
		Wait(600000)
		mozna = true
	end
end, false)
	

RegisterNetEvent("top_1013:client")
AddEventHandler("top_1013:client", function(funkcjonariusz, kordy)
	exports['mythic_notify']:DoCustomHudText('error', '<span style="font-size:13px;">10-13 |</span> Funkcjonariusz <span style="color:black;">' .. funkcjonariusz .. '</span> potrzebuje pomocy!</b>', 10000, { ['padding'] = '15px', ['width'] = '500px', ['font-size'] = '11px'})
	--TriggerServerEvent("InteractSound_SV:PlayOnSource", 'panicbutton', 0.1)
		PlaySoundFrontend(-1, "Bed", "WastedSounds", 0)
	CreateThread(function()
		local blip = AddBlipForCoord(kordy)
		SetBlipSprite(blip, 58)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 1.2)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("~r~10-13 | " .. funkcjonariusz)
		EndTextCommandSetBlipName(blip)
		Wait(60000)
		RemoveBlip(blip)
	end)
end)

RegisterNetEvent("top_1013:clientpolice")
AddEventHandler("top_1013:clientpolice", function(funkcjonariusz, kordy)
	exports['mythic_notify']:DoCustomHudText('error', '<span style="font-size:13px;">10-13 |</span> Funkcjonariusz <span style="color:black;">' .. funkcjonariusz .. '</span> wlaśnie zniknal z GPS!</b>', 10000, { ['padding'] = '15px', ['width'] = '500px', ['font-size'] = '11px'})
	--TriggerServerEvent("InteractSound_SV:PlayOnSource", 'panicbutton', 0.1)
		PlaySoundFrontend(-1, "Bed", "WastedSounds", 0)
	CreateThread(function()
		local blip = AddBlipForCoord(kordy)
		SetBlipSprite(blip, 58)
		SetBlipColour(blip, 1)
		SetBlipScale(blip, 1.2)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName("~r~10-13 | " .. funkcjonariusz)
		EndTextCommandSetBlipName(blip)
		Wait(60000)
		RemoveBlip(blip)
	end)
end)