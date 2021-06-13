Config = {}
Config.DrawDistance               = 100.0
Config.MaxInService               = -1
Config.EnableSocietyOwnedVehicles = false
Config.Jobs      				  = {}
Config.Locale                     = 'pl'

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 2354.9 , y = 3114.85, z = 47.21},
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1
	},

	VehicleSpawnPoint = {
		Pos     = {x = 2365.26, y = 3113.35, z = 47.3},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1,
		Heading = 47.52
	},

	VehicleDeleter = {
		Pos   = {x = 2334.35, y = 3119.04, z = 47.2},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1
	},

	Cloakroom = {
		Pos     = {x = 2404.17, y = 3127.65, z = 48.15},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Color   = {r = 204, g = 204, b = 0},
		Type    = 3
	}

}

Config.Dostarczanie = {
	["DostarczPaczkiMiedz"] = { ["x"] = 1986.52, ["y"] = 3792.55, ["z"] = 31.18, ["h"] = 118.62 },
	["DostarczPaczkiStal"] = { ["x"] = 1691.92, ["y"] = 3585.97, ["z"] = 34.62, ["h"] = 115.82 },
	["DostarczPaczkiAluminium"] = { ["x"] = 996.53, ["y"] = 3575.3, ["z"] = 33.61, ["h"] = 141.85 },
	["DostarczPaczkiMosiadz"] = { ["x"] = 915.31, ["y"] = 3567.37, ["z"] = 32.79, ["h"] = 87.48 },

	["MiejscaZbiorki"] = {
	[1] = { ["x"] = 2415.61, ["y"] = 3089.54, ["z"] = 47.24, ["state"] = true },
	[2] = { ["x"] = 2401.68, ["y"] = 3086.76, ["z"] = 47.15, ["state"] = true },
	[3] = { ["x"] = 2406.31, ["y"] = 3065.19, ["z"] = 47.15, ["state"] = true },
	[4] = { ["x"] = 2415.32, ["y"] = 3039.21, ["z"] = 47.15, ["state"] = true },
	[5] = { ["x"] = 2401.28, ["y"] = 3049.42, ["z"] = 47.15, ["state"] = true },
	[6] = { ["x"] = 2400.09, ["y"] = 3052.9, ["z"] = 47.15, ["state"] = true },
	[7] = { ["x"] = 2391.24, ["y"] = 3048.89, ["z"] = 47.15, ["state"] = true },
	[8] = { ["x"] = 2388.32, ["y"] = 3035.72, ["z"] = 47.15, ["state"] = true },
	[9] = { ["x"] = 2359.77, ["y"] = 3040.94, ["z"] = 47.15, ["state"] = true },
	[10] = { ["x"] = 2355.73, ["y"] = 3023.3, ["z"] = 47.15, ["state"] = true },
	[11] = { ["x"] = 2360.65, ["y"] = 3049.04, ["z"] = 47.15, ["state"] = true },
	[12] = { ["x"] = 2356.66, ["y"] = 3048.47, ["z"] = 47.15, ["state"] = true },
	[13] = { ["x"] = 2346.36, ["y"] = 3061.61, ["z"] = 47.15, ["state"] = true },
	[14] = { ["x"] = 2346.75, ["y"] = 3068.69, ["z"] = 47.15, ["state"] = true },
	[15] = { ["x"] = 2349.99, ["y"] = 3074.65, ["z"] = 47.15, ["state"] = true },
	[16] = { ["x"] = 2355.13, ["y"] = 3076.7, ["z"] = 47.15, ["state"] = true },
	[17] = { ["x"] = 2362.23, ["y"] = 3071.71, ["z"] = 47.19, ["state"] = true },
	[18] = { ["x"] = 2362.38, ["y"] = 3077.96, ["z"] = 47.19, ["state"] = true },
	[19] = { ["x"] = 2367.07, ["y"] = 3089.56, ["z"] = 47.15, ["state"] = true },
	[20] = { ["x"] = 2373.41, ["y"] = 3081.07, ["z"] = 47.15, ["state"] = true },
	[21] = { ["x"] = 2371.54, ["y"] = 3069.87, ["z"] = 47.15, ["state"] = true },
	[22] = { ["x"] = 2392.64, ["y"] = 3068.86, ["z"] = 47.58, ["state"] = true },
	[23] = { ["x"] = 2399.95, ["y"] = 3095.65, ["z"] = 47.15, ["state"] = true },
	[24] = { ["x"] = 2411.48, ["y"] = 3112.48, ["z"] = 47.15, ["state"] = true },
	[25] = { ["x"] = 2406.92, ["y"] = 3122.05, ["z"] = 47.22, ["state"] = true },
	[26] = { ["x"] = 2403.38, ["y"] = 3138.36, ["z"] = 47.15, ["state"] = true },
	[27] = { ["x"] = 2407.46, ["y"] = 3144.86, ["z"] = 47.16, ["state"] = true },
	[28] = { ["x"] = 2415.13, ["y"] = 3148.33, ["z"] = 47.19, ["state"] = true },
	[29] = { ["x"] = 2425.41, ["y"] = 3146.87, ["z"] = 47.16, ["state"] = true },
	[30] = { ["x"] = 2427.05, ["y"] = 3155.28, ["z"] = 47.16, ["state"] = true },
	}
}

Config.AuthorizedVehicles = {
	{
		model = 'burrito',
		label = 'Pojazd Złomiarza'
	}
}

Config.Uniforms = {

	roboczy = { -- gumis chuj
		male = {
				['tshirt_1'] = 15,  ['tshirt_2'] = 0,
	            ['torso_1'] = 79,   ['torso_2'] =0,
	            ['decals_1'] = 0,   ['decals_2'] = 0,
	            ['arms'] = 0,
	            ['pants_1'] = 117,   ['pants_2'] = 3,
	            ['shoes_1'] = 35,   ['shoes_2'] = 0,
	            ['bproof_1'] = 71,  ['bproof_2'] = 7
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0
		}
	},

}
