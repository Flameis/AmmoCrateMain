class ACSaluteHands extends ROWeapon;

defaultproperties
{
	AttachmentClass=class'ACSaluteHandsAttach'

	WeaponClassType=ROWCT_Rifle
	Category=ROIC_Primary
	Weight=1 //KG
	InvIndex=18
	InventoryWeight=1

	ArmsAnimSet=AnimSet'29thExtras.Anims.Salute'
	
	WeaponIdleAnims(0)=AttentionIdleAnimV2
	WeaponFireAnim(0)=SaluteAnimV2

	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=none
		PhysicsAsset=None
		AnimSets(0)=AnimSet'29thExtras.Anims.Salute'
		Animations=AnimTree'WP_Ger_MKB42_H.Animation.Ger_MKB42_Tree'
		Scale=1.0
		FOV=70
	End Object

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
}