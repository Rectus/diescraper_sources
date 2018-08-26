$modelname "props_diescraper/statue.mdl"

$staticprop

$bodygroup "Body"
{
	studio "composite.smd"
}

$lod 30
{
	replacemodel "composite.smd" "composite_lod1.smd"
}
$lod 50
{
	replacemodel "composite.smd" "composite_lod2.smd"
}


$cdmaterials "models\props_diescraper\"

$surfaceprop "Metal_Box"

$contents "solid"

$illumposition 0 0 64



$sequence "idle" "idle.smd" {
	fps 30
	"act_idle" 1
}

$collisionmodel "collision.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave

}

$collisiontext
{
	break 
	{
		"model" "props_diescraper/statue_break_base.mdl"
		"dmg.bullets" "0"
		"dmg.club" "0"
		"motiondisabled" "1"
		"debris" "0"
		"fadetime" "0"
		"multiplayer_break" "server"
	}
	break 
	{
		"model" "props_diescraper/statue_break_ball.mdl"
		"dmg.bullets" "0"
		"dmg.club" "0"
		"debris" "0"
		"fadetime" "0"
		"multiplayer_break" "server"
	}
}


$keyvalues
{
	prop_data 
	{
		"base" "Stone.Huge"
		"allowstatic" "1"
		"dmg.bullets" "0"
		"dmg.fire" "0"
		"dmg.club" "1"
		"multiplayer_break" "both"
	}
}
