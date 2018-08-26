// Map specific Speedrun!! settings

function MapGameplayStart()
{
	Scoring_SetDefaultScores( [ 
	 
	] )
}

// End of the level for the bots to run toward
MapState.BotMoveTarget <- Vector(248, 232, 8);

EntFire("lobby_door_button2", "Kill")
EntFire("lobby_door", "Open")
EntFire("elevator_panel_button", "Kill")
EntFire("elevator_door", "Kill")
EntFire("elevator_door_inner", "Kill")
EntFire("elevator_nav_block", "UnblockNav",0,1)
EntFire("lobby_door_navblock", "UnblockNav"0,1)
EntFire("elevator_nav_block", "Kill",0,2)
EntFire("lobby_door_navblock", "Kill",0,2)
EntFire("env_instructor_hint", "Kill")
