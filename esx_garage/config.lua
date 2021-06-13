Config = {}
Config.Locale = 'en'

Config.MenuAlign = 'center'
Config.DrawDistance = 10

Config.PriceUbezpieczalnia = 30000
Config.PriceZUbezpieczalnia = 15000

Config.UseCommand = false -- Will allow players to do /getproperties instead of having to log out & back in to see Private Garages.
Config.ParkVehicles = true -- true = Automatically Park all Vehicles in Garage on Server/Script Restart | false = Opposite of true but players will have to go to Pound to get their Vehicle Back.
Config.KickPossibleCheaters = true -- true = Kick Player that tries to Cheat Garage by changing Vehicle Hash/Plate.
Config.UseCustomKickMessage = false -- true = Sets Custom Kick Message for those that try to Cheat. Note: "Config.KickPossibleCheaters" must be true.

Config.GiveSocietyMoney = false -- true = Gives money to society_mechanic. Note: REQUIRES esx_mechanicjob.*
Config.ShowVehicleLocation = true -- true = Will show Location of Vehicles in the Garage Menus.
Config.ShowSpacers = true -- true = Shows Spacers in Menus.

Config.PointMarker = {Type = 1, r = 0, g = 255, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Green Color / Standard Size Circle.
Config.DeleteMarker = {Type = 1, r = 255, g = 0, b = 0, x = 5.0, y = 5.0, z = 1.0} -- Red Color / Big Size Circle.
Config.PoundMarker = {Type = 1, r = 0, g = 0, b = 100, x = 1.5, y = 1.5, z = 1.0} -- Blue Color / Standard Size Circle.
Config.JPoundMarker = {Type = 1, r = 255, g = 0, b = 0, x = 1.5, y = 1.5, z = 1.0} -- Red Color / Standard Size Circle.

Config.GarageBlip = {Sprite = 290, Color = 38, Display = 2, Scale = 0.7} -- Public Garage Blip.
Config.PGarageBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 0.7} -- Private Garage Blip.
Config.PoundBlip = {Sprite = 67, Color = 64, Display = 2, Scale = 0.7} -- Pound Blip.
Config.JGarageBlip = {Sprite = 290, Color = 49, Display = 2, Scale = 0.7} -- Job Garage Blip.
Config.JPoundBlip = {Sprite = 290, Color = 53, Display = 2, Scale = 0.7} -- Job Pound Blip.

Config.PoundWait = 1 -- How many Minutes someone must wait before Opening Pound Menu Again.
Config.JPoundWait = 2.5 -- How many Minutes someone must wait before Opening Job Pound Menu Again.

Config.UseDamageMult = true -- true = Costs more to Store a Broken/Damaged Vehicle.
Config.DamageMult = 1 -- Higher Number = Higher Repair Price.

Config.UsingAdvancedVehicleShop = false -- Set to true if using esx_advancedvehicleshop

Config.UseAmbulanceGarages = false -- true = Allows use of Ambulance Garages.
Config.UseAmbulancePounds = false -- true = Allows use of Ambulance Pounds.
Config.UseAmbulanceBlips = false -- true = Use Ambulance Blips.
Config.AmbulancePoundPrice = 80 -- How much it Costs to get Vehicle from Ambulance Pound.

Config.UsePoliceGarages = false -- true = Allows use of Police Garages.
Config.UsePolicePounds = false -- true = Allows use of Police Pounds.
Config.UsePoliceBlips = false -- true = Use Police Blips.
Config.PolicePoundPrice = 65 -- How much it Costs to get Vehicle from Police Pound.

Config.UseAircraftGarages = true -- true = Allows use of Aircraft Garages.
Config.UseAircraftBlips = true -- true = Use Aircraft Blips.
Config.AircraftPoundPrice = 7500 -- How much it Costs to get Vehicle from Aircraft Pound.

Config.UseBoatGarages = true -- true = Allows use of Boat Garages.
Config.UseBoatBlips = true -- true = Use Boat Blips.
Config.BoatPoundPrice = 7500 -- How much it Costs to get Vehicle from Boat Pound.

Config.UseCarGarages = true -- true = Allows use of Car Garages.
Config.UseCarBlips = true -- true = Use Car Blips.
Config.CarPoundPrice = 30000 -- How much it Costs to get Vehicle from Car Pound.

Config.UsePrivateCarGarages = true -- true = Allows use of Private Car Garages.

-- Marker = Enter Location | Spawner = Spawn Location | Spawner2 = Job Aircraft Spawn Location | Deleter = Delete Location
-- Deleter2 = Job Aircraft Delete Location | Heading = Spawn Heading | Heading2 = Job Aircraft Spawn Heading

-- Start of Ambulance
Config.AmbulanceGarages = {
	Los_Santos = {
		Marker = vector3(302.95, -1453.5, 28.97),
		Spawner = vector3(300.33, -1431.91, 29.8),
		Spawner2 = vector3(313.36, -1465.17, 46.51),
		Deleter = vector3(300.33, -1431.91, 28.8),
		Deleter2 = vector3(313.36, -1465.17, 45.51),
		Heading = 226.71,
		Heading2 = 318.34
	}
}

