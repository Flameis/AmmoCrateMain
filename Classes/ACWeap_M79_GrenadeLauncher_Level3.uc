//=============================================================================
// ROWeap_M79_GrenadeLauncher_Level3
//=============================================================================
// Level 3 Content for M79 Grenade Launcher - Secondary smoke rounds
//=============================================================================
// Rising Storm 2 Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M79_GrenadeLauncher_Level3 extends ACWeap_M79_GrenadeLauncher_Content;

simulated function SetDefaultAmmoLoadout()
{
	InitAltStates();

	if( WorldInfo.NetMode == NM_DedicatedServer )
		ClientSetDefaultAmmoLoadout();
}

reliable client function ClientSetDefaultAmmoLoadout()
{
	InitAltStates();
}

simulated function TimeWeaponEquipping()
{
	local ROPlayerController ROPC;

	super.TimeWeaponEquipping();

	ROPC = ROPlayerController(Instigator.Controller);

	if( ROPC != none )
	{
		ROPC.TriggerHint(ROHTrig_M79ShellTypes);
	}
}

// Set a fuse length on the smoke grenade
/*simulated function Projectile ProjectileFire()
{
	local Projectile P;

	P = super.ProjectileFire();

	if( M79SmokeProjectile(P) != none )
		`log ("[MutExtras Debug]Fuse"@M79SmokeProjectile(P).FuseLength);

	return P;
}*/

// Switch between visible buckshot/grenades
simulated function SwitchVisibleAmmo()
{
	if(IsInState('SwitchingAmmo'))
	{
		if(bUsingAltAmmo)
		{
			ShowHighExplosive();
		}
		else
		{
			ShowSmoke();
		}
	}
	else
	{
		if(bUsingAltAmmo)
		{
			ShowSmoke();
		}
		else
		{
			ShowHighExplosive();
		}
	}
}

defaultproperties
{
	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Projectile
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'M79SmokeGrenadeProjectile'
	FireInterval(ALTERNATE_FIREMODE)=0.15
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.0
	Spread(ALTERNATE_FIREMODE)=0.01 // 36 MOA

	InstantHitDamage(ALTERNATE_FIREMODE)=85
	InstantHitDamageTypes(ALTERNATE_FIREMODE)=class'RODmgType_M79Smoke'

	InitialNumPrimaryMags=9
	MaxNumPrimaryMags=9

	PrimaryAmmoClass=class'ROAmmo_40x46_M79Grenade'
	SecondaryAmmoClass=class'ROAmmo_40x46_M79Smoke'
	InitialNumSecondaryMags=4
	MaxNumSecondaryMags=4

	PrimaryAmmoIndex=0
	SecondaryAmmoIndex=3

	PerformAmmoSwitchPct=0.88f

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		//Materials(0)=
	End Object

	SecondarySuppressionPower=10.0

	SecondarySightRanges[0]=(SightRange=50,SightPitch=0,SightSlideOffset=0.0,SightPositionOffset=-0.0)
	SecondarySightRanges[1]=(SightRange=75,SightPitch=-16384,SightSlideOffset=0.28,SightPositionOffset=-1.35)
	SecondarySightRanges[2]=(SightRange=100,SightPitch=-16384,SightSlideOffset=0.48,SightPositionOffset=-1.9)
	SecondarySightRanges[3]=(SightRange=125,SightPitch=-16384,SightSlideOffset=0.62,SightPositionOffset=-2.25)
	SecondarySightRanges[4]=(SightRange=150,SightPitch=-16384,SightSlideOffset=0.93,SightPositionOffset=-3.05)
	SecondarySightRanges[5]=(SightRange=175,SightPitch=-16384,SightSlideOffset=1.16,SightPositionOffset=-3.65)
	SecondarySightRanges[6]=(SightRange=200,SightPitch=-16384,SightSlideOffset=1.42,SightPositionOffset=-4.3)
	SecondarySightRanges[7]=(SightRange=225,SightPitch=-16384,SightSlideOffset=1.62,SightPositionOffset=-4.8)
	SecondarySightRanges[8]=(SightRange=250,SightPitch=-16384,SightSlideOffset=1.95,SightPositionOffset=-5.7)
	SecondarySightRanges[9]=(SightRange=275,SightPitch=-16384,SightSlideOffset=2.28,SightPositionOffset=-6.5)
	SecondarySightRanges[10]=(SightRange=300,SightPitch=-16384,SightSlideOffset=2.50,SightPositionOffset=-7.1)
	// Do we really want to go below here?
	SecondarySightRanges[11]=(SightRange=350,SightPitch=-16384,SightSlideOffset=3.25,SightPositionOffset=-9.0)
	SecondarySightRanges[12]=(SightRange=375,SightPitch=-16384,SightSlideOffset=3.57,SightPositionOffset=-9.8)

	FireModeCanUseClientSideHitDetection[ALTERNATE_FIREMODE]=false

	AltFireModeType=ROAFT_SwitchAmmo
}
