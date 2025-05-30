// item = -1 means don't give a weapon, AKA keep stock

GBW_SoldierPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_rocketlauncher_directhit"
		item = 127
	},
	{
		classname = "tf_weapon_rocketlauncher"
		item = 228
	},
	{
		classname = "tf_weapon_rocketlauncher"
		item = 414
	},
	{
		classname = "tf_weapon_particle_cannon"
		item = 441
	},
	{
		classname = "tf_weapon_rocketlauncher"
		item = 513
	},
	{
		classname = "tf_weapon_rocketlauncher_airstrike"
		item = 1104
	},
]

GBW_SoldierSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_buff_item"
		item = 129
	},
	{
		classname = "tf_weapon_buff_item"
		item = 226
	},
	{
		classname = "tf_weapon_buff_item"
		item = 354
	},
	{
		classname = "tf_weapon_shotgun_soldier"
		item = 415
	},
	{
		classname = "tf_weapon_raygun"
		item = 442
	},
	{
		classname = "tf_weapon_shotgun_soldier"
		item = 1153
	},
]

GBW_SoldierMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_shovel"
		item = 128
	},
	{
		classname = "tf_weapon_shovel"
		item = 154
	},
	{
		classname = "tf_weapon_shovel"
		item = 264
	},
	{
		classname = "tf_weapon_katana"
		item = 357
	},
	{
		classname = "tf_weapon_shovel"
		item = 416
	},
	{
		classname = "tf_weapon_shovel"
		item = 423
	},
	{
		classname = "tf_weapon_shovel"
		item = 447
	},
	{
		classname = "tf_weapon_shovel"
		item = 474
	},
	{
		classname = "tf_weapon_shovel"
		item = 775
	},
	{
		classname = "tf_weapon_shovel"
		item = 880
	},
	{
		classname = "tf_weapon_shovel"
		item = 30758
	},
	{
		classname = "tf_weapon_shovel"
		item = 954
	},
	{
		classname = "tf_weapon_shovel"
		item = 1013
	},
]

function GBW_CreateSoldierInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_SoldierPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SoldierSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SoldierMelee)
}