//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableTurret extends ACItemPlaceableContent;

defaultproperties
{
	ConfigLoc 			= (X=0, Y=-55, Z=0)
	ConfigRot 			= (Pitch=0, Yaw=90, Roll=0)
	Bounds 				= (X=62, Y=15, Z=32)
	DrawSphereRadius 	= 66
	ReferenceSkeletalMesh = SkeletalMesh'WP_VN_3rd_Master.Mesh.DShK_HMG_3rd_Master'
	DestructibleClass 	= class'ROTurret_DShK_HMG'
}
