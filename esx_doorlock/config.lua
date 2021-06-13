Config = {}
Config.Locale = 'pl'

Config.DoorList = {

	{
		objHash = GetHashKey('v_ilev_ra_door2'),
		objHeading = 360,
		objCoords = vector3(-629.7998, 228.9898, 82.0489),
		textCoords = vector3(-629.7998, 228.9898, 82.0489),
		authorizedJobs = {'pizza'},
		locked = true,
		maxDistance = 2.5	
	},



	{
		objHash = GetHashKey('v_ilev_ss_door03'),
		objHeading = 0,
		objCoords = vector3(-112.1954, -1787.991, 29.98761),
		textCoords = vector3(-112.1954, -1787.991, 29.98761),
		authorizedJobs = {'mecano'},
		locked = true,
		maxDistance = 2.5	
	},	



	----- KOMENDA MISIN ROV  BEZ INTERIORU ----_
	

	{
		textCoords = vector3(452.69012451172, -982.65496826172, 30.678344726563),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Przod
		locked = true,
		maxDistance = 2.0,
		doors = {
		{objHash = 749848321, objHeading = 270.3, objCoords  = vector3(452.69012451172, -982.65496826172, 30.678344726563)},    --- TUATJ MASZ MASLO TAKJ MA BYC
		}
	},

{
	textCoords = vector3(434.44, -981.87, 30.71),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Przod
	locked = true,
	maxDistance = 3.0,
	doors = {
	{objHash = -320433149, objHeading = 270.3, objCoords  = vector3(434.7479, -983.2151, 30.83926)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = 1738519111, objHeading = 319.8, objCoords  = vector3(434.7479, -980.6184, 30.83926)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(444.6, -989.23, 30.69),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
	locked = true,
	maxDistance = 3.0,
	doors = {
	{objHash = 185711165, objHeading = 0.0, objCoords  = vector3(446.0079, -989.4454, 30.8393)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = 185711165, objHeading = 179.9, objCoords  = vector3(443.4078, -989.4454, 30.83926)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(449.95, -986.47, 30.69),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Szatnia
	locked = true,
	maxDistance = 3.0,
	doors = {
	{objHash = 1557126584, objHeading = 90.0, objCoords  = vector3(450.1041, -985.7384, 30.8393)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(463.88, -992.7, 24.91),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Cele
	locked = true,
	maxDistance = 1.0,
	doors = {
	{objHash = 631614199, objHeading = 0.0, objCoords  = vector3(464.5701, -992.6641, 25.06443)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(461.86, -993.56, 24.91),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
	locked = true,
	maxDistance = 1.0,
	doors = {
	{objHash = 631614199, objHeading = 270.0, objCoords  = vector3(461.8065, -994.4086, 25.06443)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(461.75, -998.47, 24.91),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
	locked = true,
	maxDistance = 1.0,
	doors = {
	{objHash = 631614199, objHeading = 90.0, objCoords  = vector3(461.75, -998.47, 24.91)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(461.81, -1002.1, 24.91),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
	locked = true,
	maxDistance = 1.0,
	doors = {
	{objHash = 631614199, objHeading = 90.0, objCoords  = vector3(461.8065, -1001.302, 25.06443)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(468.58, -1014.38, 26.39),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Tyl
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -2023754432, objHeading = 179.9, objCoords  = vector3(469.9679, -1014.452, 26.53623)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -2023754432, objHeading = 0.0, objCoords  = vector3(467.3716, -1014.452, 26.53623)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(488.97, -1020.31, 28.06),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Brama
	locked = true,
	brama = true,
	maxDistance = 5.0,
	doors = {
	{objHash = -1603817716, objHeading = 90.0, objCoords  = vector3(512.2744, -1014.938, 26.80806)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },


	-----


	---- KOMENDA DAVIS -----

	{
        textCoords = vector3(488.82, -1020.24, 28.21),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie TYL
        locked = true,
        brama = true,
        maxDistance = 5.0,
        doors = {
        {objHash = -1603817716, objHeading = 90.0, objCoords  = vector3(488.8948, -1017.21, 27.14584)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
                                            
	},

	{
        textCoords = vector3(488.82, -1020.24, 28.21),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie TYL
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1603817716, objHeading = 90.0, objCoords  = vector3(488.8948, -1017.21, 27.14584)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

                                              
	{
        textCoords = vector3(369.3653, -1607.238, 29.44148),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie TYL - DOBRE
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1047370197, objHeading = 320.3, objCoords  = vector3(368.2753, -1608.238, 29.44148)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = 1738519111, objHeading = 319.8, objCoords  = vector3(369.9344, -1606.261, 29.44148)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
                                         
	},

	{
        textCoords = vector3(392.1292, -1602.553, 28.33814),
        authorizedJobs = {'chuj'}, -- Brama
        locked = true,
        brama = true,
        maxDistance = 10.0,
        doors = {
        {objHash = 1286535678, objHeading = 140.0, objCoords  = vector3(392.1292, -1602.553, 28.33814)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(401.0792, -1609.553, 28.33814),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Brama
        locked = true,
        brama = true,
        maxDistance = 12.0,
        doors = {
        {objHash = 1286535678, objHeading = 140.0, objCoords  = vector3(397.8843, -1607.384, 28.33814)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

	{
        textCoords = vector3(391.8602, -1636.07, 29.97438),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Furtka
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1156020871, objHeading = 49.9, objCoords  = vector3(391.8602, -1636.07, 29.97438)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

	{
        textCoords = vector3(364.43, -1595.16, 29.44096),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Bok
        locked = true,
        maxDistance = 1.0,
        doors = {
        {objHash = -1685865813, objHeading = 49.7, objCoords  = vector3(364.7879, -1594.708, 29.44237)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
    },

	{
        textCoords = vector3(361.28, -1585.09, 29.44096),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Bok
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1360054856, objHeading = 319.3, objCoords  = vector3(360.5959, -1586.035, 29.44096)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = 471928866, objHeading = 320.0, objCoords  = vector3(362.2491, -1584.051, 29.44096)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
    },

	{
        textCoords = vector3(364.647, -1601.292, 29.43974),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Szatnia
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = -1925177820, objHeading = 140.4, objCoords  = vector3(364.647, -1601.292, 29.43974)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(371.9657, -1603.393, 29.4418),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Szatnia
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = -1925177820, objHeading = 319.6, objCoords  = vector3(371.9657, -1603.393, 29.4418)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(360.7056, -1602.28, 29.4431),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Przesluchan
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = 2093103062, objHeading = 139.6, objCoords  = vector3(360.7056, -1602.28, 29.4431)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(360.1164, -1601.78, 29.44206),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Przesluchan
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = 2093103062, objHeading = 320.0, objCoords  = vector3(360.1164, -1601.78, 29.44206)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(357.3149, -1599.428, 29.44081),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Przesluchan
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = 2093103062, objHeading = 140.0, objCoords  = vector3(357.3149, -1599.428, 29.44081)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(356.7397, -1598.951, 29.44163),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Przesluchan
        locked = true,
        maxDistance = 2.0,
        doors = {
        {objHash = 2093103062, objHeading = 320.0, objCoords  = vector3(356.7397, -1598.951, 29.44163)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(356.7101, -1596.037, 29.44414),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie 
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1685865813, objHeading = 49.9, objCoords  = vector3(356.7101, -1596.037, 29.44414)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

	{
        textCoords = vector3(354.2521, -1593.865, 29.44267),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie TYL
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1360054856, objHeading = 320.0, objCoords  = vector3(353.2121, -1594.865, 29.44267)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = 471928866, objHeading = 320.0, objCoords  = vector3(354.8611, -1592.875, 29.43909)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(349.4737, -1600.773, 29.6148),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie 
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(349.4737, -1600.773, 29.6148)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(352.2917, -1603.167, 29.61505),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(352.2917, -1603.167, 29.61505)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(354.4528, -1604.98, 29.61483),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(354.4528, -1604.98, 29.61483)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(356.5661, -1606.753, 29.61343),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(356.5661, -1606.753, 29.61343)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(358.6782, -1608.523, 29.61456),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(358.6782, -1608.523, 29.61456)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(361.1936, -1610.636, 29.6146),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1842288246, objHeading = 320.0, objCoords  = vector3(361.1936, -1610.636, 29.6146)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(357.7303, -1592.057, 29.44246),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 139.9, objCoords  = vector3(356.7303, -1591.257, 29.44246)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 320.0, objCoords  = vector3(358.711, -1592.919, 29.44246)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(360.5959, -1586.035, 29.44096),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Bok
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1360064856, objHeading = 320.0, objCoords  = vector3(360.5959, -1586.035, 29.44096)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = 471928866, objHeading = 320.0, objCoords  = vector3(362.2491, -1584.051, 29.44096)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(371.5391, -1586.922, 29.44176),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 49.9, objCoords  = vector3(372.1991, -1585.902, 29.44176)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 230.0, objCoords  = vector3(370.537, -1587.883, 29.44176)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(387.3778, -1600.289, 29.44177),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 49.9, objCoords  = vector3(388.3778, -1599.289, 29.44177)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 230.0, objCoords  = vector3(386.7148, -1601.269, 29.44176)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(384.3159, -1604.146, 29.4411),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie Dach
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -1925177820, objHeading = 50.3, objCoords  = vector3(384.3159, -1604.146, 29.4411)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(383.7169, -1609.573, 29.44079),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 320.0, objCoords  = vector3(383.7169, -1609.573, 29.44079)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 140.0, objCoords  = vector3(381.7363, -1607.912, 29.44079)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(386.7906, -1601.153, 33.50746),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 230.9, objCoords  = vector3(386.7906, -1601.153, 33.50746)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 49.9, objCoords  = vector3(388.461, -1599.162, 33.50746)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

	{
        textCoords = vector3(381.6847, -1597.301, 33.50706),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Pokoj
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 139.6, objCoords  = vector3(381.6847, -1597.301, 33.50706)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(374.7806, -1591.102, 33.50633),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 230.0, objCoords  = vector3(374.7806, -1591.102, 33.50633)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 50.4, objCoords  = vector3(376.4534, -1589.109, 33.50633)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(370.7128, -1587.973, 33.63252),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- bioro Capitan
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = 167807608, objHeading = 320.3, objCoords  = vector3(370.7128, -1587.973, 33.63252)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(366.2662, -1593.286, 33.63173),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- bioro Lieutenant
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = 167807608, objHeading = 320.0, objCoords  = vector3(366.2662, -1593.286, 33.63173)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(369.3522, -1607.776, 33.50739),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 230.0, objCoords  = vector3(367.4922, -1599.776, 33.50739)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 50.4, objCoords  = vector3(369.163, -1597.785, 33.50633)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},
	{
        textCoords = vector3(384.2773, -1603.934, 37.11418),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejsce dach
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = 2130535758, objHeading = 319.6, objCoords  = vector3(384.2773, -1603.934, 37.11418)},    --- TUATJ MASZ MASLO TAKJ MA BYC
        }
	},

	{
        textCoords = vector3(377.62, -1593.75, 33.50629),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 320.0, objCoords  = vector3(378.5212, -1594.639, 33.50739)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 140.5, objCoords  = vector3(376.5327, -1592.971, 33.50629)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         }
     }, 
	{
        textCoords = vector3(371.87, -1594.33, 33.50659),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 230.0, objCoords  = vector3(371.0753, -1595.445, 33.50659)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 50.3, objCoords  = vector3(372.7418, -1593.459, 33.50659)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         }
     },
	{
        textCoords = vector3(372.37, -1600.03, 33.50659),
        authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
        locked = true,
        maxDistance = 3.0,
        doors = {
        {objHash = -667323357, objHeading = 320.0, objCoords  = vector3(373.2531, -1600.946, 33.50659)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         {objHash = -667323357, objHeading = 139.9, objCoords  = vector3(371.2858, -1599.296, 33.50659)},    --- TUATJ MASZ MASLO TAKJ MA BYC
         }
     },
	-----
	
--- AMBULANCE VICEROY ---

{
	textCoords = vector3(-815.82, -1223.28, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 320.0, objCoords  = vector3(-816.7538, -1222.482, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 320.0, objCoords  = vector3(-814.7822, -1224.137, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-807.93, -1213.33, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Laboratory
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 320.0, objCoords  = vector3(808.6441, -1212.817, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-803.82, -1217.16, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Medyczna
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 320.0, objCoords  = vector3(-804.658, -1216.154, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 320.0, objCoords  = vector3(-802.686, -1217.808, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-798.96, -1221.06, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Medyczna
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 320.0, objCoords  = vector3(-799.8994, -1220.147, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 320.0, objCoords  = vector3(-797.9274, -1221.802, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-794.46, -1224.71, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Medyczna
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 320.0, objCoords  = vector3(-795.5013, -1223.837, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 320.0, objCoords  = vector3(-793.5293, -1225.492, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-802.12, -1224.83, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala Medyczna
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 139.9, objCoords  = vector3(-801.2667, -1225.781, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 139.9, objCoords  = vector3(-803.2387, -1224.126, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-794.19, -1228.42, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 230.4, objCoords  = vector3(-793.2817, -1227.424, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 230.3, objCoords  = vector3(-794.9364, -1229.396, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-798.49, -1238.33, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 319.7, objCoords  = vector3(-799.2818, -1237.143, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 319.7, objCoords  = vector3(-797.3099, -1238.798, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-797.49, -1242.53, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przejscie
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = -434783486, objHeading = 229.6, objCoords  = vector3(-796.8307, -1241.813, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	 {objHash = -1700911976, objHeading = 229.9, objCoords  = vector3(-798.4854, -1243.785, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-784.58, -1233.29, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- MRI
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 320.0, objCoords  = vector3(-784.9667, -1232.685, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-780.65, -1236.37, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Diagnostics
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 320.0, objCoords  = vector3(-781.2013, -1235.844, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-775.66, -1240.42, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- xray
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 320.0, objCoords  = vector3(-776.3165, -1239.943, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-812.03, -1239.93, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- recepcja
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 230.0, objCoords  = vector3(-881.5206, -1239.321, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },
{
	textCoords = vector3(-817.02, -1239.49, 7.34),
	authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- recepcja
	locked = true,
	maxDistance = 2.0,
	doors = {
	{objHash = 854291622, objHeading = 139.5, objCoords  = vector3(-816.3891, -1239.989, 7.487189)},    --- TUATJ MASZ MASLO TAKJ MA BYC
	}
 },

-----------------


--AMBULANCE	
		{
		textCoords = vector3(309.1337, -597.7515, 43.43391),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- RECEPCJA
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 854291622, objHeading = 160.00003051758, objCoords  = vector3(309.1337, -597.7515, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(340.7818, -581.8215, 43.43391),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- DIAGNOSTYKA
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 854291622, objHeading = 340.00003051758, objCoords  = vector3(340.7818, -581.8215, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(327.66, -593.95, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- WARD D
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 250.03100585938, objCoords  = vector3(328.1364, -592.7761, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 249.823257446289, objCoords  = vector3(327.256, -595.195, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(325.47, -589.57, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- WARD A
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 340.09378051758, objCoords  = vector3(324.236, -589.2262, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 339.5687255894, objCoords  = vector3(326.655, -590.1066, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(326.09, -579.2, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- WARD B
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 250.03897094727, objCoords  = vector3(326.5499, -578.0406, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 250.05465698242, objCoords  = vector3(325.6695, -580.4596, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(348.78, -587.47, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- WARD C
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 250.07345581055, objCoords  = vector3(349.3138, -586.326, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 250.22462463379, objCoords  = vector3(348.4333, -588.745, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(307.1182, -569.569, 43.43391),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- Apteka
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 854291622, objHeading = 340.00003051758, objCoords  = vector3(307.1182, -569.569, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},

		{
		textCoords = vector3(313.17, -572.0, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- Surgery 1
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 340.00003051758, objCoords  = vector3(312.0051, -571.3412, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords  = vector3(314.4241, -572.2216, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(319.06, -574.01, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- Surgery 2
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 340.00003051758, objCoords  = vector3(317.8426, -573.4659, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords  = vector3(320.2615, -574.3463, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(324.44, -575.88, 43.29),
		authorizedJobs = {'ambulance' , 'adwokat'}, -- Surgery 3
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -434783486, objHeading = 340.00003051758, objCoords  = vector3(323.2375, -575.4294, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -1700911976, objHeading = 340.00003051758, objCoords  = vector3(325.6565, -576.3099, 43.43391)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},
	
--chuj wie, tak omenda zajebana	
		{
		textCoords = vector3(445.4067, -984.2014, 30.82319),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Recepcja
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = GetHashKey('gabz_mrpd_door_04'), objHeading = 89.999977111816, objCoords  = vector3(445.4067, -984.2014, 30.82319)},	
				
			}		
	},	

		{
		textCoords = vector3(440.5201, -986.2335, 30.82319),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie RECEPCJA PRAWE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = GetHashKey('gabz_mrpd_door_05'), objHeading = 179.7465057373, objCoords  = vector3(440.5201, -986.2335, 30.82319)},	
				
			}		
	},	

		{
		textCoords = vector3(440.5201, -977.6011, 30.82319),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie RECEPCJA LEWE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = GetHashKey('gabz_mrpd_door_04'), objHeading = 0.060215752571821, objCoords  = vector3(440.5201, -977.6011, 30.82319)},	
				
			}		
	},	

		{
		textCoords = vector3(441.87, -998.71, 30.73),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie LEWE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -1547307588, objHeading = 179.92022705078, objCoords  = vector3(443.0618, -998.7462, 30.8153)},	--- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = -1547307588, objHeading = 0.1462604701519, objCoords  = vector3(440.7392, -998.7462, 30.8153)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},	

		{
		textCoords = vector3(488.82, -1020.24, 28.21),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie TYL
		locked = true,
		maxDistance = 9.85,
		doors = {
		{objHash = -1603817716, objHeading = 90.0, objCoords  = vector3(488.8948, -1017.21, 27.14584)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(457.11, -972.32, 30.71),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie PRAWE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -1547307588, objHeading = 359.90093994141, objCoords  = vector3(455.8862, -972.2543, 30.81531)},	--- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = -1547307588, objHeading = 180.00183105469, objCoords  = vector3(458.2087, -972.2543, 30.81531)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},

		{
		textCoords = vector3(434.77, -981.91, 30.71),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie GŁÓWNE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -1547307588, objHeading = 90.002555847168, objCoords  = vector3(434.7444, -983.0781, 30.8153)},	--- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = -1547307588, objHeading = 269.88757324219, objCoords  = vector3(434.7444, -980.7556, 30.8153)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},	

		{
		textCoords = vector3(464.3086, -984.5284, 43.77124),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejscie DACH
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -692649124, objHeading = 90.186599731445, objCoords  = vector3(464.3086, -984.5284, 43.77124)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(479.7507, -999.629, 30.78917),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Armory
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -692649124, objHeading = 90.18253326416, objCoords  = vector3(479.7507, -999.629, 30.78917)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(487.4378, -1000.189, 30.78697),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Armory
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -692649124, objHeading = 181.10133361816, objCoords  = vector3(487.4378, -1000.189, 30.78697)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},

		{
		textCoords = vector3(458.0894, -995.5247, 30.82319),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Locker
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = 149284793, objHeading = 224.83378601074, objCoords  = vector3(458.0894, -995.5247, 30.82319)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},	

		{
		textCoords = vector3(464.1566, -997.5093, 26.3707),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Parking V1
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = 1830360419, objHeading = 90.073654174805, objCoords  = vector3(464.1566, -997.5093, 26.3707)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},		

		{
		textCoords = vector3(464.1591, -974.6656, 26.3707),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Parking V2
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = 1830360419, objHeading = 269.78997802734, objCoords  = vector3(464.1591, -974.6656, 26.3707)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		}		
	},		

		{
		textCoords = vector3(468.63, -1014.76, 26.41),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejście tylnie
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = -692649124, objHeading = 179.73928833008, objCoords  = vector3(469.7743, -1014.406, 26.48382)},	--- TUATJ MASZ MASLO TAKJ MA BYC	
		{objHash = -692649124, objHeading = 0.16542878746986, objCoords  = vector3(467.3686, -1014.406, 26.48382)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},		

		{
		textCoords = vector3(476.6157, -1008.875, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cele
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 270.00503540039, objCoords  = vector3(476.6157, -1008.875, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC			
		}		
	},		

		{
		textCoords = vector3(471.51, -1008.97, 26.37),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejście do przedpokoju CELE
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = 149284793, objHeading = 89.897087097168, objCoords  = vector3(471.3758, -1010.198, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = 149284793, objHeading = 270.37002563477, objCoords  = vector3(471.3679, -1007.793, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC						
		}		
	},		

		{
		textCoords = vector3(475.9539, -1010.819, 26.40639),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Zdjęcia
		locked = true,
		maxDistance = 1.25,
		doors = {
		{objHash = -1406685646, objHeading = 180.2259595214844, objCoords  = vector3(475.9539, -1010.819, 26.40639)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(475.9539, -1006.938, 26.40639),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przyjmowanie
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -288803980, objHeading = 180.04022216797, objCoords  = vector3(475.9539, -1006.938, 26.40639)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(477.9126, -1012.189, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela NR1
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 0.0, objCoords  = vector3(477.9126, -1012.189, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(480.9128, -1012.189, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela NR2
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 0.0, objCoords  = vector3(480.9128, -1012.189, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(483.9127, -1012.189, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela NR3
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 0.0, objCoords  = vector3(483.9127, -1012.189, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(486.9131, -1012.189, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela NR4
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 359.88262939453, objCoords  = vector3(486.9131, -1012.189, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(484.1764, -1007.734, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Cela Ogólna
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 180.00001525879, objCoords  = vector3(484.1764, -1007.734, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},

		{
		textCoords = vector3(481.0084, -1004.118, 26.48005),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Wejście do przedpokoju CELE V2
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -53345114, objHeading = 179.95385742188, objCoords  = vector3(481.0084, -1004.118, 26.48005)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(479.06, -1003.173, 26.4065),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Sala rozpoznań
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -288803980, objHeading = 89.999977111816, objCoords  = vector3(479.06, -1003.173, 26.4065)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(482.6703, -995.7285, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przesłuchanko II
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -1406685646, objHeading = 270.00003051758, objCoords  = vector3(482.6703, -995.7285, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(482.6699, -992.2991, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Obserwanko II
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -1406685646, objHeading = 270.00003051758, objCoords  = vector3(482.6699, -992.2991, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},		

		{
		textCoords = vector3(482.6701, -987.5792, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Przesłuchanko I
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -1406685646, objHeading = 270.00003051758, objCoords  = vector3(482.6701, -987.5792, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},			

		{
		textCoords = vector3(482.6694, -983.9868, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Obserwanko I
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -1406685646, objHeading = 270.13311767578, objCoords  = vector3(482.6694, -983.9868, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(479.0, -986.24, 26.31),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Drzwi do przesłuchanka i obserwanka
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 149284793, objHeading = 270.03744506836, objCoords  = vector3(479.0624, -985.0323, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC		
		{objHash = 149284793, objHeading = 90.14070892334, objCoords  = vector3(479.0624, -987.4376, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC				
		}		
	},	

		{
		textCoords = vector3(475.8323, -990.4839, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Dowody
		locked = true,
		maxDistance = 1.10,
		doors = {
		{objHash = -692649124, objHeading = 134.88334655762, objCoords  = vector3(475.8323, -990.4839, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC					
		}		
	},	
	
	
	{
		textCoords = vector3(410.0258, -1024.229, 29.21824),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, ---Słupki przed komenda
		locked = true,
		maxDistance = 10.10,
		doors = {
		{objHash = -1868050792, objHeading = 270.0, objCoords  = vector3(410.0258, -1024.229, 29.21824)},	--- TUATJ MASZ MASLO TAKJ MA BYC					
		}		
	},

	{
		textCoords = vector3(410.0258, -1024.229, 29.21824),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, ---Słupki przed komenda
		locked = true,
		maxDistance = 10.10,
		doors = {
		{objHash = -1635161509, objHeading = 270.0, objCoords  = vector3(410.0258, -1024.229, 29.21824)},	--- TUATJ MASZ MASLO TAKJ MA BYC					
		}		
	},

		{
		textCoords = vector3(475.6114, -992.0482, 26.51181),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Dowody V2
		locked = true,
		maxDistance = 1.00,
		doors = {
		{objHash = -1258679973, objHeading = 0.098989859223366, objCoords  = vector3(475.6114, -992.0482, 26.51181)},	--- TUATJ MASZ MASLO TAKJ MA BYC					
		}		
	},

		{
		textCoords = vector3(478.2892, -997.9101, 26.40548),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- Swiadkowa
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 149284793, objHeading = 179.8790435791, objCoords  = vector3(478.2892, -997.9101, 26.40548)},	--- TUATJ MASZ MASLO TAKJ MA BYC					
		}		
	},	
	
--Komenda Highway Patrol
		{
		textCoords = vector3(1551.01, 819.8503, 77.78793),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -344890090, objHeading = 240.00003051758, objCoords  = vector3(1551.01, 819.8503, 77.78793)},	--- Drzwi tyl 1				
		}		
	},	

		{
		textCoords = vector3(1547.711, 814.136, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -344890090, objHeading = 240.00003051758, objCoords  = vector3(1547.711, 814.136, 77.7927)},	--- Drzwi tyl 2			
		}		
	},	

		{
		textCoords = vector3(1542.14, 809.8223, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 240.05609130859, objCoords  = vector3(1542.14, 809.8223, 77.7927)},	--- Locker		
		}		
	},		

		{
		textCoords = vector3(1542.14, 809.8223, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 240.00003051758, objCoords  = vector3(1542.14, 809.8223, 77.7927)},	--- Recepcja		
		}		
	},

		{
		textCoords = vector3(1541.499, 812.185, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 59.974746704102, objCoords  = vector3(1541.499, 812.185, 77.7927)},	--- Wejscie na tyly	
		}		
	},	

		{
		textCoords = vector3(1539.245, 822.1432, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 329.82958984375, objCoords  = vector3(1539.245, 822.1432, 77.7927)},	--- Wejscie na biura
		}		
	},	

		{
		textCoords = vector3(1555.621, 839.2528, 77.7927),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 239.99996948242, objCoords  = vector3(1555.621, 839.2528, 77.7927)},	--- Wejscie na zbrojownie
		}		
	},	

		{
		textCoords = vector3(1559.062, 833.1785, 76.65674),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -1671593055, objHeading = 60.009662628174, objCoords  = vector3(1559.062, 833.1785, 76.65674)},	--- Wejscie na cele
		}		
	},	

		{
		textCoords = vector3(1561.424, 833.051, 76.65674),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -1671593055, objHeading = 330.0, objCoords  = vector3(1561.424, 833.051, 76.65674)},	--- Cele UNO
		}		
	},

		{
		textCoords = vector3(1559.925, 830.4579, 76.65674),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -1671593055, objHeading = 330.0, objCoords  = vector3(1559.925, 830.4579, 76.65674)},	--- Cele DOS
		}		
	},

		{
		textCoords = vector3(1563.922, 828.1503, 76.65674),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -1671593055, objHeading = 330.0, objCoords  = vector3(1563.922, 828.1503, 76.65674)},	--- Cele TRES
		}		
	},	

		{
		textCoords = vector3(1565.422, 830.743, 76.65674),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = -1671593055, objHeading = 330.0, objCoords  = vector3(1565.422, 830.743, 76.65674)},	--- Cele QUATRO
		}		
	},	

		{
		textCoords = vector3(1544.375, 826.8131, 82.27543),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, 
		locked = true,
		maxDistance = 2.00,
		doors = {
		{objHash = 1040797377, objHeading = 330.0, objCoords  = vector3(1544.375, 826.8131, 82.27543)},	--- Dowody
		}		
	},						
	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)},
		}
	},


	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	---  Sandy Shores ---
	--[[	{
		textCoords = vector3(1848.14, 3690.81, 34.5),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 30.0, objCoords  = vector3(1847.69, 3690.2, 34.27)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 210.0, objCoords  = vector3(1848.79, 3690.93, 34.27)},
		}
	},
	
	{
		textCoords = vector3(1847.5, 3683.27, 34.5),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 30.0, objCoords  = vector3(1846.66, 3682.5, 34.27)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 210.0, objCoords  = vector3(1848.09, 3683.54, 34.27)},
		}
	},
	
	{
		objHash = GetHashKey('v_ilev_rc_door2'),
		objHeading = 30.0,
		objCoords = vector3(1856.53, 3690.72, 34.26),
		textCoords = vector3(1856.53, 3690.02, 34.8),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 1.5,
		size = 2
	},
	
	
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 120.0,
		objCoords = vector3(1844.39, 3688.96, 34.26),
		textCoords =vector3(1844.62, 3688.08, 34.26),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 1.0,
		size = 2
	},
	
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 300.0,
		objCoords = vector3(1846.08, 3685.22, 34.26),
		textCoords = vector3(1846.08, 3685.22, 34.26),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.0,
		size = 2
	},
	
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 300.0,
		objCoords = vector3(1847.75, 3682.32, 34.21),
		textCoords = vector3(1847.75, 3682.32, 34.21),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.0,
		size = 2
	},

	{	
	
		textCoords = vector3(1850.7, 3683.15, 34.5),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = -2023754432, objHeading = 117.84547241211, objCoords  = vector3(1851.266, 3681.875, 34.47312)},
			{objHash = -2023754432, objHeading = 299.84547241211, objCoords  = vector3(1849.266, 3684.141, 34.47312)},
		}
	},
]]


	
	{
		textCoords = vector3(1860.672, 3695.27, 30.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1486622150, objHeading = 119.88, objCoords  = vector3(1860.672, 3695.27, 30.42)},
		}
	},

	{
		textCoords = vector3(1863.026, 3691.902, 30.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1486622150, objHeading = 119.88, objCoords  = vector3(1863.026, 3691.902, 30.42)},
		}
	},

	{
		textCoords = vector3(1864.62, 3688.031, 30.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1486622150, objHeading = 119.88, objCoords  = vector3(1864.66, 3688.231, 30.42)},
		}
	},

	{
		textCoords = vector3(1849.617, 3682.07, 34.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1425448544, objHeading = 300.88, objCoords  = vector3(1849.617, 3681.18, 34.42)},
		}
	},

	{
		textCoords = vector3(1855.75, 3688.74, 34.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1425448544, objHeading = 344.88, objCoords  = vector3(1856.617, 3688.07, 34.42)},
		}
	},

	{
		textCoords = vector3(1857.579, 3698.254, 34.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1425448544, objHeading = 29.88, objCoords  = vector3(1857.579, 3698.254, 34.42)},
		}
	},


	{
		textCoords = vector3(1857.579, 3697.323, 30.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash =-1486622150, objHeading = 210.88, objCoords  = vector3(1857.579, 3697.323, 30.42)},
		}
	},

	{
		textCoords = vector3(1855.669, 3701.032, 30.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = 1196497453, objHeading = 30.88, objCoords  = vector3(1855.669, 3701.032, 30.42)},
		}
	},

	{
		textCoords = vector3(1849.949, 3688.95, 34.42),
		authorizedJobs = {'police','offpolice','ambulance'},
		locked = true,
		maxDistance = 1.5,
		doors = {
			{objHash = -1425448544, objHeading = 30.88, objCoords  = vector3(1849.949, 3688.95, 34.42)},
		}
	},
	
-- lost ---

-- lostmc

{
	textCoords = vector3(1980.084, 3050.493, 50.55628), 
	authorizedJobs = {'lost'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -2023754432, objHeading = 328.3155, objCoords  = vector3(1980.084, 3050.493, 50.55628)},
		
}
},


-- Paleto Bay ---
	{	
	
		textCoords = vector3(-428.99, 5996.83, 31.72),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_cellgate'), objHeading = 315.51547241211, objCoords  = vector3(-428.0646, 5996.672, 31.87312)},
		}
	},

	{	
	
		textCoords = vector3(-431.83, 5999.74, 31.72),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_cellgate'), objHeading = 315.51547241211, objCoords  = vector3(-431.1921, 5999.742, 31.87312)},
		}
	},

	{	
	
		textCoords = vector3(-432.93, 5992.32, 31.72),
		authorizedJobs = {'police','offpolice','IAA'},
		locked = true,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_cellgate'), objHeading = 315.65466308594, objCoords  = vector3(-432.1754, 5992.122, 31.87312)},
		}
	},	
			
--PERLA
		{
		textCoords = vector3(-1846.55, -1190.42, 14.34),--wyjscie z kuchni
		authorizedJobs = {'burgerownia'},--zmien na perle
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = GetHashKey('sibaaa_pearls_kitchendoor'), objHeading = 329.19064331055, objCoords  = vector3(-1847.271, -1189.992, 14.47118)},			
	},



	},
		{
		textCoords = vector3(-1839.43, -1181.77, 14.33),--wejscie do kuchni
		authorizedJobs = {'burgerownia'},--zmien na perle
		locked = true,
		maxDistance = 1,75,
		doors = {
			{objHash = GetHashKey('sibaaa_pearls_frontdoor'), objHeading = 58.841899871826, objCoords  = vector3(-1840.114, -1181.332, 14.74435)},			
	}		
	},	
		{
		textCoords = vector3(-1836.1, -1190.64, 19.19),--wejscie do biura morze
		authorizedJobs = {'burgerownia'},--zmien na perle
		locked = true,
		maxDistance = 2,75,
		doors = {
			{objHash = GetHashKey('sibaaa_pearls_og_officedoor'), objHeading = 151.29393005371, objCoords  = vector3(-1836.907, -1190.344, 19.08246)},			
	}		
	},
		{
		textCoords = vector3(-1831.04, -1181.6, 19.22),--wejscie do biura od miasta
		authorizedJobs = {'burgerownia'},--zmien na perle
		locked = true,
		maxDistance = 2,75,
		doors = {
			{objHash = GetHashKey('sibaaa_pearls_og_door2'), objHeading = 331.01614379883, objCoords  = vector3(-1830.246, -1181.788, 19.4074)},			
	}		
	},		
--MECHANO
	
	{
		textCoords = vector3(-112.1954, -1787.991, 29.98761),
		authorizedJobs = {'mecano','offmecano'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('v_ilev_ss_door03'), objHeading = 50.63739013672, objCoords  = vector3(-112.1954, -1787.991, 29.98761)},			
	}		
	},
	
	{
		textCoords = vector3(-102.8008, -1792.097, 32.34482),
		authorizedJobs = {'mecano','offmecano'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('v_ilev_ra_door2'), objHeading = 140.63739013672, objCoords  = vector3(-102.8008, -1792.097, 32.34482)},			
	}		
	},
	{
		textCoords = vector3(-114.959, -1772.521, 29.92948),
		authorizedJobs = {'mecano','offmecano'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('v_ilev_ss_door8'), objHeading = 50.63739013672, objCoords  = vector3(-114.959, -1772.521, 29.92948)},			
	}
	},
	
		{
		textCoords = vector3(948.13, -964.84, 39.5), 
		authorizedJobs = {'mecano','offmecano'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = GetHashKey('V_ILev_Roc_Door3'), objHeading = 93.650634765625, objCoords  = vector3(948.5289, -965.3519, 39.64355)},			
	}		
	},	
--PLAYBOY	
		{
		textCoords = vector3(-1536.85, 131.3, 57.67),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('prop_doormaf'), objHeading = 137.28956604004, objCoords  = vector3(-1536.85, 131.3, 57.67)},			
	}		
	},	
		{
		textCoords = vector3(-1522.46, 143.3, 55.66),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('v_ilev_mm_door'), objHeading = 316.63739013672, objCoords  = vector3(-1522.46, 143.3, 55.66)},			
	}		
	},
		{
		textCoords = vector3(-1500.69, 104.144, 55.80867),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = GetHashKey('v_ilev_mm_door'), objHeading = 227.32369995117, objCoords  = vector3(-1500.69, 104.144, 55.80867)},			
	}		
	},				
		{
		textCoords = vector3(-1527.282, 119.0815, 55.74234),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = -1141522158, objHeading = 137.02297973633, objCoords  = vector3(-1527.282, 119.0815, 55.74234)},	
			{objHash = 988364535, objHeading = 137.35597229004, objCoords  = vector3(-1526.287, 118.156, 55.73763)},				
	}		
	},	
	
	--
	-- Automatic Gate 2
	--
	{
		objHash = -2125423493,
		objHeading = 329.00,
		objCoords = vector3(-1616.23400, 79.78043, 60.77741),
		textCoords = vector3(-1613.65, 78.06, 62.76),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 12.5
	},	

	{
		textCoords = vector3(-1471.15, 68.99, 54.32),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 12.5,
		doors = {
			{objHash = -2125423493, objHeading = 5.00, objCoords  = vector3(-1474.131, 68.38, 52.52709)},				
	}		
	},	
	--
	-- Side Gate 1
	--
	{
		objHash = -1859471240,
		objHeading = 9.393,
		objCoords = vector3(-1462.42500, 65.71588, 53.38676),
		textCoords = vector3(-1461.7, 65.91, 53.96),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 1.25
	},
	--
	-- Side Gate 2
	--
	{
		objHash = -1859471240,
		objHeading = 60.730,
		objCoords = vector3(-1441.72700, 171.91040, 56.06494),
		textCoords = vector3(-1441.49, 172.58, 56.87),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 1.25
	},
	--
	-- Side Gate 3
	--
	{
		objHash = -1859471240,
		objHeading = 129.435,
		objCoords = vector3(-1434.00600, 235.01300, 60.37110),
		textCoords = vector3(-1434.54, 235.5, 60.81),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 1.25
	},
	--
	-- Side Gate 4
	--
	{
		objHash = -1859471240,
		objHeading = 203.500,
		objCoords = vector3(-1578.37100, 153.20700, 58.96855),
		textCoords = vector3(-1579.01, 152.87, 59.64),
		authorizedJobs = {'pruszkowski'},
		locked = true,
		maxDistance = 1.25
	},
----- RICHMAN HOUSE LUCYFERA

	{
	textCoords = vector3(-1804.94, 436.33, 129.1), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 2074032093, objHeading = 359.95, objCoords  = vector3(-1804.94, 436.33, 129.1)},
}
},	

{
	textCoords = vector3(-1804.64, 429.15, 129.1), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1826999110, objHeading = 359.95, objCoords  = vector3(-1804.64, 429.15, 129.1)},
}
},	

{
	textCoords = vector3(-1815.89, 423.1957, 128.7), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 451680698, objHeading = 0.34, objCoords  = vector3(-1817.433, 424.1957, 128.7)},
		{objHash = 451680698, objHeading = 180.45, objCoords  = vector3(-1814.455, 424.1957, 128.7)},
}
},

{
	textCoords = vector3(-1828.403, 418.88, 121.65), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1438552720, objHeading = 0.56, objCoords  = vector3(-1827.403, 418.1957, 121.65)},
		
}
},



{
	textCoords = vector3(-1787.71, 411.4, 114.0), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -801817937, objHeading = 180.26, objCoords  = vector3(-1787.71, 411.4, 114.0)},
		
}
},

{
	textCoords = vector3(-1786.38, 420.0, 117.8), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -782244720, objHeading = 268.26, objCoords  = vector3(-1786.288, 420.4, 117.8)},
		
}
},


{
	textCoords = vector3(-1798.88, 469.19, 134.0), 
	authorizedJobs = {'lucyfer'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 724862427, objHeading = 118.92, objCoords  = vector3(-1799.74, 468.0, 134.0)},
		
}
},


------ Boneli

--[[{
	textCoords = vector3(740.45, -809.92, 24.7), 
	authorizedJobs = {'bloods'},
	locked = true,
	maxDistance = 2,
	doors = {
		{objHash = 2056855795, objHeading = 0.03, objCoords  = vector3(741.1413, -809.5294, 24.31)},
		{objHash = -1777641513, objHeading = 0.3, objCoords  = vector3(739.788, -809.6345, 24.31)},
		
}
},
]]

{
	textCoords = vector3(-239.6933, 2592.03, 52.91181), 
	authorizedJobs = {'bloods'},
	locked = true,
	brama = false,
	maxDistance = 10,
	doors = {
		{objHash = -1737602496, objHeading = 350.143, objCoords  = vector3(-239.6933, 2594.698, 51.91181)},
		
}
},


{
	textCoords = vector3(-85.0163, 834.1337, 236.0421), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 110411286, objHeading = 99.39, objCoords  = vector3(-85.0163, 834.1337, 236.0421)},
		
},

-------- GABRYS/MAFIALKOS/PROSZE NIE USUWAJCIE
{
    textCoords = vector3(-104.66, 850.15, 236.11),
    authorizedJobs = {'olivierek'},
    locked = true,
    maxDistance = 6.5,
    doors = {
        {objHash = -1918480350, objHeading = 155.0, objCoords  = vector3(-107.1934, 851.2832, 235.828)},
        {objHash = -349730013, objHeading = 155.0, objCoords  = vector3(-102.194, 849.0049, 235.828)},
    }
},

{
	textCoords = vector3(-80.54476, 828.5574, 235.8669), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 279.99, objCoords  = vector3(-80.54476, 828.5574, 235.8669)},
		
}
},

{
	textCoords = vector3(-80.09899, 825.8045, 235.8669), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 279.99, objCoords  = vector3(-80.09899, 825.8045, 235.8669)},
		
}
},

},

{
	textCoords = vector3(-57.38982, 832.6761, 235.8685), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 44.99, objCoords  = vector3(-57.38982, 832.6761, 235.8685)},
		
}
},

{
	textCoords = vector3(-60.12528, 838.5179, 235.8685), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 134.99, objCoords  = vector3(-60.12528, 838.5179, 235.8685)},
		
}
},

{
	textCoords = vector3(-57.44019, 835.9851, 235.8685), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 134.99, objCoords  = vector3(-57.44019, 835.9851, 235.8685)},
		
}
},

{
	textCoords = vector3(-92.01839, 827.383, 231.4802), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 279.99, objCoords  = vector3(-92.01839, 827.383, 231.4802)},
		
}
},

{
	textCoords = vector3(-81.88301, 828.3524, 231.4802), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 9.19, objCoords  = vector3(-81.88301, 828.3524, 231.4802)},
		
}
},

{
	textCoords = vector3(-79.91512, 833.8008, 231.4773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 189.19, objCoords  = vector3(-79.91512, 833.8008, 231.4773)},
		
}
},

{
	textCoords = vector3(-59.12512, 836.18008, 231.4773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 44.23, objCoords  = vector3(-59.12512, 836.18008, 231.4773)},
		
}
},

{
	textCoords = vector3(-62.53512, 840.98008, 231.4773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 134.23, objCoords  = vector3(-62.53512, 840.98008, 231.4773)},
		
}
},


{
    textCoords = vector3(-104.66, 850.15, 236.11),
    authorizedJobs = {'olivierek'},
    locked = true,
    maxDistance = 10.5,
    doors = {
        {objHash = 108051359, objHeading = 315.0, objCoords  = vector3(-102.194,849.0049, 235.828)},
        {objHash = 2974746347, objHeading = 135.0, objCoords  = vector3(-107.1934, 851.2832, 235.828)},
    }
},

{
	textCoords = vector3(-90.153512, 817.71008, 227.74773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 631614199, objHeading = 280.0, objCoords  = vector3(-90.153512, 817.71008, 227.74773)},
		
}
},

