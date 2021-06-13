Config                            = {}

Config.DrawDistance               = 25.0
Config.MarkerType                 = 21
Config.MarkerTypeDeleters		  = 24
Config.MarkerTypeTake		  	  = 36
Config.MarkerTypeHeli			  = 34
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.Prawidlowe				  = 2
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 10 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'pl'

Config.Cipa = { 
	VehicleSpawnPoint = {
		Pos     = {x = -1269.23, y = -1858.51, z = 1.75},
		Heading = 125.52
	},
}

Config.Lodzie = {

	vector3(-1197.449, -1808.036, 2.91),
	vector3(1529.449, 3778.556, 33.519),
	vector3(-393.53, 6375.62, 12.81),
	vector3(-753.55, 952.79, 5.02),
	vector3(-3424.57, 5204.32, 8.35),
	vector3(-1600.64, 6375.62, 4.31),
	vector3(-269.11, 6643.18, 2.87),
	vector3(1551.58, 6611.42, 2.87),
	vector3(3817.36, 4482.86, 6.17),
	vector3(2818.49, -661.81, 1.27),
	vector3(632.77, -3014.88, 7.34)
}



Config.PoliceStations = {

	
DSPD = {

	Blip = {
		Pos     = { x = 369.15, y = -1602.16, z = 29.29 },
		Sprite  = 60,
		Display = 4,
		Scale   = 1.2,
		Colour  = 29,
	},

	-- https://wiki.rage.mp/index.php?title=Weapons
	AuthorizedWeapons = {
		{ name = 'nightstick',       price = 2000 },
		{ name = 'combatpistol',     price = 10000 },
		{ name = 'stungun',          price = 5000 },
		{ name = 'flashlight',       price = 2000 },
		{ name = 'fireextinguisher', price = 1500 },
		{ name = 'flaregun',         price = 1000 },
		{ name = 'parachute',        price = 0 },
	},

	Cloakrooms = {
		{ x = 369.15, y = -1602.16, z = 29.29 },
	},

	Armories = {
		{ x = 365.41,  y = -1609.44, z = 29.29 }, 
	},

	Lodzie = {
		{
			Spawner    = { x = -11932327.449, y = -1808.036, z = 3.919 },
			SpawnPoints = {
				{ x = -1269.23, y = -1858.51, z = 1.75, heading = 127.0, radius = 6.0 }
			},
		},
	},
														   

	Vehicles = {
		{
			Spawner    = { x = 371.47, y = -1612.86, z = 29.29 },
			SpawnPoints = {
				{ x = 394.87, y = -1626.08, z = 29.29, heading = 48.45, radius = 3.0 },
				{ x = 396.98, y = -1623.85, z = 29.29, heading = 59.5, radius = 3.0 },
				{ x = 399.64, y = -1621.65, z = 29.29, heading = 51.71, radius = 3.0 },
				{ x = 388.96, y = -1613.07, z = 29.29, heading = 236.9, radius = 3.0 },
			}
		},

	},

	Helicopters = {
		{
			Spawner    = { x = 382.14, y = -1600.78, z = 35.95 },
			SpawnPoint = { x = 362.76, y = -1598.42, z = 36.95},
			Heading    = 320.63
		}
	},
	

	VehicleDeleters = {
		{ x = 375.11, y = -1630.09, z = 27.93},
		{ x = 378.5, y = -1632.69, z = 27.99},
		{ x = 362.76, y = -1598.42, z = 36.95},
	},

	BossActions = {
		{ x = 363.7, y = -1583.91, z = 33.36 },
		{ x = 359.25, y =-1589.25, z = 33.36 },
		{ x = 369.63, y = -1592.51, z = 28.88 }
	},

},


	LSPD = {

		Blip = {
			Pos     = { x = 445.61, y = -985.28, z = 54.48},
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'nightstick',       price = 2000 },
			{ name = 'combatpistol',     price = 10000 },
			{ name = 'stungun',          price = 5000 },
			{ name = 'flashlight',       price = 2000 },
			{ name = 'fireextinguisher', price = 1500 },
			{ name = 'flaregun',         price = 1000 },
			{ name = 'parachute',        price = 0 },
		},

		Cloakrooms = {
			{ x = 461.76, y = -999.66, z = 30.69 },
			{ x = -63.88, y = -2513.8, z = 6.80 },
		},

		Armories = {
			--{ x = 485.36, y = -995.36, z = 30.69},
			{ x = 53.62, y = -2506.99, z = 6.8},
			{ x = 459.8, y = -979.79, z = 30.69 },
		},

		Lodzie = {
			{
				Spawner    = { x = -1197.449, y = -1808.036, z = 3.919 },
				SpawnPoints = {
					{ x = -1269.23, y = -1858.51, z = 1.75, heading = 127.0, radius = 6.0 }
				},
			},

			{
			Spawner    = { x = -753.55, y =-1512.06, z = 5.02 },
                SpawnPoints = {
                    { x = -796.57, y = -1502.73, z = 1.01, heading = 108.88, radius = 3.0 }
                },
            },
            {
Spawner    = { x = -3424.57, y =952.79, z = 8.35 },
                SpawnPoints = {
                    { x = -3428.96, y = 943.25, z =  0.94, heading = 91.51, radius = 3.0 }
                },
            },
            {
Spawner    = { x = -1600.64, y =5204.32, z = 4.31 },
                SpawnPoints = {
                    { x = -1600.7, y = 5261.38, z =  0.67, heading = 27.56, radius = 3.0 }
                },
            },
            {
Spawner    = { x = -269.11, y =6643.18, z = 7.38 },
                SpawnPoints = {
                    { x = -297.23, y = 6651.82, z =  0.48 , heading = 34.9, radius = 3.0 }
                },
            },
            {
Spawner    = { x = 1551.58, y =6611.42, z = 2.87 },
                SpawnPoints = {
                    { x = 1529.24, y = 6667.06, z =  1.57 , heading = 10.71, radius = 3.0 }
                },
            },
            {
Spawner    = { x = 3817.36, y =4482.86, z = 6.17 },
                SpawnPoints = {
                    { x = 3862.16, y = 4471.96, z =  0.84  , heading = 271.06, radius = 3.0 }
                },
            },
            {
Spawner    = { x = 2818.49, y =-661.81, z = 1.27 },
                SpawnPoints = {
                    { x =  2854.33, y = -667.43, z =  0.64  , heading = 266.51, radius = 3.0 }
                },
            },
            {
Spawner    = { x = 632.77, y =-3014.88, z = 7.34 },
                SpawnPoints = {
                    { x =  631.82, y = -3034.17, z =  0.84  , heading = 264.57, radius = 3.0 }
                },
            },
            {
Spawner    = { x = 1514.22, y =3784.34, z = 34.47 },
                SpawnPoints = {
                    { x = 1482.68, y = 3812.87, z =   30.83  , heading = 31.94, radius = 3.0 }
                },
			},
		},


		Vehicles = {
		--[[	{
				Spawner    = { x = 459.29, y = -986.65, z = 25.7 },
				SpawnPoints = {
					{ x = 452.31, y = -990.3, z = 25.7, heading = 355.34, radius = 6.0 },
				
				}
			},

			
]]

			{
				Spawner    = {x = 473.1164855957, y = -1019.182434082, z = 28.08349609375},
				SpawnPoints = {
					{x = 479.35385131836, y = -1021.1604614258, z = 27.982421875, heading = 270.52, radius = 6.0 },
				
				}
			},


			{
				Spawner    = { x = 458.15, y = -1017.3, z = 28.25 },
				SpawnPoints = {
					{ x = 449.32, y = -1023.84, z = 28.57, heading = 27.52, radius = 6.0 },
				
				}
			}
		},

		Helicopters = {
			{
				Spawner    = { x = 461.16, y = -981.14, z = 42.69 },
				SpawnPoint = { x = 449.28, y = -981.35, z = 43.69 },
				Heading    = 282.03
			}
		},

		VehicleDeleters = {
			--{ x = 452.31, y = -990.3, z = 25.7 },
			{ x = 449.32, y = -1023.84, z = 28.57 },
			{ x = 449.28, y = -981.35, z = 43.69 },
			{x = 479.35385131836, y = -1021.1604614258, z = 27.982421875}, 
		
		},

		BossActions = {
			{ x = 447.97, y = -973.37, z = 30.69 },
		
		},

	},




	SSPD = {

		Blip = {
			Pos     = { x = 1854.890, y = 3685.078, z = 33.27 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 73,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'nightstick',       price = 2000 },
			{ name = 'combatpistol',     price = 10000 },
			{ name = 'doubleaction',     price = 25000 },
			{ name = 'stungun',          price = 5000 },
			{ name = 'flashlight',       price = 2000 },
			{ name = 'fireextinguisher', price = 1500 },
			{ name = 'flaregun',         price = 1000 },
			{ name = 'parachute',        price = 0 },
		},

		Cloakrooms = {
			{ x = 1845.17, y = 3693.33, z = 34.27 },
		},

		Armories = {
			{ x = 474.14,  y = -1005.27, z = 26.27 }, 
			{ x = 1861.88, y = 3689.54, z = 34.27 },
		},

		Lodzie = {
			{
				Spawner    = { x = 1529.449, y = 3778.556, z = 34.519 },
				SpawnPoints = {
					{ x = 1501.22, y = 3823.75, z = 32.51, heading = 196.5, radius = 6.0 }
				}
			},
			
		},                                                               

		Vehicles = {
			{
				Spawner    = { x = 1850.17, y = 3674.51, z = 33.745 },
				SpawnPoints = {
					{ x = 1855.27, y = 3675.48, z = 34.0, heading = 210.83, radius = 3.0 },
					{ x = 1850.42, y = 3674.30, z = 34.0, heading = 210.83, radius = 3.0 },
					{ x = 1847.14, y = 3669.89, z = 34.0, heading = 210.83, radius = 3.0 },
					{ x = 1862.52, y = 3679.81, z = 34.0, heading = 210.83, radius = 3.0 }
				}
			},

		},

		Helicopters = {
			{
				Spawner    = { x = 1854.51, y = 3700.79, z = 33.27 },
				SpawnPoint = { x = 1842.44, y = 3708.84, z = 32.42 },
				Heading    = 299.92
			}
		},
		

		VehicleDeleters = {
			{ x = 1854.49, y = 3674.54, z = 34.0},
			{ x = 1851.13, y = 3672.32, z = 34.0},
			{ x = 1848.03, y = 3670.51, z = 34.0},
		    { x = -796.57, y =-1502.73, z = 1.01 },
            { x = -3428.96, y =943.25, z = 0.94 },
            { x = -1600.7, y =5261.38, z = 0.67 },
            { x = -297.23, y =6651.82, z = 0.48 },
            { x = 1529.24, y =6667.06, z = 1.57 },
            { x = 3862.16, y =4471.96, z = 0.84 },
            { x = 2854.33, y =-667.43, z = 0.64 },
            { x = 631.82, y =-3034.17, z = 0.84 },
            { x = 1482.68, y =3812.87, z = 30.83 },
		},

		BossActions = {
			{ x = 440.76, y = -982.13, z = 34.97 },
			{ x = 1857.31, y = 3690.0, z = 38.07 }
		},

	},

