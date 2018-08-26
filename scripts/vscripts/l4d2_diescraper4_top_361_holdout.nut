// Diescraper map 4 holdout config

local DEBUG = true;

IncludeScript("sm_resources", g_MapScript)
IncludeScript("tank_spawn_manager", g_MapScript)
IncludeScript("diescraper_random_item_spawner", g_ModeScript)

MapSpawns <-
[
	[ "PlaceableResource"],
	[ "WallBarricade"],
	[ "DefibCabinet"],
	[ "FootlockerThrowables"],
	[ "HealthCabinet"],
	[ "MedCabinet"],
	[ "Tier1WeaponCabinet"],
	[ "TankManhole"],
	[ "CooldownExtensionButton"],
	[ "RescueHelicopter"],
	[ "DiescraperWeathermachine"],
	[ "DiescraperRandomRadio"]
]

// configure our HUD and a few config elements
MapState <-
{
	InitialResources = 2
	HUDWaveInfo = true
	HUDRescueTimer = false
	HUDTickerText = "Objective: Hold out for 10 waves and then get to the chopper!"
	StartActive = true
	
	ForcedEscapeStage = 28

	CooldownEndWarningChance = 100 // crank up the chance of playing the end of wave warning
	
	NumSpawnsAtOnce = 15
	SpawnedItems = [] // Items that will be removed when new ones spawn
	RemoveRandomItemsNext = true
}

MapOptions <-
{
	SpawnSetRule = SPAWN_FINALE
	ShouldIgnoreClearStateForSpawn = false
	PreferredMobDirection = SPAWN_LARGE_VOLUME
	PreferredSpecialDirection = SPAWN_LARGE_VOLUME
	ShouldConstrainLargeVolumeSpawn = false
	EnforceFinaleNavSpawnRules = false
}

SanitizeTable <-
[	
	{ classname		= "prop_door_rotating", input = "kill" },
	{ classname		= "weapon_*", input = "kill" },
	{ classname		= "trigger_finale", input = "kill" },
	{ classname		= "prop_ragdoll", input = "kill" },
	{ model			= "models/props_junk/gascan001a.mdl" input = "kill" },
	{ targetname	= "radioroom_guncabinet", input = "kill" },
	{ targetname	= "radioroom_guncabinet_phys", input = "kill" },
	{ targetname	= "outro", input = "kill" },
	{ model			= "models/props/cs_office/chair_office.mdl" input = "kill" },
	{ model			= "models/props_plants/plantairport01.mdl" input = "kill" },
	{ model			= "models/props_plants/plantairport01_dead.mdl" input = "kill" },
	{ classname		= "logic_relay", input = "kill"},
	{ classname		= "prop_dynamic", input = "kill"},
]

