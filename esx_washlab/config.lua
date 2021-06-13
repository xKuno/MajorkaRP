---------------------------------------
--      ESX_WASHLAB by Dividerz      --
-- FOR SUPPORT: Arne#7777 on Discord --
---------------------------------------

Config = {}

Config.WaitingTime = 3000
Config.TakePercentage = true
Config.WashPercentage = 80
Config.ProducingTime = math.random(80, 120) -- IN SECONDS, NOT MS (!)
Config.CountingTime = math.random(80, 120) -- IN SECONDS, NOT MS (!)

Config.Locations = {
    washinglab = {
        teleporters = {
            enter = vector3(18.27, 7631.12, 13.82),
            exit = vector3(1138.13, -3199.07, -39.67)
        },
        process = {
            start = vector3(1134.18, -3197.95, -39.82),
            timer = vector3(1131.17, -3197.92, -39.67),
            output = vector3(1126.08, -3197.54, -39.67),
            cutter = vector3(1122.07, -3198.53, -40.39),
            counter = vector3(1116.17, -3196.13, -40.40)
        }
    }
}
