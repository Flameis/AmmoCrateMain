//=============================================================================
// ROWeap_MKb42_AssaultRifle_Level2
//=============================================================================
// Level 2 MKb42 Assault Rifle
//=============================================================================
// Red Orchestra: Heroes Of Stalingrad Source
// Copyright (C) 2007-2011 Tripwire Interactive LLC
// - Dayle "Xienen" Flowers
//=============================================================================

class ROWeap_MKb42_AssaultRifle_Level2 extends ROWeap_MKb42_AssaultRifle_Content;

defaultproperties
{
	AttachmentClass=class'AmmoCrate.ROWeapAttach_MKb42_AssaultRifle_Level2'

	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.Ger_MKB42_H_UPGD2'
	End Object

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.MKB_42_3rd_Master'
	End Object

	// MELEE FIREMODE
	WeaponFireTypes(MELEE_ATTACK_FIREMODE)=EWFT_InstantHit
	InstantHitDamageTypes(MELEE_ATTACK_FIREMODE)=class'RODmgType_MeleePierce'

	// Melee anims
	WeaponMeleeAnims(0)=MKB_42_Stab
	WeaponMeleeHardAnim=MKB_42_StabHard

	// Melee FX
	MeleeAttackHitFleshSound=AkEvent'WW_WEP_Shared.Play_WEP_Melee_Rifle_Impact'

	// Melee Settings
	MeleeAttackRange=70
	MeleeAttackDamage=110
	MeleeAttackChargeDamage=200
	bAllowMeleeToPenetrate=true
}
