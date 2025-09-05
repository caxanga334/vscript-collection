::ROOT  <- getroottable()

::BAB_gIsRunningChecks <- false

if ("BAB_GameEvents" in ROOT)
{
	BAB_GameEvents.clear()
}
else
{
	::BAB_GameEvents <- {}
}

function BAB_HookGameEvents()
{
	BAB_GameEvents["OnGameEvent_player_disconnect"] <- function(params)
	{
		if (!BAB_gIsRunningChecks)
		{
			BAB_gIsRunningChecks = true
			Msg("[BAB]: Player disconnected, running balance checks... \n")
			EntFire("worldspawn", "CallScriptFunction", "BAB_RunCheck", 2.0)
		}
	}

	__CollectGameEventCallbacks(BAB_GameEvents)
}

::BAB_ReRunCheck <- function()
{
	BAB_gIsRunningChecks = true
	EntFire("worldspawn", "CallScriptFunction", "BAB_RunCheck", 2.0)
}

::BAB_CountPlayers <- function(tbl)
{
	local maxplayers = MaxClients().tointeger()

	printf("maxplayers: %i \n", maxplayers)

	for (local i = 1; i <= maxplayers; i++)
	{
		local player = PlayerInstanceFromIndex(i)

		if (player != null)
		{
			local teamnum = player.GetTeam()

			if (teamnum == Constants.ETFTeam.TF_TEAM_RED)
			{
				tbl.red = tbl.red + 1
			}
			else if (teamnum == Constants.ETFTeam.TF_TEAM_BLUE)
			{
				tbl.blu = tbl.blu + 1
			}
		}
	}
}

::BAB_CollectBotsOnTeam <- function(arr, team)
{
	local maxplayers = MaxClients().tointeger()

	for (local i = 1; i <= maxplayers; i++)
	{
		local player = PlayerInstanceFromIndex(i)

		if (player != null && player.IsFakeClient())
		{
			local teamnum = player.GetTeam()

			if (teamnum == team)
			{
				arr.push(player)
			}
		}
	}
}

::BAB_RunCheck <- function()
{
	BAB_gIsRunningChecks = false
	local enabled = Convars.GetInt("mp_autoteambalance")

	if (enabled == 0)
	{
		Msg("[BAB]: Not balancing bots: mp_autoteambalance is 0! \n")
		return
	}

	local playercounts = {}

	playercounts.red <- 0
	playercounts.blu <- 0

	BAB_CountPlayers(playercounts)

	if (playercounts.red == playercounts.blu)
	{
		Msg("[BAB]: Teams are equal! \n")
		return
	}

	local delta = playercounts.red - playercounts.blu

	if (delta < 0)
	{
		delta = delta * -1
	}

	local limit = Convars.GetInt("mp_teams_unbalance_limit")

	if (limit <= 0)
	{
		Msg("[BAB]: Team unbalance limit is disabled, not balancing! \n")
		return
	}

	if (delta <= limit)
	{
		printf("[BAB]: Team unbalance difference is less than mp_teams_unbalance_limit, not taking action. Limit: %i Delta %i \n", limit, delta)
		return
	}

	local arr = []
	local targetteam = 0

	// less players on RED
	if (playercounts.red < playercounts.blu)
	{
		BAB_CollectBotsOnTeam(arr, Constants.ETFTeam.TF_TEAM_BLUE)
		targetteam = Constants.ETFTeam.TF_TEAM_RED
	}
	else
	{
		// less players on BLU
		BAB_CollectBotsOnTeam(arr, Constants.ETFTeam.TF_TEAM_RED)
		targetteam = Constants.ETFTeam.TF_TEAM_BLUE
	}

	if (arr.len() > 0)
	{
		local bot = arr[RandomInt(0, arr.len() - 1)]

		Msg("BAB: Auto balancing bot! \n")

		bot.ForceChangeTeam(targetteam, false)
		bot.ForceRegenerateAndRespawn()

		if ((delta - limit) > 1)
		{
			BAB_ReRunCheck()
		}
	}
	else
	{
		printf("[BAB]: No bots on team %i to kick! \n", targetteam);
	}
}

BAB_HookGameEvents()
Msg("caxanga334's Bot Auto Balancer Vscript loaded! \n")