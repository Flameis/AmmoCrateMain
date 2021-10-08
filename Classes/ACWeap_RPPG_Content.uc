//=============================================================================
// ROWeap_PPSH41_SMG_Content
//=============================================================================
// Content for PPSH41 Sub machine gun
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_RPPG_Content extends ACWeap_RPPG;

DefaultProperties
{
	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_VC_ppsh.Mesh.Sov_ppsh_UPGD1'
		PhysicsAsset=PhysicsAsset'WP_VN_VC_ppsh.Phys.Sov_ppsh_UPGD1_Physics'
		AnimSets(0)=AnimSet'WP_VN_VC_ppsh.animation.WP_PpshHands_UPGD1'
		AnimTreeTemplate=AnimTree'WP_VN_VC_ppsh.animation.Sov_PPSH41_Tree'
		Scale=1.0
		FOV=70
	End Object

	ArmsAnimSet=AnimSet'WP_VN_VC_ppsh.animation.WP_PpshHands_UPGD1'

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh_UPGD.PPSH_3rd_Master_UPGD1'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.PPSH_3rd_Master_Physics'
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

	AttachmentClass=class'ROGameContent.ROWeapAttach_PPSH41_SMG'
}
