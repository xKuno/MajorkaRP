

Config = {}

Config.chance = 92--Ile % na wytworzenie broni
Config.damage = 20--Ile dmg ma otrzymać gracz po nieudanym wytworzeniu broni
Config.CzasRobieniabroni = 500
Config.CzasRobieniaKomponentow = 30
Config.CzasRobieniaAmmo = 20

Config.Zones = {


------------- GABRYSIE ------------------
	make_weapons = {
        Pos = {x = 905.7, y = -3230.76, z = -99.10},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie broni",
        Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć broń",
        Type  = 27,
        Job = "gabrys",
        Grade = 1,
        menu_label = "make_weapons"
    },
    barrel = {
        Pos = {x = 1532.02, y = 1728.15, z = 109.02},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie lufy",
        Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć lufe",
        Type  = 27,
        Job = "gabrys",
        Grade = 0,
        menu_label = "barrel_craft"
    },
    spring = {
        Pos = {x = 1400.75, y = 2169.82, z = 97.01},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie sprężyny",
        Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć sprężyne",
        Type  = 27,
        Job = "gabrys",
        Grade = 0,
        menu_label = "spring_craft"
    },
    lock = {
        Pos = {x = 1218.04, y = 2398.25, z = 65.4},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
        Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć zamek",
        Type  = 27,
        Job = "gabrys",
        Grade = 0,
        menu_label = "lock_craft"
    },

------------- SICARIO ---------------------
	make_weaponsv5 = {
		Pos = {x = 1164.15, y = -3191.56, z = -39.95},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie broni",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć broń",
        Type  = 27,
        Job = "sicario",
        Grade = 0,
		menu_label = "make_weapons"
	},
	barrelv5 = {
		Pos = {x = 1397.12, y = 3605.08, z = 38.04},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie lufy",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć lufe",
        Type  = 27,
        Job = "sicario",
        Grade = 0,
		menu_label = "barrel_craft"
	},
	springv5 = {
		Pos = {x = 2486.1, y = 3717.98, z = 43.48 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie sprężyny",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć sprężyne",
		Job = "sicario",
        Type  = 27,
        Grade = 0,
		menu_label = "spring_craft"
	},
	lockv5 = {
		Pos = {x = 1390.54, y = 2161.6, z = 97.7},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć zamek",
		Job = "sicario",
        Type  = 27,
        Grade = 0,
		menu_label = "lock_craft"
	},

-------------PRUSZKÓW-------------
    make_weaponsv2 = {
		Pos = {x = 1341.86, y = 4389.16, z = 44.32},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie broni",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć broń",
        Type  = 27,
        Job = "pruszkowski",
        Grade = 0,
		menu_label = "make_weapons"
	},
	barrelv2 = {
		Pos = {x = 2482.24, y = 3722.63, z = 43.92},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie lufy",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć lufe",
        Type  = 27,
        Job = "pruszkowski",
        Grade = 0,
		menu_label = "barrel_craft"
	},
	springv2 = {
		Pos = {x = 1396.73, y = 3611.11, z = 34.98 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie sprężyny",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć sprężyne",
		Job = "pruszkowski",
        Type  = 27,
        Grade = 0,
		menu_label = "spring_craft"
	},
	lockv2 = {
		Pos = {x = 1385.5, y = 2162.48, z = 97.73},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć zamek",
		Job = "pruszkowski",
        Type  = 27,
        Grade = 0,
		menu_label = "lock_craft"
	},

-------------- SHADOW --------------------------

    make_weaponsv3 = {
		Pos = {x = 414.21099853516, y = 4811.05078125, z = -59.01318359375 -0.8},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie broni",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć broń",
		Job = "shadow",
		Grade = 0,
        Type  = 27,
		menu_label = "make_weapons"
	},
	barrelv3 = {
		Pos = {x = -310.48352050781, y = 2793.4020996094, z = 59.474731445313 - 0.9},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie lufy",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć lufe",
		Job = "shadow",
		Grade = 0,
        Type  = 27,
		menu_label = "barrel_craft"
	},
	springv3 = {
		Pos = {x = -481.92526245117, y = 6276.8173828125, z = 13.339965820313 - 0.9},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie sprężyny",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć sprężyne",
		Job = "shadow",
		Grade = 0,
        Type  = 27,
		menu_label = "spring_craft"
	},
	lockv3 = {
		Pos = {x = 2484.421875, y = 3446.17578125, z = 51.066650390625 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć zamek",
		Job = "shadow",
		Grade = 0,
        Type  = 27,
		menu_label = "lock_craft"
	},
	-------------- CAMMORA AKA BLOODS --------------------------

    make_weaponsv4 = {
		Pos = {x = 171.84, y = -1000.51, z = -99.0 -0.8},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie broni",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć broń",
		Job = "bloods",
		Grade = 3,
        Type  = 27,
		menu_label = "make_weapons"
	},
	barrelv4 = {
		Pos = {x = 854.69, y = -2113.39, z = 31.58 - 0.9},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie lufy",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć lufe",
		Job = "bloods",
		Grade = 0,
        Type  = 27,
		menu_label = "barrel_craft"
	},
	springv4 = {
		Pos = {x = 1460.1, y = -1930.69, z = 71.8 - 0.9},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie sprężyny",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć sprężyne",
		Job = "bloods",
		Grade = 0,
        Type  = 27,
		menu_label = "spring_craft"
	},
	lockv4 = {
		Pos = {x = 2462.05, y = 1575.20, z = 33.11 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć zamek",
		Job = "bloods",
		Grade = 0,
        Type  = 27,
		menu_label = "lock_craft"
	},

------------------- AMMO --------------------------



make_ammo = {
		Pos = {x = -134.05, y = -1609.25, z = 35.03 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć Ammunicje 9mm",
		Job = "families",
		Grade = 0,
        Type  = 27,
		menu_label = "make_ammo"
	},

	make_ammov2 = {
		Pos = {x = 110.52, y = -1980.74, z = 20.96 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć Ammunicje 9mm",
		Job = "balas",
		Grade = 0,
        Type  = 27,
		menu_label = "make_ammov2"
	},


	make_ammov3 = {
		Pos = {x = 332.32, y = -2013.57, z = 22.39 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć Ammunicje 9mm",
		Job = "vagos",
		Grade = 0,
        Type  = 27,
		menu_label = "make_ammov3"
	},


	make_ammov4 = {
		Pos = {x = 1269.25, y = -1710.04, z = 54.77 - 0.90},
        Size  = {x = 2.0, y = 2.0, z = 2.0},
        Color = {r = 136, g = 243, b = 216},
        Name  = "Tworzenie zamka",
		Text = "Nacisnij ~INPUT_CONTEXT~ aby wytworzyć Ammunicje 9mm",
		Job = "crips",
		Grade = 0,
        Type  = 27,
		menu_label = "make_ammov4"
	}



}