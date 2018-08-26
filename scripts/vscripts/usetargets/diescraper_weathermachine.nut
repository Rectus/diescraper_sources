// Use script for the holdout weather machine in diescraper.

IncludeScript("usetargets/base_buildable_target")

BuildableType	<- "diescraper_weathermachine"
ResourceCost	<- 2

// button options
BuildTime		<- 2
BuildText		<- "Stop the helipad wind"

if( ResourceCost )
{
	BuildSubText	<- "Cost: " + ResourceCost
}
else
{
	BuildSubText	<- "Cost: FREE"
}