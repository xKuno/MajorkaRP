local blips = {
	--{title="Psycholog", 			colour=0, id=419, x= -954.67, y= -2058.13, z= 19.711},
	{title="Praca Dorywcza", id=467, x = 69.02, y= -1569.87, z = 29.6},
	{title="Pearls",colour=29, id=266, x = -1829.58, y = -1193.26, z =14.33},
	{title="Department Of Justice",colour=5, id=498, x = -542.17, y = -211.13, z =29.5}, 		   
	{title="Kino", colour=29, id=135, x = -1423.41, y = -216.03, z = 46.5},
	{title="Praca Dorywcza Myśliwy", colour=1, id=160, x = -769.23773193359, y = 5595.6215820313, z = 33.48571395874},
	{title="Sprzedaż skóry i mięsa", colour=1, id=160, x = 969.16375732422, y = -2107.9033203125, z = 31.475671768188},
	-- {title="Diamond Casino", colour=74, id=617, x = 967.4, y = 51.14, z = 116.16}969.16375732422, ['y'] = -2107.9033203125, ['z'] = 31.475671768188
	{title="Strefa Łowienia", colour=4, id=317, x = 4275.71, y = 4486.53, z = -0.275671768188},
	{title="Majorka News", colour = 27, id =354 ,x = -599.43, y = -917.54, z = 33.62},
	-- {title="Wypożyczalnia Łódek", colour=3, id=427, x = 3864.26, y = 4469.58, z = 6.075671768188},
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)


