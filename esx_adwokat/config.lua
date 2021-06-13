
Config                            = {}

Config.DrawDistance               = 25.0
Config.MarkerType                 = 7
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'pl'

Config.AdwokatStations = {

	Adwokat = {

		-- https://wiki.rage.mp/index.php?title=Weapons

		Cloakrooms = {
			{ x = -542.16, y = -193.17, z = 47.42  },
		},

		Szafka = {
			{ x = -559.97, y = -204.7, z = 38.37  },
		},


		Vehicles = {
			{
				Spawner    = { x = -521.16, y = -258.94, z = 35.62  },
				SpawnPoints = {
					{ x = -517.19, y = -265.11, z = 35.37  , heading = 104.92, radius = 3.0 }
				}
			},
		},

		VehicleDeleters = {
			{ x =-517.19, y = -265.11, z = 35.37   }
		},

		BossActions = {
			{ x = -546.47, y = -203.08, z = 47.71  }
		},

	},
}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
		{
			model = 'rrab',
			label = 'Samochód Adwokatów'
		}

}
