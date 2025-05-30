function GBW_GiveWeaponFromArray(player, selectit, arr)
{
	local weapontbl = arr[RandomInt(0, arr.len() - 1)]

	if (weapontbl.item < 0)
	{
		return
	}

	GBW_GivePlayerWeapon(player, weapontbl.classname, weapontbl.item, selectit)
}

function GBW_GivePlayerWeapon(player, classname, item_id, selectit)
{
	local maxweapons = NetProps.GetPropArraySize(player, "m_hMyWeapons")
	local weapon = Entities.CreateByClassname(classname)
	NetProps.SetPropInt(weapon, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", item_id)
	NetProps.SetPropInt(weapon, "m_AttributeManager.m_Item.m_iEntityLevel", RandomInt(1, 100))
	NetProps.SetPropBool(weapon, "m_AttributeManager.m_Item.m_bInitialized", true)
	NetProps.SetPropBool(weapon, "m_bValidatedAttachedEntity", true)
	weapon.SetTeam(player.GetTeam())
	weapon.DispatchSpawn()

	// remove existing weapon in same slot
	for (local i = 0; i < maxweapons; i++)
	{
		local held_weapon = NetProps.GetPropEntityArray(player, "m_hMyWeapons", i)
		if (held_weapon == null)
			continue
		if (held_weapon.GetSlot() != weapon.GetSlot())
			continue
		held_weapon.Destroy()
		NetProps.SetPropEntityArray(player, "m_hMyWeapons", null, i)
		break
	}

	player.Weapon_Equip(weapon)

	if (selectit == true)
	{
		player.Weapon_Switch(weapon)
	}

	return weapon
}

// TO-DO: Funciton for spawning wearable entities