{
	textCoords = vector3(-79.1253512, 822.76008, 227.74773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 9.21, objCoords  = vector3(-79.1253512, 822.76008, 227.74773)},
		
}
},

{
	textCoords = vector3(-52.0253512, 827.75008, 231.56773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 44.21, objCoords  = vector3(-52.0253512, 827.75008, 231.56773)},
		
}
},

{
	textCoords = vector3(-71.3849, 823.9976008, 231.57773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 9.21, objCoords  = vector3(-71.3849, 823.9976008, 231.57773)},
		
}
},

{
	textCoords = vector3(-50.1949, 829.6476008, 235.91173), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 44.21, objCoords  = vector3(-50.1949, 829.6476008, 235.91173)},
		
}
},

{
	textCoords = vector3(-69.8749, 824.3076008, 235.97773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 9.21, objCoords  = vector3(-69.8749, 824.3076008, 235.97773)},
		
}
},

{
	textCoords = vector3(-81.66792, 822.3226008, 235.97773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 8.981, objCoords  = vector3(-81.66792, 822.3226008, 235.97773)},
		
}
},


{
	textCoords = vector3(-98.15792, 816.2426008, 235.97773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1119680854, objHeading = 9.381, objCoords  = vector3(-98.15792, 816.2426008, 235.97773)},
		
}
},

