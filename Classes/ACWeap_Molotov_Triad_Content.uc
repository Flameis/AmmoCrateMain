//=============================================================================
// ACWeap_MolotovContentQuad
//=============================================================================
// Content for Vietnamese 4 molotov loadout
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2016 Tripwire Interactive LLC
// Edited for the 29th by Reimer, Tested and Published by Scovel
//=============================================================================
class ACWeap_Molotov_Triad_Content extends ACWeap_Molotov_Triad;


DefaultProperties
{
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_VN_VC_Molotov.Mesh.VC_Molotov_Cocktail_EMPTY'
		PhysicsAsset=PhysicsAsset'WP_VN_VC_Molotov.Phy.VC_Molotov_Physics'
		AnimSets(0)=AnimSet'WP_VN_VC_Molotov.Animation.WP_MolotovHands'
		AnimTreeTemplate=AnimTree'WP_VN_VC_Molotov.Animation.VC_Molotov_Tree'
		Scale=1.0
		FOV=70
	End Object

	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master_03.Mesh.Molotov_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master_03.Phy.Molotov_3rd_Physics'
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

	// Rag SkeletalMesh
	Begin Object Class=RORagMesh Name=RagMesh0
		SkeletalMesh=SkeletalMesh'WP_VN_VC_Molotov.Mesh.VC_Molotov_Cocktail_RAG'
		PhysicsAsset=PhysicsAsset'WP_VN_VC_Molotov.Phy.VC_Molotov_RAG_Physics'
		AnimSets.Add(AnimSet'WP_VN_VC_Molotov.Animation.WP_Molotov_Rag')
		DepthPriorityGroup=SDPG_Foreground
		bOnlyOwnerSee=true
	End Object

	MolotovRagMesh=RagMesh0

	AttachmentClass=class'ROGameContent.ROWeapAttach_Molotov'

	ArmsAnimSet=AnimSet'WP_VN_VC_Molotov.Animation.WP_MolotovHands'

	InitialNumPrimaryMags=3// 3
}