
Config                         = {}

-- czas --
Config.Czasprzebierania		   = 3 -- 5 sekundy - czas przebierania ( robocze -> cywilne) // (cywilne -> robocze)
Config.czas_raportu          = 90 -- w SEKUDNACH
Config.Kutas = true

Config.Wyplata1			  = 20500 -- najmniejsza zapłata

Config.Szefu = {

  Szef = {
    Pos   = { x = 736.71, y = -1298.45, z = 26.3 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 0.5 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.StrefyJesliMaPrace = {

  Przebieralnia = {
    Pos   = { x = 769.3, y = -1297.48, z = 26.3 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 0.5 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.Szafka = {

  Szafka = {
    Pos   = {x = 753.68, y = -1298.28, z = 26.3},
  --  Pos   = {x = -277.75, y = -895.14, z = 31.31}, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 1.0 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.Samochod = {

   Samochody = {
         Pos   = { x = 747.37, y = -1284.76, z = 26.3 },
        SpawnPoints = {
            { x = 743.43, y = -1291.12, z = 26.3, heading = 84.5, radius = 3.0 },
            { x = 751.8, y = -1290.79, z = 26.3, heading = 89.77, radius = 3.0 },
        },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },   
    Type  = 36,
   },    

}

Config.SamochodUsun = {
   Samochodyschowaj = {
    Pos   = { x = 743.43, y = -1291.12, z = 26.3, },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },   
    Type  = 24,
  },
    
}

Config.StrefyJesliPrzebrany = { 
    
   raport1 = {
    Pos   = { x = 224.56, y = -788.44, z = 30.87 - 0.90 }, -- nie
    Size  = { x = 50.0, y = 50.0, z = 50.0 },
    Color = { r = 154, g= 197, b= 226 },  
    Type  = 27,
	},
	
   raport2 = {
    Pos   = { x =-357.2, y = -124.69, z = 38.81 - 0.50 }, -- warsztat 
    Size  = { x = 30.0, y = 30.0, z = 30.0 },
    Color = { r = 154, g= 197, b= 226 }, 
    Type  = 27,
  },

  raport3 = {
    Pos   = { x = 164.3, y = -3209.64, z = 5.92 },
    Size  = {x = 30.0, y = 30.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },
    Type  = 27,
  },
  
  raport4 = {
    Pos   = { x = -1616.92, y = -1061.17, z = 13.02 },
    Size  = { x = 30.0, y = 30.0, z = 10.0 },
    Color = { r = 154, g= 197, b= 226 },
    Type  = 27,
  },

   raport5 = {
    Pos   = { x = 233.44, y = 216.01, z = 104.5 },
    Size  = { x = 30.0, y = 30.0, z = 10.0 },
    Color = { r = 154, g= 197, b= 226 },
    Type  = 27,
  },

  Sprzedaz = {
    Pos   = { x = 739.74, y= -1297.82, z= 26.33 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },  
    Type  = 29,
  },
  
}

 --- DO ANIMIACJI NIE DOTYKAC ;)c
Config.ochronaStations ={
    Cstam = {
  Sprzedaz  = {
    vector3(-72.503, -814.230, 242.843)
 }
}
}

-- DO WIND NIE DOTYKAC ---


-- DO MIEJSC NIE DOTYKAC --
Config.miejsca = {
 vector3(224.56,-788.44, 30.87), 
 vector3(-357.2, -124.69, 38.81), -- WARSZTAT 
 vector3(164.3, -3209.64, 5.92), -- WALKERS
 vector3(-1616.92, -1061.17, 13.02),
 vector3(233.44, 216.01, 106.29 ),
}

Config.AuthorizedVehiclesSprawdzmy ={

  {
    model = 'gruppe1',
    label = 'Pojazd Transportowy'
  },

  
  {
    model = 'gruppe2',
    label = 'Pojazd Transportowy'
  },
{
    model = 'gruppe3',
    label = 'Pojazd Transportowy'
  },

  
}

Config.AuthorizedVehicles = {
  Shared = {
         {
            model = 'gruppe1',
            label = 'Victoria'
         },
  },

recruit = {

    
          },

guard = {

          {
            model = 'gruppe3',
            label = 'Ford Explorer'
          },
      

  },

nightwatch = {
          {
            model = 'gruppe3',
            label = 'Ford Explorer'
         },

  },

manager = {
         {
            model = 'gruppe3',
            label = 'Ford Explorer'
         },
        {
            model = 'gruppe2',
            label = 'Charger'
         },

  },

zastepca = {
        {
            model = 'gruppe3',
            label = 'Ford Explorer'
         },
        {
            model = 'gruppe2',
            label = 'Charger'
         },

  },


boss = {
       {
            model = 'gruppe3',
            label = 'Ford Explorer'
         },
        {
            model = 'gruppe2',
            label = 'Charger'
         },

  }

}

Config.Uniforms = {
  recruit_wear = {
    male = {
              ['tshirt_1'] = 21,  ['tshirt_2'] = 0,
              ['torso_1'] = 13,   ['torso_2'] =1,
              ['decals_1'] = 0,   ['decals_2'] = 1,
              ['arms'] = 11,      ['arms'] = 0,
              ['pants_1'] = 16,    ['pants_2'] = 0,
              ['shoes_1'] = 32,   ['shoes_2'] = 0,
              ['bproof_1'] = 66,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 36,  ['tshirt_2'] = 0,
              ['torso_1'] = 269,   ['torso_2'] = 0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 31,
              ['pants_1'] = 11,   ['pants_2'] = 1,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['bproof_1'] = 2,  ['bproof_2'] = 0
  },
},

  guard_waer = {
    male = {
             ['tshirt_1'] = 20,  ['tshirt_2'] = 0,
              ['torso_1'] = 13,   ['torso_2'] = 6,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 11,      ['arms'] = 0,
              ['pants_1'] = 16,    ['pants_2'] = 0,
              ['shoes_1'] = 32,   ['shoes_2'] = 0,
              ['bproof_1'] = 4,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 2,  ['tshirt_2'] = 0,
              ['torso_1'] = 14,   ['torso_2'] =3,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 14,
              ['pants_1'] = 11,   ['pants_2'] = 1,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['bproof_1'] = 4,  ['bproof_2'] = 0
  },
},
  nightwatch_wear = {
    male = {
              ['tshirt_1'] = 20,  ['tshirt_2'] = 0,
              ['torso_1'] = 168,   ['torso_2'] = 3,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 19,
              ['pants_1'] = 16,   ['pants_2'] = 0,
              ['shoes_1'] = 32,   ['shoes_2'] = 0,
              ['bproof_1'] = 4,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
              ['torso_1'] = 62,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 18,
              ['pants_1'] = 18,   ['pants_2'] = 1,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['bproof_1'] = 4,  ['bproof_2'] = 0
  },
},

manager_wear = {
    male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 106,   ['torso_2'] =2,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 19,
              ['pants_1'] = 16,   ['pants_2'] = 0,
              ['shoes_1'] = 32,   ['shoes_2'] = 0,
              ['bproof_1'] = 8,   ['bproof_2'] = 0,
              ['chain_1'] = 126,  ['chain_2'] = 0,
    },
    female = {
              ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
              ['torso_1'] = 122,   ['torso_2'] =3,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 18,
              ['pants_1'] = 52,   ['pants_2'] = 0,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['bproof_1'] = 3,  ['bproof_2'] = 0
  },
},
zastepca_wear = {
    male = {
              ['tshirt_1'] = 17,  ['tshirt_2'] = 0,
              ['torso_1'] = 3,   ['torso_2'] =13,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 12,
              ['pants_1'] = 42,   ['pants_2'] = 0,
              ['shoes_1'] = 29,   ['shoes_2'] = 0,
              ['bproof_1'] = 8,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 3,  ['tshirt_2'] = 0,
              ['torso_1'] = 122,   ['torso_2'] =3,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 18,
              ['pants_1'] = 52,   ['pants_2'] = 0,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['bproof_1'] = 4,  ['bproof_2'] = 0
  },
},

boss_wear = {
    male = {
              ['tshirt_1'] = 17,  ['tshirt_2'] = 0,
              ['torso_1'] = 13,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 11,
              ['pants_1'] = 44,   ['pants_2'] = 5,
              ['shoes_1'] = 28,   ['shoes_2'] = 3,
              ['bproof_1'] = 32,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
              ['torso_1'] = 48,   ['torso_2'] = 0,
              ['decals_1'] = 7,   ['decals_2'] = 3,
              ['arms'] = 44,
              ['pants_1'] = 46,   ['pants_2'] = 0,
              ['shoes_1'] = 50,   ['shoes_2'] = 0,
              ['helmet_1'] = -1,  ['helmet_2'] = 0,
              ['chain_1'] = 0,    ['chain_2'] = 0,
              ['ears_1'] = 2,     ['ears_2'] = 0,
              ['bproof_1'] = 13,  ['bproof_2'] = 0
  },
}


}