--[[	HighwayPatrol = {

		Blip = {
			Pos     = { x = 1546.43, y = 819.23, z = 77.66 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 73,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'WEAPON_NIGHTSTICK',       price = 5000 },
			{ name = 'WEAPON_COMBATPISTOL',     price = 50000 },
			{ name = 'WEAPON_STUNGUN',          price = 25000 },
			{ name = 'WEAPON_FLASHLIGHT',       price = 5000 },
			{ name = 'WEAPON_FIREEXTINGUISHER', price = 2500 },
			{ name = 'WEAPON_FLAREGUN',         price = 2000 },
			{ name = 'GADGET_PARACHUTE',        price = 0 },
		},

		Cloakrooms = {
			{ x = 1539.78, y = 3811.35, z = 77.66 },
		},

		Armories = {
			{ x = 1550.96,  y = 841.8, z = 77.66 }, 
		},

		Vehicles = {
			{
				Spawner    = { x = 1556.62, y = 827.64, z = 77.14 },
				SpawnPoints = {
					{ x = 1552.95, y = 805.65, z = 77.02, heading = 140.23, radius = 6.0 },
				}
			},

		},

		Lodzie = {
			{
				Spawner    = { x = 15329.449, y = 33778.556, z = 3334.519 },
				SpawnPoints = {
					{ x = 15031.22, y = 38323.75, z = 3233.51, heading = 196.5, radius = 6.0 }
				}
			},
			
		},

		Helicopters = {
			{
				Spawner    = { x = 1553.41, y = 841.83, z = 77.28 },
				SpawnPoint = { x = 1565.85, y = 844.66, z = 77.14 },
				Heading    = 299.92
			}
		},
		

		VehicleDeleters = {
			{ x = 1565.85, y = 844.66, z = 77.14},
			{ x = 1552.95, y = 805.65, z = 77.02},

		
		},

		BossActions = {
			{ x = 1543.08, y = 813.36, z = 82.13 },
		},

	},	]]--
	PBPD = {

		Blip = {
			Pos     = { x = -445.030, y = 6014.368, z = 31.721 },
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 69,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'nightstick',       price = 2000 },
			{ name = 'combatpistol',     price = 10000 },
			{ name = 'doubleaction',     price = 25000 },
			{ name = 'stungun',          price = 5000 },
			{ name = 'flashlight',       price = 2000 },
			{ name = 'fireextinguisher', price = 1500 },
			{ name = 'flaregun',         price = 1000 },
			{ name = 'parachute',        price = 0 },
		},

		Cloakrooms = {
			{ x = -440.3, y = 5997.78, z = 31.72 },
		},

		Armories = {
			{ x = -437.69, y = 5988.41, z = 31.72},
		},

		Lodzie = {
			{
				Spawner    = { x = -393.53, y = 6375.62, z = 13.81 },
				SpawnPoints = {
					{ x = -494.18 ,y = 6480.39, z = -0.8, heading = 33.0, radius = 6.0 }
				}
			},
			
		},
		
		Vehicles = {
			{
				Spawner    = { x = -459.28, y = 6028.90, z = 31.34 },
				SpawnPoints = {
					{x = -471.87, y = 6035.97, z = 31.345, heading = 223.0, radius = 6.0 },
					{ x = -479.29, y = 6028.36, z = 31.344, heading = 223.0, radius = 6.0 },
					{ x = -475.97, y = 6032.0, z = 31.344, heading = 223.0, radius = 6.0 },
					{ x = -468.97, y = 6015.55, z = 31.10, heading = 223.0, radius = 6.0 }
				}
			},

		},

		Helicopters = {
			{
				Spawner    = { x = -451.57, y = 5984.72, z = 31.35 },
				SpawnPoint = { x = -474.967, y = 5988.649, z = 30.341 },
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{ x = -471.87, y = 6035.97, z = 31.345 },
			{ x = -479.29, y = 6028.36, z = 31.344 },
			{ x = -475.97, y = 6032.0, z = 31.344 },
			{ x = -474.967, y = 5988.649, z = 31.341 }
		},


		BossActions = {
			{ x = -439.87, y = 6000.46, z = 31.72 }
		},

	},

	FZ = {

		Blip = {
			Pos     = { x = -2349.86, y = 3266.08, z = 31.81 },
			Sprite  = 60,
			Display = 0,
			Scale   = 1.2,
			Colour  = 29,
		},

		-- https://wiki.rage.mp/index.php?title=Weapons
		AuthorizedWeapons = {
			{ name = 'nightstick',       price = 2000 },
			{ name = 'combatpistol',     price = 10000 },
			{ name = 'stungun',          price = 5000 },
			{ name = 'flashlight',       price = 2000 },
			{ name = 'fireextinguisher', price = 1500 },
			{ name = 'flaregun',         price = 1000 },
			{ name = 'parachute',        price = 0 },
		},

		Cloakrooms = {
			{ x = -2349.86, y = 3266.08, z = 31.81 },
		},

		Armories = {
			{ x = -2348.79, y = 3245.46, z = 31.83 },
		},

		Lodzie = {
			{
				Spawner    = { x = -3932133.53, y = 637532.62, z = 12.81 },
				SpawnPoints = {
					{ x = -494.18 ,y = 6480.39, z = -0.8, heading = 33.0, radius = 6.0 }
				}
			},
			
		},
		
		Vehicles = {
			{
				Spawner    = { x = -2421.42, y = 3279.05, z = 31.83 },
				SpawnPoints = {
					{ x = -2421.42, y = 3279.05, z = 31.83, heading = 333.99, radius = 6.0 }
				}
			},

		},

		Helicopters = {
			{
				Spawner    = { x = -1876.64, y = 2805.4, z = 31.81 },
				SpawnPoint = { x =  -1876.64, y = 2805.4, z = 32.81},
				Heading    = 0.0
			}
		},

		VehicleDeleters = {
			{ x = -1859.58, y = 2795.33, z = 31.81 },
			{ x = -2427.36, y = 3304.87, z = 32.0 }
		},


		BossActions = {
			{ x = -44312312.787, y = 6012.523, z = 30.729 }
		},

	},


	FIB = {

        Blip = {
            Pos     = { x = 430.01, y = -980.96, z = 30.71},
            Sprite  = 60,
            Display = 0,
            Scale   = 1.2,
            Colour  = 29,
        },
        AuthorizedWeapons = {
            { name = 'nightstick',       price = 4000 },
            { name = 'combatpistol',     price = 10000 },
            { name = 'stungun',          price = 8000 },
            { name = 'flashlight',       price = 5000 },
            { name = 'parachute',       price = 250 },
        },

        Cloakrooms = {
            { x = 2519.35, y = -331.94, z = 94.09 },
            { x = 2516.48, y = -344.93, z = 101.89},
        },

        Armories = {
            { x = 2509.45, y = -333.59, z = 101.89 },
            { x = 2525.8, y = -342.04, z = 101.89 },
        },

        Lodzie = {
            {
                Spawner    = { x = -1197.449, y = -1808.036, z = 2.919 },
                SpawnPoints = {
                    { x = -1269.23, y = -1858.51, z = 1.75, heading = 127.0, radius = 6.0 }
                }
            },

        },


       Vehicles = {
            {
                Spawner    = { x = 2540.3, y = -336.3, z =94.14 },
                SpawnPoints = {
                    { x = 2546.6, y = -324.06, z = 92.5, heading = 215.81, radius = 6.0 }

                }
            }
},

        Helicopters = {
            {
                Spawner    = {  x = 2505.07, y = -340.35, z = 118.08  },
                SpawnPoint = {  x = 2511.49, y = -341.85, z = 118.19 },
                Heading    = 132.22
            }
        },


        VehicleDeleters = {
            { x = 2527.18, y = -309.69, z = 92.99 },
            {  x = 2511.49, y = -341.85, z = 118.19 }

        },

        BossActions = {
            { x = 2511.58, y = -423.66, z = 106.91 },
            { x = 2515.8, y = -445.08, z = 106.91 },
            { x = 2486.74, y = -410.24, z = 99.11 },
            { x = 2534.12, y = -444.41, z = 97.51 },
        },
    }

}

