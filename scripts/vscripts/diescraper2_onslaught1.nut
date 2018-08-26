Msg("Underpass onslaught script 1 intiated\n")

DirectorOptions <-
{
	// This turns off tanks and witches.
	ProhibitBosses = true
	
	//LockTempo = true
	MobSpawnMinTime = 3
	MobSpawnMaxTime = 7
	MobMinSize = 20
	MobMaxSize = 30
	MobMaxPending = 30
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	IntensityRelaxThreshold = 0.99
	RelaxMinInterval = 1
	RelaxMaxInterval = 5
	RelaxMaxFlowTravel = 50
	SpecialRespawnInterval = 45
        SmokerLimit = 2
        JockeyLimit = 0
        BoomerLimit = 1
        HunterLimit = 2
        ChargerLimit = 0
	PreferredSpecialDirection = SPAWN_ABOVE_SURVIVORS
	PreferredMobDirection = SPAWN_NO_PREFERENCE
	ZombieSpawnRange = 1500
}

Director.ResetMobTimer()
Director.PlayMegaMobWarningSounds()