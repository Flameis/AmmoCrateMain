//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableTurretM2 extends ACItemPlaceableTurret;

defaultproperties
{
	ConfigLoc 			= (X=0, Y=0, Z=20)
	ConfigRot 			= (Pitch=0, Yaw=0, Roll=0)
	Bounds 				= (X=62, Y=15, Z=32)
	DrawSphereRadius 	= 66
	ReferenceSkeletalMesh = SkeletalMesh'WP_VN_3rd_Master_02.Mesh.M2_HMG_3rd_Master'
	DestructibleClass 	= class'ACTurret_M2_HMG_Destroyable'
}
