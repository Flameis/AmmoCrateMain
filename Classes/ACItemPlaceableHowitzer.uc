//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableHowitzer extends ACItemPlaceableContent;

defaultproperties
{
	ConfigLoc 			= (X=0, Y=0, Z=0)
	ConfigRot 			= (Pitch=0, Yaw=90, Roll=0)
	Bounds 				= (X=62, Y=15, Z=32)
	DrawSphereRadius 	= 66
	ReferenceStaticMesh = StaticMesh'VH_VN_US_M102Howitzer.Meshes.VH_VN_M102_Howitzer_up'
	DestructibleClass 	= class'ACDestructibleHowitzer'
}
