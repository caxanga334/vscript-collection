
GBW_SniperPrimaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_compound_bow"
		item = 56
	},
	{
		classname = "tf_weapon_sniperrifle"
		item = 230
	},
	{
		classname = "tf_weapon_sniperrifle_decap"
		item = 402
	},
	{
		classname = "tf_weapon_sniperrifle"
		item = 526
	},
	{
		classname = "tf_weapon_sniperrifle"
		item = 752
	},
	{
		classname = "tf_weapon_compound_bow"
		item = 1092
	},
	{
		classname = "tf_weapon_sniperrifle_classic"
		item = 1098
	},
	{
		classname = "tf_weapon_sniperrifle"
		item = 851
	},
]

GBW_SniperSecondaries <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_wearable_razorback"
		item = 57
		// if iswearable is present, will spawn the item as an wearable instead of an weapon
		iswearable = true
		// slot is only needed for wearable entities, used to remove any weapons in this slot
		slot = 1
	},
	{
		classname = "tf_weapon_jar"
		item = 58
	},
	{
		classname = "tf_wearable"
		item = 231
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_wearable"
		item = 642
		iswearable = true
		slot = 1
	},
	{
		classname = "tf_weapon_charged_smg"
		item = 751
	},
	{
		classname = "tf_weapon_jar"
		item = 1105
	},
]

GBW_SniperMelee <- [
	{
		classname = ""
		item = -1
	},
	{
		classname = "tf_weapon_club"
		item = 171
	},
	{
		classname = "tf_weapon_club"
		item = 232
	},
	{
		classname = "tf_weapon_club"
		item = 264
	},
	{
		classname = "tf_weapon_club"
		item = 401
	},
	{
		classname = "tf_weapon_club"
		item = 423
	},
	{
		classname = "tf_weapon_club"
		item = 474
	},
	{
		classname = "tf_weapon_club"
		item = 880
	},
	{
		classname = "tf_weapon_club"
		item = 939
	},
	{
		classname = "tf_weapon_club"
		item = 954
	},
	{
		classname = "tf_weapon_club"
		item = 1013
	},
	{
		classname = "tf_weapon_club"
		item = 1127
	},
	{
		classname = "tf_weapon_club"
		item = 1123
	},
	{
		classname = "tf_weapon_club"
		item = 30758
	},
]

function GBW_CreateSniperInventory(bot)
{
	GBW_GiveWeaponFromArray(bot, true, GBW_SniperPrimaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SniperSecondaries)
	GBW_GiveWeaponFromArray(bot, false, GBW_SniperMelee)
}