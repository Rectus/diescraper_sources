// Created by Crowbar 0.19.0.0

$modelname "props_diescraper/statue_break_base.mdl"

$staticprop

$bodygroup "Body"
{
	studio "composite_gib_base.smd"
}

$cdmaterials "models\props_diescraper\"

$surfaceprop "metal"

$contents "solid"

$sequence "idle" "idle.smd" {
	fps 30
	"act_idle" 1
}

$collisionmodel "collision_base.smd"
{
	$mass 800
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}


$keyvalues
{
	prop_data 
	{
		"base" "Stone.Large"
	}
}
