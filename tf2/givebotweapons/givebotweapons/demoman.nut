
GBW_DemomanPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_grenadelauncher"
		item = 308
	},
	{
		classname = "tf_wearable"
		item = 405
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_wearable"
		item = 608
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_weapon_cannon"
		item = 996
	},
	{
		classname = "tf_weapon_grenadelauncher"
		item = 1151
	},
]

GBW_DemomanSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_pipebomblauncher"
		item = 130
	},
	{
		classname = "tf_wearable_demoshield"
		item = 131
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_wearable_demoshield"
		item = 406
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_wearable_demoshield"
		item = 1099
		iswearable = true
		slot = 1
	},
]

GBW_DemomanMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_sword"
		item = 132
	},
	{
		classname = "tf_weapon_bottle"
		item = 154
	},
	{
		classname = "tf_weapon_sword"
		item = 172
	},
	{
		classname = "tf_weapon_bottle"
		item = 264
	},
	{
		classname = "tf_weapon_sword"
		item = 266
	},
	{
		classname = "tf_weapon_stickbomb"
		item = 307
	},
	{
		classname = "tf_weapon_sword"
		item = 327
	},
	{
		classname = "tf_weapon_katana"
		item = 357
	},
	{
		classname = "tf_weapon_sword"
		item = 404
	},
	{
		classname = "tf_weapon_bottle"
		item = 423
	},
	{
		classname = "tf_weapon_bottle"
		item = 474
	},
	{
		classname = "tf_weapon_sword"
		item = 482
	},
	{
		classname = "tf_weapon_bottle"
		item = 609
	},
	{
		classname = "tf_weapon_bottle"
		item = 880
	},
	{
		classname = "tf_weapon_bottle"
		item = 954
	},
	{
		classname = "tf_weapon_bottle"
		item = 1013
	},
	{
		classname = "tf_weapon_bottle"
		item = 1123
	},
	{
		classname = "tf_weapon_bottle"
		item = 1127
	},
	{
		classname = "tf_weapon_bottle"
		item = 30758
	},
]

function GBW_CreateDemomanInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_DemomanPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_DemomanSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_DemomanMelee)
}