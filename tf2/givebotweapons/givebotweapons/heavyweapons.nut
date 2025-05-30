
GBW_HeavyweaponsPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_minigun"
		item = 41
	},
	{
		classname = "tf_weapon_minigun"
		item = 298
	},
	{
		classname = "tf_weapon_minigun"
		item = 312
	},
	{
		classname = "tf_weapon_minigun"
		item = 424
	},
	{
		classname = "tf_weapon_minigun"
		item = 811
	},
]

GBW_HeavyweaponsSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 42
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 159
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 311
	},
	{
		classname = "tf_weapon_shotgun_hwg"
		item = 425
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 433
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 863
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 1002
	},
	{
		classname = "tf_weapon_lunchbox"
		item = 1190
	},
	{
		classname = "tf_weapon_shotgun_hwg"
		item = 1153
	},
]

// All class weapons uses tf_weapon_fireaxe for heavy

GBW_HeavyweaponsMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_fists"
		item = 43
	},
	{
		classname = "tf_weapon_fists"
		item = 239
	},
	{
		classname = "tf_weapon_fists"
		item = 310
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 264
	},
	{
		classname = "tf_weapon_fists"
		item = 331
	},
	{
		classname = "tf_weapon_fists"
		item = 426
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 423
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 474
	},
	{
		classname = "tf_weapon_fists"
		item = 587
	},
	{
		classname = "tf_weapon_fists"
		item = 656
	},
	{
		classname = "tf_weapon_fists"
		item = 1100
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 880
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 954
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 1013
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 1123
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 1127
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 30758
	},
]

function GBW_CreateHeavyweaponsInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_HeavyweaponsPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_HeavyweaponsSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_HeavyweaponsMelee)
}