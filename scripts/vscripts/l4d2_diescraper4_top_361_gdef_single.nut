printl("Diescrpaer finale gdef map script");

MapSpawns <-  
[
	["GdefWorkbench"],
	["GdefGnome"],
	["GdefBarricadeBuild"],
	["GdefVendingMachine"]
	//["WrongwayBarrier"]
]

MapOptions <-
{
	SpawnSetRule = SPAWN_FINALE
	//SpawnSetRadius = 1500
	PreferredMobDirection = SPAWN_LARGE_VOLUME
	PreferredSpecialDirection = SPAWN_LARGE_VOLUME
	ShouldConstrainLargeVolumeSpawn = false
}                   


SanitizeTable <-
[
	{ classname		= "weapon_*", input = "kill" }
	{ classname		= "prop_physics", input = "kill" }
	{ classname		= "prop_ragdoll", input = "kill" }
	{ classname		= "prop_door_rotating", input = "kill" }
	{ classname		= "trigger_finale", input = "kill" }
	{ classname		= "point_prop_use_target", input = "kill" }
	{ targetname	= "gas_nozzle", input = "kill" }
	{ targetname	= "door_finale_block", input = "close" }
]

// Teleport survivors that fell off back to the helipad.
function CheckFallenPlayers()
{
	local player = null
	
	while(player = Entities.FindByClassname(player, "player"))
	{
		if(player.IsSurvivor() && player.GetOrigin().z < -1024)
		{
			player.SetOrigin(Vector(1312, 0, -128))
		}
	}
}

ScriptedMode_AddSlowPoll(CheckFallenPlayers)


