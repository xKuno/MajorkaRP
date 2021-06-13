Config               = {}

Config.DrawDistance  = 100
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255 }
Config.Type          = 1

Config.Locale = 'en'

Config.LicenseEnable = true -- only turn this on if you are using esx_license
Config.LicensePrice  = 45000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-662.1, -935.3, 20.8),
			vector3(810.2, -2157.3, 28.6),
			vector3(1693.4, 3759.5, 33.7),
			vector3(-330.2, 6083.8, 30.4),
			vector3(252.3, -50.0, 68.9),
			vector3(22.0, -1107.2, 28.8),
			vector3(2567.6, 294.3, 107.7),
			vector3(-1117.5, 2698.6, 17.5),
			vector3(842.4, -1033.4, 27.1)
		}
	},

	BialeShop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(2875.1867675781, 4399.2001953125, 62.652368164063)
		}
	},
	
	
	RzucaneShop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(742.33, 1312.92, 359.08)
		}
	},
	
	KrotkieShop  = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(28.483518600464, 3666.0659179688, 40.434448242188-0.9)
		}
	},
	
	KrotkieShopv4  = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(2186.4, 3725.46, 34.05-0.9)
		}
	},
}
