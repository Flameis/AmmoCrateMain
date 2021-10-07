//=============================================================================
// ROWeapAttach_MKb42_AssaultRifle
//=============================================================================
// 3rd person Weapon attachment class for the MP40 SMG
//=============================================================================
// Project DVA Source
// Copyright (C) 2008 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================
class ROWeapAttach_MKb42_AssaultRifle extends ROWeaponAttachment;

defaultproperties
{
	TriggerHoldDuration=0.2

	CarrySocketName=WeaponSling
	ThirdPersonHandsAnim=MKB42_Handpose
	IKProfileName=mp40

	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.MKB_42_3rd_Master'
		AnimSets(0)=AnimSet'WP_Ger_MKB42_H.Anim.MKB_42_3rd_anim'
		CullDistance=5000
	End Object

	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_3rdP_Rifles_round'
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'
	
	WeaponClass=class'ROWeap_MKb42_AssaultRifle'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_ShellEject_VC_AK47'

	// ROPawn weapon specific animations
	CHR_AnimSet=AnimSet'WP_Ger_MKB42_H.Anim.CHR_MKB42'

	// Firing animations
	FireAnim=Shoot
	FireLastAnim=Shoot_Last
	IdleAnim=Idle
	IdleEmptyAnim=Idle_Empty
}