Config.AmbulancePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Ambulance

-- Start of Police
Config.PoliceGarages = {
	Los_Santos = {
		Marker = vector3(425.41, -1003.43, 29.71),
		Spawner = vector3(434.28, -1015.8, 28.83),
		Spawner2 = vector3(449.21, -981.35, 43.69),
		Deleter = vector3(462.95, -1014.56, 27.07),
		Deleter2 = vector3(449.21, -981.35, 42.69),
		Heading = 90.46,
		Heading2 = 184.53
	}
}

Config.PolicePounds = {
	Los_Santos = {
		Marker = vector3(374.42, -1620.68, 28.29),
		Spawner = vector3(391.74, -1619.0, 28.29),
		Heading = 318.34
	}
}
-- End of Police

-- Start of Aircrafts
Config.AircraftGarages = {
	Los_Santos_Airport = {
		Marker = vector3(-1617.14, -3145.52, 12.99),
		Spawner = vector3(-1657.99, -3134.38, 12.99),
		Deleter = vector3(-1642.12, -3144.25, 12.99),
		Heading = 330.11
	},
	--[[Prywany_airport = {
		Marker = vector3(-88.69, 819.9, 239.0),
		Spawner = vector3(-73.95, 824.98, 239.6),
		Deleter = vector3(-73.95, 824.98, 239.6),
		Heading = 82.28
	},]]
	Sandy_Shores_Airport = {
		Marker = vector3(1723.84, 3288.29, 40.16),
		Spawner = vector3(1710.85, 3259.06, 40.69),
		Deleter = vector3(1714.45, 3246.75, 40.07),
		Heading = 104.66
	},
	Grapeseed_Airport = {
		Marker = vector3(2152.83, 4797.03, 40.19),
		Spawner = vector3(2122.72, 4804.85, 40.78),
		Deleter = vector3(2082.36, 4806.06, 40.07),
		Heading = 115.04
	},

}

Config.AircraftPounds = {
	Los_Santos_Airport = {
		Marker = vector3(-1243.0, -3391.92, 12.94),
		Spawner = vector3(-1272.27, -3382.46, 12.94),
		Heading = 330.25
	}
}
-- End of Aircrafts

-- Start of Boats
Config.BoatGarages = {
	Los_Santos_Dock = {
		Marker = vector3(-735.87, -1325.08, 0.6),
		Spawner = vector3(-718.87, -1320.18, -0.47),
		Deleter = vector3(-731.15, -1334.71, -0.47),
		Heading = 45.0
	},
	Sandy_Shores_Dock = {
		Marker = vector3(1333.2, 4269.92, 30.5),
		Spawner = vector3(1334.61, 4264.68, 29.86),
		Deleter = vector3(1323.73, 4269.94, 29.86),
		Heading = 87.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-283.74, 6629.51, 6.3),
		Spawner = vector3(-290.46, 6622.72, -0.47),
		Deleter = vector3(-304.66, 6607.36, -0.47),
		Heading = 52.0
	},
	Kurwa_mac = {
		Marker = vector3(-779.52, -1495.08, 1.01),
		Spawner = vector3(-861.84, -1555.32, 4.36),
		Deleter = vector3(-913.84, -1614.32, -0.47),
		Heading = 137.28
	},
	Garaz = {
		Marker = vector3(714.1, 4099.92, 35.79 - 0.90),
		Spawner = vector3(703.07, 4100.06, 30.1),
		Deleter = vector3(703.07, 4100.06, 30.1),
		Heading = 67.28
	},

	CajoPerico = {
		Marker = vector3(5153.47265625, -4656.84375, 1.4271240234375 - 0.90),
		Spawner = vector3(5133.40234375, -4657.7802734375, -0.3421630859375 ),
		Deleter = vector3(5133.40234375, -4657.7802734375, -0.3421630859375),
		Heading = 190.77
	}
}

Config.BoatPounds = {
	Los_Santos_Dock = {
		Marker = vector3(-738.67, -1400.43, 4.0),
		Spawner = vector3(-738.33, -1381.51, 0.12),
		Heading = 137.85
	}
	--[[Sandy_Shores_Dock = {
		Marker = vector3(1299.36, 4217.93, 32.91),
		Spawner = vector3(1294.35, 4226.31, 29.86),
		Heading = 345.0
	},
	Paleto_Bay_Dock = {
		Marker = vector3(-270.2, 6642.43, 6.36),
		Spawner = vector3(-290.38, 6638.54, -0.47),
		Heading = 130.0
	}]]--
}
-- End of Boats