-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AutoryzowaneLodzie = {
	Shared = {
			{
			model = 'predator',
			label = 'Policyjny Predator'
		},

		{
			model = 'code3boat',
			label = 'Policyjny Boat'
		}
	
	},
}

Config.AutoryzowaneHelicopters ={
	Shared = {
		{
			model = 'buzzard2',
			label = 'Buzzard'
		},
		{
			model = 'polmav',
			label = 'Maverick LSPD'
		},

		{
			model = 'polbuzz2',
			label = 'Buzzard LSPD'
		},

		{
			model = 'polbuzz2',
			label = 'Buzzard BCSO'
		},				
	},
}

Config.TypyAut = {
	Shared ={
		{
			type = 'LSPDTraffic',
			label = 'Traffic'
		},
		{
			type = 'LSPDOffriad',
			label = 'Offroad'
		},
		{
			type = 'LSPDEDWARD',
			label = 'Edward'
		},

		{
			type = 'mary',
			label = 'Mary'
		},

		{
			type = 'sahp',
			label = 'Highway Patrol'
		},

		{
			type = 'konwoj',
			label = 'Konwoje'
		},
	
		{
			type = 'fib',
			label = 'Pojazdy FIB'
		},			

	},
}

Config.AuthorizedVehicles = {
	Shared = {
			{
				model = 'pbus',
				label = 'Autobus Wiezienny',
				type = 'konwoj'
			},
		
			{
				model = 'policet2',
				label = 'Transporter Wiezienny',
				type = 'konwoj'
			},
			
			{
				model = 'lspdpeedo',
				label = 'Speedo Policyjne',
				type = 'konwoj'
			},			

			{
				model = 'riot',
				label = 'RIOT',
				type = 'konwoj'
			},
		
			{
				model = 'lspdpeedo',
				label = 'Speedo Policyjne',
				type = 'LSPDTraffic'
			},
			
			{
				model = 'pdbike',
				label = 'SAHP Harley',
				type = 'sahp'
			},
		
			{
				model = '18chrg',
				label = 'SAHP Charger',
				type = 'sahp'
			},
				
			{
				model = 'tahoeTC',
				label = 'SAHP Tahoe',
				type = 'sahp'
			},	

			{
				model = 'polstang',
				label = 'SAHP Mustang',
				type = 'sahp'
			},		

			
					
					
			
			{
			model = 'policeb1',
			label = 'Motocykl poscgiowka',
			type = 'mary'
			},

			{
			model = 'pd_dirtbike',
			label = 'Cross',
			type = 'mary'
			},

			{
				model = 'code3harley',
				label = 'Harleyv2',
				type = 'mary'
			},

						
			{
			model = 'policeb',
			label = 'Harley',
			type = 'mary'
			},
			

	

		},
			
	
	recruit = {

		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},

		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},


	},

	officer = {

		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},


		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},


	},	


	sergeant = {


		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code310charg',
			label = 'Charger10',
			type = 'LSPDTraffic'
		},

		{
			model = 'code314charg',
			label = 'Charger14',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318charg',
			label = 'Charger18',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},

		{
			model = 'code319silv',
			label = 'Silverado 19',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3ram',
			label = 'Dodge Ram',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},

	},	


	lieutenant = {
		
		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code310charg',
			label = 'Charger10',
			type = 'LSPDTraffic'
		},

		{
			model = 'code314charg',
			label = 'Charger14',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318charg',
			label = 'Charger18',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3ram',
			label = 'Dodge Ram',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},

		{
			model = 'code319silv',
			label = 'Silverado19',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},



		{
			model = 'code3mustang',
			label = 'Mustang',
			type = 'LSPDEDWARD'
		},
		
		{
			model = '2020camaro',
			label = 'Camaro',
			type = 'LSPDEDWARD'
		},

		{
			model = 'code320exp',
			label = 'Explorer20',
			type = 'LSPDEDWARD'
		},


		{
			model = 'code318chargk9',
			label = 'Charger K9',
			type = 'LSPDEDWARD'
		},
	


		{
			model = 'speedc8rb',
			label = 'C8',
			type = 'LSPDEDWARD'
		},


	},


	intendent = {
	
	
		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code310charg',
			label = 'Charger10',
			type = 'LSPDTraffic'
		},

		{
			model = 'code314charg',
			label = 'Charger14',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318charg',
			label = 'Charger18',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3ram',
			label = 'Dodge Ram',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},

		{
			model = 'code319silv',
			label = 'Silverado19',
			type = 'LSPDOffriad'
		},

	

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},

		
		
		{
			model = 'code3mustang',
			label = 'Mustang',
			type = 'LSPDEDWARD'
		},
		
		{
			model = '2020camaro',
			label = 'Camaro',
			type = 'LSPDEDWARD'
		},

		{
			model = 'code320exp',
			label = 'Explorer20',
			type = 'LSPDEDWARD'
		},


		{
			model = 'code318chargk9',
			label = 'Charger K9',
			type = 'LSPDEDWARD'
		},

	
		
		{
			model = 'speedc8rb',
			label = 'C8',
			type = 'LSPDEDWARD'
		},

	},

	
	zastepca = {
		

			{
				model = 'code3cvpi',
				label = 'Victoria',
				type = 'LSPDTraffic'
			},
			{
				model = 'code3cap',
				label = 'Caprice',
				type = 'LSPDTraffic'
			},
			{
				model = 'code316impala',
				label = 'Impala',
				type = 'LSPDTraffic'
			},
			{
				model = 'code3fpis',
				label = 'Taurus',
				type = 'LSPDTraffic'
			},

			{
				model = 'code310charg',
				label = 'Charger10',
				type = 'LSPDTraffic'
			},

			{
				model = 'code314charg',
				label = 'Charger14',
				type = 'LSPDTraffic'
			},

			{
				model = 'code318charg',
				label = 'Charger18',
				type = 'LSPDTraffic'
			},

			{
				model = 'code318tahoe',
				label = 'Tahoe18',
				type = 'LSPDOffriad'
			},

			{
				model = 'code3ram',
				label = 'Dodge Ram',
				type = 'LSPDOffriad'
			},

			{
				model = 'code3silverado',
				label = 'Silverado',
				type = 'LSPDOffriad'
			},

			{
				model = 'code319silv',
				label = 'Silverado19',
				type = 'LSPDOffriad'
			},

			{
				model = 'code3f150',
				label = 'Silverado f150',
				type = 'LSPDOffriad'
			},

			{
				model = 'code3durango',
				label = 'Durango',
				type = 'LSPDOffriad'
			},
			
		

			{
				model = 'code3mustang',
				label = 'Mustang',
				type = 'LSPDEDWARD'
			},

			{
				model = '2020camaro',
				label = 'Camaro',
				type = 'LSPDEDWARD'
			},

			{
				model = 'code320exp',
				label = 'Explorer20',
				type = 'LSPDEDWARD'
			},


			{
				model = 'code318chargk9',
				label = 'Charger K9',
				type = 'LSPDEDWARD'
			},


			
			{
				model = 'speedc8rb',
				label = 'C8',
				type = 'LSPDEDWARD'
			},

			{
				model = 'fibd',
				label = 'Dominator FBI',
				type = 'fib'
				},

				{
					model = 'umsierrabb',
					label = 'Sierra BB',
					type = 'fib'
					},	

				{
					model = 'nm_cam69',
					label = 'Camaro69',
					type = 'fib'
					},		

				{
					model = 'fusion18',
					label = 'Fusion 18',
					type = 'fib'
					},

			{
				model = 'fibg2',
				label = 'Gresley FBI',
				type = 'fib'
				},
		
			{
				model = 'fibn',
				label = 'Neon FBI',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},
				
				
			{
				model = 'sultan',
				label = 'Sultan',
				type = 'fib'
				},

		
			{
				model = 'fibr',
				label = 'Rumpo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibs',
				label = 'Speedo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibx',
				label = 'XLS FBI',
				type = 'fib'
				},
	
	

			{
				model = 'fbi',
				label = 'Unmarked Mercedes',
				type = 'fib'
				},

		

				{
					model = '300srt8leo',
					label = 'Hellcat SRT',
					type = 'fib'
					},

				{
					model = 'c8',
					label = 'Unmarked C8',
					type = 'fib'
					},
					
	
				{
					model = 'camaroBB',
					label = 'Camaro Blue',
					type = 'fib'
					},

				{
					model = 'fdsuv',
					label = 'Unmarked Durango',
					type = 'fib'
					},
			

		
				{
					model = 'zr1BB',
					label = 'Unmarked ZR1BB',
					type = 'fib'
					},


						

			
	
					{
						model = 'fdsuv',
						label = 'Unmarked Durango',
						type = 'fib'
						},
				
},



	chef = {
	
	
		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code310charg',
			label = 'Charger10',
			type = 'LSPDTraffic'
		},

		{
			model = 'code314charg',
			label = 'Charger14',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318charg',
			label = 'Charger18',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3ram',
			label = 'Dodge Ram',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},

		{
			model = 'code319silv',
			label = 'Silverado19',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3f150',
			label = 'Silverado f150',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},

		
	
		
		{
			model = 'code3mustang',
			label = 'Mustang',
			type = 'LSPDEDWARD'
		},
		
		{
			model = '2020camaro',
			label = 'Camaro',
			type = 'LSPDEDWARD'
		},

		{
			model = 'code320exp',
			label = 'Explorer20',
			type = 'LSPDEDWARD'
		},


		{
			model = 'code318chargk9',
			label = 'Charger K9',
			type = 'LSPDEDWARD'
		},



		{
			model = 'speedc8rb',
			label = 'C8',
			type = 'LSPDEDWARD'
		},
	},


	boss = {

		{
			model = 'code3cvpi',
			label = 'Victoria',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3cap',
			label = 'Caprice',
			type = 'LSPDTraffic'
		},
		{
			model = 'code316impala',
			label = 'Impala',
			type = 'LSPDTraffic'
		},
		{
			model = 'code3fpis',
			label = 'Taurus',
			type = 'LSPDTraffic'
		},

		{
			model = 'code310charg',
			label = 'Charger10',
			type = 'LSPDTraffic'
		},

		{
			model = 'code314charg',
			label = 'Charger14',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318charg',
			label = 'Charger18',
			type = 'LSPDTraffic'
		},

		{
			model = 'code318tahoe',
			label = 'Tahoe18',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3ram',
			label = 'Dodge Ram',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3silverado',
			label = 'Silverado',
			type = 'LSPDOffriad'
		},

		{
			model = 'code319silv',
			label = 'Silverado19',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3f150',
			label = 'Silverado f150',
			type = 'LSPDOffriad'
		},

		{
			model = 'code3durango',
			label = 'Durango',
			type = 'LSPDOffriad'
		},

		
	
		
		{
			model = 'code3mustang',
			label = 'Mustang',
			type = 'LSPDEDWARD'
		},
		
		{
			model = '2020camaro',
			label = 'Camaro',
			type = 'LSPDEDWARD'
		},

		{
			model = 'code320exp',
			label = 'Explorer20',
			type = 'LSPDEDWARD'
		},


		{
			model = 'code318chargk9',
			label = 'Charger K9',
			type = 'LSPDEDWARD'
		},


		
		{
			model = 'speedc8rb',
			label = 'C8',
			type = 'LSPDEDWARD'
		},

					{
				model = 'fibd',
				label = 'Dominator FBI',
				type = 'fib'
				},
		
			{
				model = 'fibg2',
				label = 'Gresley FBI',
				type = 'fib'
				},

				
				{
					model = 'umsierrabb',
					label = 'Sierra BB',
					type = 'fib'
					},	

				{
					model = 'nm_cam69',
					label = 'Camaro69',
					type = 'fib'
					},		

				{
					model = 'fusion18',
					label = 'Fusion 18',
					type = 'fib'
					},
		
			{
				model = 'fibn',
				label = 'Neon FBI',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

				
				
			{
				model = 'sultan',
				label = 'Sultan',
				type = 'fib'
				},

	
		
			{
				model = 'fibr',
				label = 'Rumpo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibs',
				label = 'Speedo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibx',
				label = 'XLS FBI',
				type = 'fib'
				},
	
	

			{
				model = 'fbi',
				label = 'Unmarked Mercedes',
				type = 'fib'
				},


				{
					model = '300srt8leo',
					label = 'Hellcat SRT',
					type = 'fib'
					},

				{
					model = 'c8',
					label = 'Unmarked C8',
					type = 'fib'
					},
					
				{
					model = 'camaro',
					label = 'Unmarked Camaro',
					type = 'fib'
					},
				{
					model = 'camaroBB',
					label = 'Camaro Blue',
					type = 'fib'
					},

				{
					model = 'fdsuv',
					label = 'Unmarked Durango',
					type = 'fib'
					},
		

			


	},


		agent = {

			{
				model = 'code3cvpi',
				label = 'Victoria',
				type = 'LSPDTraffic'
			},
			{
				model = 'code3cap',
				label = 'Caprice',
				type = 'LSPDTraffic'
			},
			{
				model = 'code316impala',
				label = 'Impala',
				type = 'LSPDTraffic'
			},
			{
				model = 'code3fpis',
				label = 'Taurus',
				type = 'LSPDTraffic'
			},
	
			{
				model = 'code310charg',
				label = 'Charger10',
				type = 'LSPDTraffic'
			},
	
			{
				model = 'code314charg',
				label = 'Charger14',
				type = 'LSPDTraffic'
			},
	
			{
				model = 'code318charg',
				label = 'Charger18',
				type = 'LSPDTraffic'
			},
	
			{
				model = 'code318tahoe',
				label = 'Tahoe18',
				type = 'LSPDOffriad'
			},
	
			{
				model = 'code3ram',
				label = 'Dodge Ram',
				type = 'LSPDOffriad'
			},
	
			{
				model = 'code3silverado',
				label = 'Silverado',
				type = 'LSPDOffriad'
			},
	
			{
				model = 'code319silv',
				label = 'Silverado19',
				type = 'LSPDOffriad'
			},
	
			{
				model = 'code3f150',
				label = 'Silverado f150',
				type = 'LSPDOffriad'
			},
	
			{
				model = 'code3durango',
				label = 'Durango',
				type = 'LSPDOffriad'
			},
			
			{
				model = 'code3mustang',
				label = 'Mustang',
				type = 'LSPDEDWARD'
			},
			
			{
				model = '2020camaro',
				label = 'Camaro',
				type = 'LSPDEDWARD'
			},
	
			{
				model = 'code320exp',
				label = 'Explorer20',
				type = 'LSPDEDWARD'
			},
	
	
			{
				model = 'code318chargk9',
				label = 'Charger K9',
				type = 'LSPDEDWARD'
			},
	


					{
				model = 'fibd',
				label = 'Dominator FBI',
				type = 'fib'
				},
		
			{
				model = 'fibg2',
				label = 'Gresley FBI',
				type = 'fib'
				},
		
			{
				model = 'fibn',
				label = 'Neon FBI',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

			
				{
					model = 'umsierrabb',
					label = 'Sierra BB',
					type = 'fib'
					},	

				{
					model = 'nm_cam69',
					label = 'Camaro69',
					type = 'fib'
					},		

				{
					model = 'fusion18',
					label = 'Fusion 18',
					type = 'fib'
					},	

			{
				model = 'umtahoeb',
				label = 'TahoeBB',
				type = 'fib'
				},

		
				
			{
				model = 'sultan',
				label = 'Sultan',
				type = 'fib'
				},


		
			{
				model = 'fibr',
				label = 'Rumpo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibs',
				label = 'Speedo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibx',
				label = 'XLS FBI',
				type = 'fib'
				},
	
		

			{
				model = 'fbi',
				label = 'Unmarked Mercedes',
				type = 'fib'
				},

		

	
	},
	

		recruit3 = {

				{
				model = 'fibd',
				label = 'Dominator FBI',
				type = 'fib'
				},
		
			{
				model = 'fibg2',
				label = 'Gresley FBI',
				type = 'fib'
				},
		
			{
				model = 'fibn',
				label = 'Neon FBI',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

			{
				model = 'UCTAXI',
				label = 'Taxi',
				type = 'fib'
				},

		
				
			{
				model = 'sultan',
				label = 'Sultan',
				type = 'fib'
				},

				{
					model = 'baller',
					label = 'Balller',
					type = 'fib'
					},

						{
					model = 'baller3',
					label = 'Balller3',
					type = 'fib'
					},
		
					{
						model = 'jackal',
						label = 'Jackal',
						type = 'fib'
						},	
						
						{
							model = 'landstalker2',
							label = 'Landstalker',
							type = 'fib'
							},						

		
			{
				model = 'fibr',
				label = 'Rumpo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibs',
				label = 'Speedo FBI',
				type = 'fib'
				},
		
			{
				model = 'fibx',
				label = 'XLS FBI',
				type = 'fib'
				},
	
		

			{
				model = 'fbi',
				label = 'Unmarked Mercedes',
				type = 'fib'
				},

		
				{
					model = '300srt8leo',
					label = 'Hellcat SRT',
					type = 'fib'
					},

				{
					model = 'c8',
					label = 'Unmarked C8',
					type = 'fib'
					},
					
				{
					model = 'camaro',
					label = 'Unmarked Camaro',
					type = 'fib'
					},
				{
					model = 'camaroBB',
					label = 'Camaro Blue',
					type = 'fib'
					},

				{
					model = 'fdsuv',
					label = 'Unmarked Durango',
					type = 'fib'
					},
		


				{
					model = 'zr1BB',
					label = 'Unmarked ZR1BB',
					type = 'fib'
					},



		},

			recruit2 = {


				{
					model = 'code3cvpi',
					label = 'Victoria',
					type = 'LSPDTraffic'
				},
		

		
			
			},
			
			officer2 = {
			
				{
					model = 'code3cvpi',
					label = 'Victoria',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3cap',
					label = 'Caprice',
					type = 'LSPDTraffic'
				},
				{
					model = 'code316impala',
					label = 'Impala',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3fpis',
					label = 'Taurus',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318tahoe',
					label = 'Tahoe18',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3silverado',
					label = 'Silverado',
					type = 'LSPDOffriad'
				},
			
			},
			
		
			
			sergeant2 = {
			
				{
					model = 'code3cvpi',
					label = 'Victoria',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3cap',
					label = 'Caprice',
					type = 'LSPDTraffic'
				},
				{
					model = 'code316impala',
					label = 'Impala',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3fpis',
					label = 'Taurus',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code310charg',
					label = 'Charger10',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code314charg',
					label = 'Charger14',
					type = 'LSPDTraffic'
				},

				{
					model = 'code318charg',
					label = 'Charger18',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318tahoe',
					label = 'Tahoe18',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3silverado',
					label = 'Silverado',
					type = 'LSPDOffriad'

			
				},

				{
					model = 'code319silv',
					label = 'Silverado19',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3durango',
					label = 'Durango',
					type = 'LSPDOffriad'
				},
			
			},
			
			intendent2 = {
			
			
				{
					model = 'code3cvpi',
					label = 'Victoria',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3cap',
					label = 'Caprice',
					type = 'LSPDTraffic'
				},
				{
					model = 'code316impala',
					label = 'Impala',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3fpis',
					label = 'Taurus',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code310charg',
					label = 'Charger10',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code314charg',
					label = 'Charger14',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318charg',
					label = 'Charger18',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318tahoe',
					label = 'Tahoe18',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3ram',
					label = 'Dodge Ram',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3silverado',
					label = 'Silverado',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code319silv',
					label = 'Silverado19',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3durango',
					label = 'Durango',
					type = 'LSPDOffriad'
				},

		
				{
					model = 'code3mustang',
					label = 'Mustang',
					type = 'LSPDEDWARD'
				},
				
				{
					model = '2020camaro',
					label = 'Camaro',
					type = 'LSPDEDWARD'
				},

					
				{
					model = 'code3f150',
					label = 'Fiat150',
					type = 'LSPDEDWARD'
				},
		
				{
					model = 'code320exp',
					label = 'Explorer20',
					type = 'LSPDEDWARD'
				},
		
		
				{
					model = 'code318chargk9',
					label = 'Charger K9',
					type = 'LSPDEDWARD'
				},
	

	
				{
					model = 'speedc8rb',
					label = 'C8',
					type = 'LSPDEDWARD'
				},
			
			},

			chef2 = {
			
			
				{
					model = 'code3cvpi',
					label = 'Victoria',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3cap',
					label = 'Caprice',
					type = 'LSPDTraffic'
				},
				{
					model = 'code316impala',
					label = 'Impala',
					type = 'LSPDTraffic'
				},
				{
					model = 'code3fpis',
					label = 'Taurus',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code310charg',
					label = 'Charger10',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code314charg',
					label = 'Charger14',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318charg',
					label = 'Charger18',
					type = 'LSPDTraffic'
				},
		
				{
					model = 'code318tahoe',
					label = 'Tahoe18',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3ram',
					label = 'Dodge Ram',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3silverado',
					label = 'Silverado',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code319silv',
					label = 'Silverado19',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3f150',
					label = 'Silverado f150',
					type = 'LSPDOffriad'
				},
		
				{
					model = 'code3durango',
					label = 'Durango',
					type = 'LSPDOffriad'
				},
				


				{
					model = 'code3mustang',
					label = 'Mustang',
					type = 'LSPDEDWARD'
				},
				
				{
					model = '2020camaro',
					label = 'Camaro',
					type = 'LSPDEDWARD'
				},
		
				{
					model = 'code320exp',
					label = 'Explorer20',
					type = 'LSPDEDWARD'
				},
		
		
				{
					model = 'code318chargk9',
					label = 'Charger K9',
					type = 'LSPDEDWARD'
				},
	
				
				{
					model = 'speedc8rb',
					label = 'C8',
					type = 'LSPDEDWARD'
				},
		
			
			},

			
}


-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 20,  ['tshirt_2'] = 0,
            ['torso_1'] = 19,   ['torso_2'] = 1,
      		['decals_1'] = 0,   ['decals_2'] = 0,
        	['arms'] = 50,
            ['pants_1'] = 17,   ['pants_2'] = 0,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
       		['helmet_1'] = 1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,   ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 14,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 36,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 48,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 58,  ['helmet_2'] = 2,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 19,  ['bproof_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 19,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 50,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 26,  ['helmet_2'] = 0,
			['chain_1'] = 21,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
                        ['bags_1'] = 9,    ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 46,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	sergeant_wear = {
		male = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 20,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 21,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['bags_1'] = 9,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 20,   ['torso_2'] = 1,
			['decals_1'] = 8,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 32,   ['shoes_2'] = 0,
			['helmet_1'] = 33,  ['helmet_2'] = 0,
			['chain_1'] = 21,   ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 0,   ['bproof_2'] = 0,
        	['bags_1'] = 9,     ['bags_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	chef_wear = {
		male = {
			        ['tshirt_1'] = 22,  ['tshirt_2'] = 0,
				['torso_1'] = 21,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 43,
				['pants_1'] = 16,   ['pants_2'] = 0,
				['shoes_1'] = 32,   ['shoes_2'] = 0,
				['helmet_1'] = 33,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 1,
				['arms'] = 44,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	intendent_wear = {
		male = {
			        ['tshirt_1'] = 17,  ['tshirt_2'] = 0,
				['torso_1'] = 20,   ['torso_2'] = 0,
				['decals_1'] = 8,   ['decals_2'] = 0,
				['arms'] = 46,
				['pants_1'] = 16,   ['pants_2'] = 0,
				['shoes_1'] = 32,   ['shoes_2'] = 0,
				['helmet_1'] = 33,  ['helmet_2'] = 0,
				['chain_1'] = 21,   ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 0,   ['bproof_2'] = 0,
               ['bags_1'] = 9,     ['bags_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 1,
				['arms'] = 44,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 22,  ['tshirt_2'] = 0,
				['torso_1'] = 21,   ['torso_2'] = 1,
				['decals_1'] = 0,   ['decals_2'] = 0,
				['arms'] = 43,
				['pants_1'] = 16,   ['pants_2'] = 0,
				['shoes_1'] = 32,   ['shoes_2'] = 0,
				['helmet_1'] = 33,  ['helmet_2'] = 0,
				['chain_1'] = 21,    ['chain_2'] = 0,
				['ears_1'] = 0,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0
			},
			female = {
				['tshirt_1'] = 35,  ['tshirt_2'] = 0,
				['torso_1'] = 48,   ['torso_2'] = 0,
				['decals_1'] = 7,   ['decals_2'] = 1,
				['arms'] = 44,
				['pants_1'] = 34,   ['pants_2'] = 0,
				['shoes_1'] = 27,   ['shoes_2'] = 0,
				['helmet_1'] = -1,  ['helmet_2'] = 0,
				['chain_1'] = 0,    ['chain_2'] = 0,
				['ears_1'] = 2,     ['ears_2'] = 0,
				['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	posterunkowy_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	sierzant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	detektyw_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	szeryf_wear = { -- currently the same as chef_wear
	male = {
		['tshirt_1'] = 22,  ['tshirt_2'] = 0,
        ['torso_1'] = 44,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 35,
        ['pants_1'] = 24,   ['pants_2'] = 0,
        ['shoes_1'] = 59,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 1,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = 66,  ['bproof_2'] = 0
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
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	chef2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 23,  ['tshirt_2'] = 0,
			['torso_1'] = 33,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 59,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 1,  ['bproof_2'] = 0
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
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	doa_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 239,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 19,
        ['pants_1'] = 72,   ['pants_2'] = 1,
        ['shoes_1'] = 33,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 1,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = 7,  ['bproof_2'] = 4
		},
		female = {
			['tshirt_1'] = 23,  ['tshirt_2'] = 0,
			['torso_1'] = 152,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 39,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 3,  ['bproof_2'] = 1
		}
	},

	doa_wear2 = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 23,  ['tshirt_2'] = 0,
        ['torso_1'] = 66,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 32,
        ['pants_1'] = 72,   ['pants_2'] = 2,
        ['shoes_1'] = 32,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 1,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = 7,  ['bproof_2'] = 4
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
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	hp_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 44,  ['tshirt_2'] = 0,
            ['torso_1'] = 75,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 41,	['arms_2'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 1,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 13,  ['helmet_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 2,  ['bproof_2'] = 0
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
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	moto_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 16,  ['tshirt_2'] = 0,
			['torso_1'] = 25,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['pants_1'] = 20,   ['pants_2'] = 0,
			['shoes_1'] = 38,   ['shoes_2'] = 0,
			['helmet_1'] = 24,  ['helmet_2'] = 0,
			['chain_1'] = 18,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 14,  ['bproof_2'] = 0
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
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},
	
	swat_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 33,  ['tshirt_2'] = 1,
			['torso_1'] = 22,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 46,
			['mask_1'] = 20,   ['mask_2'] = 0,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = 20,  ['helmet_2'] = 0,
			['chain_1'] = 18,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 52,  ['bproof_2'] = 0,
			['glasses_1'] = 0,    ['glasses_2'] = 0,
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

	crash_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 26,  ['tshirt_2'] = 0,
			['torso_1'] = 191,   ['torso_2'] = 0,
			['decals_1'] = 25,   ['decals_2'] = 0,
			['arms'] = 20,
			['mask_1'] = 59,   ['mask_2'] = 1,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = 116,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 38,  ['bproof_2'] = 5,
			['glasses_1'] = 0,    ['glasses_2'] = 0,
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

	crash2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 26,  ['tshirt_2'] = 0,
			['torso_1'] = 191,   ['torso_2'] = 0,
			['decals_1'] = 25,   ['decals_2'] = 0,
			['arms'] = 20,
			['mask_1'] = 0,   ['mask_2'] = 0,
			['pants_1'] = 16,   ['pants_2'] = 0,
			['shoes_1'] = 33,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 0,     ['ears_2'] = 0,
			['bproof_1'] = 38,  ['bproof_2'] = 5,
			['glasses_1'] = 0,    ['glasses_2'] = 0,
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
	
	swat_wear2 = { -- currently the same as chef_wear
	male = {
		['tshirt_1'] = 33,  ['tshirt_2'] = 1,
		['torso_1'] = 16,   ['torso_2'] = 3,
		['decals_1'] = 0,   ['decals_2'] = 0,
		['arms'] = 43,
		['mask_1'] = 20,   ['mask_2'] = 0,
		['pants_1'] = 16,   ['pants_2'] = 0,
		['shoes_1'] = 33,   ['shoes_2'] = 0,
		['helmet_1'] = 23,  ['helmet_2'] = 0,
		['chain_1'] = 18,    ['chain_2'] = 0,
		['ears_1'] = 0,     ['ears_2'] = 0,
		['bproof_1'] = 50,  ['bproof_2'] = 0,
		['glasses_1'] = 0,    ['glasses_2'] = 0,
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
		['bproof_1'] = 0,  ['bproof_2'] = 0
	}
},

pilot_wear = { -- currently the same as chef_wear
male = {
	['tshirt_1'] = 72,  ['tshirt_2'] = 0,
	['torso_1'] = 23,   ['torso_2'] = 0,
	['decals_1'] = 0,   ['decals_2'] = 0,
	['arms'] = 46,
	['mask_1'] = 0,   	['mask_2'] = 0,
	['pants_1'] = 19,   ['pants_2'] = 0,
	['shoes_1'] = 33,   ['shoes_2'] = 0,
	['helmet_1'] = 28,  ['helmet_2'] = 0,
	['chain_1'] = 18,    ['chain_2'] = 0,
	['ears_1'] = 0,     ['ears_2'] = 0,
	['bproof_1'] = 0,  ['bproof_2'] = 0
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

correction_wear = { -- currently the same as chef_wear
male = {
	['tshirt_1'] = 24,  ['tshirt_2'] = 0,
	['torso_1'] = 158,   ['torso_2'] = 3,
	['decals_1'] = 0,   ['decals_2'] = 0,
	['arms'] = 32,
	['pants_1'] = 72,   ['pants_2'] = 0,
	['shoes_1'] = 32,   ['shoes_2'] = 0,
	['helmet_1'] = -1,  ['helmet_2'] = 0,
	['chain_1'] = 1,    ['chain_2'] = 0,
	['ears_1'] = -1,     ['ears_2'] = 0,
	['bproof_1'] = 7,  ['bproof_2'] = 3
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

correction2_wear = { -- currently the same as chef_wear
male = {
	['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 109,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 78,
            ['pants_1'] = 75,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 10,  ['helmet_2'] = 6,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 7,  ['bproof_2'] = 3
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

rower_wear = { -- currently the same as chef_wear
male = {
	['tshirt_1'] = 22,  ['tshirt_2'] = 0,
	['torso_1'] = 16,   ['torso_2'] = 2,
	['decals_1'] = 0,   ['decals_2'] = 0,
	['arms'] = 43,
	['mask_1'] = 0,   	['mask_2'] = 0,
	['pants_1'] = 21,   ['pants_2'] = 0,
	['shoes_1'] = 2,   ['shoes_2'] = 0,
	['helmet_1'] = 25,  ['helmet_2'] = 0,
	['chain_1'] = 0,    ['chain_2'] = 0,
	['ears_1'] = 2,     ['ears_2'] = 0,
	['bproof_1'] = 14,  ['bproof_2'] = 0
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

hplongchuj_wear = { -- gumis chuj
male = {
	['tshirt_1'] = 33,  ['tshirt_2'] = 0,
	['torso_1'] = 83,   ['torso_2'] =2,
    ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 45,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 13,  ['helmet_2'] = 2,
            ['chain_1'] = 18,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 66,  ['bproof_2'] = 0
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

hpshortchuj_wear = { -- gumis chuj
male = {
    ['tshirt_1'] = 30,  ['tshirt_2'] = 0,
            ['torso_1'] = 175,   ['torso_2'] =0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 43,
            ['pants_1'] = 72,   ['pants_2'] = 3,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 13,  ['helmet_2'] = 2,
            ['chain_1'] = 16,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 1,  ['bproof_2'] = 0
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

hpjacketchuj_wear = { -- gumis chuj
male = {
    ['tshirt_1'] = 94,  ['tshirt_2'] = 0,
            ['torso_1'] = 160,   ['torso_2'] =0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 19,
            ['pants_1'] = 72,   ['pants_2'] = 3,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 13,  ['helmet_2'] = 2,
            ['chain_1'] = 16,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 67,  ['bproof_2'] = 0
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

hpdowodca_wear = { -- gumis chuj
male = {
['tshirt_1'] = 20,  ['tshirt_2'] = 0,
            ['torso_1'] = 88,   ['torso_2'] =6,
            ['decals_1'] = 29,   ['decals_2'] = 5,
            ['arms'] = 0,
            ['pants_1'] = 17,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0, 
            ['chain_1'] = 18,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
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
highwaykamz_wear = { -- gumis chuj
male = {
['bproof_1'] = 71, ['bproof_2'] = 2,
},
female = {
['bproof_1'] = 10, ['bproof_2'] = 2,
}
},
highwaykamzkulodoporna_wear = { -- gumis chuj
male = {
['bproof_1'] = 65, ['bproof_2'] = 0,
},
female = {
['bproof_1'] = 10, ['bproof_2'] = 2,
}
},
bullet_wear = {
male = {
	['bproof_1'] = 17,  ['bproof_2'] = 0,
},
female = {
	['bproof_1'] = 13,  ['bproof_2'] = 1
}
},
kask_wear = {
male = {
	['helmet_1'] = 20,  ['helmet_2'] =  0,
},
female = {
	['helmet_1'] = 123,  ['helmet_2'] =  15
}
},
gilet_wear = {
male = {
	['bproof_1'] = 14,  ['bproof_2'] = 0,
},
female = {
	['tshirt_1'] = 36,  ['tshirt_2'] = 1
}
},


	--- STROJE SO ---

	recruit2_wear = { -- currently the same as chef_wear
	male = {
		['tshirt_1'] = 20,  ['tshirt_2'] = 0,
        ['torso_1'] = 31,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 32,
        ['pants_1'] = 24,   ['pants_2'] = 0,
        ['shoes_1'] = 59,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 1,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = 63,  ['bproof_2'] = 1
	},
	female = {
		['tshirt_1'] = 35,  ['tshirt_2'] = 0,
		['torso_1'] = 48,   ['torso_2'] = 0,
		['decals_1'] = 7,   ['decals_2'] = 3,
		['arms'] = 44,		['arms_2'] = 0,
		['pants_1'] = 46,   ['pants_2'] = 0,
		['shoes_1'] = 27,   ['shoes_2'] = 0,
		['helmet_1'] = -1,  ['helmet_2'] = 0,
		['chain_1'] = 0,    ['chain_2'] = 0,
		['ears_1'] = 2,     ['ears_2'] = 0,
		['bproof_1'] = 13,  ['bproof_2'] = 0
		}
	},
		swatso_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 20,  ['tshirt_2'] = 0,
			['torso_1'] = 38,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 19,
			['pants_1'] = 22,   ['pants_2'] = 0,
			['shoes_1'] = 43,   ['shoes_2'] = 0,
			['helmet_1'] = 36,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 2,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 44,  ['bproof_2'] = 1
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,		['arms_2'] = 0,
			['pants_1'] = 46,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 13,  ['bproof_2'] = 0
		}
	},

	officer2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 17,  ['tshirt_2'] = 0,
			['torso_1'] = 29,   ['torso_2'] = 0,
			['decals_1'] = 10,   ['decals_2'] = 0,
			['arms'] = 32,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 59,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 1,  ['bproof_2'] = 0
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

	sergeant2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 20,  ['tshirt_2'] = 0,
			['torso_1'] = 30,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 33,
			['pants_1'] = 24,   ['pants_2'] = 0,
			['shoes_1'] = 59,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 1,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 1,  ['bproof_2'] = 0
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

	intendent2_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 21,  ['tshirt_2'] = 0,
        ['torso_1'] = 34,   ['torso_2'] = 0,
        ['decals_1'] = 0,   ['decals_2'] = 0,
        ['arms'] = 33,
        ['pants_1'] = 24,   ['pants_2'] = 0,
        ['shoes_1'] = 59,   ['shoes_2'] = 0,
        ['helmet_1'] = -1,  ['helmet_2'] = 0,
        ['chain_1'] = 1,    ['chain_2'] = 0,
        ['ears_1'] = -1,     ['ears_2'] = 0,
        ['bproof_1'] = 1,  ['bproof_2'] = 0
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

	------- FIB FIB FIB FIB -----------------


	IAA_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 111,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 44,
            ['pants_1'] = 26,   ['pants_2'] = 0,
            ['shoes_1'] = 1,   ['shoes_2'] = 14,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	bojowy_wear = {
		male = {
			['tshirt_1'] = 24,  ['tshirt_2'] = 0,
            ['torso_1'] = 108,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 32,
            ['pants_1'] = 72,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 62, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	windbreaker_wear = {
		male = {
			['tshirt_1'] = 11,  ['tshirt_2'] = 2,
            ['torso_1'] = 95,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 4,   ['pants_2'] = 2,
            ['shoes_1'] = 12,   ['shoes_2'] = 6,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 0,
            ['mask_1'] = 0, 		['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	windbreaker_wear2 = {
		male = {
			['tshirt_1'] = 11,  ['tshirt_2'] = 2,
            ['torso_1'] = 93,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 69,   ['pants_2'] = 3,
            ['shoes_1'] = 12,   ['shoes_2'] = 6,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 0,
            ['mask_1'] = 0, 	['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	bojowy_wear2 = {
		male = {
		['tshirt_1'] = 24,  ['tshirt_2'] = 0,
            ['torso_1'] = 106,   ['torso_2'] = 2,
            ['decals_1'] = 28,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 72,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 20,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 79, ['bproof_2'] = 2,
            ['mask_1'] = 0, ['mask_2'] =  0

		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	elegancki_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 27,   ['torso_2'] = 4,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 42,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 13,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 62, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 21,  ['bproof_2'] = 3
		}
	},

	dzienny_wear = {
		male = {
			['tshirt_1'] = 24,  ['tshirt_2'] = 0,
            ['torso_1'] = 108,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 32,
            ['pants_1'] = 69,   ['pants_2'] = 3,
            ['shoes_1'] = 12,   ['shoes_2'] = 6,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 73, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	dzienny_wear2 = {
		male = {
			['tshirt_1'] = 45,  ['tshirt_2'] = 0,
            ['torso_1'] = 3,   ['torso_2'] = 13,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 42,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['chain_1'] = 10,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 75, ['bproof_2'] = 0,
            ['mask_1'] = 0, ['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},



	bojowy_wear3 = {
		male = {
			['tshirt_1'] = 24,  ['tshirt_2'] = 0,
            ['torso_1'] = 106,   ['torso_2'] = 2,
            ['decals_1'] = 28,   ['decals_2'] = 0,
            ['arms'] = 24,
            ['pants_1'] = 72,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 20,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 5, ['bproof_2'] = 1,
            ['mask_1'] = 0, ['mask_2'] =  0
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},



	garnitur_wear = {
		male = {
			['tshirt_1'] = 21,  ['tshirt_2'] = 4,
            ['torso_1'] = 4,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 22,
            ['pants_1'] = 22,   ['pants_2'] = 0,
            ['shoes_1'] = 40,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 21, ['bproof_2'] = 3,
            ['mask_1'] = 11, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	przykrywka_wear = {
		male = {
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
            ['torso_1'] = 250,   ['torso_2'] = 0,
            ['decals_1'] = 58,   ['decals_2'] = 0,
            ['arms'] = 85,
            ['pants_1'] = 96,   ['pants_2'] = 0,
            ['shoes_1'] = 2,   ['shoes_2'] = 9,
            ['helmet_1'] = 122,  ['helmet_2'] = 0,
            ['chain_1'] = 126,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 11, ['mask_2'] = 0,
            ['bags_1'] = 21, ['bags_2'] = 10,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	----------------------------------GUMIS JEGO STROJE FIB---------------------------------


	bojowy_wear3 = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 97,   ['torso_2'] = 2,
            ['decals_1'] = 28,   ['decals_2'] = 0,
            ['arms'] = 36,
            ['pants_1'] = 75,   ['pants_2'] = 1,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = 140,  ['helmet_2'] = 0,
            ['chain_1'] = 1,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 37, ['bproof_2'] = 1,
            ['mask_1'] = 59, ['mask_2'] =  1
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},


	garnitur_wear = {
		male = {
			['tshirt_1'] = 21,  ['tshirt_2'] = 4,
            ['torso_1'] = 4,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 22,
            ['pants_1'] = 22,   ['pants_2'] = 0,
            ['shoes_1'] = 40,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 21, ['bproof_2'] = 3,
            ['mask_1'] = 11, ['mask_2'] = 0,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},

	przykrywkaEMS_wear = {
		male = {
			['tshirt_1'] = 129,  ['tshirt_2'] = 0,
            ['torso_1'] = 250,   ['torso_2'] = 0,
            ['decals_1'] = 58,   ['decals_2'] = 0,
            ['arms'] = 85,
            ['pants_1'] = 96,   ['pants_2'] = 0,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = 122,  ['helmet_2'] = 0,
            ['chain_1'] = 126,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0, ['bproof_2'] = 0,
            ['mask_1'] = 11, ['mask_2'] = 0,
            ['bags_1'] = 21, ['bags_2'] = 10,
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0
		}
	},



	kamizelka_wear = {
		male = {
			['bproof_1'] = 62, ['bproof_2'] = 0,
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},

	sheriff_kamza = {
		male = {
			['bproof_1'] = 27, ['bproof_2'] = 0,
		},
		female = {
			['bproof_1'] = 6,  ['bproof_2'] = 0
		}
	},


	torba_wear = {
		male = {
			['bags_1'] = 31,  ['bags_2'] = 0
		},
		female = {
			['bags_1'] = 13,  ['bags_2'] = 1
		}
	},
	identy_wear = {
		male = {
			['bproof_1'] = 74, ['bproof_2'] = 3, 
		},
		female = {
			['helmet_1'] = 123,  ['helmet_2'] =  15 
		}
	},

}