RandomItemSpawnList <-
[
	//Entity:						Probability:	Ammo:			Melee type:
	{ent = "weapon_rifle"			prob = 10,		ammo = 50,	melee_type = null	},
	{ent = "weapon_shotgun_spas"	prob = 10,		ammo = 10,	melee_type = null	},
	{ent = "weapon_sniper_military"	prob = 10,		ammo = 15,	melee_type = null	},
	{ent = "weapon_rifle_ak47"		prob = 10,		ammo = 40,	melee_type = null	},
	{ent = "weapon_autoshotgun"		prob = 10,		ammo = 10,	melee_type = null	},
	{ent = "weapon_rifle_desert"	prob = 10,		ammo = 60,	melee_type = null	},
	{ent = "weapon_hunting_rifle"	prob = 10,		ammo = 15,	melee_type = null	},
	
	{ent = "weapon_rifle_m60"		prob = 5,		ammo = null,	melee_type = null	},
	{ent = "weapon_grenade_launcher"	prob = 5,		ammo = 5,	melee_type = null	},
	
	// Needed to be able to pick up ammo for tier 1 guns.
	{ent = "weapon_smg_silenced"	prob = 0,		ammo = 50,	melee_type = null	},
	{ent = "weapon_smg"				prob = 0,		ammo = 50,	melee_type = null	},
	{ent = "weapon_shotgun_chrome"	prob = 0,		ammo = 10,	melee_type = null	},
	{ent = "weapon_pumpshotgun"		prob = 0,		ammo = 10,	melee_type = null	},
	
	{ent = "weapon_pistol_magnum"	prob = 5,		ammo = null,	melee_type = null	},

	
	{ent = "weapon_adrenaline" 		prob = 7,		ammo = null,	melee_type = null	},
	{ent = "weapon_melee_spawn"		prob = 10,		ammo = null,	melee_type = "any"	},	
	{ent = "weapon_pain_pills" 		prob = 7,		ammo = null,	melee_type = null	},
	{ent = "weapon_vomitjar" 		prob = 5,		ammo = null,	melee_type = null	},
	{ent = "weapon_molotov" 		prob = 7,		ammo = null,	melee_type = null	},
	{ent = "weapon_pipe_bomb" 		prob = 7,		ammo = null,	melee_type = null	},
	{ent = "weapon_first_aid_kit" 	prob = 5,		ammo = null,	melee_type = null	},
	{ent = "upgrade_spawn" 			prob = 3,		ammo = null,	melee_type = null	},
	{ent = "weapon_upgradepack_explosive" 		prob = 3,		ammo = null,	melee_type = null	},
	{ent = "weapon_upgradepack_incendiary" 		prob = 3,		ammo = null,	melee_type = null	},
	
	{ent = "custom_ammo_pack" 		prob = 160,		ammo = 2,	melee_type = null	},

]

InstructorHintTable <-
[
	{ targetname = "tier_1_script_hint", mdl = "models/props_unique/guncabinet_door.mdl", targetEntName = "gun_cabinet_door", hintText = "Tier 1 Guns" }
	{ targetname = "tier_2_script_hint", mdl = "models/props_placeable/tier2_guns_trophy.mdl", targetEntName = "random_radio_prop1", hintText = "Guns and items randomly spawn each wave" }
	{ targetname = "ammobox_hint", mdl = "models/props/gunhunt/pickup_ammobox.mdl", targetEntName = "_33_random_spawned_ammo", hintText = "Ammoboxes are only usable once" }
	{ targetname = "first_aid_script_hint", mdl = "models/props_buildables/small_cabinet_firstaid.mdl", targetEntName = "health_cabinet", hintText = "First Aid Kits" }
]

//=========================================================
//function StartDelayStage( stageData )
//=========================================================
function DelayCB( stageData )
{
	// check to see if tanks should spawn
	g_RoundState.TankManager.ManholeTankSpawnCheck()
}

function FirstWaveCB( stageData )
{
	//Ticker_SetBlink( true )
	//Ticker_NewStr( "Here they come! Survive 10 waves!", 10 )
}

function EscapeWaveCB( stageData ) 
{
	g_RoundState.g_RescueManager.EnableRescue()

	//call the rescue chopper!
	g_RoundState.g_RescueManager.SummonRescueChopperCheck()	
}


// delay time constants to make stage definition easier
DelayTime <- 30	
DelayTimeShort <- 25
DelayTimeMedium <- 30
DelayTimeLong <- 35

stageDefaults <-
{ name = "default", 
	type = STAGE_PANIC, 
	value = 1,
	params = { PanicWavePauseMax = 1, BileMobSize = 20, TankLimit = 1, SpawnDirectionCount = 0, SpawnDirectionMask = 0, AddToSpawnTimer = 6 },
	callback = null, 
	trigger = null, 
	NextDelay = DelayTime 
} 

stage1 <-
{ name = "wave 1", 
	params = { PanicWavePauseMax = 5, DefaultLimit = 1, MaxSpecials = 2, SpitterLimit = 0, ChargerLimit = 0, BoomerLimit = 0, CommonLimit = 30, SpawnDirectionMask = 0}, 
	NextDelay = DelayTimeShort, 
	callback = FirstWaveCB 
}