{
	textCoords = vector3(-90.70095, 821.0826008, 240.35773), 
	authorizedJobs = {'olivierek'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1186396713, objHeading = 281.4077, objCoords  = vector3(-90.70095, 821.0826008, 240.35773)},
		
}
},
---GABRYS2---

{
	textCoords = vector3(354.4469, 18.5749, 84.8167),
    authorizedJobs = {'gabrys'}, -- Przejscie
    locked = true,
    maxDistance = 10.0,
    doors = {
    {objHash = -1130189596, objHeading = 0.0, objCoords  = vector3(354.4469, 18.5749, 83.8167)},

	}
},

{
	textCoords = vector3(407.3095, -17.2857, 91.9848),
    authorizedJobs = {'gabrys'}, -- Przejscie
    locked = true,
    maxDistance = 3.0,
    doors = {
    {objHash = 607720026, objHeading = 240.0, objCoords  = vector3(407.3095, -17.2857, 90.9848)},
	}
},

{
	textCoords = vector3(406.5408, -16.8257, 92.0748),
    authorizedJobs = {'gabrys'}, -- Przejscie
    locked = true,
    maxDistance = 3.0,
    doors = {
    {objHash = -973354389, objHeading = 150.0, objCoords  = vector3(406.5408, -16.8257, 92.0748)},
	}
},

