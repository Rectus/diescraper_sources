// Created by Crowbar 0.19.0.0

$modelname "props_diescraper/statue_break_ball.mdl"

$staticprop

$bodygroup "Body"
{
	studio "composite_gib_ball.smd"
}

$cdmaterials "models\props_diescraper\"

$surfaceprop "metalpanel"

$contents "solid"

$sequence "idle" "idle.smd" {
	fps 30
	"act_idle" 1
}

$collisionmodel "collision_ball.smd"
{
	$mass 1500
	$inertia 1
	$damping 0
	$rotdamping 0

}


$keyvalues
{
	prop_data 
	{
		"base" "Stone.Huge"
		"allowstatic" "1"
	}
}
