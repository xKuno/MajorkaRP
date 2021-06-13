--Truck
Config	=	{}

 -- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
	-- weight == 0 : The item do not affect character inventory weight
	-- weight > 0 : The item cost place on inventory
	-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 500000



-- If true, ignore rest of file
Config.WeightSqlBased = false

-- I Prefer to edit weight on the config.lua and I have switched Config.WeightSqlBased to false:

Config.localWeight = {
	acetone = 100,
	assaultrifle = 1,
	smg_mk2 = 1,
	bag = 100,
	bakedbread = 150000,
	baker = 150,
	bandage = 100,
	bateria = 950,
	battery = 1000,
	beer = 50,
	benzyna = 150,
	betontransport = 100000,
	bitcoin = 0,
	bletki = 100,
	blowpipe = 1000,
	bolcacahuetes = 150,
	bolchips = 150,
	bolnoixcajou = 150,
	bolpistache = 150,
	bones = 150,
	book = 0,
	bottle = 150,
	bottles = 150000,
	bread = 125,
	water = 330,
	handcuffs = 1000,
	jewels = 500,
	kombinerki = 1000,
	licenseplate = 500,
	lighter = 500,
	mortar = 100,
	oxygen_mask = 1000, 
	pendrive = 5000, 
	phone = 1000,
	radio = 1000, 
	scissors = 1000,
	redgull = 500,
	silencieux = 2500 ,
	worek = 1500,
	zdrapka = 1000,
	zdrapkaextra = 1000,
	zdrapkaplus = 1000,

	-- HAJS --- 
	--- TU JUZ KAMILEK BRONIE ---
	combatpistol = 5000,
	pistol_ammo = 1,
	smg_ammo = 1,
	rifle_ammo = 1,
	pistol = 5000,
	vintagepistol = 5000,
	pistol_mk2 = 5000,
	snspistol_mk2 = 5000,
	heavypistol = 5000,
	pistol50 = 5000,
	revolver = 5000,
	stungun = 5000,
	knife = 5000,
	knuckle = 5000,
	nightstick = 5000,
	hammer = 5000,
	bat = 5000,
	golfclub = 5000,
	bottle = 5000,
	dagger = 5000,
	hatchet = 5000,
	machete = 5000,
	flashlight = 5000,
	switchblade = 5000,
	golfclub = 5000,
	poolclue = 5000,
	pipewrench = 5000,
	zestaw_pistol = 5000, 
	zestaw_pistol_combat = 5000, 
	zestaw_pistol_mk2 = 5000, 
	zestaw_pistol_sns_mk2 = 5000, 
	zestaw_pistol_vintage = 5000,
	zamek_mk2 = 1500,
	zamek_snsmk2 = 1500,
	zamek_vintage = 1500,
	sprezyna_mk2 = 1500,
	sprezyna_snsmk2 = 1500,
	sprezyna_vintage = 1500,
	lufa_mk2 = 1500,
	lufa_snsmk2 = 1500,
	lufa_vintage = 1500,
	--- NARKO KURWA TYKI ---
	coke = 100,
	coke100 =100 ,
	coke30 = 100,
	coke70 = 100,
	cokes100 = 100,
	acid	= 100,
	rcoke100 = 100,
	rcoke30 = 100,
	rcoke70 = 100,
	rcokes100 = 100,
	coke_pooch = 100,
	hybrid = 100,
	marijuana = 100,
	menthe = 100,
	dietyloamina = 100,
	meth = 100,
	methlab = 100,
	methm = 100,
	meth_sudo = 100,
	moonshine = 100,
	menthe = 100,
	rhasz = 100,
	seed_amfa = 100,
	amfa = 100, 
	ramfa = 100,
	csgocase = 1000,
	resztki = 100,
	opium = 100,
	plantpot = 1000,
	purifiedwater = 100, 
	highgradefert = 100,
	rhybrid = 100,
	rnitro = 100,
	rozpuszczalnik = 100,
	rsativa = 100,
	rweed = 100,
	sativa = 100,
	seed_coke100 = 100,
	seed_coke30 = 100,
	seed_coke70 = 100,
 	seed_hybrid = 100,
 	seed_sativa = 100,
 	seed_weed = 100,
 	spakowanytyton = 100,
 	sterydy = 100,
 	sterydy_pooch = 100,
 	tyton = 100,
 	woreczek = 100,
 	zacier = 100,
 	extazy = 100,


}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0, --Trains
}