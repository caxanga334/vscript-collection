// item = -1 means don't give a weapon, AKA keep stock

GBW_ScoutPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_scattergun"
		item = 45
	},
	{
		classname = "tf_weapon_handgun_scout_primary"
		item = 220
	},
	{
		classname = "tf_weapon_scattergun"
		item = 1103
	},
	{
		classname = "tf_weapon_soda_popper"
		item = 448
	},
	{
		classname = "tf_weapon_pep_brawler_blaster"
		item = 772
	},
	{
		classname = "tf_weapon_scattergun"
		item = 1103
	},
]

GBW_ScoutSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_lunchbox_drink"
		item = 46
	},
	{
		classname = "tf_weapon_pistol"
		item = 294
	},
	{
		classname = "tf_weapon_lunchbox_drink"
		item = 163
	},
	{
		classname = "tf_weapon_handgun_scout_secondary"
		item = 449
	},
	{
		classname = "tf_weapon_handgun_scout_secondary"
		item = 773
	},
	{
		classname = "tf_weapon_cleaver"
		item = 812
	},
	{
		classname = "tf_weapon_jar_milk"
		item = 222
	},
	{
		classname = "tf_weapon_pistol"
		item = 30666
	},
	{
		classname = "tf_weapon_jar_milk"
		item = 1121
	},
]

GBW_ScoutMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_bat_wood"
		item = 44
	},
	{
		classname = "tf_weapon_bat_fish"
		item = 221
	},
	{
		classname = "tf_weapon_bat"
		item = 264
	},
	{
		classname = "tf_weapon_bat"
		item = 317
	},
	{
		classname = "tf_weapon_bat"
		item = 325
	},
	{
		classname = "tf_weapon_bat"
		item = 349
	},
	{
		classname = "tf_weapon_bat"
		item = 355
	},
	{
		classname = "tf_weapon_bat"
		item = 423
	},
	{
		classname = "tf_weapon_bat"
		item = 450
	},
	{
		classname = "tf_weapon_bat"
		item = 452
	},
	{
		classname = "tf_weapon_bat_fish"
		item = 572
	},
	{
		classname = "tf_weapon_bat_giftwrap"
		item = 648
	},
	{
		classname = "tf_weapon_bat"
		item = 880
	},
	{
		classname = "tf_weapon_bat"
		item = 939
	},
	{
		classname = "tf_weapon_bat"
		item = 954
	},
	{
		classname = "tf_weapon_bat"
		item = 1013
	},
	{
		classname = "tf_weapon_bat"
		item = 30667
	},
	{
		classname = "tf_weapon_bat"
		item = 30758
	},
]

function GBW_CreateScoutInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_ScoutPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_ScoutSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_ScoutMelee)
}