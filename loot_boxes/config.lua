Config = {}
-- MORE AVAILABLE ON 5MSCRIPTS.COM
Config.UserLicense = "None"
Config["image_source"] = ""
Config.CloseInventoryHudTrigger = "esx_inventoryhud:closeInventory"

Config["chance"] = {
	[1] = { name = "Pospolita", rate = 50 },
	[2] = { name = "Rzadka", rate = 40 },
	[3] = { name = "Epicka", rate = 8 },
	[4] = { name = "Unkatowa", rate = 1.5} ,
	[5] = { name = "Legendarna", rate = 0.5 },
	[6] = { name = "ULTRAHARD", rate = 0.01 },
}

Config["broadcast"] = false
Config["broadcast_tier"] = {
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = false,
}

Config["5mscriptscom"] = {
	["csgocase"] = {
		name = "Case #1",
		list = {
			{ money = 15000, tier = 1 },
			{ money = 20000, tier = 1 },
			{ money = 25000, tier = 1 },
			{ item = "bayonet", amount=1, tier = 4 },
			{ money = 50000, tier = 2 },
			{ money = 1500000, tier = 5 },
			{ money = 2500000, tier = 5 },
			{ money = 100000, tier = 3 },
			{ money = 150000, tier = 3 },
			{ money = 300000, tier = 4 },

		}
	},
	
-- MORE AVAILABLE ON 5MSCRIPTS.COM
--2500$
	["csgocase4"] = {
		name = "Case #2",
		list = {
			{ money = 250, tier = 1 },
			{ money = 500, tier = 1 },
			{ money = 750, tier = 1 },
			{ money = 1500, tier = 1 },
			{ money = 1750, tier = 2 },
			{ money = 2750, tier = 2 },
			{ money = 10000, tier = 3 },
			{ money = 25000, tier = 3 },
			{ money = 50000, tier = 4 },
			{ item = "beer", amount=1, tier = 1 },
			{ item = "bat", amount=1, tier = 5 },
			{ item = "knife", amount=1, tier = 5 },
		}
	},
}