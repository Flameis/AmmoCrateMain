//=============================================================================
// ROWeap_M18_SignalSmoke_Purple
//=============================================================================
// Content for American M18 Signal Smoke Grenade - Purple Colour
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M18_SignalSmoke_Green_Content extends ACWeap_M18_SignalSmoke_Green;

defaultproperties
{
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_USA_M8_SmokeGrenade.Mesh.USA_M8_SmokeGrenade'
		Materials(0)=MaterialInstanceConstant'WP_VN_USA_M8_SmokeGrenade.MIC.M18_SmokeViolet_Mat'
		PhysicsAsset=PhysicsAsset'WP_VN_USA_M8_SmokeGrenade.Phys.USA_M8_SmokeGrenade_Physics'
		AnimSets(0)=AnimSet'WP_VN_USA_M8_SmokeGrenade.Animation.WP_M8SmokeHands'
		AnimTreeTemplate=AnimTree'WP_VN_USA_M8_SmokeGrenade.Animation.USA_M8Smoke_Tree'
		Scale=1.0
		FOV=70
	End Object

	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh.M18Smoke_Violet_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Projectile.Phy.M8Smoke_Projectile_3rd_Physics'
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

	AttachmentClass=class'ROGameContent.ROWeapAttach_M18_SignalSmoke_Purple'

	ArmsAnimSet=AnimSet'WP_VN_USA_M8_SmokeGrenade.Animation.WP_M8SmokeHands'
}
