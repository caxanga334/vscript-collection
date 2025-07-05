::GBW_gIsGivingItems <- false
::GBW_gRecalculateBodyGroups <- false
::GBW_gCleanUpTimerIsActive <- false
::GBW_PlayerManager <- Entities.FindByClassname(null, "tf_player_manager")

::GBW_GetPlayerUserID <- function(player)
{
    return NetProps.GetPropIntArray(GBW_PlayerManager, "m_iUserID", player.entindex())
}

// Remove a weapon from the given slot, used when spawning wearables
::GBW_RemoveWeaponOfSlot <- function(player, slot)
{
	local maxweapons = NetProps.GetPropArraySize(player, "m_hMyWeapons")

	for (local i = 0; i < maxweapons; i++)
	{
		local held_weapon = NetProps.GetPropEntityArray(player, "m_hMyWeapons", i)
		if (held_weapon == null)
			continue
		if (held_weapon.GetSlot() != slot)
			continue
		held_weapon.Destroy()
		NetProps.SetPropEntityArray(player, "m_hMyWeapons", null, i)
		break
	}
}

// Re-creation of CBaseEntity::FollowEntity
::GBW_FollowEntity <- function(entity, other, bonemerge = true)
{
	entity.AcceptInput("SetParent", "!activator", other, other)
	entity.SetMoveType(Constants.EMoveType.MOVETYPE_NONE, Constants.EMoveCollide.MOVECOLLIDE_DEFAULT)

	if (bonemerge)
	{
		NetProps.SetPropInt(entity, "m_fEffects", 129); //EF_BONEMERGE | EF_BONEMERGE_FASTCULL
	}

	local vec3_zero = Vector(0,0,0)
	local vec3_angle_zero = QAngle(0,0,0)
	entity.AddSolidFlags(Constants.FSolid.FSOLID_NOT_SOLID)
	entity.SetLocalOrigin(vec3_zero)
	entity.SetLocalAngles(vec3_angle_zero)
}

::GBW_CleanUpPlayerWearables <- function(player)
{
	player.ValidateScriptScope()
	local player_scope = player.GetScriptScope()
	if (!("gbw_wearables" in player_scope))
		player_scope.gbw_wearables <- []

	// Delete the entities
	foreach (k, v in player_scope.gbw_wearables)
	{
		if (v.IsValid())
		{
			v.Destroy()
		}
	}

	// reset this back to false
	NetProps.SetPropBool(player, "m_Shared.m_bShieldEquipped", false);
	player_scope.gbw_wearables.clear()
}

function GBW_GiveWeaponFromArray(player, selectit, arr)
{
	local weapontbl = arr[RandomInt(0, arr.len() - 1)]

	if (weapontbl.item < 0)
	{
		return
	}

	if ("iswearable" in weapontbl)
	{
		GBW_GivePlayerWearable(player, weapontbl.classname, weapontbl.item, weapontbl.slot)
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

	// Fixes
	if (classname == "tf_weapon_sapper")
	{
		NetProps.SetPropInt(weapon, "BuilderLocalData.m_iObjectType", 3)
		NetProps.SetPropInt(weapon, "m_iObjectMode", 0)
		NetProps.SetPropInt(weapon, "m_iSubType", 3)
		NetProps.SetPropInt(weapon, "BuilderLocalData.m_aBuildableObjectTypes.000", 0)
		NetProps.SetPropInt(weapon, "BuilderLocalData.m_aBuildableObjectTypes.001", 0)
		NetProps.SetPropInt(weapon, "BuilderLocalData.m_aBuildableObjectTypes.002", 0)
		NetProps.SetPropInt(weapon, "BuilderLocalData.m_aBuildableObjectTypes.003", 1)
	}

	weapon.ReapplyProvision()
	return weapon
}

::GBW_GivePlayerWearable <- function(player, classname, item_id, slot)
{
	// Remove any weapon using the same slot as the wearable
	GBW_RemoveWeaponOfSlot(player, slot)

	local wearable = Entities.CreateByClassname(classname)
	NetProps.SetPropInt(wearable, "m_AttributeManager.m_Item.m_iItemDefinitionIndex", item_id)
	NetProps.SetPropBool(wearable, "m_AttributeManager.m_Item.m_bInitialized", true)
	NetProps.SetPropBool(wearable, "m_bValidatedAttachedEntity", true)
	NetProps.SetPropBool(wearable, "m_bForcePurgeFixedupStrings", true);
	wearable.SetTeam(player.GetTeam())
	wearable.SetOwner(player)
	wearable.DispatchSpawn()
	GBW_FollowEntity(wearable, player, true)
	wearable.ReapplyProvision()
	player.Weapon_Equip(wearable) // is this really needed?

	// GBW_gRecalculateBodyGroups = true

	local player_scope = player.GetScriptScope()
	player_scope.gbw_wearables.append(wearable) // should be valid since GBW_CleanUpPlayerWearables is called before this

	// fixes
	if (classname == "tf_wearable_demoshield")
	{
		NetProps.SetPropBool(player, "m_Shared.m_bShieldEquipped", true);
	}

	return wearable
}

::GBW_DoCleanUpDroppedWeapons <- function()
{
	local weapon = null
	while (weapon = Entities.FindByClassname(weapon, "tf_dropped_weapon"))
	{
		weapon.Destroy()
	}

	GBW_gCleanUpTimerIsActive = false
}