--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- Police Settings:1
Config.RequiredPoliceOnline = 2		-- required police online for players to do missions
Config.PoliceDatabaseName = "police"	-- set the exact name from your jobs database for police
Config.PoliceNotfiyEnabled = true		-- police notification upon truck robbery enabled (true) or disabled (false)
Config.PoliceBlipShow = true			-- enable or disable blip on map on police notify
Config.PoliceBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.PoliceBlipRadius = 50.0			-- set radius of the police notify blip
Config.PoliceBlipAlpha = 250			-- set alpha of the blip
Config.PoliceBlipColor = 5				-- set blip color

-- ## MISSION NPC PART ## --

-- Location where get mission from NPC:
Config.MissionNPC = {
	{
		Pos = {x=1247.37,y=-2911.29,z=21.33},		-- set NPC coords here
		Heading = 270.61,							-- set heading of the NPC here
		Ped = 's_m_y_dealer_01'						-- set npc model name here
	},
}

-- Set to true/false depending on whether you want blip on the map for npc
Config.EnableGoldJobBlip = false

-- Mission NPC Blip Settings:
Config.EnableMapBlip = false							-- set between true/false
Config.BlipNameOnMap = "Kozachuj"				-- set name of the blip
Config.BlipSprite = 280								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.7								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/


-- ## GOLD JOB PART ## --

Config.MissionPosition = 
{
	{
		Location = vector3(502.86,-3126.67,7.34),
		InUse = false,
		Heading = 165.1,
		GoonSpawns = {
			NPC1 = {
				x = 528.95,
				y = -3121.1,
				z = 6.07,
				h = 243.29,
				ped = 'u_m_m_prolsec_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC2 = {
				x = 541.75,
				y = -3119.23,
				z = 8.56,
				h = 133.53,
				ped = 'u_m_m_edtoh',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_PISTOL',
			},
			NPC3 = {
				x = 548.4,
				y = -3129.68,
				z = 6.25,
				h = 278.07,
				ped = 'u_m_m_aldinapoli',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC4 = {
				x = 533.38,
				y = -3119.39,
				z = 6.07,
				h = 174.24,
				ped = 'u_m_m_aldinapoli',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_pistol',
			}
		}
	},
	{
		Location = vector3(539.1,-2736.19,7.66),
		InUse = false,
		Heading = 232.66,
		GoonSpawns = {
			NPC1 = {
				x = 530.47,
				y = -2734.43,
				z = 6.06,
				h = 250.12,
				ped = 'u_m_m_prolsec_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC2 = {
				x = 533.38,
				y = -2728.95,
				z = 6.06,
				h = 230.19,
				ped = 'u_m_m_edtoh',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_PISTOL',
			},
			NPC3 = {
				x = 545.92,
				y = -2740.53,
				z = 6.6,
				h = 42.23,
				ped = 'u_m_m_aldinapoli',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			}
		}
	},

	{
		Location = vector3(-408.85,-2794.87,7.66),
		InUse = false,
		Heading = 315.26,
		GoonSpawns = {
			NPC1 = {
				x = -403.65,
				y = -2800.37,
				z = 6.06,
				h = 38.11,
				ped = 'u_m_m_prolsec_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			},
			NPC2 = {
				x = -400.61,
				y = -2795.95,
				z = 6.06,
				h = 89.62,
				ped = 'u_m_m_edtoh',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_PISTOL',
			},
			NPC3 = {
				x = -411.27,
				y = -2788.89,
				z = 6.6,
				h = 245.3,
				ped = 'u_m_m_aldinapoli',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_PISTOL',
			}
		}
	},
	
}

-- Gold Job Delivery Locations:
Config.DeliveryPoints = {
	vector3(1242.02,-3155.74,5.53), -- dostarczanie furgonu
}

-- Gold Job Delivery Marker Setting:
Config.DeliveryDrawDistance  = 50.0
Config.DeliveryMarkerType  = 27
Config.DeliveryMarkerScale  = { x = 3.0, y = 3.0, z = 1.0 }
Config.DeliveryMarkerColor  = { r = 255, g = 255, b = 0, a = 100 }

-- Enable GTA style "mission complete/fail" notifications:
Config.EnableCustomNotification = true

-- Use BlackMoney or Cash for mission cost?
Config.UseBlackMoneyAsMissionCost = true

-- Set amount of money that mission should cost.
Config.MissionCost = 5000

-- Set cooldown for doing gold jobs in minutes:
Config.JobCooldownTime = 200

-- Reward Settings:
Config.ItemName1 = "goldwatch"				-- exact name of your item1
Config.ItemMinAmount1 = 4					-- set minimum reward amount of item1 (this value is multiplied with x100)
Config.ItemMaxAmount1 = 6					-- set maximum reward amount of item1 (this value is multiplied with x100)
Config.EnableSecondItemReward = false		-- add another item as reward but this has only 50% chance 
Config.ItemName2 = "goldbar"				-- exact name of your item2
Config.ItemMinAmount2 = 1					-- set minimum reward amount of item2
Config.ItemMaxAmount2 = 3					-- set maximum reward amount of item2
Config.RandomChance = 2						-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.

-- ## SMELTERY PART ## --

-- Location where you melt to gold bars
Config.GoldSmeltery = {
	{ ["x"] = 1109.93, ["y"] = -2008.24, ["z"] = 31.06, ["h"] = 0 },
}

-- Smeltery Marker
Config.SmelteryMarker = 27
Config.SmelteryMarkerColor = { r = 255, g = 255, b = 0, a = 100 }

-- Set time it takes to convert gold watches into gold bar in seconds
Config.SmelteryTime = 20

-- Set to true/false depending on whether you want blip on the map for smeltery or not
Config.EnableSmelteryBlip = false


-- ## EXCHANGE PART ## --

-- Location where you exchange gold bars to cash
Config.GoldExchange = {
	{ ["x"] = -218.62, ["y"] = -300.67, ["z"] = 74.48, ["h"] = 339.7 },
}

-- Exchange Marker
Config.ExchangeMarker = 27
Config.ExchangeMarkerColor = { r = 255, g = 255, b = 0, a = 100 }

-- Set time it takes to convert gold bars into cash in seconds
Config.ExchangeTime = 2

-- Set to true/false depending on whether you want blip on the map for exchange or not
Config.EnableExchangeBlip = false

-- Set cooldown for doing gold exchanges in minutes:
Config.ExchangeCooldown = 15


