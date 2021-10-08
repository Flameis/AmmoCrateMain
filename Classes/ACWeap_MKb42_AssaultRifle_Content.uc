//=============================================================================
// ACWeap_MKb42_AssaultRifle_Content
//=============================================================================
// Content for MKb42 Assault Rifle
//=============================================================================
// Project DVA Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - Sakib Saikia
//=============================================================================
class ACWeap_MKb42_AssaultRifle_Content extends ACWeap_MKb42_AssaultRifle;

DefaultProperties
{
	ArmsAnimSet=AnimSet'WP_Ger_MKB42_H.Animation.WP_MKB42Hands'

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.Ger_MKB42_H'
		PhysicsAsset=None
		AnimSets(0)=AnimSet'WP_Ger_MKB42_H.Animation.WP_MKB42Hands'
		Animations=AnimTree'WP_Ger_MKB42_H.Animation.Ger_MKB42_Tree'
		Scale=1.0
		FOV=70
	End Object

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.MKB_42_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_Ger_MKB42_H.Phy.MKB_42_3rd_Master_Physics'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true//false
		BlockRigidBody=true
		bHasPhysicsAssetInstance=false
		bUpdateKinematicBonesFromAnimation=false
		PhysicsWeight=1.0
		RBChannel=RBCC_GameplayPhysics
		RBCollideWithChannels=(Default=TRUE,GameplayPhysics=TRUE,EffectPhysics=TRUE)
		bSkipAllUpdateWhenPhysicsAsleep=TRUE
		bSyncActorLocationToRootRigidBody=true
	End Object

	AttachmentClass=class'AmmoCrate.ACWeapAttach_MKb42_AssaultRifle'
}