{
	textCoords = vector3(354.363, 18.63274, 85.589),
    authorizedJobs = {'gabrys'}, -- Przejscie
    locked = true,
    maxDistance = 40.0,
    doors = {
    {objHash = -1140189596, objHeading = 36.920, objCoords  = vector3(354.363, 18.63274, 85.589)},
	}
},

{
    textCoords = vector3(-124.35, 900.77, 235.9783),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 5.5,
    doors = {
        {objHash = -1918480350, objHeading = 98.4357, objCoords  = vector3(-124.7022,903.4881, 235.9783)},
        {objHash = -349730013, objHeading = 98.1044, objCoords  = vector3(-123.9024, 898.0499, 235.9783)},
    }
},

{
    textCoords = vector3(-177.3052, 905.954, 239.0822),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 1335409163, objHeading = 44.7357, objCoords  = vector3(-177.3052, 905.954, 239.0822)},
    }
},

{
    textCoords = vector3(-149.0257, 895.4813, 235.7622),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 330294775, objHeading = 44.39, objCoords  = vector3(-149.0257, 895.4813, 235.7622)},
    }
},

{
    textCoords = vector3(-151.8557, 909.7813, 235.8022),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 1335309163, objHeading = 44.85, objCoords  = vector3(-151.8557, 909.7813, 235.8022)},
    }
},

