Msg("Lobby onslaught script intiated\n")

if (Director.GetGameMode() == "versus")
{
	DirectorOptions <-
	{
		// This turns off tanks and witches.
		ProhibitBosses = false
		
		//LockTempo = true
		MobSpawnMinTime = 6
		MobSpawnMaxTime = 12
		MobMinSize = 12
		MobMaxSize = 17
		MobMaxPending = 20
		SustainPeakMinTime = 5
		SustainPeakMaxTime = 10
		IntensityRelaxThreshold = 0.99
		RelaxMinInterval = 5
		RelaxMaxInterval = 5
		RelaxMaxFlowTravel = 50
		SpecialRespawnInterval = 30
		PreferredMobDirection = SPAWN_NO_PREFERENCE
		ZombieSpawnRange = 1500
	}
}

else
{
	DirectorOptions <-
	{
		// This turns off tanks and witches.
		ProhibitBosses = false
		
		//LockTempo = true
		MobSpawnMinTime = 4
		MobSpawnMaxTime = 8
		MobMinSize = 15
		MobMaxSize = 20
		MobMaxPending = 25
		SustainPeakMinTime = 3
		SustainPeakMaxTime = 6
		IntensityRelaxThreshold = 0.99
		RelaxMinInterval = 2
		RelaxMaxInterval = 3
		RelaxMaxFlowTravel = 50
		SpecialRespawnInterval = 20
			SmokerLimit = 2

		PreferredMobDirection = SPAWN_NO_PREFERENCE
		ZombieSpawnRange = 1250
	}
}

Director.ResetMobTimer()
Director.PlayMegaMobWarningSounds()