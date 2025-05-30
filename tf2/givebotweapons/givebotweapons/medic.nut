
GBW_MedicPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_syringegun_medic"
		item = 36
	},
	{
		classname = "tf_weapon_crossbow"
		item = 305
	},
	{
		classname = "tf_weapon_syringegun_medic"
		item = 412
	},
]

GBW_MedicSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_medigun"
		item = 35
	},
	{
		classname = "tf_weapon_medigun"
		item = 411
	},
	{
		classname = "tf_weapon_medigun"
		item = 998
	},
]

GBW_MedicMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 37
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 173
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 264
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 304
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 413
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 423
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 474
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 880
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 939
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 954
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 1013
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 1123
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 1127
	},
	{
		classname = "tf_weapon_bonesaw"
		item = 30758
	},
]

function GBW_CreateMedicInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_MedicPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_MedicSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_MedicMelee)
}