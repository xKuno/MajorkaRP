--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------ koza gbur ham i prostak
--------------------------------------------


Config                         = {}
Config.Locale                     = 'pl'
-- czas --
Config.Czasprzebierania			 = 5 -- 5 sekundy - czas przebierania ( robocze -> cywilne) // (cywilne -> robocze)
Config.czassmazenia            = 25 -- 15 sekund - czas smażenia mięsa
Config.czaskrojenia            = 10 -- 15 sekund - czas krojenia pomidora
Config.czasmycia               = 15 -- 15 sekund - czas mycia sałaty
Config.czasprzygotowania       = 60
Config.czasprzygotowaniasredni = 45
Config.czasprzygotowanianajmniejszy = 30 
Config.czasprzygotowaniamax    = 45 -- 15 sekund - czas przygotowywania całego burgera
Config.czassprzatania          = 60 -- 45 sekund - czas sprzątania toalety

-- szansa --
Config.szansa                  = 10 -- 1-100% na to że kilent zwymiotuje po zjedzeniu burgera
Config.bw                      = 1

-- Max. ilości przedmiotów, które może mieć gracz

-- Należy dokonać takich samych zmian w ograniczeniach bazy danych (tabela `items` kolumna `limit`)
Config.maxbulka                = 5 -- bułka
Config.maxpomidor              = 5 -- pomidor
Config.maxsalata               = 5 -- sałata
Config.maxmieso                = 5 -- mięso
Config.maxketchup              = 5 -- ketchup

Config.maxgmieso               = 5 -- usmażone mięso
Config.maxgpomidor             = 5 -- pokrojony pomidor
Config.maxgsalata              = 5 -- umyta sałata

Config.maxburger               = 8 -- gotowe burgery
Config.czek					   = 3000
Config.czek2				   = 4000


-- Wypłaty, pieniążki, itp. --
Config.losujwyplate       = true -- true wypłata będzie losowana z wartości Config.Wypłata1 - Config.Wypłata2 // false - gracz będzie otrzymywał stałą wypłatę zdefiniowaną w Config.Wyplatanielosuj

-- Jeśli gracz ma otrzymywać stały zarobek --
Config.Wyplatanielosuj    = 30

-- Jeśli chcesz losować zarobek --
Config.Wyplata1			  = 1950 -- najmniejsza zapłata
Config.Wyplata2 		  = 2050 -- największa zapłata
Config.Wyplata3       	  = 820 -- najmniejsza zapłata
Config.Wyplata4       	  = 1050 -- największa zapłata


Config.Samochod = {

   Samochody = {
	Pos   = { x = -625.25, y = 248.25, z = 81.64 },
        SpawnPoints = {
            { x = -626.37, y = 255.35, z = 81.58, heading = 261.86, radius = 2.0 },
        },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 0 },  
    Type  = 36,
   },    

}

Config.SamochodUsun = {
   Samochodyschowaj = {
	Pos   = { x = -626.37, y = 255.35, z = 81.58},
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 0 },  
    Type  = 24,
	},
    
}

Config.Szafka = {

  Szafka = {
    Pos   = {x = -631.97, y = 233.17, z = 81.88}, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 1.0 }, -- wielkość 
    Color = { r = 0, g = 100, b = 255 }, -- kolor (RGB) 
    Type  = 21, -- typ markera
  },
  
}

Config.Szefu = {

  Szef = {
    Pos   = { x = -635.11, y = 234.95, z = 81.88 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 1.0 }, -- wielkość 
    Color = { r = 0, g = 100, b = 255 }, -- kolor (RGB) 
    Type  = 21, -- typ markera
  },
  
}

Config.StrefyJesliMaPrace = {

  Przebieralnia = {
    Pos   = { x = -634.63, y = 226.47, z = 81.88 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 1.0 }, -- wielkość 
    Color = { r = 0, g = 100, b = 255 }, -- kolor (RGB) 
    Type  = 21, -- typ markera
  },
  
}

Config.Strefysprzatanko = {


  
}

Config.StrefyJesliPrzebrany = { 
  
   Lodowka = {
    Pos   = { x = -631.87, y = 227.64, z = 81.88 },
    Size  = { x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 0 },  
    Type  = 21,
  },
  
  
	
   Kroj = {
    Pos   = { x = -627.89, y = 223.52, z = 81.88 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 50, g = 150, b = 50 },  
    Type  = 21,
  },

  Myj = {
    Pos   = {  x = -631.0, y = 223.49, z = 81.88 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 50, g = 50, b = 150 },  
    Type  = 21,
  },
  
  Przyg = {
    Pos   = { x = -631.52, y = 224.78, z = 81.88 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 150, g = 50, b = 50 },  
    Type  = 21,
  },

  Sprzedaz = {
    Pos   = { x = -626.63, y = 233.02, z = 81.88 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 100, g = 255, b = 150 },  
    Type  = 29,
  },
  
}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 22
Config.MarkernitroType            = 31
Config.MarkerdespawnType          = 39
Config.MarkerspawnType            = 23
Config.MarkerbossType         	  = 29
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 95, b = 0 }

