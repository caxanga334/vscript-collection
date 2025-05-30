
GBW_EngineerPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_sentry_revenge"
		item = 141
	},
	{
		classname = "tf_weapon_shotgun_primary"
		item = 527
	},
	{
		classname = "tf_weapon_drg_pomson"
		item = 588
	},
	{
		classname = "tf_weapon_shotgun_building_rescue"
		item = 997
	},
	{
		classname = "tf_weapon_shotgun_primary"
		item = 1153
	},
]

GBW_EngineerSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_laser_pointer"
		item = 140
	},
	{
		classname = "tf_weapon_pistol"
		item = 294
	},
	{
		classname = "tf_weapon_mechanical_arm"
		item = 528
	},
	{
		classname = "tf_weapon_pistol"
		item = 30666
	},
]

GBW_EngineerMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_robot_arm"
		item = 142
	},
	{
		classname = "tf_weapon_wrench"
		item = 155
	},
	{
		classname = "tf_weapon_wrench"
		item = 169
	},
	{
		classname = "tf_weapon_wrench"
		item = 329
	},
	{
		classname = "tf_weapon_wrench"
		item = 423
	},
	{
		classname = "tf_weapon_wrench"
		item = 589
	},
	{
		classname = "tf_weapon_wrench"
		item = 1123
	},
	{
		classname = "tf_weapon_wrench"
		item = 30758
	},
]

function GBW_CreateEngineerInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_EngineerPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_EngineerSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_EngineerMelee)
}