-- Start of Cars
Config.CarGarages = {
	Los_Santos = {
		Marker = vector3(215.80, -810.06, 29.73),
		Spawner = vector3(229.70, -800.12, 29.57),
		Deleter = vector3(223.80, -760.42, 29.65),
		Heading = 157.84
	},
	Sandy_Shores = {
		Marker = vector3(1737.59, 3710.2, 33.14),
		Spawner = vector3(1737.84, 3719.28, 33.04),
		Deleter = vector3(1722.66, 3713.74, 33.21),
		Heading = 21.22
	},
	Sandy_Shores2 = {
		Marker = vector3(1705.4505615234, 4795.0551757813, 40.970927734375), 
		Spawner = vector3(1716.158203125, 4803.0859375, 41.731811523438),
		Deleter = vector3(1719.4154052734, 4808.7822265625, 40.684428710938),
		Heading = 90.22
	},

	Winogroniarz_LS1 = {
		Marker = vector3(-1933.65, 2038.87, 139.83), 
		Spawner = vector3(-1911.34, 2031.0, 139.74),
		Deleter = vector3(-1922.78, 2040.86, 139.83),
		Heading = 90.22
	},

	Gopostal_LS1 = {
		Marker = vector3(53.52, 115.11, 78.2), 
		Spawner = vector3(64.68, 115.02, 79.09),
		Deleter = vector3(62.82, 126.6, 78.2),
		Heading = 162.22
	},

	Paleto_Bay = {
		Marker = vector3(152.09,6645.476,30.6),
		Spawner = vector3(144.48,6636.01,31.02),
		Deleter = vector3(147.96,6627.26,30.7),
		Heading = 132.0
	},
	
	Seul_LS = {
        Marker = vector3(-695.54, -762.75, 32.68),
        Spawner = vector3(-703.51, -757.81, 33.11),
        Deleter = vector3(-704.51, -763.36, 33.19),
        Heading = 274.68
    },
	Urzednicza_LS = {
        Marker = vector3(332.17, -205.02, 53.09),
        Spawner = vector3(325.33, -208.72, 53.09),
        Deleter = vector3(323.64, -203.2, 53.09),
        Heading = 160.79
    },

	KASYNOSZEF = {
        Marker = vector3(886.75, -0.17, 78.0209),
        Spawner = vector3(891.37, 9.35, 78.0209),
        Deleter = vector3(891.37, 9.35, 78.0209),
        Heading = 240.79
    },

	Szpital_LS = {
        Marker = vector3(-494.73, -325.86, 34.11),
        Spawner = vector3(-491.5, -336.11, 33.75),
        Deleter = vector3(-490.17, -329.6, 33.74),
        Heading = 170.08
    },
  	

	Biednadzielnica_LS = {
        Marker = vector3(1005.45, -1855.74, 30.04),
        Spawner = vector3(994.08, -1863.94, 29.89),
        Deleter = vector3(995.49, -1858.36, 29.89),
        Heading = 172.09
	},

	Eclipe_LS = {
        Marker = vector3(-796.02, 336.7, 84.7),
        Spawner = vector3(-797.95, 323.12, 84.7),
        Deleter = vector3(-800.91, 335.78, 84.7),
        Heading = 178.35
	},
	Walkers_LS = {
        Marker = vector3(259.37, -3059.83, 4.80),
        Spawner = vector3(253.98, -3058.27, 5.61),
        Deleter = vector3(271.85, -3052.99, 4.90),
        Heading = 134.54
	},
	Lotnisko_LS = {
        Marker = vector3(-928.74, -2543.95, 14.30),
        Spawner = vector3(-935.46, -2542.59, 13.45),
        Deleter = vector3(-926.2, -2548.29, 13.00),
        Heading = 154.49
	},
	Zachodnie_LS = {
        Marker = vector3(-2952.89, 49.57, 10.20),
        Spawner = vector3(-2951.18, 54.75, 11.01),
        Deleter = vector3(-2968.11, 72.36, 10.20),
        Heading = 66.28
	},
	Grove_LS = {
        Marker = vector3(-75.01, -1825.01, 25.50),
        Spawner = vector3(-70.69, -1822.77, 26.34),
        Deleter = vector3(-54.11, -1846.39, 25.00),
        Heading = 230.48
    },
    Mecano_LS = {
        Marker = vector3(-360.49, -127.01, 38.7 -0.90),
        Spawner = vector3(-358.0, -120.61, 38.7),
        Deleter = vector3(-358.0, -120.61, 38.7 -0.90),
        Heading = 69.71
    },
	Krawiec = {
        Marker = vector3(684.11, -964.64, 23.07 - 0.90),
        Spawner = vector3(691.58, -960.37, 23.65 ),
        Deleter = vector3(691.58, -960.37, 23.65 - 0.90),
        Heading = 178.8
    },
    OsiedleKamilaIMasla_LS = {
        Marker = vector3(1372.22, -569.7, 73.34),
        Spawner = vector3(1367.67, -579.7, 73.34),
        Deleter = vector3(1367.67, -579.7, 73.34),
        Heading = 52.28
    },

	Wiezienie = {
        Marker = vector3(1855.6483154297, 2620.9978027344, 45.05126953125 -0.80),
        Spawner = vector3(1865.2879638672, 2618.3735351563, 45.05126953125),
        Deleter = vector3(1865.2879638672, 2618.3735351563, 45.05126953125 - 0.80),
        Heading = 180.28
    },

	Szpital_Viceory = {
        Marker = vector3(-817.22637939453, -1209.82421875, 6.920166015625 -0.90),
        Spawner = vector3(-821.9736328125, -1203.3494873047, 6.920166015625),
        Deleter = vector3(-821.9736328125, -1203.3494873047, 6.920166015625 - 0.90),
        Heading = 58.4
    },

	Ubezpieczalnia = {
        Marker = vector3(420.92309570313, -1638.9494628906, 29.279907226563  -0.90),
        Spawner = vector3(413.32748413086, -1642.4967041016, 29.279907226563 ),
        Deleter = vector3(413.32748413086, -1642.4967041016, 29.279907226563  - 0.90),
        Heading = 186.67
    },

	Cayo = {
        Marker = vector3(4466.5053710938, -4475.1430664063, 4.3590087890625  -0.90),
        Spawner = vector3(4473.5869140625, -4481.0375976563, 4.207275390625),
        Deleter = vector3(4473.5869140625, -4481.0375976563, 4.207275390625  - 0.90),
        Heading = 195.87
    },

	CayoPrzystan = {
        Marker = vector3(5171.68359375, -4655.6176757813, 2.5223388671875  -0.90),
        Spawner = vector3(5172.3955078125, -4646.0307617188, 2.5391845703125),
        Deleter = vector3(5172.3955078125, -4646.0307617188, 2.5391845703125  - 0.90),
        Heading = 345.89
    },

	CayoMasiteczko = {
        Marker = vector3(4976.9799804688, -5723.8813476563, 19.877685546875  -0.90),
        Spawner = vector3(4976.123046875, -5731.8725585938, 19.877685546875 ),
        Deleter = vector3(4976.123046875, -5731.8725585938, 19.877685546875  - 0.90),
        Heading = 231.77
    },

}