{
    textCoords = vector3(-150.7657, 890.3013, 239.1148),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 330294775, objHeading = 48.38, objCoords  = vector3(-150.7657, 890.3013, 239.1148)},
    }
},

{
	textCoords = vector3(-167.4467041016, 915.88240356445, 235.807578125), 
	authorizedJobs = {'gabrys'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1335309163, objHeading = 224.84, objCoords  = vector3(-166.5462822266, 916.62926699219, 235.807578125)},
		{objHash = 1335309163, objHeading = 45.16, objCoords  = vector3(-168.3823095703, 914.79270356445, 235.807406640625)},
}
},


{
	textCoords = vector3(390.7, 1.05, 92.41473),
    authorizedJobs = {'gabrys'}, -- Przejscie
    locked = true,
    maxDistance = 3.0,
    doors = {
    {objHash = 607720026, objHeading = 240.0, objCoords  = vector3(390.1235, -0.1210895, 92.41473)},    --- TUATJ MASZ MASLO TAKJ MA BYC
     {objHash = 607720026, objHeading = 59.77, objCoords  = vector3(391.3176, 1.966623, 92.41473)},    --- TUATJ MASZ MASLO TAKJ MA BYC

	}
},

{
    textCoords = vector3(-151.8321, 891.2762, 233.5634),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 330294775, objHeading = 48.069, objCoords  = vector3(-151.8321, 891.2762, 233.5634)},
    }
},

