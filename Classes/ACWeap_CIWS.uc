//=============================================================================
// ROWeap_M3A1_SMG
//=============================================================================
// M3A1 "Grease Gun" Sub machine gun
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_CIWS extends ROWeap_M3A1_SMG
	abstract;

defaultproperties
{
	WeaponContentClass(0)="ROGameContent.ACWeap_CIWS_Content"

	PreFireTraceLength=1000 //25 Meters

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponFiring
	WeaponFireTypes(0)=EWFT_Custom
	WeaponProjectiles(0)=class'ACBullet_CIWS'
	FireInterval(0)=+0.013 // 4500 RPM, just like a real CIWS :)
	Spread(0)=0.004 // 15.48 MOA
	WeaponDryFireSnd=AkEvent'WW_WEP_Shared.Play_WEP_Generic_Dry_Fire'

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=none
	//WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=none
	FireInterval(ALTERNATE_FIREMODE)=+0.013
	Spread(ALTERNATE_FIREMODE)=0.01 //19.35 MOA // 15.48 MOA


	AltFireModeType=ROAFT_ExtendStock

	//ShoulderedSpreadMod=3.0//6.0
	//HippedSpreadMod=5.0//10.0

	// AI
	MinBurstAmount=1
	MaxBurstAmount=4500
	//BurstWaitTime=1.0
	//AISpreadScale=20.0

	// Recoil
	maxRecoilPitch=10//90//200
	minRecoilPitch=10//50//110
	maxRecoilYaw=50//130
	minRecoilYaw=-50//-130
	RecoilRate=0.002
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=750
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=500
	RecoilISMinYawLimit=65035
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65035
   	RecoilBlendOutRatio=1
   	//PostureHippedRecoilModifer=2.0
   	//PostureShoulderRecoilModifer=1.75

	// InstantHitDamage(0)=500
	// InstantHitDamage(1)=500
	InstantHitDamage(0)=300
	InstantHitDamage(1)=300

	InstantHitDamageTypes(0)=class'RODmgType_DShKBullet'
	InstantHitDamageTypes(1)=class'RODmgType_DShKBullet'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_ShellEject_USA_M3A1'

	SuppressionPower=20

	// Ammo
	AmmoClass=class'ACAmmo_1143x23_CIWS'
	MaxAmmoCount=1000000
	bUsesMagazines=true
	InitialNumPrimaryMags=4
	bPlusOneLoading=false
	bCanReloadNonEmptyMag=true
	PenetrationDepth=200
	MaxPenetrationTests=3
	MaxNumPenetrations=20
	PerformReloadPct=0.70f
}