Config.AuthorizedVehicles = {
	Shared = {

		  {
            model = 'bmx',
            label = 'MASZ ROWERKA'
        },


	},

	recrue = {

         {
            model = 'skuterp',
            label = 'Skurwter'
        },

	},

    sergeant = {
        {
			model = 'skuterp',
			label = 'Skurwter'
		},
      
        {
            model = 'foodcar4',
            label = 'Woz pizzera'
        }

  },

	zastepca = {
		{
			model = 'foodcar4',
			label = 'Woz pizzera'
		},
		{
			model = 'skuterp',
			label = 'Skurwter'
        },
        
         {
            model = 'foodcar2',
            label = 'Woz pizzera v2'
        }

	},


	boss = {
		{
			model = 'foodcar4',
			label = 'Woz pizzera'
		},

        {
            model = 'foodcar2',
            label = 'Woz pizzera v2'
        },

		{
			model = 'skuterp',
			label = 'Skurwter'
        }

	}

}

Config.Dostawy = {
    -- Stacja El burro heights
        Delivery1LS = {
            Pos   = {x = 1214.6900634766, y = -1407.5736083984, z = 35.126708984375},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
    -- a cot� des flic
    Delivery2LS = {
            Pos   = {x = -83.261535644531, y = -1758.7912597656, z = 29.633666992188},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
    -- vers la plage
    Delivery3LS = {
            Pos   = {x = 251.51208496094, y = -1266.3692626953, z = 29.14501953125},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
    -- studio 1
    Delivery4LS = {
            Pos   = {x = 1176.5010986328, y = -315.81097412109, z = 69.163330078125},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery5LS = {
            Pos   = {x = 603.20440673828, y = 266.55825805664, z = 103.36853027344},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery6LS = {
            Pos   = {x = -2098.3515625, y = -294.8571472168, z = 13.03662109375},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery7LS = {
            Pos   = {x = -707.60437011719, y = -934.60217285156, z = 19.00146484375},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery8LS = {
            Pos   = {x = -518.32086181641, y = -1194.8835449219, z = 19.2373046875},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery9LS = {
            Pos   = {x = -305.82858276367, y = -1460.8879394531, z = 30.79638671875},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        Delivery10LS = {
            Pos   = {x = 2596.2724609375, y = 363.61318969727, z = 108.42346191406},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 3500
        },
        RetourCamion = {
            Pos   = {x = -633.49, y = 254.25, z = 81.38},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 0
        },
    
        AnnulerMission = {
            Pos   = {x = -618.38, y = 252.51, z = 81.59},
            Color = {r = 204, g = 204, b = 0},
            Size  = {x = 5.0, y = 5.0, z = 5.0},
            Color = {r = 204, g = 204, b = 0},
            Type  = 29,
            Paye = 0
        },



}

Config.Uniforms = {

   job_wear = {
        male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 2,   ['torso_2'] = 2,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 87,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 2,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,   ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 46,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 56,   ['pants_2'] = 4,
            ['shoes_1'] = 36,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },

    job_szefkuchni = {
        male = {
         ['tshirt_1'] = 0,  ['tshirt_2'] = 5,
            ['torso_1'] = 3,   ['torso_2'] = 3,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 18,   ['pants_2'] = 0,
            ['shoes_1'] = 48,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['glasses_1'] = 0,   ['glasses_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 46,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 56,   ['pants_2'] = 4,
            ['shoes_1'] = 36,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },

    job_manager = {
        male = {
       ['tshirt_1'] = 78,  ['tshirt_2'] = 0,
            ['torso_1'] = 82,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 11,
            ['pants_1'] = 48,   ['pants_2'] = 6,
            ['shoes_1'] = 31,   ['shoes_2'] = 1,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['glasses_1'] = 8,   ['glasses_2'] = 8
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 46,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 56,   ['pants_2'] = 4,
            ['shoes_1'] = 36,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },

    job_zastepca = {
        male = {
          ['tshirt_1'] = 13,  ['tshirt_2'] = 2,
            ['torso_1'] = 4,   ['torso_2'] = 4,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 6,
            ['pants_1'] = 48,   ['pants_2'] = 3,
            ['shoes_1'] = 31,   ['shoes_2'] = 3,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['glasses_1'] = 0,   ['glasses_2'] = 0
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 46,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 56,   ['pants_2'] = 4,
            ['shoes_1'] = 36,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },



    job_szef = {
        male = {
         ['tshirt_1'] = 119,  ['tshirt_2'] = 0,
            ['torso_1'] = 156,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 48,   ['pants_2'] = 0,
            ['shoes_1'] = 31,   ['shoes_2'] = 3,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['glasses_1'] = 8,   ['glasses_2'] = 8
        },
        female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 46,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 56,   ['pants_2'] = 4,
            ['shoes_1'] = 36,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 0,     ['ears_2'] = 0,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
        }
    },


}

--------------------------------------------
------ Napisane przez wojtek.cfg#0349 ------
----------------- ©  2019 ------------------
--------------------------------------------