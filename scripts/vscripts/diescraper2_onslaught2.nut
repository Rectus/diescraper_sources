Msg("Underpass onslaught script 2 intiated\n")

DirectorOptions <-
{
	// This turns off tanks and witches.
	ProhibitBosses = true
	
	//LockTempo = true
	MobSpawnMinTime = 3
	MobSpawnMaxTime = 7
	MobMinSize = 20
	MobMaxSize = 30
	MobMaxPending = 15
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	IntensityRelaxThreshold = 0.99
	RelaxMinInterval = 3
	RelaxMaxInterval = 7
	RelaxMaxFlowTravel = 500
	SpecialRespawnInterval = 30
        SmokerLimit = 1
        JockeyLimit = 0
        BoomerLimit = 1
        HunterLimit = 2
        ChargerLimit = 2
	PreferredMobDirection = SPAWN_ABOVE_SURVIVORS
	ZombieSpawnRange = 1500
}

Director.ResetMobTimer()
