//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableBush01 extends ACItemPlaceableContent;

defaultproperties
{
	ConfigLoc 			= (X=0, Y=-55, Z=0)
	ConfigRot 			= (Pitch=0, Yaw=90, Roll=0)
	Bounds 				= (X=62, Y=15, Z=32)
	DrawSphereRadius 	= 66
	ReferenceStaticMesh = StaticMesh'ENV_JungleTree.Mesh.S_ENV_BushV2_01'
	DestructibleClass 	= class'ACDestructibleBush01'
}