{
    textCoords = vector3(-165.0408, 899.7982, 233.5634),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 330294775, objHeading = 134.77, objCoords  = vector3(-165.0408, 899.7982, 233.5634)},
    }
},

{
    textCoords = vector3(-177.3052, 905.954, 239.0822),
    authorizedJobs = {'gabrys'},
    locked = true,
    maxDistance = 2.5,
    doors = {
        {objHash = 1335309163, objHeading = 44.73, objCoords  = vector3(-177.3052, 905.954, 239.0822)},
    }
},

-- wyscigi
{
	textCoords = vector3(1980.084, 3050.49, 50.15633), 
	authorizedJobs = {'trc'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -2023754432, objHeading = 328.31, objCoords  = vector3(1980.084, 3050.49, 50.15633)},
		
}
},
{
	textCoords = vector3(119.07, 6639.16, 32.10), 
	authorizedJobs = {'trc'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1259801187, objHeading = 314.999, objCoords  = vector3(119.07, 6639.16, 32.10)},
		
}
},

--- shadow family

{
	textCoords = vector3(-2587.574, 1910.457, 167.6492), 
	authorizedJobs = {'shadow'},
	locked = true,
	maxDistance = 5,
	doors = {
		{objHash = 308207762, objHeading = 5.8999, objCoords  = vector3(-2587.574, 1910.457, 167.6492)},
		
}
},

--Sicario--
{
	textCoords = vector3(-1036.4967041016, 329.18240356445, 68.017578125), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 6,
	doors = {
		{objHash = -1918480350, objHeading = 177.09, objCoords  = vector3(-1038.5142822266, 329.44616699219, 68.017578125)},
		{objHash = -349730013, objHeading = 177.49, objCoords  = vector3(-1034.4923095703, 329.18240356445, 68.101806640625)},
}
},
{
	textCoords = vector3(-1064.9670410156, 316.29888916016, 65.86083984375), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 6,
	doors = {
		{objHash = -1918480350, objHeading = 258.09, objCoords  = vector3(-1065.5999755859, 314.18902587891, 65.725952148438)},
		{objHash = -349730013, objHeading = 257.49, objCoords  = vector3(-1064.8879394531, 318.46154785156, 65.945068359375)},
}
},

{
	textCoords = vector3(-1038.17, 311.55, 67.27), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 893692758, objHeading = 198.736, objCoords  = vector3(-1039.73, 311.55, 67.27)},
		{objHash = 893692758, objHeading = 18.736, objCoords  = vector3(-1036.93, 311.55, 67.27)},
		
}
},

{
	textCoords = vector3(-1051.87, 304.52, 67.05), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 395669496, objHeading = 288.576, objCoords  = vector3(-1051.87, 303.73, 67.05)},
		{objHash = 395669496, objHeading = 108.576, objCoords  = vector3(-1051.87, 305.38, 67.05)},
		
}
},

{
	textCoords = vector3(-1047.32, 296.13, 66.99), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1123731138, objHeading = 18.85, objCoords  = vector3(-1046.32, 296.13, 66.99)},
		{objHash = 1123731138, objHeading = 198.85, objCoords  = vector3(-1048.32, 296.13, 66.99)},
		
}
},

{
	textCoords = vector3(-953.41, 300.82, 70.76), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 6,
	doors = {
		{objHash = -349730013, objHeading = 305.457, objCoords  = vector3(-954.793, 303.13, 70.92)},
		{objHash = -1918480350, objHeading = 304.628, objCoords  = vector3(-951.656, 298.66, 70.93)},
		
}
},

{
	textCoords = vector3(-954.98, 336.72, 71.37), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1568354151, objHeading = 180.00, objCoords  = vector3(-954.98, 336.72, 71.37)},
		
}
},

{
	textCoords = vector3(-944.61, 291.44, 70.451), 
	authorizedJobs = {'sicario'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1568354151, objHeading = 359.72, objCoords  = vector3(-944.61, 291.44, 70.451)},
		
}
},

--wloczykij

{
	textCoords = vector3(-1553.335, 33.86, 57.377), 
	authorizedJobs = {'wloczykij'},
	locked = true,
	maxDistance = 8,
	doors = {
		{objHash = -2125423493, objHeading = 351.4999, objCoords  = vector3(-1553.335, 33.86, 57.377)},
		
}
},
-- zablokowana brama
{
	textCoords = vector3(-1583.28, 40.141, 59.33), 
	authorizedJobs = {'wloczyskij'},
	locked = true,
	maxDistance = 8,
	doors = {
		{objHash = -2125423493, objHeading = 167.4999, objCoords  = vector3(-1583.28, 40.141, 59.33)},
		
}
},
-- drzwi nie otwierac

{
	textCoords = vector3(412.92, 4817.405, -59.998), 
	authorizedJobs = {'nieotwierac'},
	locked = true,
	maxDistance = 6,
	doors = {
		{objHash = -361000789, objHeading = 0.0, objCoords  = vector3(412.92, 4817.405, -59.998)},
		{objHash = -361000789, objHeading = 179.9999, objCoords  = vector3(423.9459, 4817.405, -59.999)},
}
},

--tijuana

{
	textCoords = vector3(-1477.6614990234, 884.99340820313, 182.86596679688), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 6,
	doors = {
		{objHash = -1918480350, objHeading = 79.233, objCoords  = vector3(-1477.229, 887.649, 183.017)},
		{objHash = -349730013, objHeading = 79.219, objCoords  = vector3(-1478.257, 882.243, 183.0719)},
}
},
{
	textCoords = vector3(-1517.0241699219, 851.09008789063, 181.58532714844), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1033441082, objHeading = 340.1, objCoords  = vector3(-1518.027, 851.5494, 181.718)},
		{objHash = 1033441082, objHeading = 158.989, objCoords  = vector3(-1515.827, 850.7246, 181.718)},
		
}
},
{
	textCoords = vector3(-1520.77, 848.3264, 181.718), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1033441082, objHeading = 25.049, objCoords  = vector3(-1520.77, 848.3264, 181.718)},
		
}
},
{
	textCoords = vector3(-1500.635, 856.679, 181.721), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1033441082, objHeading = 204.958, objCoords  = vector3(-1500.635, 856.679, 181.721)},
		
}
},
{
	textCoords = vector3(-1490.6768798828, 852.18463134766, 181.58532714844), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1033441082, objHeading = 114.981, objCoords  = vector3(-1490.0966796875, 851.44616699219, 181.58532714844)},
		{objHash = 1033441082, objHeading = 294.942, objCoords  = vector3(-1491.0593261719, 852.77801513672, 181.58532714844)},
		
}
},
{
	textCoords = vector3(-1500.1450195313, 844.87915039063, 181.58532714844), 
	authorizedJobs = {'tijuana'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1785293089, objHeading = 25.182, objCoords  = vector3(-1500.1450195313, 844.87915039063, 181.58532714844)},
		
}
},
--VITALI
{
	textCoords = vector3(724.7473, -697.9548, 28.892969), 
	authorizedJobs = {'vitali'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -2113580896, objHeading = 90.03002166748, objCoords  = vector3(724.7473, -697.9548, 28.892969)},
		
}
},
-- sicario
{
	textCoords = vector3(-2667.602, 1326.96, 147.5934), 
	authorizedJobs = {'andrzej'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = 1901183774, objHeading = 89.49886, objCoords  = vector3(-2667.602, 1326.96, 147.5934)},
		
}
},

{
	textCoords = vector3(-2683.499, 1328.96, 147.1534), 
	authorizedJobs = {'andrzej'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -1027256213, objHeading = 179.1, objCoords  = vector3(-2683.499, 1328.96, 147.1534)},
		
}
},

{
	textCoords = vector3(-2667.22, 1330.4, 147.5534), 
	authorizedJobs = {'andrzej'},
	locked = true,
	maxDistance = 3,
	doors = {
		{objHash = -147325430, objHeading = 179.1, objCoords  = vector3(-2666.396, 1330.96, 147.5534)},
		
}
},

{
	textCoords = vector3(-2652.467, 1307.366, 148.4865), 
	authorizedJobs = {'andrzej'},
	locked = true,
	brama = true,
	maxDistance = 10,
	doors = {
		{objHash = -1573772550, objHeading = 90.1, objCoords  = vector3(-2652.467, 1307.366, 147.5865)},
		
}
},

{
	textCoords = vector3(-2672.981, 1309.51, 152.04), 
	authorizedJobs = {'hhaajp'},
	locked = true,
	maxDistance = 1,
	doors = {
		{objHash = 283948267, objHeading = 177.1, objCoords  = vector3(-2672.981, 1309.51, 152.04)},
		
}
},
------- vigne

{
    textCoords = vector3(-1889.13, 2051.88, 141.01), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1077118233, objHeading = 158.986862182262, objCoords  = vector3(-1890.225, 2052.236, 141.3125)},
  		{objHash = 1077118233, objHeading = 340.68853759766, objCoords  = vector3(-1887.903, 2051.387, 141.3115)},

}
},

