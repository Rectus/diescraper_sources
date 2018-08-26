// Diescraper ammo box script
//
// Author: Rectus
// Copyright 2014
//
// Makes a prop behave like an ammo box that every player can use once to refill their ammo.

REUSE_DELAY <- 2.0;
uses <- 2;

lastUseTime <- {}

/*ammoTable <-
{
	weapon_autoshotgun = {slot = 8, ammo = 90},
	weapon_grenade_launcher = {slot = 17, ammo = 30},
	weapon_hunting_rifle = {slot = 9, ammo = 150},
	weapon_pumpshotgun = {slot = 7, ammo = 56},
	weapon_rifle = {slot = 3, ammo = 360},
	weapon_rifle_ak47 = {slot = 3, ammo = 360},
	weapon_rifle_desert = {slot = 3, ammo = 360},
	weapon_rifle_sg552 = {slot = 3, ammo = 360},
	weapon_shotgun_chrome = {slot = 7, ammo = 56},
	weapon_shotgun_spas = {slot = 8, ammo = 90},
	weapon_smg = {slot = 5, ammo = 650},
	weapon_smg_mp5 = {slot = 5, ammo = 650},
	weapon_smg_silenced = {slot = 5, ammo = 650},
	weapon_sniper_awp = {slot = 10, ammo = 180},
	weapon_sniper_military = {slot = 10, ammo = 180},
	weapon_sniper_scout = {slot = 10, ammo = 180},
}*/


ammoTable <- {}
ammoTable[3] <- 360,
ammoTable[5] <- 650,
ammoTable[7] <- 56,
ammoTable[8] <- 90,
ammoTable[9] <- 150,
ammoTable[10] <- 180
//ammoTable[17] <- 30



function InputUse()
{
	local player = activator;
	local ammoGiven = false
	
	if(player && !IsPlayerABot(player))
	{	
		if((player in lastUseTime) && lastUseTime[player] + REUSE_DELAY > Time())
		{
			return
		}
		
		// Check for refillable custom weapons
		local invTable = {};
		GetInvTable(player, invTable);
		if("slot1" in invTable)
		{
			if(invTable.slot1 && invTable.slot1.GetScriptScope() && ("OnAmmoRefilled" in invTable.slot1.GetScriptScope()))
			{
				if(invTable.slot1.GetScriptScope().OnAmmoRefilled())
					ammoGiven = true
			}
		}	
	
		local weapon = GetPrimaryWeapon(player);

		if(!weapon)
		{
			if(!ammoGiven)
			{
				DisplayInstructorHint(AmmoDeniedHint, self, player);	
				return
			}
		}

		local ammoType = NetProps.GetPropInt(weapon, "m_iPrimaryAmmoType")
		
		if(!(ammoType in ammoTable))
		{
			if(!ammoGiven)
			{
				DisplayInstructorHint(AmmoDeniedHintNotRefillable, self, player);		
				return
			}
		}
		else
		{
			//local ammoInClip = NetProps.GetPropInt(weapon, "m_iClip1")
			local ammoStore = NetProps.GetPropIntArray(player, "m_iAmmo", ammoType)
			local totalAmmo = ammoStore //+ ammoInClip
			
			if(totalAmmo < ammoTable[ammoType])
			{
				player.GiveAmmo(999)
				ammoGiven = true
			}
		}
		

		if(ammoGiven)
		{	
			EmitSoundOnClient("BaseCombatCharacter.AmmoPickup", player)
			GiveBotsAmmo()
			DoEntFire("!self", "SetBodyGroup", "1", 0, null, self)
			if(--uses <= 0)
			{
				// Remove from the spawned item list in holdout mode.
				if(Director.GetGameMode() == "holdout")
					g_ModeScript.SessionState.SpawnedItems.remove(self.GetEntityIndex())
					
				self.Kill()
			}
			DisplayInstructorHint(AmmoSuccessHint, null, player)
			lastUseTime[player] <- Time()
		}
	}
}

function GiveBotsAmmo()
{
	local player = null;
	local weaponName = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
		if(IsPlayerABot(player))
		{
			player.GiveAmmo(999);
		}
	}
}

function GetPrimaryWeapon(player)
{
	local invTable = {};
	GetInvTable(player, invTable);

	if(!("slot0" in invTable))
		return null;
		
	local weapon = invTable.slot0;
	
	if(weapon)
		return weapon;
		
	return null;
}


AmmoSuccessHint <-
{
	hint_name = "gunnuts_ammobox_success"
	hint_caption = "Ammo replenished", 
	hint_timeout = 3, 
	hint_icon_onscreen = "icon_info",
	hint_instance_type = 2,
	hint_color = "255 255 255"
}

AmmoDeniedHint <-
{
	hint_name = "gunnuts_ammobox_denied"
	hint_caption = "You must have a primary weapon to pick up ammo", 
	hint_timeout = 4, 
	hint_icon_onscreen = "icon_no",
	hint_instance_type = 2,
	hint_color = "255 255 255"
}

AmmoDeniedHintNotRefillable <-
{
	hint_name = "gunnuts_ammobox_denied"
	hint_caption = "You can not replenish the ammo of this weapon", 
	hint_timeout = 4, 
	hint_icon_onscreen = "icon_no",
	hint_instance_type = 2,
	hint_color = "255 255 255"
}