Config.CarPounds = {
	Los_Santos = {
		Marker = vector3(408.61, -1625.47, 28.29),
		Spawner = vector3(405.64, -1643.4, 27.61),
		Heading = 229.54
	},
	Sandy_Shores = {
		Marker = vector3(1651.38, 3804.84, 37.65),
		Spawner = vector3(1627.84, 3788.45, 33.77),
		Heading = 308.53
	},
	Paleto_Bay = {
		Marker = vector3(-234.82, 6198.65, 30.94),
		Spawner = vector3(-230.08, 6190.24, 30.49),
		Heading = 140.24
	},
	
}
-- End of Cars

Config.PrivateAircraftGarages = {

Prywany_airport = {
		Marker = vector3(-88.69, 819.9, 240.0),
		Spawner = vector3(-73.95, 824.98, 240.6),
		Deleter = vector3(-73.95, 824.98, 240.6),
		Heading = 82.28
	},
	Lucyfer_Airport = {
		Marker = vector3(-1787.67, 411.02, 113.45-0.9),
		Spawner = vector3(-1795.79, 397.89, 112.79-0.9),
		Deleter = vector3(-1795.79, 397.89, 112.79-0.9),
		Heading = 115.04
	},
	Winiarnia_Airport = {
		Marker = vector3(-1895.32, 2059.86, 140.97-0.9),
		Spawner = vector3(-1899.93, 2006.92, 141.66-0.9),
		Deleter = vector3(-1899.93, 2006.92, 141.66-0.9),
		Heading = 115.04
	},

	Cayoperico_airport = {
		Marker = vector3(4443.23, -4469.95, 4.33-0.9),
		Spawner = vector3(4448.7, -4485.76, 4.22),
		Deleter = vector3(4448.7, -4485.76, 4.22-0.9),
		Heading = 201.55
	},

	Kewin_dom = {
		Org = 'kewin',
		Marker = vector3(-2600.367, 1697.42, 141.87-0.9),
		Spawner = vector3(-2583.87, 1701.98, 141.6),
		Deleter = vector3(-2583.87, 1701.98, 141.36-0.9),
		Heading = 115.04
	},

	Tijuana_hcujdipca = {
		Org = 'tijuana',
		Marker = vector3(-1542.29, 848.72, 181.85-0.9),
		Spawner = vector3(-1552.4, 845.53, 183.66),
		Deleter = vector3(-1552.4, 845.53, 183.66 - 0.9),
		Heading = 110.5
	}
}


