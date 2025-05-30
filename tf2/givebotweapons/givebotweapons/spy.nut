
GBW_SpyPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_revolver"
		item = 61
	},
	{
		classname = "tf_weapon_revolver"
		item = 161
	},
	{
		classname = "tf_weapon_revolver"
		item = 224
	},
	{
		classname = "tf_weapon_revolver"
		item = 460
	},
	{
		classname = "tf_weapon_revolver"
		item = 525
	},
]

GBW_SpySecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_sapper"
		item = 810
	},
	{
		classname = "tf_weapon_sapper"
		item = 933
	},
	{
		classname = "tf_weapon_sapper"
		item = 1102
	},
]

GBW_SpyMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_knife"
		item = 225
	},
	{
		classname = "tf_weapon_knife"
		item = 356
	},
	{
		classname = "tf_weapon_knife"
		item = 423
	},
	{
		classname = "tf_weapon_knife"
		item = 461
	},
	{
		classname = "tf_weapon_knife"
		item = 574
	},
	{
		classname = "tf_weapon_knife"
		item = 638
	},
	{
		classname = "tf_weapon_knife"
		item = 649
	},
	{
		classname = "tf_weapon_knife"
		item = 727
	},
	{
		classname = "tf_weapon_knife"
		item = 30758
	},
]

GBW_SpyWatches <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_invis"
		item = 59
	},
	{
		classname = "tf_weapon_invis"
		item = 60
	},
	{
		classname = "tf_weapon_invis"
		item = 297
	},
	{
		classname = "tf_weapon_invis"
		item = 947
	},
]

function GBW_CreateSpyInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_SpyPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SpySecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SpyMelee)
	GBW_GiveWeaponFromArray(bot, false, GBW_SpyWatches)
}