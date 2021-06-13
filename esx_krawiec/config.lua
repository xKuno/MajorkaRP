
Config                         = {}

-- czas --
Config.Czasprzebierania		   = 3 -- 5 sekundy - czas przebierania ( robocze -> cywilne) // (cywilne -> robocze)

Config.Wyplata1			  = 1850 -- najmniejsza zapłata

Config.Szefu = {

  Szef = {
    Pos   = { x = 707.32, y = -966.9, z = 30.41 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 0.5 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.StrefyJesliMaPrace = {

  Przebieralnia = {
    Pos   = { x = 705.89, y = -960.72, z = 30.4 }, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 0.5 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.Szafka = {

  Szafka = {
    Pos   = {x = 708.62, y = -963.93, z = 30.04}, -- koordynaty
    Size  = { x = 1.0, y = 1.0, z = 1.0 }, -- wielkość 
    Color = { r = 154, g= 197, b= 226 }, -- kolor (RGB) 
    Type  = 3, -- typ markera
  },
  
}

Config.Samochod = {

   Samochody = {
         Pos   = { x = 743.55, y = -974.25, z = 24.57 },
        SpawnPoints = {
            { x = 749.13, y = -968.9, z = 24.77, heading = 267.75, radius = 3.0 },
        },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },   
    Type  = 36,
   },    

}

Config.SamochodUsun = {
   Samochodyschowaj = {
    Pos   = {  x = 749.13, y = -968.9, z = 24.77 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },   
    Type  = 24,
  },
    
}

Config.StrefyJesliPrzebrany = { 
    
   zbieranie_welna = {
    Pos   = { x = 1718.47, y = 4792.0, z = 41.07},
    Size  = { x = 5.0, y = 5.0, z = 5.0 },
    Color = { r = 154, g= 197, b= 226 },  
    Type  = 25,
	},
	
   przerabianie_welna = {
    Pos   = { x = 711.37, y = -969.67, z = 29.5},
    Size  = { x = 3.0, y = 3.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 }, 
    Type  = 25,
  },

  tworzenie_ubrania = {
    Pos   = {x = 715.35, y = -959.69, z = 30.04 },
    Size  = {x = 2.0, y = 2.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },
    Type  = 31,
  },

  Sprzedaz = {
    Pos   = { x = 425.56, y= -805.59, z= 29.49 },
    Size  = { x = 1.0, y = 1.0, z = 1.0 },
    Color = { r = 154, g= 197, b= 226 },  
    Type  = 29,
  },
  
}

-- DO MIEJSC NIE DOTYKAC --
Config.miejsca = {
  Blips = {
    {
      Pos =  vector3(1707.47, 4792.0, 41.97), 
      nazwa = '#1 Welna'
    },

    {
      Pos = vector3(711.37, -969.67, 30.04), 
      nazwa = '#2 Tkanina'
    },

    {
      Pos = vector3(715.35, -959.69, 30.4), 
      nazwa = '#3 Ubrania'
    },

    {
      Pos = vector3(425.56, -805.59, 29.49), 
      nazwa = '#4 Sprzedaz'
    },

  }
}




Config.AuthorizedVehiclesSprawdzmy ={

         {
            model = 'e15082',
            label = 'Samochód Krawca'
         },

  
}

Config.AuthorizedVehicles = {
  Shared = {
         {
            model = 'e15082',
            label = 'Samochód Krawca'
         },
  },

czlonek = {

    
          },

          szwacz = {

    
          },


          krawiec = {

    
          },


          starczykrawiec = {

    
          },

        mistrzkrawiec = {

  
        },



zastepca = {
    
  },


boss = {
    

  }

}

Config.Uniforms = {
  recruit_wear = {
    male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 1,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 0,
              ['pants_1'] = 69,   ['pants_2'] = 0,
              ['shoes_1'] = 22,   ['shoes_2'] = 0,
              ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 9,   ['torso_2'] = 1,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 9,
              ['pants_1'] = 32,   ['pants_2'] = 0,
              ['shoes_1'] = 32,   ['shoes_2'] = 2,
  },
},
szwacz_wear = {
  male = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 1,   ['torso_2'] =0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 69,   ['pants_2'] = 1,
            ['shoes_1'] = 22,   ['shoes_2'] = 1,
            ['bproof_1'] = 0,  ['bproof_2'] = 0
  },
  female = {
         
  },
},

  krawiec_wear = {
    male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 1,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 0,
              ['pants_1'] = 69,   ['pants_2'] = 2,
              ['shoes_1'] = 22,   ['shoes_2'] = 2,
              ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
         
    },
  },
    starczykrawiec_wear = {
      male = {
                ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                ['torso_1'] = 1,   ['torso_2'] =0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 0,
                ['pants_1'] = 69,   ['pants_2'] = 3,
                ['shoes_1'] = 22,   ['shoes_2'] = 3,
                ['bproof_1'] = 0,  ['bproof_2'] = 0
      },
      female = {
         
      },
    },
      mistrzkrawiec_wear = {
        male = {
                  ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                  ['torso_1'] = 1,   ['torso_2'] =0,
                  ['decals_1'] = 0,   ['decals_2'] = 0,
                  ['arms'] = 0,
                  ['pants_1'] = 122,   ['pants_2'] = 2,
                  ['shoes_1'] = 22,   ['shoes_2'] = 4,
                  ['bproof_1'] = 0,  ['bproof_2'] = 0
        },
  female = {
            ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
            ['torso_1'] = 9,   ['torso_2'] = 1,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 9,
            ['pants_1'] = 32,   ['pants_2'] = 0,
            ['shoes_1'] = 32,   ['shoes_2'] = 2,
},
},

zastepca_wear = {
    male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 1,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 0,
              ['pants_1'] = 48,   ['pants_2'] = 0,
              ['shoes_1'] = 29,   ['shoes_2'] = 0,
              ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
         
  },
},

boss_wear = {
    male = {
              ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
              ['torso_1'] = 1,   ['torso_2'] =0,
              ['decals_1'] = 0,   ['decals_2'] = 0,
              ['arms'] = 0,
              ['pants_1'] = 48,   ['pants_2'] = 0,
              ['shoes_1'] = 29,   ['shoes_2'] = 0,
              ['bproof_1'] = 0,  ['bproof_2'] = 0
    },
    female = {
         
  },
}


}