{
    textCoords = vector3(-1886.55, 2050.80, 141.01), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1077118233, objHeading = 159.57081604004, objCoords  = vector3(-1887.534, 2051.234, 141.3125)},
		{objHash = 1077118233, objHeading = 340.16311645508, objCoords  = vector3(-1885.211, 2050.38, 141.3085)},

}
},
{
    textCoords = vector3(-1864.25, 2060.55, 141.98), 
    authorizedJobs = {'tak'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = -1141522158, objHeading = 270.17037963867, objCoords  = vector3(-1864.2, 2059.899, 141.1452)},
		{objHash = 988364535, objHeading = 270.64068603516, objCoords  = vector3(-1864.213, 2061.265, 141.1456)},

}
},
{
    textCoords = vector3(-1860.60, 2058.35, 135.46), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = -710818483, objHeading = 269.41394042969, objCoords  = vector3(-1860.672, 2057.727, 135.689)},

}
},
{
    textCoords = vector3(-1864.70, 2058.40, 135.46), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = -710818483, objHeading = 270.54425048828, objCoords  = vector3(-1864.813, 2057.723, 135.689)},

}
},
{
    textCoords = vector3(-1884.40, 2060.25, 145.57), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 534758478, objHeading = 159.99301147461, objCoords  = vector3(-1885.679, 2060.775, 145.7319)},
		{objHash = 534758478, objHeading = 340.26193237305, objCoords  = vector3(-1883.23, 2059.881, 145.7319)},

}
},
{
    textCoords = vector3(-1874.45, 2069.63, 141.01), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1077118233, objHeading = 159.57081604004, objCoords  = vector3(-1875.614, 2070.068, 141.3125)},
		{objHash = 1077118233, objHeading = 340.16311645508, objCoords  = vector3(-1873.294, 2069.22, 141.3085)},

}
},
{
    textCoords = vector3(-1886.07, 2073.88, 141.00), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1077118233, objHeading = 159.57081604004, objCoords  = vector3(-1887.243, 2074.308, 141.3125)},
		{objHash = 1077118233, objHeading = 340.16311645508, objCoords  = vector3(-1884.921, 2073.462, 141.3085)},

}
},
{
    textCoords = vector3(-1893.82, 2075.1, 140.84), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1077118233, objHeading = 140.69152832031, objCoords  = vector3(-1894.73, 2075.967, 141.3125)},
		{objHash = 1077118233, objHeading = 319.49935913086, objCoords  = vector3(-1892.833, 2074.381, 141.3085)},

}
},

{
    textCoords = vector3(-1899.49, 2083.77, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 139.72131347656, objCoords  = vector3(-1900.406, 2084.447, 140.9146)},
		{objHash = 1843224684, objHeading = 319.81390380859, objCoords  = vector3(-1898.514, 2082.852, 140.9153)},

}
},
{
    textCoords = vector3(-1902.0, 2085.52, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 139.72131347656, objCoords  = vector3(-1902.882, 2086.545, 140.9168)},
		{objHash = 1843224684, objHeading = 320.25769042969, objCoords  = vector3(-1900.994, 2084.947, 140.9188)},

}
},
{
    textCoords = vector3(-1906.63, 2084.55, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 49.617721557617, objCoords  = vector3(-1905.994, 2085.627, 140.9115)},
		{objHash = 1843224684, objHeading = 229.5853729248, objCoords  = vector3(-1907.596, 2083.744, 140.9115)},

}
},
{
    textCoords = vector3(-1911.05, 2079.72, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 49.617721557617, objCoords  = vector3(-1910.202, 2080.679, 140.9115)},
		{objHash = 1843224684, objHeading = 229.5853729248, objCoords  = vector3(-1911.81, 2078.795, 140.9115)},

}
},
{
    textCoords = vector3(-1911.15, 2074.72, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 139.86227416992, objCoords  = vector3(-1912.101, 2075.56, 140.9149)},
		{objHash = 1843224684, objHeading = 319.82238769531, objCoords  = vector3(-1910.209, 2073.969, 140.9131)},

}
},
{
    textCoords = vector3(-1908.63, 2072.60, 140.41), 
    authorizedJobs = {'vigne'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 1843224684, objHeading = 139.86227416992, objCoords  = vector3(-1909.624, 2073.472, 140.9152)},
		{objHash = 1843224684, objHeading = 320.18402099609, objCoords  = vector3(-1907.732, 2071.878, 140.9131)},

}
},
{
    textCoords = vector3(2514.80, -356.60, 94.13), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = -114880996, objHeading = 224.08758544922, objCoords  = vector3(2515.779, -355.764, 93.99196)},
		{objHash = -2045695986, objHeading = 223.93830871582, objCoords  = vector3(2513.915, -357.572, 93.99156)},

}
},
{
    textCoords = vector3(2505.05, -349.40, 105.69), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 395979613, objHeading = 45.040489196777, objCoords  = vector3(2505.883, -348.672, 105.8514)},

}
},
{
    textCoords = vector3(2507.65, -348.85, 105.69), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 395979613, objHeading = 134.91192626853, objCoords  = vector3(2506.877, -348.153, 105.8514)},

}
},
{
    textCoords = vector3(2510.30, -351.75, 105.69), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 395979613, objHeading = 134.92541503906, objCoords  = vector3(2509.618, -351.073, 105.8514)},

}
},
{
    textCoords = vector3(2507.75, -354.40, 105.69), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 395979613, objHeading = 134.92541503906, objCoords  = vector3(2507.034, -353.658, 105.8514)},

}
},
{
    textCoords = vector3(2505.0, -351.65, 105.69), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = 395979613, objHeading = 134.79452514648, objCoords  = vector3(2504.244, -350.937, 105.8514)},

}
},
{
    textCoords = vector3(2521.0, -416.47, 94.12), 
    authorizedJobs = {'police' , 'adwokat' , 'ambulance'},
    locked = true,
    maxDistance = 3,
    doors = {
        {objHash = -603547852, objHeading = 315.00003051758, objCoords  = vector3(2521.943, -417.384, 93.0905)},
		{objHash = 1122723068, objHeading = 315.00003051758, objCoords  = vector3(2520.099, -415.5436, 93.0905)},
}
},

	{
    textCoords = vector3(935.99, -1489.82, 30.7), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 5,
    doors = {
        {objHash = -2076929163, objHeading = 0.0011910815956071, objCoords  = vector3(935.9291, -1489.484, 31.19228)},

	}
	},
	{
	    textCoords = vector3(943.35, -1489.71, 30.7), 
	    authorizedJobs = {'brat'},
	    locked = true,
	    maxDistance = 5,
	    doors = {
	        {objHash = -2076929163, objHeading = 0.0016437851591036, objCoords  = vector3(943.3696, -1489.486, 31.21412)},

	}
	},
	{
	    textCoords = vector3(939.73, -1489.69, 30.55), 
	    authorizedJobs = {'brat'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1052098579, objHeading = 0.20061349868774, objCoords  = vector3(939.0271, -1489.573, 30.242)},

	}
	},

	{
    textCoords = vector3(1406.84, 1128.25, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -228773386, objHeading = 180.0866064453, objCoords  = vector3(1407.548, 1128.329, 114.4855)},

}
},

{
    textCoords = vector3(1407.82, 1164.4, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -52575179, objHeading = 90.0866064453, objCoords  = vector3(1408.166, 1165.834, 114.5)},
        {objHash = -1032171637, objHeading = 90.0866064453, objCoords  = vector3(1408.171, 1163.834, 114.5)},

}
},

