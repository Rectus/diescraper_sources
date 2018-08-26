
function DisplayHintAll()
{
	local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
		DoEntFire("!self", "ShowHint", "", 0, player, self);
	}
}

function DisplayHintSurvivors()
{
	local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
		if(player.IsSurvivor())
			DoEntFire("!self", "ShowHint", "", 0, player, self);
	}
}

function DisplayHintInfected()
{
	local player = null;
	while(player = Entities.FindByClassname(player, "player"))
	{
		if(!player.IsSurvivor())
			DoEntFire("!self", "ShowHint", "", 0, player, self);
	}
}