TotalProbability <- 0
TotalSpawns <- 0
ItemSpawnPoints <- []
spawnFailed <- false

ItemSpawnList <-
[
	//Entity:						Probability:	Ammo:			Melee type:
	{ent = "weapon_rifle"			prob = 10,		ammo = 50,	melee_type = "null"	},
	{ent = "weapon_rifle_desert"	prob = 10,		ammo = 50,	melee_type = "null"	},
	{ent = "weapon_shotgun_spas"	prob = 10,		ammo = 15,	melee_type = "null"	},
	{ent = "weapon_sniper_military"	prob = 10,		ammo = 25,	melee_type = "null"	},
	{ent = "weapon_rifle_ak47"		prob = 10,		ammo = 50,	melee_type = "null"	},
	{ent = "weapon_autoshotgun"		prob = 10,		ammo = 15,	melee_type = "null"	},
	{ent = "weapon_hunting_rifle"	prob = 12,		ammo = 25,	melee_type = "null"	},
	{ent = "weapon_rifle_m60"		prob = 1,		ammo = 40,	melee_type = "null"	},	
	{ent = "prop_physics"			prob = 20,		ammo = null,	melee_type = "null"	},	
]

function GetItemSpawnPoints()
{
	
	local mapSpawnPoint = null;
	while(mapSpawnPoint = Entities.FindByName(mapSpawnPoint, "randomspawner_item_spawn"))
	{
		ItemSpawnPoints.append(mapSpawnPoint.GetOrigin());
		TotalSpawns++
	}
		

	printl("Found " + TotalSpawns + " item spawns");
}


function CalcTotalProbability()
{
	local totalProb = 0;
	foreach(item in ItemSpawnList)
		totalProb += item.prob;
		
	TotalProbability = totalProb;
}

function SpawnItems(amount)
{
	for(local i = 0; i < amount; i++)
	{
		local probCount = RandomInt(1, TotalProbability);
		foreach(item in ItemSpawnList)
		{
			if((probCount -= item.prob) <= 0)
			{
				SpawnSingleItem(item.ent, item.ammo, ItemSpawnPoints[RandomInt(0, TotalSpawns -1)], Vector(0, RandomFloat(0, 360), (RandomInt(0,1) * 180 - 90)));
				break;
			}
		}
	}
}

function SpawnStatic()
{
	local mapSpawnPoint = null;
	while(mapSpawnPoint = Entities.FindByName(mapSpawnPoint, "rifle_cache_spawn"))
	{
		SpawnSingleItem("weapon_rifle", 50, mapSpawnPoint.GetOrigin(), Vector(0, RandomFloat(0, 360), (RandomInt(0,1) * 180 - 90)));
	}

	while(mapSpawnPoint = Entities.FindByName(mapSpawnPoint, "static_spawn"))
	{
		local probCount = RandomInt(1, TotalProbability);
		foreach(item in ItemSpawnList)
		{
			if((probCount -= item.prob) <= 0)
			{
				SpawnSingleItem(item.ent, item.ammo, ItemSpawnPoints[RandomInt(0, TotalSpawns -1)], Vector(0, RandomFloat(0, 360), (RandomInt(0,1) * 180 - 90)));
				break;
			}
		}
	}
}

function SpawnSingleItem(ent, ammo, point, angles)
{	
	if(ent == "prop_physics" ) // Ammo pickup
		entTable <-
		{
			targetname	= "random_spawned_ammo"
			classname	= "prop_physics"
			model		= "models/props_gunnuts/ammo_box.mdl"
			glowstate	= "1"
			glowrange	= "256"
			spawnflags	= "41282"
			origin		= point
			angles		= Vector(0, RandomFloat(0, 360), 0)
			//solid		= "0" 
			vscripts	= "diescraper_ammo_pack"
		}
	else
	{
		entTable <-
		{
			classname	= ent
			ammo		= ammo
			origin		= point
			angles		= angles
			solid		= "6" 
		}
	}
	g_ModeScript.CreateSingleSimpleEntityFromTable(entTable);
	//g_ModeScript.DeepPrintTable(entTable);
}

// Creates and forcefully displays a hint. 
::DisplayInstructorHint <- function(keyvalues, target = null, player = null)
{
	keyvalues.classname <- "env_instructor_hint";
	keyvalues.hint_auto_start <- 0;
	keyvalues.hint_allow_nodraw_target <- 1;

	if(!target)
	{
		if(Entities.FindByName(null, "static_hint_target") == null)
			SpawnEntityFromTable("info_target_instructor_hint", {targetname = "static_hint_target"});
	
		keyvalues.hint_target <- "static_hint_target";
		keyvalues.hint_static <- 1;
		keyvalues.hint_range <- 0;
	}
	else
	{
		keyvalues.hint_target <- target.GetName();
		keyvalues.hint_static <- 0;
	}

	local hint = SpawnEntityFromTable("env_instructor_hint", keyvalues);
	
	if(player)
	{
		DoEntFire("!self", "ShowHint", "", 0, player, hint);
	}
	else
	{
		while(player = Entities.FindByClassname(player, "player"))
		{
			DoEntFire("!self", "ShowHint", "", 0, player, hint);
		}
	}
	if(keyvalues.hint_timeout && keyvalues.hint_timeout != 0)
	{
		DoEntFire("!self", "Kill", "", keyvalues.hint_timeout, null, hint);
	}
	
	return hint;
}

// Start
try
{
	CalcTotalProbability();
	GetItemSpawnPoints();
	SpawnStatic();
	SpawnItems(20);
}
catch(id)
{
	printl("EMS weapon spawning failed, using backup. Issue: " + id);
	spawnFailed = true;
}

if(spawnFailed)
	EntFire ("finale_weapon_relay", "Trigger", 0);
else
{
	EntFire ("finale_weapon_spawn*", "Kill", 0);
	EntFire ("finale_weapons_coop", "Kill", 0);
}