stage2 <-
{ name = "wave 2", 
	params = { DefaultLimit = 1, MaxSpecials = 3, HunterLimit = 2, BoomerLimit = 0, SpitterLimit = 0, CommonLimit = 30, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
}

stage3 <-
{ name = "wave 3", 
	params = { DefaultLimit = 1, MaxSpecials = 4, JockeyLimit = 2, BoomerLimit = 0, SmokerLimit = 2, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
}

stage4 <-
{ name = "wave 4", 
	params = { DefaultLimit = 1, MaxSpecials = 6, HunterLimit = 2, SmokerLimit = 2, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
} 

stage5 <-
{ name = "wave 5", 
	params = { DefaultLimit = 1, MaxSpecials = 4, SpitterLimit = 0, BoomerLimit = 0, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeLong 
}

stage6 <-
{ name = "wave 6", 
	params = { DefaultLimit = 2, MaxSpecials = 6, SmokerLimit = 3, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
}

stage7 <-
{ name = "wave 7", 
	params = { DefaultLimit = 1, MaxSpecials = 8, BoomerLimit = 2, SpitterLimit = 6, CommonLimit = 40, SpawnDirectionMask = 0 },  
	NextDelay = DelayTimeShort 
}

stage8 <-
{ name = "wave 8", 
	params = { DefaultLimit = 2, MaxSpecials = 10, HunterLimit = 4, JockeyLimit = 4, SmokerLimit = 5, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
}

stage9 <-
{ name = "wave 9", 
	params = { DefaultLimit = 4, MaxSpecials = 10, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	NextDelay = DelayTimeMedium 
}

stage10 <-
{ name = "wave 10", 
	params = { DefaultLimit = 4, MaxSpecials = 10, CommonLimit = 40, SpawnDirectionMask = 0 }, 
	callback = EscapeWaveCB, 
	NextDelay = DelayTimeShort 
}


stageEscape <-
{ name = "escapeWave", 
	type = STAGE_ESCAPE, 
	value = 3,
	params = { DefaultLimit = 4, MaxSpecials = 6, CommonLimit = 40 },
	callback = EscapeWaveCB 
}

stageDelay <-
{ name = "delay",
	params = { DefaultLimit = 0, MaxSpecials = 0, BileMobSize = 0 }
	callback = DelayCB, 
	type = STAGE_DELAY, 
	value = 60    // the 60 will get rewritten per stage from NextDelayVal
}	

	
//=========================================================
// If a melee weapon hits a breakable door (barricades are 
// doors) then increase the damage so it breaks more quickly
//=========================================================
function AllowTakeDamage( damageTable )
{
	if ( damageTable.Victim.GetClassname() == "prop_door_rotating" )
	{
		if ( damageTable.Weapon != null )
		{
			if ( damageTable.Weapon.GetClassname() == "weapon_melee" )
			{
				ScriptedDamageInfo.DamageDone = 100.0
				return true
			}
		}
	}
	
	return true
}

//=========================================================
// Called by the start box code when any survivor leaves the
// start box. If a survivor leaves the start box, we take
// that to mean that they're ready, so we start the action
//=========================================================
function SurvivorLeftStartBox()
{
	EndTrainingHints(30);
	//Director.ForceNextStage();
	EntFire("director", "ScriptedPanicEvent", 0);
}

//=========================================================
//=========================================================
function DoMapSetup()
{
	Ticker_SetTimeout(0); // keeps start ticker text on screen
	
	g_RoundState.TankManager.ManholeTankSetup(2)
	
	EntFire("coop_block1_template", "ForceSpawn");
	EntFire("coop_block2_template", "ForceSpawn");
	InitializeRandomItemSpawns(RandomItemSpawnList, (RANDOMSPAWN_USEPARTICLES | RANDOMSPAWN_ALLOWMULTIPLEITEMS));
	CreateTrainingHints(InstructorHintTable);
}

//=========================================================
// Activate and Shutdown code
//=========================================================
function Precache()
{
	Startbox_Precache()
}

function OnActivate()
{
	EntFire("ammo_box_coop_template", "ForceSpawn", 0);
	//teleport players to the start point
	if (!TeleportPlayersToStartPoints( "playerstart*" ) )
		printl(" ** TeleportPlayersToStartPoints: Spawn point count or player count incorrect! Verify that there are 4 of each.")

	if ( !SpawnStartBox( "startbox_origin", true, 1200, 1100 ) )
	{
		printl("Warning: No startbox_origin in map.\n  Place a startbox_origin entity in order to spawn a game start region.\n")
		// should auto-start now... do we need to forcenextstage?
	}	

	EntFire("survival_block_template", "ForceSpawn");
	
	g_ResourceManager.AddResources( SessionState.InitialResources )
}

function OnShutdown()
{
	ClearStartBox()
}

//=========================================================
//=========================================================
function GetAttackStage() 
{
	RefreshRandomItems();
	
	local stage_name = "stage" + SessionState.ScriptedStageWave
	return this[stage_name]
	
	
	
}

//=========================================================
//=========================================================
function GetMapEscapeStage()
{
	RefreshRandomItems();
	
	Ticker_SetBlink( true )
	Ticker_NewStr("Here comes the Rescue Chopper!")
	return stageEscape
}

//=========================================================
//=========================================================
function GetMapClearoutStage()
{
	DirectorOptions.ScriptedStageType = STAGE_CLEAROUT
	DirectorOptions.ScriptedStageValue = 5
	return null
}


//=========================================================
//=========================================================
function GetMapDelayStage()
{
	switch( SessionState.ScriptedStageWave )
	{
		case 1:
			Ticker_NewStr( "Now would be a good time to heal, barricade, explore and spend supplies", 20 )
			break
		
		case 9:
			Ticker_SetBlink( true )
			Ticker_NewStr( "The rescue chopper will pick you up very soon!", 20)
			break

		default:
			break
	}
	
	

	if( "NextDelayTime" in SessionState )
		stageDelay.value = SessionState.NextDelayTime
	else
		stageDelay.value = DelayTimeMedium
	return stageDelay
}

function DoMapEventCheck()
{
	g_RoundState.TankManager.ManholeTankReleaseCheck()
}

function RefreshRandomItems()
{
	if(SessionState.RemoveRandomItemsNext)
		DeleteOldItems();
	else
		SessionState.RemoveRandomItemsNext <- true;
	SessionState.SpawnedItems.extend(g_ModeScript.SpawnRandomItems(SessionState.NumSpawnsAtOnce));
	
	Ticker_SetBlink(true);
	Ticker_NewStr("New items have spawned", 10);
}

function DeleteOldItems()
{
	local count = 0;
	foreach(item in SessionState.SpawnedItems)
	{
		if(item)
		{
			CreateParticleSystemAt(item, Vector(0,0,0), "small_smoke");
			DoEntFire("!self", "Kill", "", 0, item, item);
			count++;
		}
	}
	SessionState.SpawnedItems.clear();
	if(DEBUG)
		printl("Removed " + count + " old items.");
}

function OnGameEvent_player_use(params)
{
	if(("targetid" in params))
	{
		if((item <- EntIndexToHScript(params.targetid))
			&& ( idx <- SessionState.SpawnedItems.find(item)) != null)
		{
			if(item.GetName().find("random_spawned_ammo"))
				return;
		
			SessionState.SpawnedItems.remove(idx);
			if(DEBUG)
				printl("Picked up " + item);
		}
	}
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


// Prints out useful information when you say debug_print
function InterceptChat(str, SrcEnt)
{
	if(DEBUG && (str.find("debug_print") != null))
	{
		printl("DirectorOptions:");
		DeepPrintTable(DirectorOptions);
		printl("SessionOptions:");
		DeepPrintTable(SessionOptions);
		printl("SessionState:");
		DeepPrintTable(SessionState);
		printl("ItemSpawnList:");
		DeepPrintTable(ItemSpawnList);
		printl("SpawnedItems:");
		DeepPrintTable(SessionState.SpawnedItems);
	}
}