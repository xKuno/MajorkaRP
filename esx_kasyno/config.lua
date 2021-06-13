Config              = {}
Config.DrawDistance = 25.0
Config.MaxDelivery	= 8
Config.TruckPrice	= 0
Config.Locale = 'en'

Config.Trucks = {
	"burrito3",
	"boxville",
	"tiptruck",
	"bodhi2",
	"kalahari",
	"tourbus",
	"trash",
	"scrap",
	"bison",
	"youga",
	"surfer",
	"youga2"
}

Config.Cloakroom = {
    CloakRoom = {
            Pos   = {x = 820.26, y = -2365.33, z = 29.41},
            Size  = {x = 1.0, y = 1.0, z = 1.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 27
        },
}

Config.Zones = {
    VehicleSpawner = {
            Pos   = {x = 822.87, y = -2355.9, z = 29.37},
            Size  = {x = 3.0, y = 3.0, z = 1.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 27
        },

    VehicleSpawnPoint = {
            Pos   = {x = 832.75, y = -2348.96, z = 30.15},
            Size  = {x = 3.0, y = 3.0, z = 1.0},
            Type  = -1
        },
}
Config.Livraison = {
-------------------------------------------Los Santos
	-- Strawberry avenue et Davis avenue
	Delivery1LS = {
			Pos   = {x = 121.0655, y = -1488.4984, z = 28.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- a cot? des flic
	Delivery2LS = {
			Pos   = {x = 459.4836, y = -641.76, z = 28.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- vers la plage
	Delivery3LS = {
			Pos   = {x = -1468.64, y = -923.6420, z = 10.03},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- studio 1
	Delivery4LS = {
			Pos   = {x = -1064.7435, y = -553.4235, z = 32.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- popular street et el rancho boulevard
	Delivery5LS = {
			Pos   = {x = 809.5350, y = -2024.2238, z = 28.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	--Alta street et las lagunas boulevard
	Delivery6LS = {
			Pos   = {x = 63.2668, y = -227.9965, z = 50.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery7LS = {
			Pos   = {x = -1338.6923, y = -402.4188, z = 34.9},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	--Rockford Drive Noth et boulevard del perro
	Delivery8LS = {
			Pos   = {x = 548.6097, y = -206.3496, z = 52.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	--New empire way (airport)
	Delivery9LS = {
			Pos   = {x = -1141.9106, y = -2699.9340, z = 13.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	--Rockford drive south
	Delivery10LS = {
			Pos   = {x = -640.0313, y = -1224.9519, z = 10.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
------------------------------------------- Blaine County
	-- panorama drive
	Delivery1BC = {
			Pos   = {x = 1999.5457, y = 3055.0686, z = 45.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- route 68
	Delivery2BC = {
			Pos   = {x = 555.4768, y = 2733.9533, z = 41.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Algonquin boulevard et cholla springs avenue
	Delivery3BC = {
			Pos   = {x =1685.1549, y = 3752.0849, z = 33.0},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Joshua road
	Delivery4BC = {
			Pos   = {x = 182.7030, y = 2793.9829, z = 44.5},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- East joshua road
	Delivery5BC = {
			Pos   = {x = 2710.6799, y = 4335.3168, z = 44.8},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Seaview road
	Delivery6BC = {
			Pos   = {x = 1930.6518, y = 4637.5878, z = 39.3},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Paleto boulevard
	Delivery7BC = {
			Pos   = {x = 2280.1938, y = 4983.8686, z = 42.01},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Paleto boulevard et Procopio drive
	Delivery8BC = {
			Pos   = {x = 1967.97, y = 5164.11, z = 47.53},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Marina drive et joshua road
	Delivery9BC = {
			Pos   = {x = 916.6915, y = 3568.7783, z = 32.7},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	-- Pyrite Avenue
	Delivery10BC = {
			Pos   = {x = 2045.1533, y = 3185.2793, z = 44.97},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	
	RetourCamion = {
			Pos   = {x = 833.63, y = -2365.32, z = 29.67},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 5.0, y = 5.0, z = 3.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	
	AnnulerMission = {
			Pos   = {x = 842.72, y = -2339.99, z = 29.73},
			Color = {r = 204, g = 204, b = 0},
			Size  = {x = 8.0, y = 8.0, z = 4.0},
			Color = {r = 204, g = 204, b = 0},
			Type  = 27,
			Paye = 6250
		},
	}