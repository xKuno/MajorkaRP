Config                            = {}

Config.DrawDistance               = 50.0

Config.MinimumDistance            = 5 

Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false
Config.Kutas					  = true
Config.Locale                     = 'pl'


Config.AuthorizedVehicles = {
	Shared = {

		 {
			model = 'taxi',
			label = 'Taxi Ford'
		},


	},

	novice = {

      

	},

    experimente = {
       {
			model = 'priustaxi',
			label = 'Taxi Prius'
		},

  },


	boss = {

		{
			model = 'priustaxi',
			label = 'Taxi Prius'
		},

		{
			model = 'bmci',
			label = 'MASZ NO MASZ'
		},

		

	}

}

Config.AuthorizedVehiclesHahajp = {
		{
			model = 'taxi',
			label = 'Taxi Ford'
		},
	
		{
			model = 'priustaxi',
			label = 'Taxi Prius'
		},
	
		{
			model = 'bmci',
			label = 'MASZ NO MASZ'
		},
	
}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 888.23, y = -161.77, z = 76.89},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 36, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = 897.0, y = -152.75, z = 76.56},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 328.91
	},

	VehicleDeleter = {
		Pos   = {x = 892.32, y = -160.17, z = 75.89},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1, Rotate = false
	},

	TaxiActions = {
		Pos   = {x = 908.58, y = -152.69, z = 74.17},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 20, Rotate = true
	},

	Cloakroom = {
		Pos     = {x = 898.75, y = -168.69, z = 74.17},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 204, g = 204, b = 0},
		Type    = 21, Rotate = true
	}
}

Config.JobLocations = {
	vector3(126.02, -1309.88, 29.17),
	vector3(566.74, -1765.1, 29.16),
	vector3(-143.09, -2184.78, 10.32),
	vector3(-1284.92, 293.78, 64.85),
	vector3(233.71, 197.7, 105.21),
	vector3(423.13, -1267.04, 31.67),
	vector3(144.76, -1989.51, 18.16),
	vector3(87.8, -662.45, 44.07),
	vector3(429.64, -645.94, 28.5),
	vector3(4.57, -1543.69, 29.29),
	vector3(-235.17, -984.06, 29.13),
	vector3(-155.12, -414.06, 33.64),
	vector3(-232.6, -1867.46, 28.71),
	vector3(-1379.71, 54.02, 53.68),
	vector3(-1015.58, -467.49, 37.06),
	vector3(-887.5, -2188.41, 8.53),
	vector3(-765.24, -2536.18, 13.78),
	vector3(101.12, -2542.89, 6.0),
	vector3(993.42, -1892.0, 30.04),
	vector3(925.56, 50.06, 80.76),
	vector3(646.07, 586.69, 128.91),
	vector3(-1600.0, -1040.47, 13.02),
	vector3(120.2, -786.46, 31.28),
	vector3(536.93, -238.31, 49.63),
	vector3(-683.04, 293.51, 82.21),
	vector3(-695.05, -847.83, 23.57),
	vector3(404.78, -1477.87, 29.14),
	vector3(1176.87, -461.2, 66.16),
	vector3(923.26, -2467.15, 28.43),
	vector3(-3024.39, 114.11, 11.63),
	vector3(-515.28, -263.76, 35.41)
}