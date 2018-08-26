Msg("Quieting director\n");


if (Director.GetGameMode() == "coop")
{

	DirectorOptions <-
	{
	  ProhibitBosses = true
	  CommonLimit = 0
	} 
}
else
{
	DirectorOptions <-
	{
	  ProhibitBosses = true
	  MobMaxSize = 5
	} 
}
