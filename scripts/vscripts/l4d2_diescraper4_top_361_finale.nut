Msg("Diescraper custom finale script intiated\n")

//-----------------------------------------------------
local PANIC = 0
local TANK = 1
local DELAY = 2
local ONSLAUGHT = 3
//-----------------------------------------------------

// Only runs in regular versus mode
if (Director.GetGameMode() == "versus")
{
	SharedOptions <-
	{
		C_CustomFinale_StageCount = 8
	
		C_CustomFinale1 = PANIC
		C_CustomFinaleValue1 = 2

		C_CustomFinale2 = DELAY
		C_CustomFinaleValue2 = 15

		C_CustomFinale3 = TANK
		C_CustomFinaleValue3 = 1

		C_CustomFinale4 = DELAY
		C_CustomFinaleValue4 = 15

		C_CustomFinale5 = PANIC
		C_CustomFinaleValue5 = 2

		C_CustomFinale6 = DELAY
		C_CustomFinaleValue6 = 15

		C_CustomFinale7 = TANK
		C_CustomFinaleValue7 = 1

		C_CustomFinale8 = DELAY
		C_CustomFinaleValue8 = 5
		
		ZombieSpawnRange = 2000
		SpecialRespawnInterval = 30
		PreferredMobDirection = SPAWN_ABOVE_SURVIVORS
	}
}
// Run the helipad lights stage in other modes.
else
{
	SharedOptions <-
	{	
		C_CustomFinale_StageCount = 10
	
		C_CustomFinale1 = PANIC
		C_CustomFinaleValue1 = 2

		C_CustomFinale2 = DELAY
		C_CustomFinaleValue2 = 20

		C_CustomFinale3 = TANK
		C_CustomFinaleValue3 = 1

		C_CustomFinale4 = DELAY
		C_CustomFinaleValue4 = 15

		C_CustomFinale5 = PANIC
		C_CustomFinaleValue5 = 1

		C_CustomFinale6 = DELAY
		C_CustomFinaleValue6 = 20

		C_CustomFinale7 = TANK
		C_CustomFinaleValue7 = 1

		C_CustomFinale8 = DELAY
		C_CustomFinaleValue8 = 15
		
		//Onslaught stage that the player can end early by completing a task. Otherwise runs for 30 - 60 seconds.
		C_CustomFinale9 = ONSLAUGHT
		C_CustomFinaleValue9 = "diescraper4_onslaught_helipadlights"
		C_CustomFinaleMusic9 = "Event.ApproachingScavengeRoundWin"
		
		C_CustomFinale10 = DELAY
		C_CustomFinaleValue10 = 5
		
		ZombieSpawnRange = 2000
		SpecialRespawnInterval = 30
		PreferredMobDirection = SPAWN_ABOVE_SURVIVORS
		
		ShouldAllowMobsWithTank = false
		ShouldAllowSpecialsWithTank = true
	}
	
}


DirectorOptions <- clone SharedOptions



//-----------------------------------------------------------------------------

function OnBeginCustomFinaleStage( num, type )
{	
	if ( developer() > 0 )
	{
		printl("========================================================");
		printl( "Beginning custom finale stage " + num + " of type " + type );
	}
	
	local TANK = 1
	
	// Try to make the tank spawn closer
	if(type == TANK)
	{
		printl("Tank stage!");
		DirectorScript.DirectorOptions.ZombieSpawnRange <- 250;
	}
	else
	{
		DirectorScript.DirectorOptions.ZombieSpawnRange <- 2000;
	}
	
}