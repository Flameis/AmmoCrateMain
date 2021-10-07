//=============================================================================
// ROWeap_M3A1_SMG_Content
//=============================================================================
// Content for M3A1 "Greasegun" SMG
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_CIWS_Content extends ACWeap_CIWS;

DefaultProperties
{
	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_USA_M3GreaseGun.Mesh.US_M3_UPGD1'
		PhysicsAsset=PhysicsAsset'WP_VN_USA_M3GreaseGun.Phys.US_M3_UPGD1_Physics'
		AnimSets(0)=AnimSet'WP_VN_USA_M3GreaseGun.Animation.WP_M3hands_UPGD1'
		AnimTreeTemplate=AnimTree'WP_VN_USA_M3GreaseGun.Animation.US_M3_Tree'
		Scale=1.0
		FOV=70
	End Object

	ArmsAnimSet=AnimSet'WP_VN_USA_M3GreaseGun.Animation.WP_M3hands_UPGD1'

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh.M3_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.M3_3rd_Master_Physics'
		AnimTreeTemplate=AnimTree'WP_VN_3rd_Master.AnimTree.M3A1_SMG_3rd_Tree'
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

	AttachmentClass=class'ROGameContent.ROWeapAttach_M3A1_SMG'

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M14.Play_WEP_M14_Fire_Single_3P', FirstPersonCue=AkEvent'WW_WEP_M14.Play_WEP_M14_Fire_Single')
}
