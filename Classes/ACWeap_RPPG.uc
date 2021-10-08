//=============================================================================
// ROWeap_PPSH41_SMG
//=============================================================================
// PPSH41 Sub machine gun
//=============================================================================
// Rising Storm 2 Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_RPPG extends ROProjectileWeapon
	abstract;

// @TEMP - triple spread for most handheld weapons
simulated function float GetSpreadMod()
{
	return 4 * super.GetSpreadMod();
}

defaultproperties
{
	WeaponContentClass(0)="ACWeap_RPPG_Content"

	AmmoContentClassStart=1
	// class below here are available only through selecting alternative ammo loadouts
	WeaponContentClass(1)="ROGameContent.ROWeap_PPSH41_SMG_Drum"

	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_PPSH41_SMG_Stick'
	RoleSelectionImage(1)=Texture2D'VN_UI_Textures.WeaponTex.VN_Weap_PPSH41_SMG_Drum'

	FireModeCanUseClientSideHitDetection[0]=false
	FireModeCanUseClientSideHitDetection[1]=false

	WeaponClassType=ROWCT_SMG
	TeamIndex=`AXIS_TEAM_INDEX

	Category=ROIC_Primary
	Weight=3.63 //KG
	InvIndex=`ROII_PPSH41_SMG
	InventoryWeight=2

	PlayerIronSightFOV=55

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponFiring
	WeaponFireTypes(0)=EWFT_Custom
	WeaponProjectiles(0)=class'ACBullet_RPPG'
	FireInterval(0)=+0.066
	DelayedRecoilTime(0)=0.0
	Spread(0)=0.0022 // 8 MOA
	WeaponDryFireSnd=AkEvent'WW_WEP_Shared.Play_WEP_Generic_Dry_Fire'

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'ACBullet_RPPG'
	bLoopHighROFSounds(ALTERNATE_FIREMODE)=false
	FireInterval(ALTERNATE_FIREMODE)=+0.066
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.01
	Spread(ALTERNATE_FIREMODE)=0.0022 // 8 MOA

	PreFireTraceLength=0 //25 Meters

	//ShoulderedSpreadMod=3.0//6.0
	//HippedSpreadMod=5.0//10.0

	// AI
	MinBurstAmount=1
	MaxBurstAmount=15
	//BurstWaitTime=1.0
	//AILongDistanceScale=1.25
	//AIMediumDistanceScale=1.15
	//AISpreadScale=20.0

	// Recoil
	maxRecoilPitch=190//170
	minRecoilPitch=190//170//140
	maxRecoilYaw=1
	minRecoilYaw=-1
	RecoilRate=0.01//0.06
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=750
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=600//500
	RecoilISMinYawLimit=65035
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65035
   	RecoilBlendOutRatio=1
   	//PostureHippedRecoilModifer=1.0
   	//PostureShoulderRecoilModifer=1.0

   	minRecoilYawAbsolute=1

	// InstantHitDamage(0)=1000
	// InstantHitDamage(1)=1000
   	InstantHitDamage(0)=1000
	InstantHitDamage(1)=1000

	InstantHitDamageTypes(0)=class'RODmgType_PPSH41Bullet'
	InstantHitDamageTypes(1)=class'RODmgType_PPSH41Bullet'

	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_1stP_SMG'
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_ShellEject_VC_PPSH'

	bHasIronSights=true;

	//Equip and putdown
	WeaponPutDownAnim=PPSH_putaway
	WeaponEquipAnim=PPSH_pullout
	WeaponDownAnim=PPSH_Down
	WeaponUpAnim=PPSH_Up

	// Fire Anims
	//Hip fire
	WeaponFireAnim(0)=PPSH_Hip_Shoot1
	WeaponFireAnim(1)=PPSH_Hip_Shoot2
	WeaponFireLastAnim=PPSH_shootLAST
	//Shouldered fire
	WeaponFireShoulderedAnim(0)=PPSH_Hip_Shoot1
	WeaponFireShoulderedAnim(1)=PPSH_Hip_Shoot2
	WeaponFireLastShoulderedAnim=PPSH_shootLAST
	//Fire using iron sights
	WeaponFireSightedAnim(0)=PPSH_iron_shoot
	WeaponFireSightedAnim(1)=PPSH_iron_shoot
	WeaponFireLastSightedAnim=PPSH_iron_shootLAST

	// Idle Anims
	//Hip Idle
	WeaponIdleAnims(0)=PPSH_shoulder_idle
	WeaponIdleAnims(1)=PPSH_shoulder_idle
	// Shouldered idle
	WeaponIdleShoulderedAnims(0)=PPSH_shoulder_idle
	WeaponIdleShoulderedAnims(1)=PPSH_shoulder_idle
	//Sighted Idle
	WeaponIdleSightedAnims(0)=PPSH_iron_idle
	WeaponIdleSightedAnims(1)=PPSH_iron_idle

	// Prone Crawl
	WeaponCrawlingAnims(0)=PPSH_CrawlF
	WeaponCrawlStartAnim=PPSH_Crawl_into
	WeaponCrawlEndAnim=PPSH_Crawl_out

	//Reloading
	WeaponReloadEmptyMagAnim=PPSH_reloadempty
	WeaponReloadNonEmptyMagAnim=PPSH_reloadhalf
	WeaponRestReloadEmptyMagAnim=PPSH_reloadempty_rest
	WeaponRestReloadNonEmptyMagAnim=PPSH_reloadhalf_rest
	// Ammo check
	WeaponAmmoCheckAnim=PPSH_ammocheck
	WeaponRestAmmoCheckAnim=PPSH_ammocheck_rest

	// Sprinting
	WeaponSprintStartAnim=PPSH_sprint_into
	WeaponSprintLoopAnim=PPSH_Sprint
	WeaponSprintEndAnim=PPSH_sprint_out
	Weapon1HSprintStartAnim=PPSH_ger_sprint_into
	Weapon1HSprintLoopAnim=PPSH_ger_Sprint
	Weapon1HSprintEndAnim=PPSH_ger_sprint_out

	// Mantling
	WeaponMantleOverAnim=PPSH_Mantle
 	WeaponSwitchToAltFireModeAnim=PPSH_AutoTOsemi
  	WeaponSwitchToDefaultFireModeAnim=PPSH_SemiTOauto

	// Cover/Blind Fire Anims
	WeaponRestAnim=PPSH_rest_idle
	WeaponEquipRestAnim=PPSH_pullout_rest
	WeaponPutDownRestAnim=PPSH_putaway_rest
	WeaponBlindFireRightAnim=PPSH_BF_Right_Shoot
	WeaponBlindFireLeftAnim=PPSH_BF_Left_Shoot
	WeaponBlindFireUpAnim=PPSH_BF_up_Shoot
	WeaponIdleToRestAnim=PPSH_idleTOrest
	WeaponRestToIdleAnim=PPSH_restTOidle
	WeaponRestToBlindFireRightAnim=PPSH_restTOBF_Right
	WeaponRestToBlindFireLeftAnim=PPSH_restTOBF_Left
	WeaponRestToBlindFireUpAnim=PPSH_restTOBF_up
	WeaponBlindFireRightToRestAnim=PPSH_BF_Right_TOrest
	WeaponBlindFireLeftToRestAnim=PPSH_BF_Left_TOrest
	WeaponBlindFireUpToRestAnim=PPSH_BF_up_TOrest
	WeaponBFLeftToUpTransAnim=PPSH_BFleft_toBFup
	WeaponBFRightToUpTransAnim=PPSH_BFright_toBFup
	WeaponBFUpToLeftTransAnim=PPSH_BFup_toBFleft
	WeaponBFUpToRightTransAnim=PPSH_BFup_toBFright
	// Blind Fire ready
	WeaponBF_Rest2LeftReady=PPSH_restTO_L_ready
	WeaponBF_LeftReady2LeftFire=PPSH_L_readyTOBF_L
	WeaponBF_LeftFire2LeftReady=PPSH_BF_LTO_L_ready
	WeaponBF_LeftReady2Rest=PPSH_L_readyTOrest
	WeaponBF_Rest2RightReady=PPSH_restTO_R_ready
	WeaponBF_RightReady2RightFire=PPSH_R_readyTOBF_R
	WeaponBF_RightFire2RightReady=PPSH_BF_RTO_R_ready
	WeaponBF_RightReady2Rest=PPSH_R_readyTOrest
	WeaponBF_Rest2UpReady=PPSH_restTO_Up_ready
	WeaponBF_UpReady2UpFire=PPSH_Up_readyTOBF_Up
	WeaponBF_UpFire2UpReady=PPSH_BF_UpTO_Up_ready
	WeaponBF_UpReady2Rest=PPSH_Up_readyTOrest
	WeaponBF_LeftReady2Up=PPSH_L_ready_toUp_ready
	WeaponBF_LeftReady2Right=PPSH_L_ready_toR_ready
	WeaponBF_UpReady2Left=PPSH_Up_ready_toL_ready
	WeaponBF_UpReady2Right=PPSH_Up_ready_toR_ready
	WeaponBF_RightReady2Up=PPSH_R_ready_toUp_ready
	WeaponBF_RightReady2Left=PPSH_R_ready_toL_ready
	WeaponBF_LeftReady2Idle=PPSH_L_readyTOidle
	WeaponBF_RightReady2Idle=PPSH_R_readyTOidle
	WeaponBF_UpReady2Idle=PPSH_Up_readyTOidle
	WeaponBF_Idle2UpReady=PPSH_idleTO_Up_ready
	WeaponBF_Idle2LeftReady=PPSH_idleTO_L_ready
	WeaponBF_Idle2RightReady=PPSH_idleTO_R_ready

	// Enemy Spotting
	WeaponSpotEnemyAnim=PPSH_SpotEnemy
	WeaponSpotEnemySightedAnim=PPSH_SpotEnemy_ironsight

	// Melee anims
	WeaponMeleeAnims(0)=PPSH_Bash
	WeaponMeleeHardAnim=PPSH_BashHard
	MeleePullbackAnim=PPSH_Pullback
	MeleeHoldAnim=PPSH_Pullback_Hold

	ReloadMagazinEmptyCameraAnim=CameraAnim'1stperson_Cameras.Anim.Camera_MP40_reloadempty'

	EquipTime=+0.66//0.75

	bDebugWeapon = false

	BoltControllerNames[0]=BoltSlide_PPSH

	FireModeRotControlName=FireSelect_PPSH

	ISFocusDepth=28

	// Ammo
	AmmoClass=class'ACAmmo_762x25_RPPG'
	MaxAmmoCount=35000
	bUsesMagazines=true
	InitialNumPrimaryMags=10//5
	bPlusOneLoading=false
	bCanReloadNonEmptyMag=true
	PenetrationDepth=30
	MaxPenetrationTests=3
	MaxNumPenetrations=2
	PerformReloadPct=0.85f

	AltAmmoLoadouts(0)=(WeaponContentClassIndex=1)

	PlayerViewOffset=(X=3.5,Y=4.5,Z=-1.75)
	ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
	
	ShoulderedPosition=(X=2.5,Y=2,Z=-1.25)

	IronSightPosition=(X=-3.0,Y=0,Z=0.0)

	bUsesFreeAim=true

	ZoomInTime=0.25//0.35//0.25//0.3
	ZoomOutTime=0.25

	// Free Aim variables
	FreeAimHipfireOffsetX=30

	SuppressionPower=200

	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=30,RightAmplitude=30,LeftFunction=WF_Constant,RightFunction=WF_Constant,Duration=0.100)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1

	CollisionCheckLength=36.5

	FireCameraAnim[0]=CameraAnim'1stperson_Cameras.Anim.Camera_PPSh_Shoot'
	FireCameraAnim[1]=CameraAnim'1stperson_Cameras.Anim.Camera_PPSh_Shoot'

	SightRotControlName=Sight_Rotation

	SightRanges[0]=(SightRange=100,SightPitch=16384,SightPositionOffset=-0.03)
	SightRanges[1]=(SightRange=200,SightPitch=0,SightPositionOffset=-0.07,AddedPitch=45)

	SwayScale=1.0//1.15

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown', FirstPersonCue=AkEvent'WW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WWW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown', FirstPersonCue=AkEvent'WW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown')

	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown', FirstPersonCue=AkEvent'WW_VOX_VC_Voice2.Play_VC_Soldier_2_EnemyHelicopterDown')
	bLoopHighROFSounds(DEFAULT_FIREMODE)=true

}

