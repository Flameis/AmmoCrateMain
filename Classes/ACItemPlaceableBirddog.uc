//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableBirddog extends ACItemPlaceableContent;

defaultproperties
{
	ConfigLoc 			= (X=0, Y=0, Z=0)
	ConfigRot 			= (Pitch=0, Yaw=180, Roll=0)
	Bounds 				= (X=62, Y=15, Z=32)
	DrawSphereRadius 	= 66
	ReferenceStaticMesh = StaticMesh'VH_VN_US_Recon.Mesh.O-1_USAF'
	DestructibleClass 	= class'ACDestructibleBirddog'
}
