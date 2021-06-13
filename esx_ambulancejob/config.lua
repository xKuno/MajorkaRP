Config                            = {}

Config.DrawDistance               = 25.0
Config.MarkerTypeCloakroom		  = 22
Config.MarkerTypePharmacy		  = 42
Config.MarkerTypeLodzie		      = 35
Config.MarkerTypeHelka			  = 34
Config.MarkerTypeVehicles		  = 36
Config.MarkerTypeDeleters		  = 24
Config.MarkerColor                = { r = 251, g = 48, b = 0 }
Config.MarkerSize                 = { x = 2.5, y = 2.5, z = 1.5 }
Config.EnableESXIdentity          = true 
Config.EnableLicenses             = true 
Config.ReviveReward               = 6250  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = false -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders
Config.Locale                     = 'pl'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 5 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 50 * minute -- Time til the player bleeds out

Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 4500

Config.AmbulanceStations = {
--[[
	LosSantos = {

        Blip = {
            Pos     = { x = 304.78, y = -588.4, z = 43.28 },
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },

        Blipprywatny = {
            Pos     = { x = -1491.5, y = -1026.42, z = 7,3 },
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },


        AmbulanceActions = {
         { x = 299.35, y = -597.45, z = 43.28},	-- elburro 
         { x = -1486.92, y = -1030.63, z = 6.3},     --Patrol         
        },

        EmsMenu = {
         { x = 334.76, y = -594.27, z = 43.27},
    
        },

        Pharmacy = {
             { x = 309.99, y = -568.72, z = 43.27 },
             { x = -1491.51, y = -1026.42, z = 6.3},     --Patrol               
        },

        Lodzie = {
            {
                Spawner    = { x = -1479.59, y = -1008.93, z = 6.29 },
                SpawnPoints = {
                    { x = -1632.76, y = -1173.5, z = 3.28 , heading = 127.0, radius = 6.0 }
                }
            },

        },


        Vehicles = {
            {
                Spawner    =     { x = 333.84, y = -561.82, z = 28.73 },
                SpawnPoints = {
                    { x = 323.0, y = -548.56, z = 28.74, heading = 360.00, radius = 6.0 },
         
                }
            },
        },

        Helka = {
            {
                    Spawner    = { x = 355.65, y = -577.16, z = 74.17 },
                    SpawnPoints = {
                    { x = 349.87, y = -587.85, z = 74.17, heading = 248.92, radius = 6.0 }
                }
            },
        },

        VehicleDeleters = {
            { x = -341.73, y = -559.74, z = 28.74},
            { x = 350.9, y = -588.24, z = 74.17},
            { x = 298.43, y = -576.08, z = 43.13},            
            { x = -1135.0, y = -1612.04, z = 34.69},
            { x = 342.18, y = -560.65, z = 28.74}            
    
               
        },


    },
]]--
LosSantos = {

       --[[ Blip = { -- mountzonach
            Pos     = { x = -447.05, y = -313.12, z = 78.17 },
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },]]

          Blip = { -- viceroy
            Pos     = {x = -827.67034912109, y = -1223.2087402344, z = 6.920166015625},
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },

       --[[Blip = { -- el burro
            Pos     = { x = 1122.63, y = -1539.91, z = 78.17 },
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },]]

        Blipprywatny = {
            Pos     = { x = -1491.5, y = -1026.42, z = 7,3 },
            Sprite  = 61,
            Display = 4,
            Scale   = 1.2,
            Colour  = 59
        },


        AmbulanceActions = { -- PRZEIBIERALNIA
         { x = -443.53, y = -310.0, z = 34.91}, -- mz
         { x = 299.01, y = -597.79, z = 43.28},
         { x = 437.45, y = -978.93, z = 26.67},   --KOMENDA  
         { x = -1486.92, y = -1030.63, z = 6.3}, -- Patrol
         { x = 1144.08, y = -1551.19, z = 35.38}, -- ell buro
         {x = -825.23077392578, y = -1236.3297119141, z = 7.3245849609375},        -- viucero    
        },

        EmsMenu = { -- BOSS MENU
        { x = -609.93, y = -300.13, z = 69.52}, 
        { x = -508.08, y = -329.4, z = 69.52},        
        { x = 334.79, y = -594.23, z = 43.28}, 
        { x = 1144.08, y = -1551.19, z = 35.38}, 
        {x = -791.18243408203, y = -1244.9934082031, z = 7.3245849609375}, -- Viceroy
        },

        Pharmacy = {
        	{ x = -453.83, y = -308.61, z = 34.91}, -- mz
             { x = 310.14, y = -568.3, z = 43.28 },
              { x = 435.94, y = -973.54, z = 26.67 }, --komenda  
             { x = -1491.51, y = -1026.42, z = 6.3},     --Patrol         
             { x = 1122.63, y = -1539.91, z = 34.87},   
             {x = -804.85711669922, y = -1210.8264160156, z = 7.3245849609375}, -- viceeroy 
        },

        Lodzie = {
            {
                Spawner    = { x = -1479.59, y = -1008.93, z = 6.29 },
                SpawnPoints = {
                    { x = -1632.76, y = -1173.5, z = 3.28 , heading = 127.0, radius = 6.0 }
                }
            },

        },


        Vehicles = {
            {
                Spawner    =     { x = -421.14, y = -349.5, z = 24.23 },
                SpawnPoints = {
                    { x = -435.44, y = -351.2, z = 24.23, heading = 207.97, radius = 6.0 },
         
                }
            },

             {
                Spawner    =     { x = 1118.31, y = -1521.85, z = 34.84 },
                SpawnPoints = {
                    { x = 1119.15, y = -1516.54, z = 34.69, heading = 281.79, radius = 6.0 },
         
                }
            },

            {
                Spawner    =     {x = -862.52307128906, y = -1227.2175292969, z = 6.3978271484375},
                SpawnPoints = {
                    {x = -861.25714111328, y = -1220.5186767578, z = 6.0439453125, heading = 311.29, radius = 3.0 },
                    {x = -863.28790283203, y = -1216.1669921875, z = 5.5721435546875,  heading = 301.92, radius = 3.0},
                    {x = -858.39562988281, y = -1222.6417236328, z = 6.01025390625, heading = 321.55, radius = 3.0},
         
                }
            },

            {
                Spawner    =     {x = -843.13848876953, y = -1234.4044189453, z = 6.920166015625},
                SpawnPoints = {
                    {x = -841.17364501953, y = -1226.7692871094, z = 6.920166015625, heading = 34.85, radius = 6.0 },
                    {x = -861.25714111328, y = -1220.5186767578, z = 6.0439453125, heading = 311.29, radius = 3.0 },
                    {x = -863.28790283203, y = -1216.1669921875, z = 5.5721435546875,  heading = 301.92, radius = 3.0},
                    {x = -858.39562988281, y = -1222.6417236328, z = 6.01025390625, heading = 321.55, radius = 3.0},
         
                }
            }



        },

        Helka = {
            {
                    Spawner    = { x = -444.73, y = -302.79, z = 78.17 },
                    SpawnPoints = {
                    { x = -456.05, y = -290.8, z = 78.17, heading = 28.24, radius = 6.0 }
                }
            },

            {
                    Spawner    = { x = 1134.52, y = -1604.75, z = 34.69 },
                    SpawnPoints = {
                    { x = 1133.92, y = -1612.05, z = 34.69, heading = 263.16, radius = 6.0 }
                }
            },


            {
                Spawner    = {x = -784.78680419922, y = -1199.8154296875, z = 51.134033203125},
                SpawnPoints = {
                    {x = -790.81317138672, y = -1191.771484375, z = 53.021240234375, heading = 263.16, radius = 6.0 }
            }
        },
            

            
        },

        VehicleDeleters = {
        	{ x = -435.44, y = -351.2, z = 24.23 },
            { x = -456.05, y = -290.8, z = 78.17 },
			{ x = 351.83, y = -588.33, z = 74.16 },
			{ x = 1133.92, y = -1612.05, z = 34.69},
            { x = 1118.22, y = -1517.07, z = 34.69},
            {x = -841.17364501953, y = -1226.7692871094, z = 6.920166015625}, 
            {x = -861.25714111328, y = -1220.5186767578, z = 6.0439453125},    
            {x = -863.28790283203, y = -1216.1669921875, z = 5.5721435546875},
            {x = -858.39562988281, y = -1222.6417236328, z = 6.01025390625},
            {x = -844.07470703125, y = -1243.4901123047, z = 14.82275390625},
            {x = -790.81317138672, y = -1191.771484375, z = 53.021240234375},
        },

    },
Paleto = {

        Blip = {
    Pos     = { x = -245.41, y = 6329.04, z = 31.43 },
    Sprite  = 61,
    Display = 4,
    Scale   = 1.2,
    Colour  = 2
        },

    

        AmbulanceActions = {
            { x = -252.61, y = 6310.33, z = 32.43 },
        },

        Pharmacy = {
            { x = -251.98, y = 6313.21, z = 32.43 },
        },

        EmsMenu = {
         { x = -256.11, y = 6306.21, z = 32.43},
        },

        Lodzie = {
            {
                Spawner    = { x = -278.51, y = 6637.81, z = 7.55 },
                SpawnPoints = {
                    { x = -297.05, y = 6667.49, z = 1.55, heading = 30.98, radius = 6.0 }
                }
            },
            
        },


        Vehicles = {
            {
                Spawner    = { x = -271.8, y = 6334.13, z = 32.43 },
                SpawnPoints = {
                    { x = -279.29, y = 6321.46, z = 32.4, heading = 224.78, radius = 6.0 },
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
		
		},

        Helka = {
            {
                    Spawner    = { x = -252.61, y = 6327.62, z = 39.66 },
                    SpawnPoints = {
                    { x = -252.19, y = 6319.02, z = 39.66, heading = 44.94, radius = 6.0 }
                }
            },
        },

        VehicleDeleters = {
            { x = -260.87, y = 6345.1, z = 32.43 },
            { x = -252.37, y = 6319.16, z = 39.66 },
        },

    },

    Sandy = {

        Blip = {
    Pos     = { x = 1836.51, y = 3676.04, z = 31.43 },
    Sprite  = 61,
    Display = 4,
    Scale   = 1.2,
    Colour  = 47
        },

    

        AmbulanceActions = {
            { x = 1825.49, y = 3674.78, z = 34.27 },
        },

        Pharmacy = {
            { x = 1836.75, y = 3684.78, z = 34.27 },
        },

        EmsMenu = {
         { x = 1839.71, y = 3686.76, z = 34.27 },
        },

        Lodzie = {
            {
                Spawner    = { x = -23123178.51, y = 663312317.81, z = 7232.55 },
                SpawnPoints = {
                    { x = -297.05, y = 6667.49, z = 1.55, heading = 30.98, radius = 6.0 }
                }
            },
            
        },


        Vehicles = {
            {
                Spawner    = { x =1835.91, y = 3670.13, z = 34.28 },
                SpawnPoints = {
                    { x = 1835.69, y = 3664.56, z = 33.72, heading = 212.23, radius = 6.0 },
                }
            },

        },

        Helka = {
            {
                    Spawner    = { x = 1854.21, y = 3701.6, z = 34.28 },
                    SpawnPoints = {
                    { x = 1849.52, y = 3714.23, z = 33.21, heading = 295.43, radius = 6.0 }
                }
            },
        },

        VehicleDeleters = {
            { x = 1829.76, y = 3690.06, z = 38.38 },
            { x = 1834.65, y = 3665.05, z = 33.23 },
            --{ x = -252.37, y = 6319.16, z = 39.66 },
        },

    },
}

Config.Lodzie = {
{
	model = 'Dinghy',
	label = 'Lodz Ratunkowa'
},
{
	model = 'Seashark2',
	label = 'Motorowka Ratunkowa'
},
{
	model = 'dw_cgpredato',
	label = 'Predator EMS'
}
}


Config.AuthorizedHelka = {
	Shared = { 

		{
		model = 'aw139',
		label = 'Max Thunder ma ukryty harem pod szpitalem'
		}

 			},

	praktykant = {

		
		},

	ratownik = {
	
	
		},

	lekarz = {
		
		{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}
		

	

		},

	lekarzv2 = {
	{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}

		},

	lekarzv3 = {
		{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}
		
		},
	     

	doktor = {
{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}

    	},

    doktorv2 = {
	{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}

   	 	},

   	fleczer = {
{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}

    	},

    chirurg = {
{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}
    	},
    securo = {
 {
        model = 'supervolito',
        label = 'Supervolito'
        }
        },       

    zastepca = {
	{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		}

    	},

	boss = {
{
		model = 'polmav',
		label = 'Helikopter Ratunkowy'
		},

		{
		model = 'mh65c',
		label = 'Helikopter Ratunkowy Lepszy'
		},
		{
		model = 'r1custom',
		label = 'Motorynka'
		},
		{
		model = 'polems',
		label = 'BossWozik'
		}

    	},
}
-- https://wiki.rage.mp/index.php?title=Vehicles
Config.AuthorizedVehicles = {
	Shared = {


  
			--emsnspeedo
    {
        model = 'emsnspeedo',
        label = 'Speedo'
    },
  
    {
        model = 'AMR_TAHOE',
        label = 'Tahoe'
    },
   
    {
        model = 'STEEDAMB',
        label = 'Steed'
    }, 
            			
	
    {
        model = 'rambulance',
        label = 'Ram2500'
    },

    {
        model = 'ALSrescue1',
        label = 'Freightliner'
    },


    {
        model = 'ambulance14',
        label = 'Ford Demers'
    }, 	
},
	psycholog = {
    {
        model = 'teslax',
        label = 'Samochod Psychologow'
    },

    {
        model = 'rsvr16',
        label = 'LUNA'
    },


},
	praktykant = {

		
		},

	ratownik = {

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

		},

	lekarz = {

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },

	},

	lekarzv2 = {





    {
        model = 'qrv',
        label = 'Explorer'
   	},

	{
        model = 'emsroamer',
        label = 'Roamer'
    },
		
	{
        model = 'firesilv17',
        label = 'Silverado'
    },

		},

	lekarzv3 = {



    {
        model = 'qrv',
        label = 'Explorer'
   	},

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

    {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },    
  
},
	     

	doktor = {

    {
        model = 'qrv',
        label = 'Explorer'
   	},

    {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },

    	},

    doktorv2 = {

    {
        model = 'qrv',
        label = 'Explorer'
   	},

      {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },

   	 	},

   		fleczer = {


    {
        model = 'qrv',
        label = 'Explorer'
   	},

 {
        model = 'camaroRB',
        label = 'Camaro Medyczne '
    },

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

      {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

     {
        model = 'corspeedo',
        label = 'Pojazd Koronera'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },
  
    	},



    	chirurg = {

    {
        model = 'qrv',
        label = 'Explorer'
   	},
	


	{
        model = 'emsroamer',
        label = 'Roamer'
    },

      {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

    {
        model = 'dodgeems',
        label = 'Dodge EMS'
    },

     {
        model = 'corspeedo',
        label = 'Pojazd Koronera'
    },

	{
        model = 'firesilv17',
        label = 'Silverado'
    },

   	},

   	securo = {


   {
        model = 'brawler',
        label = 'Terenówka Mireczka'
    },

   {
        model = 'caddy',
        label = 'Wózek Mireczka'
    },    
   		 },

     	zastepca = {

    {
        model = 'qrv',
        label = 'Explorer'
   	},

	{
        model = 'emsroamer',
        label = 'Roamer'
    },

     {
        model = 'camaroRB',
        label = 'Camaro Medyczne '
    },

      {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

    {
        model = 'dodgeems',
        label = 'Dodge EMS'
    },

    {
        model = 'dodgesamu',
        label = 'Dodge zarządu '
    },

    {
        model = 'polgs350',
        label = 'Lexus medyczny'
    },

     {
        model = 'corspeedo',
        label = 'Pojazd Koronera'
    },

 	{
        model = 'firesilv17',
        label = 'Silverado'
    },

    	},

	boss = {



    {
        model = 'qrv',
        label = 'Explorer'
   	},
	
		{
        model = 'emsroamer',
        label = 'Roamer'
    },

    {
        model = 'camaroRB',
        label = 'Camaro Medyczne '
    },

      {
        model = '2020tacoma',
        label = 'Medyczna Tacoma'
    },

    {
        model = 'dodgeems',
        label = 'Dodge EMS'
    },

    {
        model = 'dodgesamu',
        label = 'Dodge zarządu '
    },

     {
        model = 'polgs350',
        label = 'Lexus medyczny'
    },

     {
        model = 'corspeedo',
        label = 'Pojazd Koronera'
    },
    
	{
        model = 'firesilv17',
        label = 'Silverado'
    },

    {
        model = 'teslax',
        label = 'Boss Samochod'
    },

    {
        model = 'rsvr16',
        label = 'LUNA CAR'
    },

    }
}


Config.Zones = {

	WstajePoBw = {
		Pos	= {x = -801.01977539063, y = -1236.8835449219, z = 8.0322265625},
		Type = -1
	}

}

Config.Uniforms = {
	nurek = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 300,   ['torso_2'] = 3,
            ['decals_1'] = 75,   ['decals_2'] = 0,
            ['arms'] = 48,
            ['pants_1'] = 114,   ['pants_2'] = 3,
            ['shoes_1'] = 75,   ['shoes_2'] = 3,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 36,  ['tshirt_2'] = 1,
            ['torso_1'] = 48,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 48,
            ['pants_1'] = 34,   ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = 45,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },

	zimowy = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 69,   ['torso_2'] = 0,
            ['decals_1'] = 75,   ['decals_2'] = 0,
            ['arms'] = 81,
            ['pants_1'] = 67,   ['pants_2'] = 0,
            ['shoes_1'] = 33,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 139,   ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 136,   ['torso_2'] = 1,
            ['decals_1'] = 65,   ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 34,   ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = 100,  ['helmet_2'] = 0,
            ['chain_1'] = 96,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 13,  ['bproof_2'] = 0
        }
    },
	
	pelny = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 112,   ['torso_2'] =0,
            ['decals_1'] = 76,   ['decals_2'] = 0,
            ['arms'] = 89,
            ['pants_1'] = 66,   ['pants_2'] = 0,
            ['shoes_1'] = 32,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 139,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 136,   ['torso_2'] = 1,
            ['decals_1'] = 65,   ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 34,   ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = 0,  ['helmet_2'] = 0,
            ['chain_1'] = 96,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },
    COVID = {
        male = {
            ['tshirt_1'] = 50,  ['tshirt_2'] = 0,
            ['torso_1'] = 199,   ['torso_2'] =0,
            ['decals_1'] = 75,   ['decals_2'] = 0,
            ['arms'] = 79,
            ['pants_1'] = 44,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 139,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 2,
            ['torso_1'] = 61,   ['torso_2'] = 2,
            ['decals_1'] = 66,   ['decals_2'] = 0,
            ['arms'] = 75,
            ['pants_1'] = 40,   ['pants_2'] = 2,
            ['shoes_1'] = 25,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['mask_1'] = 46,   ['mask_2'] = 0
        }
    },
    securo_wear = {
        male = {
           ['tshirt_1'] = 16,  ['tshirt_2'] = 0,
            ['torso_1'] = 67,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 2,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 62,  ['tshirt_2'] = 2,
            ['torso_1'] = 67,   ['torso_2'] = 2,
            ['decals_1'] = 58,   ['decals_2'] = 0,
            ['arms'] = 64,
            ['pants_1'] = 40,   ['pants_2'] = 2,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
            ['mask_1'] = 46,   ['mask_2'] = 0
        }
    }, 

	pelny2 = {
        male = {
            ['tshirt_1'] = 43,  ['tshirt_2'] = 1,
            ['torso_1'] = 148,   ['torso_2'] = 0,
            ['decals_1'] = 75,   ['decals_2'] = 0,
            ['arms'] = 87,
            ['pants_1'] = 116,   ['pants_2'] = 0,
            ['shoes_1'] = 12,   ['shoes_2'] = 6,
            ['helmet_1'] = 14,  ['helmet_2'] = 2,
            ['chain_1'] = 139,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0,
			['bags_1'] = 21,  ['bags_2'] = 10
        },
        female = {
            ['tshirt_1'] = 14,  ['tshirt_2'] = 0,
            ['torso_1'] = 136,   ['torso_2'] = 1,
            ['decals_1'] = 65,   ['decals_2'] = 0,
            ['arms'] = 88,
            ['pants_1'] = 34,   ['pants_2'] = 0,
            ['shoes_1'] = 27,   ['shoes_2'] = 0,
            ['helmet_1'] = 100,  ['helmet_2'] = 0,
            ['chain_1'] = 96,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    }
}


--------------------------------------------------
------ DEATH CAM FOR FIVEM MADE BY KIMINAZE ------
------ This script does let you control the ------
------ camera after you have died.          ------
--------------------------------------------------

Cfg = {}

-- maximum radius the camera will orbit at (in meters)
Cfg.radius = 5