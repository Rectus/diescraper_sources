Msg("Helipad lights task initiated.\n")


DirectorOptions <-
{
	MobSpawnMinTime = 1
	MobSpawnMaxTime = 5
	MobMinSize = 15
	MobMaxSize = 20
	MobMaxPending = 30
	SustainPeakMinTime = 5
	SustainPeakMaxTime = 10
	IntensityRelaxThreshold = 0.99
	RelaxMinInterval = 1
	RelaxMaxInterval = 5
	RelaxMaxFlowTravel = 50
	PreferredMobDirection = SPAWN_ABOVE_SURVIVORS
	ZombieSpawnRange = 2000
	SpecialRespawnInterval = 15
}

Director.ResetMobTimer()
Director.PlayMegaMobWarningSounds()

//Turns off the helipad lights and enables the switch.
EntFire ("finale_escape_lightrelay1", "Trigger", 0)