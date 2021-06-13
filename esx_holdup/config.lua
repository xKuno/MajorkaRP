Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 10.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.TimerBeforeNewRob    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds
Config.CooldownNapadow    = 1800 -- The cooldown timer on a store after robbery was completed / canceled, in seconds

Config.MaxDistance    = 10   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1734.43, y = 6420.47, z = 35.04 },
		reward = math.random(65500, 81500),
		nameOfStore = "24/7. (Paleto Bay)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["sandyshores_twentyfoursever"] = {
		position = { x = 1959.46, y = 3748.5, z = 32.34 },
		reward = math.random(64500, 89500),
		nameOfStore = "24/7. (Sandy Shores)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(61500, 85500),
		nameOfStore = "24/7. (Little Seoul)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},

	["ocean_liquor"] = {
		position = { x = -2959.59, y = 387.4, z = 14.04 },
		reward = math.random(67500, 80500),
		nameOfStore = "Robs Liquor. (Great Ocean Highway)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["rancho_liquor"] = {
		position = { x = 1126.80, y = -980.40, z = 45.41 },
		reward = math.random(68500, 80500),
		nameOfStore = "Robs Liquor. (El Rancho Blvd)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["sanandreas_liquor"] = {
		position = { x = -1220.56, y = -915.8, z = 11.33 },
		reward = math.random(71500, 84500),
		nameOfStore = "Robs Liquor. (San Andreas Avenue)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["grove_ltd"] = {
		position = { x = -43.26, y = -1748.57, z = 29.42 },
		reward = math.random(70500, 83500),
		nameOfStore = "LTD Gasoline. (Grove Street)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["mirror_ltd"] = {
		position = { x = 1159.67, y = -314.01, z = 69.21 },
		reward = math.random(78250, 81250),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},	
	["vinewood_centre"] = {
		position = { x = 378.12, y = 333.24, z = 103.57 },
		reward = math.random(71500, 95000),
		nameOfStore = "Centrum Vinewood. (Vinewood Hills)",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["tequilala_centre"] = {
		position = { x = -562.26, y = 287.28, z = 82.18 },
		reward = math.random(77500, 99500),
		nameOfStore = "Tequilala.",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["fryzjer_paleto"] = {
		position = { x = -277.59, y = 6230.18, z = 31.7 },
		reward = math.random(60500, 75500),
		nameOfStore = "Fryzjera.",
		secondsRemaining = 150, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["Banham_centre"] = {
		position = { x = -1828.49, y = 799.21, z = 138.17 },
		reward = math.random(73500, 88500),
		nameOfStore = "Banham Canyon Dr.",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
	["Palomino_Freeway"] = {
		position = { x = 2549.33, y = 384.9, z = 108.62 },
		reward = math.random(74500, 89250),
		nameOfStore = "Palomino Freeway.",
		secondsRemaining = 190, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_WELDING",
		cops = 2,
		czyste = true,
		isbank = false,
		isother = false,
		itemneeded = 'blowpipe'
	},
		
	["fleeca"] = {
		position = { x = 147.04908752441, y = -1044.9448242188, z = 29.36802482605 },
		reward = math.random(240000,340000),
		nameOfStore = "Fleeca Bank",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		czyste = false,
		isbank = true,
		isother = false,
		itemneeded = 'drill'
	},
	["fleeca2"] = {
		position = { x = -2957.6674804688, y = 481.45776367188, z = 15.697026252747 },
		reward = math.random(230000,370000),
		nameOfStore = "Fleeca Bank (Highway)",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		isbank = true,
		czyste = false,
		isother = false,
		itemneeded = 'drill'
	},
	["blainecounty"] = {
		position = { x = -107.06505584717, y = 6474.8012695313, z = 31.62670135498 },
		reward = math.random(210000,310000),
		nameOfStore = "Blaine County Savings",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		isbank = true,
		czyste = false,
		isother = false,
		itemneeded = 'drill'
	},
	["PrincipalBank"] = {
		position = { x = 265.61098632813, y = 213.595895996094, z = 101.685694274902 },
		reward = math.random(1200000,1600000),
		nameOfStore = "Principal Bank",
		secondsRemaining = 900, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 5,
		isbank = true,
		czyste = false,
		isother = false,
		itemneeded = 'drill'
	},
	["SandyBank"] = {
		position = { x = 1176.541098632813, y = 2711.625895996094, z = 38.105694274902 },
		reward = math.random(210000,310000),
		nameOfStore = "Sandy Shores Bank",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		isbank = true,
		czyste = false,
		isother = false,
		itemneeded = 'drill'
	},
	["BoulevardDelPerroBank"] = {
		position = { x = -1211.921098632813, y = -335.765895996094, z = 37.795694274902 },
		reward = math.random(250000,350000),
		nameOfStore = "Boulevard Del Perro bank",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		isbank = true,
		czyste = false,
		isother = false,
		itemneeded = 'drill'
	},
	["MeteorSTBank"] = {
		position = { x = 311.121098632813, y = -283.265895996094, z = 54.175694274902 },
		reward = math.random(250000,350000),
		nameOfStore = "Meteor ST bank",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 4,
		isbank = true,
		isother = false,
		czyste = false,
		itemneeded = 'drill'
	},
	["HumaneLabs"] = {
		position = { x = 3538.721098632813, y = 3665.785895996094, z = 28.125694274902 },
		reward = math.random(750000,850000),
		nameOfStore = "Napad na Humane Labs",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 7,
		czyste = false,
		isbank = false,
		isother = true,
		itemneeded = 'drill'
	},

	["Muzeum"] = {
		position = { x = -600.5, y = -598.94, z = 0.89 },
		reward = math.random(1000000,1100000),
		nameOfStore = "Napad na Muzeum",
		secondsRemaining = 600, -- seconds
		lastRobbed = 0,
		animation = "brak",
		cops = 7,
		czyste = false,
		isbank = false,
		isother = true,
		itemneeded = 'pendrive'
	},
	["Elektronik"] = {
		position = { x = -1056.88, y = -233.16, z = 44.02 },
		reward = math.random(72500,92500),
		nameOfStore = "Napad na Elektroniczny",
		secondsRemaining = 250, -- seconds
		lastRobbed = 0,
		animation = "brak",
		cops = 6,
		czyste = true,
		isbank = false,
		isother = true,
		itemneeded = 'blowpipe'
	},

	["Yacht"] = {
		position = { x = -2071.341098632813, y = -1018.49, z = 3.05 },
		reward = math.random(600000,800000),
		nameOfStore = "Napad na Jacht",
		secondsRemaining = 700, -- seconds
		lastRobbed = 0,
		animation = "WORLD_HUMAN_CONST_DRILL",
		cops = 8,
		isbank = false,
		czyste = false,
		isother = true,
		itemneeded = 'drill'
	}
}
