Config = {}

Config.Price = 225000

Config.DrawDistance = 100.0
Config.MarkerSize   = {x = 1.5, y = 1.5, z = 1.0}
Config.MarkerColor  = {r = 102, g = 102, b = 204}
Config.MarkerType   = 1
Config.Locale = 'en'

Config.Zones = {}

Config.Shops = {
  {x = 309.92,  y = -562.79,  z = 43.3},
}

for _,i in pairs(Config.Shops) do

	Config.Zones['Shop_' .. _] = {
	 	Pos   = i,
	 	Size  = Config.MarkerSize,
	 	Color = Config.MarkerColor,
	 	Type  = Config.MarkerType
  }

end