-- Start of Private Cars
Config.PrivateCarGarages = {
	-- Maze Bank Building Garages


	Haze2_LS = {
		Org = "tijuana",
		Marker = vector3(-1538.35, 875.66, 180.56),
		Spawner = vector3(-1548.27, 883.44, 180.69),
		Deleter = vector3(-1542.53, 888.15, 180.49),
		Heading = 330.27
	},


	niggerz = {
		Org = 'smk',
		Marker = vector3(66.48131561279, -2564.2329711914, 6.0-0.9),
		Spawner = vector3(69.48, -2555.67, 6.0),
		Deleter = vector3(74.5, -2538.64, 6.0-0.9),
		Heading = 278.04
	},

	GAVBRYS = {
		Org = "gabrys",
		Marker = vector3(340.56,-11.78,83.0),
        Spawner = vector3(357.33,-22.17,83.0),
        Deleter = vector3(357.33,-22.17,83.0),
        Heading = 355.0
	},

	Manque_LS = {
		--Private = "MazeBankBuilding",
		Marker = vector3(869.65, -585.63, 57.07),
		Spawner = vector3(869.74, -591.86, 57.27),
		Deleter = vector3(869.74, -591.86, 57.27),
		Heading = 319.05
	},

	Bar_kebab = {
		---Private = "Vivevood Donator",
	Marker = vector3(28.52,-1597.27,28.32), 
	Spawner = vector3(24.16,-1589.77,28.61),
	Deleter = vector3(29.77,-1582.79,28.22),
	Heading = 268.37
	},

	Bar_kebab = {
		---Private = "Vivevood Donator",
	Marker = vector3(28.52,-1597.27,28.32), 
	Spawner = vector3(24.16,-1589.77,28.61),
	Deleter = vector3(29.77,-1582.79,28.22),
	Heading = 268.37
	},

	DomUkryty = {
		---Private = "Donator House10",
	Marker = vector3(-928.0,7.88,46.75), 
	Spawner = vector3(-925.87,11.87,47.6),
	Deleter = vector3(-929.81,15.31,46.90),
	Heading = 217.67
	},

	DomDonatorHouse6 = {
		---Private = "DonatorHouse6",
	Marker = vector3(-1747.9,373.22,89.08), 
	Spawner = vector3(-1751.59,364.5,89.66),
	Deleter = vector3(-1747.42,367.56,88.95),
	Heading = 112.1
	},

	DonatorOsiewacz2 = {
		---Private = "DonatorOsiewacz2",
	Marker = vector3(-1468.79,-29.73, 53.88),
	Spawner = vector3(-1462.86,-26.78,54.53),
	Deleter = vector3(-1463.67,-41.89,54.0),
	Heading = 51.21
	},

	vespucci_LS = {
		Org = "police",
		Marker = vector3(-1066.17, -878.02, 3.97),
		Spawner = vector3(-1069.38, -878.57, 4.25),
		Deleter = vector3(-1076.3, -882.5, 3.68),
		Heading = 32.96
	},
	
	vespucci_LS = {
		Org = "ochrona",
		Marker = vector3(-281.46, -888.1, 30.32),
		Spawner = vector3(-276.54, -891.97, 30.08),
		Deleter = vector3(-289.6, -887.21, 30.08),
		Heading = 32.96
	},

	Ruscy_LS= {
		Org = "police",
		Marker = vector3(-14.17, -708.53, 31.49),
		Spawner = vector3(-20.18, -707.21, 31.34),
		Deleter = vector3(-20.18, -707.21, 31.34),
		Heading = 338.24
	},
	


	RichmanDfu_LS = {
		Private = "Lucyfer House",
		Marker = vector3(-1788.43, 459.34, 127.4),
		Spawner = vector3(-1794.74, 458.38, 127.4),
		Deleter = vector3(-1782.75, 464.33, 127.4),
		Heading = 95.69
	},
	
	--[[Kevin_LS = {
		--Private = "Kevin",
		Marker = vector3(-3200.67, 829.3, 8.28),
		Spawner = vector3(-3207.24, 832.18, 8.28),
		Deleter = vector3(-3213.37, 837.74, 7.39),
		Heading = 123.24
	},]]

	lucyferczychujwie_LS = {
		Private = "Lucyfer House",
		Marker = vector3(-1790.39, 420.19, 112.47),
		Spawner = vector3(-1792.45, 415.69, 112.45),
		Deleter = vector3(-1792.45, 415.69, 112.45),
		Heading = 192.34
	},

	sezarzapomylke = {
		Private = "Hawick AveMotel267",
		Marker = vector3(267.69, -1930.15, 24.0),
		Spawner = vector3(268.24, -1925.87, 25.23),
		Deleter = vector3(268.24, -1925.87, 24.0),
		Heading = 48.47
	},

	domcoli = {
		Private = "Ace Jones DrLuxApartment8",
		Marker = vector3(-335.5, 634.38, 171.7),
		Spawner = vector3(-346.94, 637.0, 171.42),
		Deleter = vector3(-341.92, 633.03, 171.31),
		Heading = 48.24
	},

	Donator_House1 = {
		Private = "Donator House1",
		Marker = vector3(-136.64, 595.63, 204.58 - 0.90),
		Spawner = vector3(-144.48, 596.35, 203.78),
		Deleter = vector3(-144.48, 596.35, 203.78 - 0.90),
		Heading = 6.37
	},



	--[[domdonatorav2 = {
		--Private = "Donator House1",
		Marker = vector3(-3020.9, 745.19, 26.4),
		Spawner = vector3(-3017.67, 740.0, 25.9),
		Deleter = vector3(-3017.67, 740.0, 25.9),
		Heading = 101.47
	},]]

		domdonatorav3 = {
		Private = "Didion DrLuxApartment229",
		Marker = vector3(-89.22, 426.29, 112.0),
		Spawner = vector3(-96.87, 426.21, 113.04),
		Deleter = vector3(-96.08, 430.37, 112.0),
		Heading = 173.21
	},

		domdonatorav4= {
		Private = "Donator House5",
		Marker = vector3(-1556.05, 17.49, 58.83 - 0.90),
		Spawner = vector3(-1554.92, 24.31, 58.59),
		Deleter = vector3(-1554.92, 24.31, 58.59 - 0.90),
		Heading = 350.51
	},

	domdonatorav17 = {
		Private = "Donator House17",
		Marker = vector3(-195.4, 407.83, 111.11 - 0.90),
		Spawner = vector3(-201.36, 409.98, 110.52),
		Deleter = vector3(-201.36, 409.98, 110.52 - 0.90),
		Heading = 10.62
	},

	domdonatorav6 = {
		Private = "Donator House18",
		Marker = vector3(763.31, 4175.38, 40.6 - 0.90),
		Spawner = vector3(771.05, 4180.33, 40.71),
		Deleter = vector3(771.05, 4180.33, 40.71 - 0.90),
		Heading = 105.75
	},


	domdonatorav24 = {
		Private = "Donator House24",
		Marker = vector3(-276.94946289063, 596.40002441406, 181.6695556640 - 0.90),
		Spawner = vector3(-274.0087890625, 601.64837646484, 181.77075195313),
		Deleter = vector3(-274.0087890625, 601.64837646484, 181.77075195313 - 0.90),
		Heading = 344.73
	},

	domdonatorav25 = {
		Private = "Donator House25",
		Marker = vector3(-949.87249755859, -1076.7032470703, 2.134765625 - 0.90),
		Spawner = vector3(-954.50109863281, -1083.2835693359, 2.134765625),
		Deleter = vector3(-954.50109863281, -1083.2835693359, 2.134765625 - 0.90),
		Heading = 208.74
	},

	domdonatorav26 = {
		Private = "Donator House26",
		Marker = vector3(-1043.4637451172, 224.41319274902, 63.754638671875 - 0.90),
		Spawner = vector3(-1049.7890625, 222.27691650391, 63.754638671875),
		Deleter = vector3(-1049.7890625, 222.27691650391, 63.754638671875 - 0.90),
		Heading = 182.22
	},

	domdonatorav31_andzia = {
		Private = "Donator House31",
		Marker = vector3(-1264.4637451172, 522.41319274902, 97.37 - 0.90),
		Spawner = vector3(-1270.7890625, 519.27691650391, 97.37),
		Deleter = vector3(-1270.7890625, 519.27691650391, 97.37 - 0.90),
		Heading = 175.03
	},


	GWCGOLFING = {
		Private = "Donator House8",
		Marker = vector3(-924.49, 211.34, 67.46 - 0.90),
		Spawner = vector3(-933.13, 211.04, 67.46),
		Deleter = vector3(-933.13, 211.04, 67.46 - 0.90),
		Heading = 160.51
	},
	
	spreyhousegaraz = {
		Private = "Donator House12",
		Marker = vector3(-968.51, 104.98, 55.67 - 0.90),
		Spawner = vector3(-963.99, 108.31, 55.57),
		Deleter = vector3(-963.99, 108.31, 55.57 - 0.90),
		Heading = 306.33
	},

	mianiagaraz = {
		Private = "Donator House11",
		Marker = vector3(-1029.74, 691.06, 161.16 - 0.90),
		Spawner = vector3(-1021.31, 695.5, 161.37),
		Deleter = vector3(-1021.31, 695.5, 161.37 - 0.90),
		Heading = 306.33
	},

	bratorgprzestepcza3 = {
		Org = 'brat', 
		Marker = vector3(1404.39, 1115.83, 114.84 - 0.90),
		Spawner = vector3(1412.27, 1119.03, 114.84),
		Deleter = vector3(1412.27, 1119.03, 114.84 - 0.90),
		Heading = 92.31
	},

	camorra = {
		Org = 'bloods', 
		Marker = vector3(-166.25933837891, 2586.1450195313, 32.1611328125 - 0.90),
		Spawner = vector3(-160.65493774414, 2587.6748046875, 32.1611328125 ),
		Deleter = vector3(-160.65493774414, 2587.6748046875, 32.1611328125  - 0.90),
		Heading = 354.89
	},

	ciapaty = {
		Org = 'ciapaty', 
		Marker = vector3(-1988.78, -502.1, 12.18 - 0.90),
		Spawner = vector3(-1983.38, -499.69, 11.4),
		Deleter = vector3(-1983.38, -499.69, 12.18 - 0.90),
		Heading = 315.91
	},


	michal = {
		Org = 'michal', 
		Marker = vector3(-811.3, 187.48, 72.48 - 0.90),
		Spawner = vector3(-821.39, 183.58, 72.0),
		Deleter = vector3(-821.39, 183.58, 72.0 - 0.90),
		Heading = 143.86
	},


	kewin = {
		Org = 'kewin', 
		Marker = vector3(-2611.77, 1684.98, 141.87 - 0.90),
		Spawner = vector3(-2605.79, 1679.32, 141.76),
		Deleter = vector3(-2605.79, 1679.32, 141.76 - 0.90),
		Heading = 226.63
	},

	--[[Policehahajp = {
		Org = 'police', 
		Marker = vector3(435.5, -975.39, 25.7 - 0.90),
		Spawner = vector3(431.17, -982.86, 25.7),
		Deleter = vector3(431.17, -982.86, 25.7 - 0.90),
		Heading = 180.86
	},]]

	Policehahajp = {
		Org = 'police', 
		Marker = vector3(383.9736328125, -1636.03515625, 29.279907226563 -0.90),
		Spawner = vector3(390.93627929688, -1629.0593261719, 29.279907226563),
		Deleter = vector3(390.93627929688, -1629.0593261719, 29.279907226563 - 0.90),
		Heading = 323.86
	},


	house23 = {
		Private = "Donator House14",
		Marker = vector3(-1210.57, 274.21, 69.52 - 0.90),
		Spawner = vector3(-1204.61, 266.59, 69.54),
		Deleter = vector3(-1204.61, 266.59, 69.54 - 0.90),
		Heading = 283.21
	},

	taxi = {
		Org = "taxi",
		Marker = vector3(920.54, -163.47, 74.84 - 0.90),
		Spawner = vector3(916.71, -170.56, 74.84),
		Deleter = vector3(916.71, -170.56, 74.47 - 0.90),
		Heading = 92.81
	},

	pruszkowskiorgprzestepcaz = {
		Org = "pruszkowski",
		Marker = vector3(-1533.56, 81.36, 56.77 - 0.90),
		Spawner = vector3(-1524.68, 83.61, 56.53 - 0.90),
		Deleter = vector3(-1524.68, 83.61, 56.53 - 0.90),
		Heading = 56.53
	},

	sater = {
		Org = "tijuana",
        Marker = vector3(201.73, 2462.0, 54.68),
        Spawner = vector3(204.64, 2456.92, 56.28),
        Deleter = vector3(211.8, 2468.34, 54.64),
        Heading = 274.17
    },

	wloczykijgang = {
		Org = "wloczykij",
        Marker = vector3(-1550.2681884766, 25.002199172974, 58.446899414063 - 0.90),
        Spawner = vector3(-1552.6812744141, 20.901100158691, 58.581665039063),
        Deleter = vector3(-1555.9912109375, 21.296705245972, 58.632202148438 - 0.90),
        Heading = 274.17
    },
	
	shadow = {
		Org = "shadow",
        Marker = vector3(-2581.6748046875, 1926.1977539063, 167.22924804688 - 0.90),
        Spawner = vector3(-2586.1186523438, 1930.5626220703, 167.29675292969),
        Deleter = vector3(-2596.8000488281, 1930.2725830078, 167.29675292969 - 0.90),
        Heading = 274.17
    },
	
    balas = {
		Org = "balas",
        Marker = vector3(102.6, -1964.92, 20.84 - 0.90),
        Spawner = vector3(103.94, -1950.53, 20.67),
        Deleter = vector3(103.94, -1950.53, 20.67 - 0.90),
        Heading = 294.17
    },

    crips = {
		Org = "crips",
        Marker = vector3(1307.07, -1751.7, 53.88 - 0.90),
        Spawner = vector3(1299.61, -1735.04, 53.88),
        Deleter = vector3(1299.61, -1735.04, 53.88 - 0.90),
        Heading = 23.23
    },

      vagos = {
		Org = "vagos",
        Marker = vector3(337.53, -2035.58, 21.38 - 0.90),
        Spawner = vector3(328.84, -2034.82, 20.95),
        Deleter = vector3(328.84, -2034.82, 20.95 - 0.90),
        Heading = 23.23
    },

    vanilla = {
		Org = "vanilla",
        Marker = vector3(144.83, -1287.72, 29.34 - 0.90),
        Spawner = vector3(147.42, -1279.75, 29.02 - 0.90),
        Deleter = vector3(147.42, -1279.75, 29.02 - 0.90),
        Heading = 208.43
    },

	vanilla2 = {
		Org = "vanilla",
        Marker = vector3(-3106.96, 254.56, 12.42 - 0.90),
        Spawner = vector3(-3100, 251.58, 11.94 - 0.90),
        Deleter = vector3(-3099.86, 244.23, 12.34 - 0.90),
        Heading = 287.96
    },

 	GABRYS	= {
		Org = "olivierek",
        Marker = vector3(-101.13, 831.56, 235.42 - 0.90),
        Spawner = vector3(-105.37, 825.78, 235.54 - 0.90),
        Deleter = vector3(-105.37, 825.78, 235.54 - 0.90),
        Heading = 360.96
    },

    families	= {
		Org = "families",
        Marker = vector3(-25.37, -1427.56, 30.66 - 0.90),
        Spawner = vector3(-25.07, -1437.37, 30.66),
        Deleter = vector3(-25.07, -1437.37, 30.66 - 0.90),
         Heading = 179.96
     },

     szpieg	= {
		Org = "szpieg",
		Marker = vector3(-2588.36, 1927.61, 167.31 - 0.90),
        Spawner = vector3(-2594.79, 1930.18, 167.3),
        Deleter = vector3(-2594.79, 1930.18, 167.3 - 0.90),
        Heading = 268.09
     },

      trucker	= {
		Org = "trucker",
		Marker = vector3(131.57, -3216.37, 5.86 - 0.90),
        Spawner = vector3(132.75, -3209.72, 5.86),
        Deleter = vector3(132.75, -3209.72, 5.86 - 0.90),
        Heading = 271.19
     },

	 pearls	= {
		Org = "burgerownia",
		Marker = vector3(-1797.6131591797, -1173.2572021484, 13.0029296875 - 0.90),
        Spawner = vector3(-1787.3670654297, -1176.3956298828, 13.0029296875 ),
        Deleter = vector3(-1787.3670654297, -1176.3956298828, 13.0029296875  - 0.90),
        Heading =322.2
	},


	 gruppe6	= {
		--Org = "trucker",
		Marker = vector3(729.55, -1295.37, 26.29 - 0.90),
        Spawner = vector3(725.56, -1300.8, 26.26),
        Deleter = vector3(725.56, -1300.8, 26.26 - 0.90),
        Heading = 26.26
     },


     DonatorHouse20 = {
		Private = "Donator House20",
        Marker = vector3(-2670.86, 1309.72, 147.12 - 0.90),
        Spawner = vector3(-2661.41, 1307.6, 147.12),
        Deleter = vector3(-2661.41, 1307.6, 147.12 - 0.90),
        Heading = 272.51
     },

	 kromkahouse = {
		Private = "2123",
        Marker = vector3(736.096, 2516.07, 73.22 - 0.90),
        Spawner = vector3(747.81, 2515.72, 73.07),
        Deleter = vector3(736.096, 2509.07, 73.22 - 0.90),
        Heading = 171.51
     },

	 DonatorHouse23 = {
		Private = "Donator House23",
        Marker = vector3(-1587.49, -83.49, 54.33 - 0.90),
        Spawner = vector3(-1577.97, -84.01, 54.13),
        Deleter = vector3(-1577.97, -84.01, 54.13 - 0.90),
        Heading = 275.67
     },

	kartel = {
		---Private = "kartel",
		Marker = vector3(-1012.29, 293.57, 67.54),
		Spawner = vector3(-1003.69, 295.57, 68.13),
		Deleter = vector3(-996.33, 297.91, 67.7),
		Heading = 287.61
	},

	starychuj	= {
		Private = "Vinewood Blvdaprt",
        Marker = vector3(-668.44, 905.87, 229.38),
        Spawner = vector3(-672.12, 912.43, 230.5),
        Deleter = vector3(-676.71, 904.42, 229.93),
         Heading = 327.61
     },
	 
	 lost	= {
		Org = "lost",
        Marker = vector3(1983.64, 3027.61, 47.06-0.9),
        Spawner = vector3(1995.01, 3035.57, 47.03-0.9),
        Deleter = vector3(1995.01, 3035.57, 47.03-0.9),
         Heading = 66.21
     },

     DonatorHouse19	= {
		Private = "Donator House19",
        Marker = vector3(-1150.92, -1519.43, 4.36 - 0.90),
        Spawner = vector3(-1163.14, -1514.23, 4.34),
        Deleter = vector3(-1156.42, -1520.54, 4.34 -0.90),
         Heading = 30.79
     },

      DonatorHouse21	= {
		Private = "Donator House21",
        Marker = vector3(-2791.64, 1434.22, 100.93 - 0.90),
        Spawner = vector3(-2779.09, 1426.34, 100.93),
        Deleter = vector3(-2779.09, 1426.34, 100.93 -0.90),
         Heading = 316.79
     },

      DonatorHouse22	= {
		Private = "Donator House22",
        Marker = vector3(-1054.04, 727.15, 165.47 - 0.90),
        Spawner = vector3(-1058.18, 737.18, 165.45),
        Deleter = vector3(-1058.18, 737.18, 165.45 -0.90),
         Heading = 290.79
     },



	-- End of VENT Custom Garages
}
-- End of Private Cars
