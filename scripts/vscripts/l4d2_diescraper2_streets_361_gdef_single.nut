printl("Diescrpaer finale gdef map script");

MapSpawns <-  
[
	["GdefWorkbench"],
	["GdefGnome"],
	["GdefBarricadeBuild"],
	["GdefVendingMachine"],
	["WrongwayBarrier"]
]

MapOptions <-
{
	SpawnSetRule = SPAWN_POSITIONAL
	SpawnSetRadius = 2500
	SpawnSetPosition = Vector(6666, 64, 90)
	ShouldIgnoreClearStateForSpawn = true
}                   


SanitizeTable <-
[
	{ classname		= "weapon_*", input = "kill" }
	{ classname		= "prop_physics", input = "kill" }
	{ classname		= "prop_ragdoll", input = "kill" }
	{ classname		= "trigger_multiple", input = "kill" }
	{ targetname	= "statue", input = "kill" }
	{ targetname	= "howitzer_button", input = "kill" }
	{ classname		= "prop_door_rotating", input = "kill" }
]