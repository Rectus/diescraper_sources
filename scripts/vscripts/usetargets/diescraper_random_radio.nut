// Use script for the holdout weather machine in diescraper.

IncludeScript("usetargets/base_buildable_target")

BuildableType	<- "diescraper_random_radio"
ResourceCost	<- 4

// button options
BuildTime		<- 1
BuildText		<- "Spawn more items in random places"

if( ResourceCost )
{
	BuildSubText	<- "Cost: " + ResourceCost
}
else
{
	BuildSubText	<- "Cost: FREE"
}