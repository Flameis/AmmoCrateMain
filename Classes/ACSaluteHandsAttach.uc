//=============================================================================
// ROWeapAttach_MKb42_AssaultRifle
//=============================================================================
// 3rd person Weapon attachment class for the MP40 SMG
//=============================================================================
// Project DVA Source
// Copyright (C) 2008 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ACSaluteHandsAttach extends ROWeaponAttachment;

defaultproperties
{
	TriggerHoldDuration=0.2

	CarrySocketName=WeaponSling
	ThirdPersonHandsAnim=AttentionIdleAnimV2
	IKProfileName=mp40

	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=none
		AnimSets(0)=AnimSet'29thExtras.Anims.Salute'
	End Object
	
	WeaponClass=class'ACSaluteHands'

	// ROPawn weapon specific animations
	CHR_AnimSet=AnimSet'29thExtras.Anims.Salute'

	// Firing animations
	FireAnim=SaluteAnimV2
	FireLastAnim=SaluteAnimV2
	IdleAnim=AttentionIdleAnimV2
	IdleEmptyAnim=AttentionIdleAnimV2
}
