::ROOT  <- getroottable()

IncludeScript("givebotweapons/utils", ROOT)
IncludeScript("givebotweapons/scout", ROOT)
IncludeScript("givebotweapons/soldier", ROOT)
IncludeScript("givebotweapons/pyro", ROOT)
IncludeScript("givebotweapons/demoman", ROOT)
IncludeScript("givebotweapons/heavyweapons", ROOT)
IncludeScript("givebotweapons/engineer", ROOT)
IncludeScript("givebotweapons/medic", ROOT)
IncludeScript("givebotweapons/sniper", ROOT)
IncludeScript("givebotweapons/spy", ROOT)

::GBW_GenerateAndEquipWeapons <- function(bot)
{
	if (bot.GetTeam() <= Constants.ETFTeam.TEAM_SPECTATOR)
	{
		return
	}

	if (IsMannVsMachineMode())
	{
		if (bot.GetTeam() == Constants.ETFTeam.TF_TEAM_PVE_INVADERS || bot.GetTeam() == Constants.ETFTeam.TF_TEAM_PVE_INVADERS_GIANTS)
		{
			// Don't touch MvM robots weapons
			return
		}
	}

	local plclass = bot.GetPlayerClass()

	if (plclass == Constants.ETFClass.TF_CLASS_SCOUT)
	{
		GBW_CreateScoutInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_SOLDIER)
	{
		GBW_CreateSoldierInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_PYRO)
	{
		GBW_CreatePyroInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_DEMOMAN)
	{
		GBW_CreateDemomanInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_HEAVYWEAPONS)
	{
		GBW_CreateHeavyweaponsInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_ENGINEER)
	{
		GBW_CreateEngineerInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_MEDIC)
	{
		GBW_CreateMedicInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_SNIPER)
	{
		GBW_CreateSniperInventory(bot)
	}
	else if (plclass == Constants.ETFClass.TF_CLASS_SPY)
	{
		GBW_CreateSpyInventory(bot)
	}
}

if ("GBW_GameEvents" in ROOT)
{
	GBW_GameEvents.clear()
}
else
{
	::GBW_GameEvents <- {}
}

function GBW_HookGameEvents()
{
	GBW_GameEvents["OnGameEvent_post_inventory_application"] <- function(params)
	{
		local player = GetPlayerFromUserID(params.userid)

		if (player.IsFakeClient())
		{
			::GBW_GenerateAndEquipWeapons(player)
		}
	}

	__CollectGameEventCallbacks(GBW_GameEvents)
}

GBW_HookGameEvents()
Msg("caxanga334's Give Bot Weapons Vscript Edition loaded! \n")