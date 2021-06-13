Config = {}
Config.Animations = {
	{
		name  = 'rannys',
		label = 'Ranny / Medyczne',
		items = {
			{label = "Upadek", keyword = "upadek", type = "ragdoll", data = {}},
			{label = "RKO", keyword = "rko", type = "anim", data = {lib = "missheistfbi3b_ig8_2", anim = "cpr_loop_paramedic", mode = 1}},
			{label = "Postrzał w brzuch", keyword = "postrzal", type = "anim", data = {lib = "random@crash_rescue@wounded@base", anim = "base", mode = 1}},
			{label = "Ból brzucha", keyword = "bol", type = "anim", data = {lib = "combat@damage@writheidle_a", anim = "writhe_idle_a", mode = 1}},
			{label = "Ból głowy", keyword = "bol2", type = "anim", data = {lib = "combat@damage@writheidle_b", anim = "writhe_idle_f", mode = 1}},
			{label = "Ból nogi", keyword = "bol3", type = "anim", data = {lib = "combat@damage@writheidle_b", anim = "writhe_idle_e", mode = 1}},
			{label = "Ból pleców", keyword = "bol4", type = "anim", data = {lib = "anim@move_lester", anim = "idle_a", mode = 49}}			
		}
	},

	{
		name  = 'greetings',
		label = 'Pozdrowienia',
		items = {
			{label = "Machnięcie ręką", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_hello"}},
			{label = "Powitanie", keyword = "powitanie", type = "anim", data = {lib = "mp_common", anim = "givetake1_a"}},
			{label = "Graba", keyword = "graba", type = "anim", data = {lib = "mp_ped_interaction", anim = "handshake_guy_a"}},
			{label = "Graba i klepanie po plecach", type = "anim", data = {lib = "mp_ped_interaction", anim = "hugs_guy_a"}},
			{label = "Żółwik", keyword = "zolwik", type = "anim", data = {lib = "anim@am_hold_up@male", anim = "shoplift_high"}},
			{label = "Salut", keyword = "salut", type = "anim", data = {lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute", mode = 49}},
			{label = "Środkowy palec", keyword = "fuck", type = "anim", data = {lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter"}},
			{label = "Środkowy palec v2", keyword = "fuck2", type = "anim", data = {lib = "mp_player_intfinger", anim = "mp_player_int_finger"}},
			{label = "Posłanie buziaczka", keyword = "buziak", type = "anim", data = {lib = "anim@mp_player_intselfieblow_kiss", anim = "exit", mode = 48}},
			{label = "Machanie ręką", keyword = "machanie", type = "anim", data = {lib = "random@hitch_lift", anim = "come_here_idle_c", mode = 49}}
		}
	},

	{
		name = 'interaction',
		label = 'Interakcja',
		items = {
			{label = "Notes", keyword = "notes", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_TIME_OF_DEATH"}},
			{label = "Założone ręce", keyword = "foch", type = "anim", data = {lib = "amb@world_human_hang_out_street@female_arms_crossed@base", anim = "base", mode = 49}},
			{label = "Założone ręce v2", keyword = "foch2", type = "anim", data = {lib = "anim@amb@nightclub@peds@", anim = "rcmme_amanda1_stand_loop_cop", mode = 49}},
			{label = "Oprzyj się", keyword = "oprzyj", type = "anim", data = {lib = "amb@prop_human_bum_shopping_cart@male@base", anim = "base", mode = 1}},
			{label = "Kciuk w górę", keyword = "kciuk", type = "anim", data = {lib = "anim@mp_player_intincarthumbs_uplow@ds@", anim = "idle_a", mode = 49}},
			{label = "Kciuk w dół", keyword = "kciuk2", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "thumbs_down_a_player_a"}},
			{label = "Dłubanie w nosie", keyword = "nos", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@nose_pick", anim = "nose_pick", mode = 49}},
			{label = "Wybierz mnie", keyword = "mnie", type = "anim", data = {lib = "missmic4premiere", anim = "crowd_b_idle_01"}},
			{label = "Głupio wyszło", keyword = "glupio", type = "anim", data = {lib = "missmic4premiere", anim = "interview_short_anton"}},
			{label = "Przykro mi", keyword = "przykro", type = "anim", data = {lib = "missmurder", anim = "idle"}},
			{label = "Niegrzeczny palec", keyword = "niegrzeczny", type = "anim", data = {lib = "anim@mp_player_intincarno_waystd@ps@", anim = "enter"}},
			{label = "Tłumaczenie", keyword = "tlumacz", type = "anim", data = {lib = "oddjobs@assassinate@vice@hooker", anim = "argue_a"}},
			{label = "O prosze prosze", keyword = "oprosze", type = "anim", data = {lib = "misscommon@response", anim = "bring_it_on"}},
			{label = "Celuj z palca", keyword = "celujzpalca", type = "anim", data = {lib = "random@countryside_gang_fight", anim = "biker_02_stickup_loop"}},
			{label = "Gwizdanie", keyword = "gwizdanie", type = "anim", data = {lib = "taxi_hail", anim = "hail_taxi"}},
			{label = "Pukanie", keyword = "gwizdanie", type = "anim", data = {lib = "timetable@jimmy@doorknock@", anim = "knockdoor_idle"}},
	    }
	},

	{
		name = 'poses',
		label = 'Pozy',
		items = {
			{label = "Ochroniarz", keyword = "ochroniarz", type = "scenario", data = {anim = "WORLD_HUMAN_GUARD_STAND"}},
			{label = "Guard", keyword = "guard", type = "anim", data = {lib = "amb@world_human_stand_guard@male@base", anim = "base", mode = 49}},
			{label = "Ręce na biodra", keyword = "biodra", type = "anim", data = {lib = "amb@world_human_cop_idles@male@idle_b", anim = "idle_e", mode = 49}},
			{label = "Policjant", keyword = "policjant", type = "scenario", data = {anim = "WORLD_HUMAN_COP_IDLES"}},
			{label = "Cop", keyword = "cop", type = "anim", data = {lib = "amb@code_human_wander_idles_cop@male@static", anim = "static", mode = 49}},
			{label = "Bandzior", keyword = "", type = "scenario", data = {anim = "WORLD_HUMAN_HIKER_STANDING"}},
			{label = "Luźno", keyword = "luzno", type = "anim", data = {lib = "amb@world_human_stand_impatient@female@no_sign@base", anim = "base", mode = 2}},
			{label = "Zastanowienie", keyword = "zastanowienie", type = "anim", data = {lib = "amb@world_human_prostitute@cokehead@base", anim = "base", mode = 2}},
			{label = "Niespokojny", keyword = "niespokojny", type = "anim", data = {lib = "amb@world_human_drug_dealer_hard@male@idle_a", anim = "idle_c", mode = 2}},
			{label = "Wyzywająca", keyword = "wyzywajaca", type = "anim", data = {lib = "amb@world_human_hang_out_street@female_arm_side@idle_a", anim = "idle_b", mode = 2}},
			{label = "Nuda", keyword = "nuda", type = "anim", data = {lib = "amb@world_human_hang_out_street@female_hold_arm@enter", anim = "enter", mode = 2}},
			{label = "Samolot", keyword = "samolot", type = "anim", data = {lib = "missfbi1", anim = "ledge_loop", mode = 2}},
			{label = "Ptak", keyword = "ptak", type = "anim", data = {lib = "random@peyote@bird", anim = "wakeup", mode = 2}},
			{label = "Znaki gangu", keyword = "gang", type = "anim", data = {lib = "mp_player_int_uppergang_sign_a", anim = "mp_player_int_gang_sign_a", mode = 2}},
			{label = "SpiderMan", keyword = "spiederman", type = "anim", data = {lib = "missexile3", anim = "ex03_train_roof_idle", mode = 2}},
			{label = "Udawanie psa", keyword = "pies", type = "anim", data = {lib = "random@peyote@dog", anim = "wakeup"}},
			{label = "Swiętowanie", keyword = "swietowanie", type = "anim", data = {lib = "rcmfanatic1celebrate", anim = "celebrate"}},
			{label = "Klaun", keyword = "clown", type = "anim", data = {lib = "rcm_barry2", anim = "clown_idle_0"}},
			{label = "Niezyjesz", keyword = "nzyjesz", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@cut_throat", anim = "cut_throat"}},
		}
	},

	{
		name  = 'conversation',
		label = 'Konwersacja',
		items = {
			{label = "Drapanie się po głowie", keyword = "dglowa", type = "anim", keyword = "hm", data = {lib = "mp_cp_stolen_tut", anim = "b_think", mode = 48}},
			{label = "Jest Dobrze!", keyword = "jd", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@thumbs_up", anim = "thumbs_up"}},
			{label = "Przytulanie", keyword = "przytul", type = "anim", data = {lib = "mp_ped_interaction", anim = "kisses_guy_a"}},
			{label = "Spokojnie", keyword = "spokoj", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_easy_now"}},
			{label = "Zdziwienie", keyword = "zdziwienie", type = "anim", data = {lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a"}},
			{label = "A niech to licho!", keyword = "niechto", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_damn"}},
			{label = "Super", keyword = "super", type = "anim", data = {lib = "mp_action", anim = "thanks_male_06"}},
			{label = "No i co z tego?", keyword = "noi", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on"}},
			{label = "Ja", keyword = "ja", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_me"}},
			{label = "Klęczenie", keyword = "kleczenie", type = "anim", data = {lib = "amb@medic@standing@kneel@base", anim = "base", mode = 2}},
			{label = "Zestresowana", keyword = "zestresowana", type = "anim", data = {lib = "random@hitch_lift", anim = "f_distressed_loop"}}
		}
	},

	{
		name  = 'leaning',
		label = 'Siadanie / Leżenie / Opieranie',
		items = {
			{label = "Menel", keyword = "menel", type = "scenario", data = {anim = "WORLD_HUMAN_PICNIC"}},
			{label = "Usiądź", keyword = "siadaj", type = "scenario", data = {anim = "PROP_HUMAN_SEAT_BENCH"}},
			{label = "Losowe opieranie się", type = "scenario", data = {anim = "WORLD_HUMAN_LEANING"}},
			{label = "Opieranie się", keyword = "opieranie", type = "anim", data = {lib = "random@hitch_lift", anim = "idle_a", mode = 1}},
			{label = "Opieranie się v2", keyword = "opieranie2", type = "anim", data = {lib = "misscarsteal4leadinout", anim = "ig_1_base", mode = 1}},
			{label = "Opieranie się v3", keyword = "opieranie3", type = "anim", data = {lib = "missstrip_club_lean", anim = "player_lean_rail_loop", mode = 1}},
			{label = "Opieranie się na rękach", keyword = "opieranie4", type = "anim", data = {lib = "mp_safehousebeer@", anim = "base_drink", mode = 1}},
			{label = "Opieranie się do tyłu", keyword = "opieranie5", type = "anim", data = {lib = "anim@amb@nightclub@gt_idle@", anim = "base", mode = 1}},
			{label = "Leżenie na plecach", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE_BACK"}},
			{label = "Leżenie na plecach v2", keyword = "lezenie", type = "anim", data = {lib = "timetable@tracy@sleep@", anim = "idle_c", mode = 1}},
			{label = "Leżenie na brzuchu", keyword = "lezenie2", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE"}},
			{label = "Leżenie na boku", keyword = "lezenie3", type = "anim", data = {lib = "amb@world_human_bum_slumped@male@laying_on_left_side@base", anim = "base", mode = 1}},		
			{label = "Kładzenie się do łóżka", keyword = "lezenie4", type = "anim", data = {lib = "mp_bedmid", anim = "f_getin_l_bighouse"}},
			{label = "Siedzenie z telefonem", keyword = "telefon", type = "anim", data = {lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle"}},
			{label = "Siedzenie na ziemii na luzaku", keyword = "siedzenie", type = "anim", data = {lib = "anim@heists@fleeca_bank@ig_7_jetski_owner", anim = "owner_idle", mode = 1}},
			{label = "Siedzenie na ziemii w zwarciu", keyword = "siedzenie2", type = "anim", data = {lib = "anim@amb@business@bgen@bgen_no_work@", anim = "sit_phone_phoneputdown_fallasleep_nowork", mode = 1}},
			{label = "Siedzenie na ziemii przygnębiony", keyword = "siedzenie3", type = "anim", data = {lib = "anim@amb@business@bgen@bgen_no_work@", anim = "sit_phone_phoneputdown_sleeping-noworkfemale", mode = 1}},
			{label = "Siedzenie po turecku z rękami w górze", keyword = "siedzenie4", type = "anim", data = {lib = "mp_fm_intro_cut", anim = "base_loop", mode = 1}},
			{label = "Siedzenie pod ścianą", keyword = "menel2", type = "anim", data = {lib = "amb@world_human_stupor@male@idle_a", anim = "idle_b", mode = 1}},
			{label = "Siedzenie na ziemi załamany", keyword = "siedzenie5", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@lo_alone@", anim = "lowalone_dlg_longrant_laz", mode = 1}},
			{label = "Siedzenie na ziemii", keyword = "siad", type = "anim", data = {lib = "rcm_barry3", anim = "barry_3_sit_loop", mode = 1}},
			{label = "Siedzenie na luzie", keyword = "siad2", type = "anim", data = {lib = "rcm_barry3", anim = "barry_3_sit_loop", mode = 1}},
			{label = "Siedzenie na krześle", keyword = "siadaj", type = "anim", data = {anim = "PROP_HUMAN_SEAT_BENCH"}},
			{label = "Siedzenie na krześle2", keyword = "siadaj2", type = "anim", data = {lib = "timetable@ron@ig_5_p3", anim = "ig_5_p3_base", mode = 1}},
			{label = "Siedzenie noga na noge", keyword = "siadaj3", type = "anim", data = {lib = "timetable@reunited@ig_10", anim = "base_amanda", mode = 1}},
			{label = "Siedzenie przygarbiony", keyword = "siadaj4", type = "anim", data = {lib = "timetable@ron@ig_3_couch", anim = "base", mode = 1}},
			{label = "Siedzenie na luzaku", keyword = "siadaj5", type = "anim", data = {lib = "timetable@maid@couch@", anim = "base", mode = 1}},
			{label = "Kucanie", keyword = "kucaj", type = "anim", data = {lib = "rcmextreme3", anim = "idle", mode = 1}},
			{label = "Kucanie2", keyword = "kucaj2", type = "anim", data = {lib = "amb@world_human_bum_wash@male@low@idle_a", anim = "idle_a", mode = 1}},
			{label = "Placek", keyword = "placek", type = "anim", data = {lib = "missarmenian2", anim = "drunk_loop", mode = 1}},
		}
	},

	{
		name  = 'situational',
		label = 'Sytuacyjne',
		items = {
			{label = "Selfie", keyword = "selfie", type = "scenario", data = {anim = "WORLD_HUMAN_TOURIST_MOBILE"}},
			{label = "Ręce za głowę", keyword = "rece", type = "anim", data = {lib = "random@arrests@busted", anim = "idle_c", mode = 49}},
			{label = "Strach", keyword = "strach", type = "anim", data = {lib = "amb@code_human_cower_stand@male@react_cowering", anim = "base_right"}},
			{label = "Zakładnik", keyword = "zakladnik", type = "anim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
			{label = "Chowanie się", keyword = "chowanie", type = "anim", data = {lib = "mp_am_hold_up", anim = "cower_loop"}},
			{label = "Rozpacz", keyword = "rozpacz", type = "anim", data = {lib = "mp_bank_heist_1", anim = "f_cower_01"}},
			{label = "Poddanie się na glebę", keyword = "poddanie", type = "anim", data = {lib = "mp_bank_heist_1", anim = "prone_l_front_intro", mode = 2}},
			{label = "Rozglądanie się", type = "scenario", data = {anim = "CODE_HUMAN_CROSS_ROAD_WAIT"}},
			{label = "Rozglądanie się v2", keyword = "rozgladanie", type = "anim", data = {lib = "mp_fm_intro_cut", anim = "idle_a"}},
			{label = "Wkurzenie się", keyword = "wkurw", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@freakout", anim = "freakout"}},
			{label = "Wymiotowanie w aucie", type = "anim", data = {lib = "oddjobs@taxi@tie", anim = "vomit_outside"}},
			{label = "Kibicowanie", keyword = "kibicowanie", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "angry_clap_b_player_b", mode = 1}},
			{label = "Kibicowanie v2", keyword = "kibicowanie2", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "angry_clap_a_player_a", mode = 1}},
			{label = "Ręce do tyłu", keyword = "rece2", type = "anim", data = {lib = "anim@miss@low@fin@vagos@", anim = "idle_ped06", mode = 49}},
			{label = "Drapanie się po tyłku", keyword = "drapanie", type = "anim", data = {lib = "anim@heists@team_respawn@respawn_01", anim = "heist_spawn_01_ped_d", mode = 49}},
			{label = "Otrzepanie się", keyword = "otrzepanie", type = "anim", data = {lib = "move_m@_idles@shake_off", anim = "shakeoff_1"}},
			{label = "Otrzepanie się v2", keyword = "otrzepanie2", type = "anim", data = {lib = "move_m@_idles@wet", anim = "fidget_wet"}},
			{label = "Sprawdzanie wody pod prysznicem", keyword = "woda", type = "anim", data = {lib = "mp_safehouseshower@female@", anim = "shower_enter_into_idle"}},
			{label = "Mycie się", keyword = "mycie", type = "anim", data = {lib = "mp_safehouseshower@female@", anim = "shower_idle_a"}},
			{label = "Mycie się v2", keyword = "mycie2", type = "anim", data = {lib = "mp_safehouseshower@male@", anim = "male_shower_idle_a"}},
			{label = "Ślizg", keyword = "slizg", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "slide_a_player_a"}},
			{label = "Jebniecie glowa o sciane", keyword = "glowa", type = "anim", data = {lib = "melee@unarmed@streamed_variations", anim = "plyr_takedown_front_headbutt"}}
		}
	},

	{
		name  = 'festives',
		label = 'Imprezka',
		items = {
			{label = "Bujanie się", keyword = "bujanie", type = "scenario", data = {anim = "WORLD_HUMAN_STRIP_WATCH_STAND"}},
			{label = "Granie na instrumentach", keyword = "granie", type = "scenario", data = {anim = "WORLD_HUMAN_MUSICIAN"}},
			{label = "DJ", keyword = "dj", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj"}},
			{label = "Picie kawy", keyword = "kawa", type = "loop", data = {base = {lib = "amb@world_human_aa_coffee@base", anim = "base", length = 3600}, idle = {lib = "amb@world_human_aa_coffee@idle_a", anims = {{"idle_a", 6200}, {"idle_b", 3700}, {"idle_c", 6500}}}, finish = {lib = "amb@world_human_aa_coffee@base", anim = "base", length = 4500}, mode = 0, prop = {object = "p_ing_coffeecup_01", bone = 57005, offset = {x = 0.125, y = 0.02, z = -0.03}, rotation = {x = 95.0, y = 140.0, z = 190.0}, dettach = true}}},
			{label = "Picie piwa", type = "scenario", data = {anim = "WORLD_HUMAN_PARTYING"}},
			{label = "Picie wina", type = "scenario", data = {anim = "WORLD_HUMAN_DRINKING"}},
			{label = "Rock'n'roll", keyword = "rock", type = "anim", data = {lib = "mp_player_int_upperrock", anim = "mp_player_int_rock"}},
			{label = "Robienie grilla", type = "scenario", data = {anim = "PROP_HUMAN_BBQ"}},
			{label = "Wciąganie mety", keyword = "meta", type = "anim", data = {lib = "anim@amb@nightclub@peds@", anim = "missfbi3_party_snort_coke_b_male3", mode = 1}}
		
		}
	},

	{
		name  = 'work',
		label = 'Praca',
		items = {
			{label = "Przygotowanie broni", keyword = "bron", type = "anim", data = {lib = "mp_corona@single_team", anim = "single_team_intro_one"}},
			{label = "Żebrak", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_FREEWAY"}},
			{label = "Pakowanie na naczepę", keyword = "pakowanie", type = "anim", data = {lib = "mp_am_hold_up", anim = "purchase_beerbox_shopkeeper"}},
			{label = "Kierowanie ruchem", keyword = "kierowanie", type = "scenario", data = {anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT"}},
			{label = "Wędkowanie", type = "scenario", data = {anim = "WORLD_HUMAN_STAND_FISHING"}},
			{label = "Podsłuchiwanie", keyword = "podsluch", type = "anim", data = {lib = "mini@safe_cracking", anim = "idle_base"}},
			{label = "Szukanie śladów", keyword = "szukanie", type = "anim", data = {lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f"}},
			{label = "Rozdmuchiwanie liści", type = "scenario", data = {anim = "WORLD_HUMAN_GARDENER_LEAF_BLOWER"}},
			{label = "Kopanie w ogródku", type = "scenario", data = {anim = "WORLD_HUMAN_GARDENER_PLANT"}},
			{label = "Pisanie na klawiaturze", keyword = "klawiatura", type = "anim", data = {lib = "missah_2_ext_altleadinout", anim = "hack_loop", mode = 1}},
			{label = "Młotek", type = "scenario", data = {anim = "WORLD_HUMAN_HAMMERING"}},
			{label = "Robienie zdjęć", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
			--{label = "Robienie zdjęć", keyword = "foto", type = "loop",  data = {base = {lib = "amb@world_human_paparazzi@male@enter", anim = "enter", length = 1000}, idle = {lib = "amb@world_human_paparazzi@male@idle_a", anims = {{"idle_a", 6000}, {"idle_b", 6000}, {"idle_c", 5000}}}, finish = {lib = "amb@world_human_paparazzi@male@exit", anim = "exit", length = 1000}, mode = 0, prop = {object = "prop_pap_camera_01", bone = 57005, offset = {x = 0.125, y = 0.02, z = -0.03}, rotation = {x = 75.0, y = 120.0, z = 180.0}, dettach = false}}},
			{label = "Mycie okna", type = "scenario", data = {anim = "WORLD_HUMAN_MAID_CLEAN"}},
			{label = "Mim", type = "scenario", data = {anim = "WORLD_HUMAN_HUMAN_STATUE"}}
		}
	},

	{
		name  = 'humors',
		label = 'Humor',
		items = {
			{label = "Kajdanki", keyword = "kajdanki", type = "anim", data = {lib = "mp_arresting", anim = "idle", mode = 49}},
			{label = "Klaskanie", keyword = "klaskanie",  type = "scenario", data = {anim = "WORLD_HUMAN_CHEERING"}},
			{label = "Facepalm", keyword = "facepalm", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@face_palm", anim = "face_palm"}},
			{label = "Samobójstwo", keyword = "ck", type = "anim", data = {lib = "mp_suicide", anim = "pistol"}},
			{label = "Skok w bok", keyword = "bok", type = "anim", data = {lib = "melee@unarmed@streamed_core_psycho", anim = "victim_psycho_rear_takedown"}},
			{label = "Jezus", keyword = "jezus", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female"}},
			{label = "Palec w dziurke", keyword = "palec", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@dock", anim = "dock"}},	
			{label = "Jesteś pierdolnięty", keyword = "pierdolniety", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@you_loco", anim = "you_loco"}}
		}
	},

	{
		name  = 'sports',
		label = 'Sport',
		items = {
			{label = "Garda", keyword = "garda", type = "anim", data = {lib = "oddjobs@assassinate@multi@", anim = "react_big_variations_a"}},
			{label = "Rozgrzewka", keyword = "rozgrzewka", type = "anim", data = {lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e"}},
			{label = "Bitka", keyword = "bitka", type = "anim", data = {lib = "mp_deathmatch_intros@unarmed", anim = "intro_male_unarmed_b"}},
			{label = "Jogging", type = "scenario", data = {anim = "WORLD_HUMAN_JOG_STANDING"}},
			{label = "Pompki", keyword = "pompki", type = "anim", data = {lib = "amb@world_human_push_ups@male@base", anim = "base", mode = 1}},
			{label = "Brzuszki", keyword = "brzuszki", type = "anim", data = {lib = "amb@world_human_sit_ups@male@base", anim = "base", mode = 1}},
			{label = "Napinanie", type = "scenario", data = {anim = "WORLD_HUMAN_MUSCLE_FLEX"}},
			{label = "Napinanie mięśni", type = "anim", data = {lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base"}},
			{label = "Napinanie bicków", type = "anim", data = {lib = "amb@world_human_muscle_flex@arms_in_front@idle_a", anim = "idle_a"}},
			{label = "Trenowanie bicków", type = "anim", data = {lib = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base"}},
			{label = "Yoga", keyword = "yoga", type = "anim", data = {lib = "amb@world_human_yoga@male@base", anim = "base_a"}},
			{label = "Salto w tył", keyword = "salto", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "flip_a_player_a"}},
			{label = "Gwiazda", keyword = "gwiazda", type = "anim", data = {lib = "anim@arena@celeb@flat@solo@no_props@", anim = "cap_a_player_a"}},
			{label = "Karate", keyword = "karate", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@karate_chops", anim = "karate_chops"}}
		}
	},

	{
		name  = 'dances',
		label = 'Taniec',
		items = {
			{label = "Taniec", keyword = "taniec", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_hi_06_base_laz", mode = 1}},
			{label = "Disco", keyword = "disco", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@uncle_disco", anim = "uncle_disco", mode = 1}},
			{label = "Impra", keyword = "impra", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups_transitions@", anim = "trans_dance_crowd_li_to_hi_09_v2_female^3", mode = 1}},
			{label = "Wczuta", keyword = "wczuta", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups_transitions@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^6", mode = 1}},
			{label = "Zabawa", keyword = "zabawa", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups_transitions@", anim = "trans_dance_crowd_hi_to_mi_09_v1_female^1", mode = 1}},
			{label = "Kręć tym mała", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_hi_17_smackthat_laz", mode = 1}},
			{label = "Densjer", keyword = "densjer", type = "anim", data = {lib = "anim@amb@nightclub@dancers@crowddance_groups_transitions@", anim = "trans_dance_crowd_hi_to_li_09_v1_female^3", mode = 1}},
			{label = "Robot", keyword = "robot", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_mi_15_robot_laz", mode = 1}},
			{label = "Wixa", keyword = "wixa", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_2@monologue_2a", anim = "mnt_dnc_angel", mode = 1}},
			{label = "Stepowanie", keyword = "stepowanie", type = "anim", data = {lib = "special_ped@mountain_dancer@monologue_3@monologue_3a", anim = "mnt_dnc_buttwag", mode = 1}},
			{label = "Boogie", keyword = "boogie", type = "anim", data = {lib = "rcmnigel1bnmt_1b", anim = "dance_loop_tyler", mode = 1}},
			{label = "Striptizerka", type = "anim", data = {lib = "mp_am_stripper", anim = "lap_dance_girl", mode = 1}},
			{label = "Macarena", keyword = "macarena", type = "anim", data = {lib = "misschinese2_crystalmazemcs1_cs", anim = "dance_loop_tao", mode = 1}},
			{label = "Taniec kurczaka", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@chicken_taunt", anim = "chicken_taunt", mode = 1}},
			{label = "Taniec łosia", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@thumb_on_ears", anim = "thumb_on_ears", mode = 1}},
			{label = "Taniec spidermana", keyword = "taniec10", type = "anim", data = {lib = "anim@amb@nightclub@lazlow@hi_podium@", anim = "danceidle_hi_17_spiderman_laz", mode = 1}},
			{label = "Wywijanie ręką", keyword = "wywijanie", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@find_the_fish", anim = "find_the_fish", mode = 1}},
			{label = "Super Hero", keyword = "hero", type = "anim", data = {lib = "rcmbarry", anim = "base", mode = 1}}
		}
	},

	{
		name  = 'movements',
		label = 'Style chodzenia',
		items = {
			{label = "Codzienny", type = "attitude", data = {lib = "move_m@shocked@a", anim = "move_m@shocked@a"}},
			{label = "Jogging", type = "anim", data = {lib = "move_f@jogger", anim = "idle", mode = 49}},
			{label = "Normalne (M)", type = "attitude", data = {lib = "move_m@confident", anim = "move_m@confident"}},
			{label = "Normalne (K)", type = "attitude", data = {lib = "move_f@heels@c", anim = "move_f@heels@c"}},
			{label = "Depresja (M)", type = "attitude", data = {lib = "move_m@depressed@a", anim = "move_m@depressed@a"}},
			{label = "Depresja (K)", type = "attitude", data = {lib = "move_f@depressed@a", anim = "move_f@depressed@a"}},
			{label = "Biznesman", type = "attitude", data = {lib = "move_m@business@a", anim = "move_m@business@a"}},
			{label = "Zdeterminowany", type = "attitude", data = {lib = "move_m@brave@a", anim = "move_m@brave@a"}},
			{label = "Grubas", type = "attitude", data = {lib = "move_m@fat@a", anim = "move_m@fat@a"}},
			{label = "Hipster", type = "attitude", data = {lib = "move_m@hipster@a", anim = "move_m@hipster@a"}},
			{label = "Kulawy", type = "attitude", data = {lib = "move_m@injured", anim = "move_m@injured"}},
			{label = "Wkurwiony", type = "attitude", data = {lib = "move_m@hurry@a", anim = "move_m@hurry@a"}},
			{label = "Włóczęga", type = "attitude", data = {lib = "move_m@hobo@a", anim = "move_m@hobo@a"}},
			{label = "Smutny", type = "attitude", data = {lib = "move_m@sad@a", anim = "move_m@sad@a"}},
			{label = "Muskularny", type = "attitude", data = {lib = "move_m@muscle@a", anim = "move_m@muscle@a"}},
			{label = "Mroczny", type = "attitude", data = {lib = "move_m@shadyped@a", anim = "move_m@shadyped@a"}},
			{label = "Zmęczony", type = "attitude", data = {lib = "move_m@buzzed", anim = "move_m@buzzed"}},
			{label = "Szybki krok", type = "attitude", data = {lib = "move_m@hurry_butch@a", anim = "move_m@hurry_butch@a"}},
			{label = "Dumny", type = "attitude", data = {lib = "move_m@money", anim = "move_m@money"}},
			{label = "Wyścig", type = "attitude", data = {lib = "move_m@quick", anim = "move_m@quick"}},
			{label = "Ciepły", type = "attitude", data = {lib = "move_f@maneater", anim = "move_f@maneater"}},
			{label = "Ciepły v2", type = "attitude", data = {lib = "move_f@sassy", anim = "move_f@sassy"}},	
			{label = "Arogancki", type = "attitude", data = {lib = "move_f@arrogant@a", anim = "move_f@arrogant@a"}},
			{label = "Gangster", type = "attitude", data = {lib = "move_m@gangster@generic", anim = "move_m@gangster@generic"}},
			{label = "Gangster 2", type = "attitude", data = {lib = "move_m@gangster@ng", anim = "move_m@gangster@ng"}},
			{label = "Swagger", type = "attitude", data = {lib = "move_m@swagger", anim = "move_m@swagger"}},
			{label = "Pewny siebie", type = "attitude", data = {lib = "move_m@fire", anim = "move_m@fire"}}
		}
	},

	{
		name = 'speaking',
		label = 'Style mówienia',
		resource = 'esx_voice',
		items = {
			{label = "Normalny", type = "facial", data = 1},
			{label = "Wkurwiony", type = "facial", data = 2},
			{label = "Zaangażowany", type = "facial", data = 3},
			{label = "Skupiony", type = "facial", data = 4},
			{label = "Zły", type = "facial", data = 5},
			{label = "Zacieszony", type = "facial", data = 6},
			{label = "Szczęśliwy", type = "facial", data = 7},
			{label = "Zdziwiony", type = "facial", data = 8},
			{label = "Zamknięte oczy", type = "facial", data = 9},
			{label = "Odczuwając ból", type = "facial", data = 10}
		}
	},

	{
		name  = 'porn',
		label = 'PEGI 21',
		items = {
			{label = "Masturbacja", keyword = "masturbacja", type = "anim", data = {lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01", mode = 49}},
			{label = "Masturbacja z wytryskiem", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@wank", anim = "wank"}},
			{label = "Pomaganie pani w aucie", type = "anim", data = {lib = "oddjobs@towing", anim = "m_blow_job_loop"}},
			{label = "Robienie loda w aucie", type = "anim", data = {lib = "oddjobs@towing", anim = "f_blow_job_loop"}},
			{label = "Seks w aucie", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_player"}},
			{label = "Siadanie w aucie", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_female"}},
			{label = "Drapanie się po jajach", keyword = "drapanie", type = "anim", data = {lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch"}},
			{label = "Kobiecy urok", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_02"}},
			{label = "Posuwanie", keyword = "posuwanie", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging"}},
			{label = "Wypięcie tyłka", keyword = "wypnij", type = "anim", data = {lib = "switch@trevor@mocks_lapdance", anim = "001443_01_trvs_28_exit_trv"}},
			{label = "Czekająca pani", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
			{label = "Wystawianie tyłka i piersi", type = "anim", data = {lib = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b"}},
			{label = "Striptiz taniec v1", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
			{label = "Zaproszenie faceta", keyword = "zaproszenie", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_invite", anim = "ld_girl_a_invite"}},
			{label = "Striptiz taniec v2", type = "anim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
			{label = "Striptiz taniec v3", type = "anim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
			{label = "Striptiz taniec v4", type = "anim", data = {lib = "mini@strip_club@private_dance@part1", anim = "priv_dance_p1"}}
		}
	}
}
