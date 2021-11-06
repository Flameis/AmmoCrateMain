//=============================================================================
// ACWeap_M18ClaymoreMineContentQuadAllowable
//=============================================================================
// Content for American Claymore Mine
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2016 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// Edited for the 29th by Reimer, Tested and Published by Scovel
//=============================================================================
class ACWeap_M18ClaymoreQuadContent extends ACWeap_M18ClaymoreQuad;


DefaultProperties
{
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_USA_Claymore.Mesh.US_Claymore'
		PhysicsAsset=PhysicsAsset'WP_VN_USA_Claymore.Phys.US_Claymore_Physics'
		AnimSets(0)=AnimSet'WP_VN_USA_Claymore.Animation.WP_Claymorehands'
		AnimTreeTemplate=AnimTree'WP_VN_USA_Claymore.Animation.Claymore_Tree'
		Scale=1.0
		FOV=70
	End Object

	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh.Claymore_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.Claymore_3rd_Master_Physics'
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

	AttachmentClass=class'ROGameContent.ROWeapAttach_M18_Claymore'

	ArmsAnimSet=AnimSet'WP_VN_USA_Claymore.Animation.WP_Claymorehands'
}
