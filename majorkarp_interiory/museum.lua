local function ButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

local function Button(ControlButton)
    PushScaleformMovieMethodParameterButtonName(ControlButton)
end

local function setupScaleform(scaleform, itemString, button)
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
	if button ~= nil then
		Button(GetControlInstructionalButton(2, 38, true))
	end
    ButtonMessage(itemString)
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()
    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    return scaleform
end

local intLoc = vec3(-558.0, -617, 1.0)
local extLoc = vec3(-555.5, -619.0, 34.8)

function EnterMuseum()
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	BeginTextCommandBusyString("FMMC_PLYLOAD")
	EndTextCommandBusyString(4)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	RequestIpl("vespucci_museum_milo_")
	SetEntityCoords(PlayerPedId(), intLoc)
	SetEntityHeading(PlayerPedId(), 0.0)
	SetGameplayCamRelativeHeading(0.0)
	Citizen.Wait(1000)
	RemoveLoadingPrompt()
	DoScreenFadeIn(2000)
	Citizen.Wait(1000)
end

function ExitMuseum()
	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	BeginTextCommandBusyString("FMMC_PLYLOAD")
	EndTextCommandBusyString(4)
	DoScreenFadeOut(1000)
	Citizen.Wait(1000)
	RemoveIpl("vespucci_museum_milo_")
	SetEntityCoords(PlayerPedId(), extLoc)
	SetEntityHeading(PlayerPedId(), 180.0)
	SetGameplayCamRelativeHeading(0.0)
	Citizen.Wait(1000)
	RemoveLoadingPrompt()
	DoScreenFadeIn(2000)
	Citizen.Wait(1000)
end

Citizen.CreateThread(function()
	museumBlip = AddBlipForCoord(extLoc)
	SetBlipDisplay(museumBlip, 4)
	SetBlipSprite(museumBlip, 78)
	SetBlipColour(museumBlip, 11)
	SetBlipScale(museumBlip, 0.8)
	SetBlipAsShortRange(museumBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Museum")
	EndTextCommandSetBlipName(museumBlip)
	
	while true do Citizen.Wait(0)
		if #(GetEntityCoords(PlayerPedId()) - extLoc) < 100.0 then

			DrawMarker(21, extLoc, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.0, 1.0, 247, 255, 28, 100, true, true, 2, false, false, false, false)
			if not IsPedInAnyVehicle(PlayerPedId(), true) then
				if #(GetEntityCoords(PlayerPedId()) - extLoc) < 1.0 then
					enterForm = setupScaleform("instructional_buttons", "Wejdz do Muzeum", 38)
					DrawScaleformMovieFullscreen(enterForm, 255, 255, 255, 255, 0)
					if IsControlJustReleased(2, 38) then
						EnterMuseum()
					end
				end
			end
		end
		if #(GetEntityCoords(PlayerPedId()) - intLoc) < 50.0 then
			DrawMarker(21, intLoc, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.0, 1.0, 247, 255, 28, 100, true, true, 2, false, false, false, false)
			if not IsPedInAnyVehicle(PlayerPedId(), true) then
				if #(GetEntityCoords(PlayerPedId()) - intLoc) < 1.0 then
					exitForm = setupScaleform("instructional_buttons", "Wyjdz z Muzeum", 38)
					DrawScaleformMovieFullscreen(exitForm, 255, 255, 255, 255, 0)
					if IsControlJustReleased(2, 38) then
						ExitMuseum()
					end
				end
			end
		end
	end
end)