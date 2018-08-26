Msg("Diescraper skymall minifinale script intiated: ")

//-----------------------------------------------------
local PANIC = 0
local TANK = 1
local DELAY = 2
local ONSLAUGHT = 3
//-----------------------------------------------------

// Global variable set by entity if played in versus.
if ("DiescraperVersusActive" in getroottable())
{
	Msg("Versus\n") 
	SharedOptions <-
	{		
		A_CustomFinale1 = ONSLAUGHT
		A_CustomFinaleValue1 = "diescraper3_onslaught"
	}
}

else
{
	Msg("Coop\n") 
	SharedOptions <-
	{

		A_CustomFinale1 = PANIC
		A_CustomFinaleValue1 = 1

		A_CustomFinale2 = DELAY
		A_CustomFinaleValue2 = 10
		
		A_CustomFinale3 = ONSLAUGHT
		A_CustomFinaleValue3 = "diescraper3_onslaught"

	}
}

SharedOptions.ZombieSpawnRange <- 1500
SharedOptions.PreferredMobDirection <- SPAWN_ABOVE_SURVIVORS

DirectorOptions <- SharedOptions


//-----------------------------------------------------------------------------

function OnBeginCustomFinaleStage( num, type )
{
	if ( developer() > 0 )
	{
		printl("========================================================");
		printl( "Beginning custom finale stage " + num + " of type " + type );
	}
	
}