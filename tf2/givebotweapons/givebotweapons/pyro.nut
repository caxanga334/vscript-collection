
GBW_PyroPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_flamethrower"
		item = 40
	},
	{
		classname = "tf_weapon_flamethrower"
		item = 215
	},
	{
		classname = "tf_weapon_flamethrower"
		item = 594
	},
	{
		classname = "tf_weapon_rocketlauncher_fireball"
		item = 1178
	},
	{
		classname = "tf_weapon_flamethrower"
		item = 30474
	},
]

GBW_PyroSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_flaregun"
		item = 39
	},
	{
		classname = "tf_weapon_flaregun"
		item = 351
	},
	{
		classname = "tf_weapon_flaregun_revenge"
		item = 595
	},
	{
		classname = "tf_weapon_flaregun"
		item = 740
	},
	{
		classname = "tf_weapon_shotgun_pyro"
		item = 415
	},
	{
		classname = "tf_weapon_shotgun_pyro"
		item = 1153
	},
	{
		classname = "tf_weapon_rocketpack"
		item = 1179
	},
	{
		classname = "tf_weapon_jar_gas"
		item = 1180
	},
]

GBW_PyroMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 38
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 153
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 214
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 264
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 326
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 348
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 423
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 457
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 466
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 474
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 593
	},
	{
		classname = "tf_weapon_fireaxe"
		item = 739
	},
	{
		classname = "tf_weapon_breakable_sign"
		item = 813
	},
	{
		classname = "tf_weapon_slap"
		item = 1181
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

function GBW_CreatePyroInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_PyroPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_PyroSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_PyroMelee)
}