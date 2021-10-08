//=============================================================================
// ACWeapAttach_MKb42_AssaultRifle_Level2
//=============================================================================
// 3rd person Weapon attachment class for the MKB42 Assault Rifle
//=============================================================================
// Red Orchestra: Heroes Of Stalingrad Source
// Copyright (C) 2007-2011 Tripwire Interactive LLC
// - Andrew Ladenberger
//=============================================================================

class ACWeapAttach_MKb42_AssaultRifle_Level2 extends ACWeapAttach_MKb42_AssaultRifle;

defaultproperties
{
	// SRS - Changed the weapon class reference since we cannot access a class in the content package
	// WeaponClass=class'ACWeap_MKb42_AssaultRifle_Level2'
	WeaponClass=class'ACWeap_MKb42_AssaultRifle'

	// Weapon SkeletalMesh
	Begin Object Name=SkeletalMeshComponent0
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.Ger_MKB42_H_UPGD2'
	End Object
}
