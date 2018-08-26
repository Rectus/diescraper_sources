// Commands the activating bot to move of the helipad when triggerd.

HelipadMoveDest <- Vector(692, 4,-119);
IsRunningEMS <- true;


function CommandAvoidHelipad()
{
	if(!IsRunningEMS)
		return;

	local BOT_CMD_ATTACK = 0
	local BOT_CMD_MOVE = 1
	local BOT_CMD_RETREAT = 2
	
	try
	{
		if(IsPlayerABot(activator))
		{
			CommandTable <-
			{
				bot = activator
				cmd = BOT_CMD_MOVE
				pos = HelipadMoveDest
			}	
			
			CommandABot(CommandTable);
		}
	}
	catch(id)
	{
		printl("EMS bot command failed, disabling. Issue: " + id);
		IsRunningEMS <- false;
	}
}