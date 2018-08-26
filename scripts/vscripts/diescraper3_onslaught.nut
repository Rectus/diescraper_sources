Msg("Skymall onslaught script intiated\n")

// Global variable set by entity if played in versus.
if ("DiescraperVersusActive" in getroottable())
{
	DirectorOptions <-
	{	
		MobSpawnMinTime = 5
		MobSpawnMaxTime = 12
		MobMinSize = 10
		MobMaxSize = 15
		MobMaxPending = 20
		SustainPeakMinTime = 5
		SustainPeakMaxTime = 10
		IntensityRelaxThreshold = 0.99
		RelaxMinInterval = 7
		RelaxMaxInterval = 10
		RelaxMaxFlowTravel = 100
		ZombieSpawnRange = 2000
		PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
		MinimumStageTime = 15
	}
	//Spawns the button to turn of the alarm.
	EntFire ("alarm_button_template", "ForceSpawn", 0)
	
	//Opens the upstairs shutters and shows a hint.
	EntFire ("onslaught_relay", "Trigger", 0, 20.0)
}

else
{
	DirectorOptions <-
	{
		
		MobSpawnMinTime = 5
		MobSpawnMaxTime = 10
		MobMinSize = 10
		MobMaxSize = 15
		MobMaxPending = 25
		SustainPeakMinTime = 5
		SustainPeakMaxTime = 10
		IntensityRelaxThreshold = 0.99
		RelaxMinInterval = 1
		RelaxMaxInterval = 5
		RelaxMaxFlowTravel = 50
		SpecialRespawnInterval = 20
			SmokerLimit = 2
			JockeyLimit = 0
			BoomerLimit = 0
			HunterLimit = 1
			ChargerLimit = 0
			SpitterLimit = 1
		PreferredMobDirection = SPAWN_IN_FRONT_OF_SURVIVORS
		ZombieSpawnRange = 1500
		MinimumStageTime = 15
	}
	//Spawns the button to turn off the alarm.	
	EntFire ("alarm_button_coop_spawner", "ForceSpawn", 0)
	
	//Opens the upstairs shutters and shows a hint.
	EntFire ("onslaught_relay", "Trigger", 0)
}
Director.ResetMobTimer()
//Director.PlayMegaMobWarningSounds()




