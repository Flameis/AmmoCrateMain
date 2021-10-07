//=============================================================================
// ROWeap_XM21Scoped_Rifle_Level3
//=============================================================================
// Level 3 Content for XM21 Scoped rifle - Suppressor
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_XM21Scoped_Rifle_Suppressed extends ROWeap_XM21Scoped_Rifle_Content;

/** Flag set at the beginning of the Reloading state to determine whether or not the weapon should be considered
 *  'bolted' after completing the reload.
 */
var protected bool bWillPerformBolting;

simulated state Reloading
{
	// @Override to ensure we catch the bolt reset at the beginning of the reload state,
	// so it isn't cleared improperly -Austin
	simulated function BeginState(name PreviousStateName)
	{
		bWillPerformBolting = bNeedsBolting && !HasAnyAmmo();

		super.BeginState(PreviousStateName);
	}

	/**
	 * Cleanup reloading state
	 *
	 * Network: Server only - replicated via ClientReloadComplete()
	 * @Override to check the bWillPerformBolting flag
	 */
	function ReloadComplete()
	{
		if ( CurrentReloadStatus == RORS_Complete )
		{
			// Calculate how many full stripper clips we have left
			CalcNumFullStripperClips(StripperClipBulletCount);
			CalcTotalStoredAmmoCount();
			KillsSinceLastReload = 0;

			ClientReloadComplete(AmmoCount, AmmoStatus());

			if ( !Instigator.IsLocallyControlled() )
			{
				// Clear Reload Status
				CurrentReloadType = RORT_None;
				CurrentReloadStatus = RORS_None;
				ReloadingFromMagIndex = -1;

				// Reset bolt after reload
				if(bWillPerformBolting)
				{
					bNeedsBolting = false;
				}

				GotoActiveState();
			}
		}
	}
}

/**
 * @Override to check the bWillPerformBolting flag
 */
reliable client function ClientReloadComplete(int ServerAmmoCount, float AmmoPercent)
{
	local ROPlayerController ROPC;

	// aladenberger 8/20/2011 - Don't wait around for variable replication to prevent a sync error in Active.BeginFire()
	if ( Role < ROLE_Authority && AmmoCount < ServerAmmoCount )
	{
		AmmoCount = ServerAmmoCount;
		ClientAmmoCount = AmmoCount;
	}

	ROPC = ROPlayerController(Instigator.Controller);

	// Display a status message to the player(Nearly Empty, Half Full, Full, etc)
	if( ROPC != none)
	{
		if( ROPC.MyROHUD != none &&
			ROPC.MyROHUD.AmmoCheckWidget != none &&
			!ROPC.MyROHUD.AmmoCheckWidget.bAmmoStatusUseText )
		{
			if( AmmoPercent > 0.9 )
			{
				ROPC.MyROHUD.AmmoCheckWidget.AddIcon(ROAL_Full);
			}
			else if( AmmoPercent > 0.5 )
			{
				ROPC.MyROHUD.AmmoCheckWidget.AddIcon(ROAL_High);
			}
			else if( AmmoPercent > 0.2 )
			{
				ROPC.MyROHUD.AmmoCheckWidget.AddIcon(ROAL_Low);
			}
			else
			{
				ROPC.MyROHUD.AmmoCheckWidget.AddIcon(ROAL_VeryLow);
			}
		}
		else
		{
			if( AmmoPercent > 0.9 )
			{
				ROPC.ReceiveLocalizedMessage(class'ROLocalMessageGameReload', 3);
			}
			else if( AmmoPercent > 0.5 )
			{
				ROPC.ReceiveLocalizedMessage(class'ROLocalMessageGameReload', 2);
			}
			else if( AmmoPercent > 0.2 )
			{
				ROPC.ReceiveLocalizedMessage(class'ROLocalMessageGameReload', 1);
			}
			else
			{
				ROPC.ReceiveLocalizedMessage(class'ROLocalMessageGameReload', 0);
			}
		}
	}

	// Clear Reload Status
	CurrentReloadType = RORT_None;
	CurrentReloadStatus = RORS_None;
	ReloadingFromMagIndex = -1;

	// @HACK: This function is called for every reload - this runs into trouble when you perform a mag reload
	// without cycling the bolt, a possibility unique to this weapon at the moment. So, determine whether we do
	// this 
	if(bWillPerformBolting)
	{
		// Reset bolt after reload
		bNeedsBolting = false;
	}

	// Clear any dry fires
	NumDryFires=0;

	// Exit the Reloading State if we can
	if( CanGoToActiveStateOnClientReloadComplete() )
	{
	   GotoActiveState();
	}
}

