// Map specific Speedrun!! settings

function MapGameplayStart()
{
	Scoring_SetDefaultScores( [ 
	 
	] )
}

// End of the level for the bots to run toward
MapState.BotMoveTarget <- Vector(-4, -416, 513);

EntFire("generator_lever_button", "Kill")
EntFire("shutter_relay", "Trigger")
EntFire("store_shutter_nav", "UnblockNav"0,1)
EntFire("store_shutter_nav", "Kill",0,2)
EntFire("env_instructor_hint", "Kill")