{
    textCoords = vector3(1409.12, 1147.32, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -1032171637, objHeading = 90.084495544434, objCoords  = vector3(1409.292, 1146.254, 114.4869)},
{objHash = -52575179, objHeading = 89.999969482422, objCoords  = vector3(1409.292, 1148.454, 114.4869)},


}
},
{
    textCoords = vector3(1408.02, 1160.07, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -1032171637, objHeading = 89.667892456055, objCoords  = vector3(1408.157, 1158.956, 114.4873)},
{objHash = -52575179, objHeading = 90.118408203125, objCoords  = vector3(1408.167, 1161.155, 114.4873)},


}
},
{
    textCoords = vector3(1390.52, 1162.39, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -1032171637, objHeading = 89.667892456055, objCoords  = vector3(1390.411, 1161.241, 114.4873)},
{objHash = -52575179, objHeading = 89.667892456055, objCoords  = vector3(1390.424, 1163.438, 114.4873)},


}
},
{
    textCoords = vector3(1396.05, 1141.93, 114.75), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -228773386, objHeading = 269.95404052734, objCoords  = vector3(1395.92, 1142.904, 114.7902)},
{objHash = -228773386, objHeading = 89.832801818848, objCoords  = vector3(1395.92, 1140.705, 114.7902)},


}
},
{
    textCoords = vector3(1390.6, 1132.19, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -52575179, objHeading = 90.125457763672, objCoords  = vector3(1390.666, 1133.317, 114.4808)},
{objHash = -1032171637, objHeading = 89.841156005859, objCoords  = vector3(1390.666, 1131.117, 114.4808)},


}
},
{
    textCoords = vector3(1400.49, 1128.52, 114.5), 
    authorizedJobs = {'brat'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -52575179, objHeading = 179.81275939941, objCoords  = vector3(1399.393, 1128.314, 114.4836)},
{objHash = -1032171637, objHeading = 179.82879638672, objCoords  = vector3(1401.59, 1128.314, 114.4836)},


}
},

	{
		textCoords = vector3(-1987.37, -512.32, 12.50), 
		authorizedJobs = {'ciapaty'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = 308207762, objHeading = 50.079677581787, objCoords  = vector3(-1986.969, -511.6528, 12.329)},
	
	}
	},

	{
		textCoords = vector3(-1980.1, -496.32, 12.50), 
		authorizedJobs = {'ciapaty'},
		locked = true,
		brama = true,
		maxDistance = 5,
		doors = {
			{objHash = 2052512905, objHeading = 140.19664001465, objCoords  = vector3(-1980.544, -496.4486, 12.52564)},
	
	}
	},

	{
		textCoords = vector3(-1975.92, -497.86, 12.50), 
		authorizedJobs = {'ciapaty'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = -550386901, objHeading = 230.58712768555, objCoords  = vector3(-1975.371, -497.5298, 12.01911)},
	
	}
	},

	{
		textCoords = vector3(-270.133012451172, -2002.65496826172, 30.678344726563), -- GALLA
		authorizedJobs = {'mma'}, -- Wejscie Przod
		locked = true,
		maxDistance = 2.0,
		doors = {
		{objHash = 1345239927, objHeading = 248.3, objCoords  = vector3(-270.133012451172, -2002.65496826172, 30.278344726563)},    --- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = 1345239927, objHeading = 68.84, objCoords  = vector3(-269.923012451172, -2000.65496826172, 30.278344726563)},    --- TUATJ MASZ MASLO TAKJ MA BYC
		}
	},

	{
		textCoords = vector3(-243.133012451172, -2007.65496826172, 24.678344726563), -- GALLA
		authorizedJobs = {'mma'}, -- Wejscie Przod
		locked = true,
		maxDistance = 2.0,
		doors = {
		{objHash = 1083279016, objHeading = 77.3, objCoords  = vector3(-243.133012451172, -2007.65496826172, 24.678344726563)},    --- TUATJ MASZ MASLO TAKJ MA BYC
		{objHash = 1083279016, objHeading = 256.84, objCoords  = vector3(-242.593012451172, -2005.65496826172, 24.678344726563)},    --- TUATJ MASZ MASLO TAKJ MA BYC
		}
	},

	{
		textCoords = vector3(-674.139, -164.97, 38.03), 
		authorizedJobs = {'menel'},
		locked = true,
		maxDistance = 2,
		doors = {
			{objHash = 668467214, objHeading = 300.0, objCoords  = vector3(-674.139, -164.97, 38.03)},
	
	}
	},

	{
    textCoords = vector3(-669.42, -153.15, 43.54), 
    authorizedJobs = {'menel'},
    locked = true,
    maxDistance = 2,
    doors = {
        {objHash = -1309327919, objHeading = 300.12496948242, objCoords  = vector3(-668.5054, -153.7614, 44.10809)},

	}
	},
	
	{
		textCoords = vector3(-246.85, -920.55, 32.4552), 
		authorizedJobs = {'ochrona'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = 495262852, objHeading = 69.99, objCoords  = vector3(-246.85, -920.55, 32.4552)},
	
	}
	},

	{
		textCoords = vector3(-244.85, -915.1139, 32.4552), 
		authorizedJobs = {'ochrona'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = 495262852, objHeading = 69.99, objCoords  = vector3(-244.85, -915.1139, 32.4552)},
	
	}
	},

	{
		textCoords = vector3(-232.53, -915.6, 32.4552), 
		authorizedJobs = {'ochrona'},
		locked = true,
		maxDistance = 3,
		doors = {
			{objHash = 100848840, objHeading = 160.04, objCoords  = vector3(-233.48, -915.45, 32.4552)},
			{objHash = -2050436002, objHeading = 160.04, objCoords  = vector3(-231.45, -916.1981, 32.4552)},
	
	}
	},



	{
	    textCoords = vector3(-575.01, -934.42, 28.98), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = -1119680854, objHeading = 0.0, objCoords  = vector3(-575.01, -934.42, 28.98)},

	}
	},

	{
	    textCoords = vector3(-570.61, -931.32, 28.98), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = -1119680854, objHeading = 269.99, objCoords  = vector3(-570.01, -930.42, 28.98)},
	        {objHash = -1119680854, objHeading = 90.04, objCoords  = vector3(-570.01, -932.42, 28.98)},


	}
	},


	{
	    textCoords = vector3(-573.67, -934.35, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = -2037125726, objHeading = 90.0, objCoords  = vector3(-573.01, -933.42, 33.48)},
	        {objHash = -2037125726, objHeading = 269.69, objCoords  = vector3(-573.73, -935.69, 33.98)},


	}
	},

	{
	    textCoords = vector3(-566.7211, -932.53, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 269.72, objCoords  = vector3(-566.7211, -932.53, 33.34)},


	}
	},

	{
	    textCoords = vector3(-568.7211, -918.53, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 3.12, objCoords  = vector3(-568.7211, -918.53, 33.34)},


	}
	},

	{
	    textCoords = vector3(-591.75, -912.53, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 89.12, objCoords  = vector3(-591.75, -912.53, 33.3)},


	}
	},


	{
	    textCoords = vector3(-600.03, -922.87, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 359.761, objCoords  = vector3(-598.75, -922.53, 33.3)},
	         {objHash = 1901183774, objHeading = 179.761, objCoords  = vector3(-601.27, -922.53, 33.3)},


	}
	},

	{
	    textCoords = vector3(-588.13, -937.53, 33.34), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 0.12, objCoords  = vector3(-589.13, -938.53, 33.34)},


	}
	},

	{
	    textCoords = vector3(-571.3, -930.07, 23.90), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1901183774, objHeading = 90.761, objCoords  = vector3(-571.68, -928.53, 23.3)},
	     {objHash = 1901183774, objHeading = 270.761, objCoords  = vector3(-571.68, -931.53, 23.3)},


	}
	},

	{
	    textCoords = vector3(-578.16, -915.88, 23.90), 
	    authorizedJobs = {'news'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	     {objHash = 1901183774, objHeading = 90.761, objCoords  = vector3(-577.68, -914.53, 23.3)},
	     {objHash = 1901183774, objHeading = 270.761, objCoords  = vector3(-577.68, -917.53, 23.3)},


	}
	},

	{
	    textCoords = vector3(113.16, -1297.43, 29.48), 
	    authorizedJobs = {'vanilla'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	     {objHash = -495720969, objHeading = 299.761, objCoords  = vector3(113.16, -1297.43, 29.48)},


	}
	},


	{
	    textCoords = vector3(95.47, -1284.78, 29.27), 
	    authorizedJobs = {'vanilla'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	     {objHash = 668467214, objHeading = 209.93, objCoords  = vector3(96.09, -1284.02, 29.27)},


	}
	},

	{
	    textCoords = vector3(127.9552, -1298.503, 29.41), 
	    authorizedJobs = {'vanilla'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	     {objHash = -1116041313, objHeading = 30.93, objCoords  = vector3(127.9552, -1298.503, 29.41)},


	}
	},

	{
	    textCoords = vector3(127.9552, -1298.503, 29.41), 
	    authorizedJobs = {'vanilla'},
	    locked = true,
	    maxDistance = 2,
	    doors = {
	     {objHash = -1116041313, objHeading = 30.93, objCoords  = vector3(127.9552, -1298.503, 29.41)},


	}
	},

	{
	    textCoords = vector3(-2599.44, 1673.26, 141.9031), 
	    authorizedJobs = {'kewin'},
	    locked = true,
	    maxDistance = 12,
	    brama = true,
	    doors = {
	     {objHash = 1286535678, objHeading = 201.93, objCoords  = vector3(-2603.063, 1671.269, 140.9031)},


	}
	},

	{
	    textCoords = vector3(-1050.432, 718.503, 165.9031), 
	    authorizedJobs = {'chujjp'},
	    locked = true,
	    maxDistance = 1,
	    doors = {
	     {objHash = -1243140539, objHeading = 205.93, objCoords  = vector3(-1050.432, 718.503, 165.9031)},


	}
	},


	{
	    textCoords = vector3(-1831.57, -1180.97, 14.74), 
	    authorizedJobs = {'burgerownia'},
	    locked = true,
	    maxDistance = 1,
	    doors = {
	     {objHash = 1870406214, objHeading = 60.93, objCoords  = vector3(-1831.57, -1180.97, 14.74)},


	}
	},

	{
	    textCoords = vector3(-1845.42, -1194.80, 19.45), 
	    authorizedJobs = {'burgerownia'},
	    locked = true,
	    maxDistance = 1,
	    doors = {
	     {objHash = -1643773373, objHeading = 151.01, objCoords  = vector3(-1845.42, -1194.80, 19.45)},


	}
	},

	{
	    textCoords = vector3(-1817.90, -1193.66, 14.86), 
	    authorizedJobs = {'burgerownia'},
	    locked = false,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1994441020, objHeading = 60.01, objCoords  = vector3(-1817.90, -1193.66, 14.86)},
	     {objHash = 1994441020, objHeading = 240.01, objCoords  = vector3(-1815.88, -1194.83, 14.86)},


	}
	},

	{
	    textCoords = vector3(-1822.63, -1200.036, 19.97), 
	    authorizedJobs = {'burgerownia'},
	    locked = false,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1994441020, objHeading = 330.50, objCoords  = vector3(-1822.63, -1200.036, 19.97)},
	     {objHash = 1994441020, objHeading = 150.01, objCoords  = vector3(-1823.80, -1202.05, 19.99)},


	}
	},

	{
	    textCoords = vector3(-1841.88, -1198.01, 14.86), 
	    authorizedJobs = {'burgerownia'},
	    locked = false,
	    maxDistance = 2,
	    doors = {
	        {objHash = 1994441020, objHeading = 330.01, objCoords  = vector3(-1841.88, -1198.01, 14.86)},
	     {objHash = 1994441020, objHeading = 150.01, objCoords  = vector3(-1843.05, -1200.03, 14.86)},


	}
	},



	{
	    textCoords = vector3(-1286.304, 491.027, 97.87), 
	    authorizedJobs = {'chujjp'},
	    locked = true,
	    maxDistance = 1,
	    doors = {
	     {objHash = 1747066351, objHeading = 268.93, objCoords  = vector3(-1286.304, 491.027, 97.87)},


	}
	},


}





	--[[	{
		textCoords = vector3(-1078.43, -825.58, 11.04),
		authorizedJobs = {'police' , 'adwokat' , 'ambulance'}, -- EVIDENCE ROOM -2
		locked = true,
		maxDistance = 2.85,
		doors = {
		{objHash = GetHashKey('vesp_door1'), objHeading = 217.43853759766, objCoords  = vector3(-1079.627, -826.2634, 11.18247)},	
		{objHash = GetHashKey('vesp_door1'), objHeading = 36.951152801514, objCoords  = vector3(-1077.576, -824.6953, 11.18247)},					
			}		
	},	
]]