DefaultProperties
{
	InvIndex=`ROII_XM21_Suppressed_SniperRifle

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponSingleFiring
	WeaponFireTypes(0)=EWFT_Custom
	WeaponProjectiles(0)=class'XM21ScopedBullet'
	FireInterval(0)=1.1//+1.5
	DelayedRecoilTime(0)=0.01
	Spread(0)=0.000414 // 1.5 MOA

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=WeaponManualSingleFiring
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'XM21ScopedBullet'
	FireInterval(ALTERNATE_FIREMODE)=1.1//+1.5
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.01
	Spread(ALTERNATE_FIREMODE)=0.000414 // 1.5 MOA

	bHasManualBolting=true
	bAmmoCheckDoesBolting=true
	bHasBayonet=false
	AltFireModeType=ROAFT_None

	PreFireTraceLength=1250 //25 Meters

	// Sionics M14SS-1 extends 9" past the muzzle
	// 55.9 + 11.43
	CollisionCheckLength=67.33

	// 12.5 lbs with Sionics M14SS-1
	Weight=5.7 // kg

	WeaponFireAnim(0)=M14_Hip_Bolt
	WeaponFireAnim(1)=M14_Hip_Bolt
	WeaponFireLastAnim=M14_Shoot_Suppressed
	//Shouldered fire
	WeaponFireShoulderedAnim(0)=M14_Hip_Bolt
	WeaponFireShoulderedAnim(1)=M14_Hip_Bolt
	WeaponFireLastShoulderedAnim=M14_Shoot_Suppressed
	//Fire using iron sights
   	WeaponFireSightedAnim(0)=M14_Iron_Bolt
	WeaponFireSightedAnim(1)=M14_Iron_Bolt
	WeaponFireLastSightedAnim=M14_Iron_Shoot_Suppressed
	//Manual bolting
	WeaponManualBoltAnim=M14_Iron_Manual_Bolt
	WeaponManualBoltRestAnim=M14_Iron_Manual_Bolt

	//Reloading
	WeaponReloadEmptyMagAnim=M14_reloadempty_Suppressed

	// Recoil - a bit more than halved from the full power load (accounting for the suppressor)
	maxRecoilPitch=300//700
	minRecoilPitch=300//180
	maxRecoilYaw=90//120
	minRecoilYaw=-90//-120
	minRecoilYawAbsolute=40
	RecoilRate=0.07
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=2000
	RecoilMinPitchLimit=63535
	RecoilISMaxYawLimit=500
	RecoilISMinYawLimit=65035
	RecoilISMaxPitchLimit=1000
	RecoilISMinPitchLimit=64535
   	//PostureHippedRecoilModifer=1.3
   	//PostureShoulderRecoilModifer=1.2
	RecoilViewRotationScale=0.45

	RecoilOffsetModY = 1000.f
	RecoilOffsetModZ = 1000.f

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		SkeletalMesh=SkeletalMesh'WP_VN_USA_M14.Mesh.US_XM21_Suppressed'
		// SkeletalMesh=SkeletalMesh'WP_VN_USA_M14.Mesh.US_XM21_UPGD2'
	End Object

	// Pickup staticmesh
	Begin Object Name=PickupMesh
		SkeletalMesh=SkeletalMesh'WP_VN_3rd_Master.Mesh_UPGD.XM21_Suppressed_3rd_Master'
		PhysicsAsset=PhysicsAsset'WP_VN_3rd_Master.Phy.XM21_3rd_Physics'
	End Object

	AttachmentClass=class'ROGameContent.ROWeapAttach_XM21Scoped_Rifle_Suppressed'

	// Update shell eject for reduced power round and manual operation
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_ShellEject_USA_XM21_Suppressed'
	bNoShellEjectOnFire=true
	
	// Update muzzle flash for silencer
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_1stP_Rifles_suppressed_XM21'
	MuzzleFlashLightClass=none

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M14.Play_XM21_Sup_Fire_Single_3P', FirstPersonCue=AkEvent'WW_WEP_M14.Play_WEP_XM21_Sup_Fire_Single')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M14.Play_XM21_Sup_Fire_Single_3P', FirstPersonCue=AkEvent'WW_WEP_M14.Play_WEP_XM21_Sup_Fire_Single')

	SuppressionPower=10

	SwayScale=1.2
}
