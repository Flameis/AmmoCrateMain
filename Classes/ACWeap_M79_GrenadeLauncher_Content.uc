//=============================================================================
// ROWeap_M79_GrenadeLauncher_Level3
//=============================================================================
// Level 3 Content for M79 Grenade Launcher - Secondary smoke rounds
//=============================================================================
// Rising Storm 2 Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M79_GrenadeLauncher_Content extends ACWeap_M79_GrenadeLauncher;

defaultproperties
{
	//Arms
	ArmsAnimSet=AnimSet'WP_VN_USA_M79.Animation.WP_M79hands'

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_USA_M79.Mesh.US_M79'
		PhysicsAsset=PhysicsAsset'WP_VN_USA_M79.Phys.US_M79_Physics'
		AnimSets(0)=AnimSet'WP_VN_USA_M79.Animation.WP_M79hands'
		AnimTreeTemplate=AnimTree'WP_VN_USA_M79.Animation.US_M79_Tree'
		Scale=1.0
		FOV=70
	End Object

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh.M79_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.M79_3rd_Master_Physics'
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

	FireModeCanUseClientSideHitDetection[ALTERNATE_FIREMODE]=false

	AttachmentClass=class'ROGameContent.ROWeapAttach_M79_GrenadeLauncher'

}
