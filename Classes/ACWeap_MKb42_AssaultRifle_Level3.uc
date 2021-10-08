//=============================================================================
// ACWeap_MKb42_AssaultRifle_Level3
//=============================================================================
// Level 3 MKb42 Assault Rifle
//=============================================================================
// Red Orchestra: Heroes Of Stalingrad Source
// Copyright (C) 2007-2011 Tripwire Interactive LLC
// - Dayle "Xienen" Flowers
//=============================================================================

class ACWeap_MKb42_AssaultRifle_Level3 extends ROSniperWeapon;

simulated exec function SwitchFireMode()
{
	if ( !bUsingSights )
	{
		super(ROWeapon).SwitchFireMode();
	}
	else
	{
		super(ROSniperWeapon).SwitchFireMode();
	}
}

defaultproperties
{
	// 2D scene capture
	Begin Object Name=ROSceneCapture2DDPGComponent0
	   TextureTarget=TextureRenderTarget2D'WP_Ger_Kar98k_Rifle.Materials.Kar98Lense'
	   FieldOfView=5.0 // "1.5X" = 7.5 / 1.5 = 5.0(FYI: 7.5 is our "real world" FOV on a 19" monitor for this scope) //4.667
	End Object

	WeaponClassType=ROWCT_AssaultRifle

	TeamIndex=`AXIS_TEAM_INDEX

	Category=ROIC_Primary
	Weight=4.4 //KG
	InvIndex=18
	InventoryWeight=6

	PlayerIronSightFOV=45.0

	PreFireTraceLength=1250 //25 Meters
	FireTweenTime=0.01

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponFiring
	WeaponFireTypes(0)=EWFT_Custom
	WeaponProjectiles(0)=class'ACBullet_MKB42'
	FireInterval(0)=+0.10
	DelayedRecoilTime(0)=0.0
	Spread(0)=0.0012

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=WeaponSingleFiring
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'ACBullet_MKB42'
	FireInterval(ALTERNATE_FIREMODE)=+0.10
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.01
	Spread(ALTERNATE_FIREMODE)=0.0012

	ShoulderedSpreadMod=6.0
	HippedSpreadMod=10.0

	// AI
	MinBurstAmount=2
	MaxBurstAmount=4
	BurstWaitTime=1.0

	// Recoil
	maxRecoilPitch=300
	minRecoilPitch=200
	maxRecoilYaw=150
	minRecoilYaw=-45
	RecoilRate=0.095//0.085
	RecoilMaxYawLimit=500
	RecoilMinYawLimit=65035
	RecoilMaxPitchLimit=900
	RecoilMinPitchLimit=64785
	RecoilISMaxYawLimit=500
	RecoilISMinYawLimit=65035
	RecoilISMaxPitchLimit=500
	RecoilISMinPitchLimit=65035
   	RecoilBlendOutRatio=0.65//0.75//0.45
   	PostureHippedRecoilModifer=2.0
   	PostureShoulderRecoilModifer=1.75
	RecoilViewRotationScale=0.4

	ArmsAnimSet=AnimSet'WP_Ger_MKB42_H.Animation.WP_MKB42Hands'

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		SkeletalMesh=SkeletalMesh'WP_Ger_MKB42_H.Mesh.Ger_MKB42_H_UPGD3'
		PhysicsAsset=None
		AnimSets(0)=AnimSet'WP_Ger_MKB42_H.Animation.WP_MKB42Hands'
		Animations=AnimTree'WP_Ger_MKB42_H.Animation.Ger_MKB42_Tree'
		Scale=1.0
		FOV=70
	End Object

	// Pickup staticmesh
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

	AttachmentClass=class'AmmoCrate.ACWeapAttach_MKb42_AssaultRifle_Level3'

	InstantHitDamage(0)=70
	InstantHitDamage(1)=70

	InstantHitDamageTypes(0)=class'ACDmgType_MKb42Bullet'
	InstantHitDamageTypes(1)=class'ACDmgType_MKb42Bullet'

	MuzzleFlashSocket=MuzzleFlashSocket
	MuzzleFlashPSCTemplate=ParticleSystem'FX_VN_Weapons.MuzzleFlashes.FX_VN_MuzzleFlash_1stP_Rifles_round'
	MuzzleFlashDuration=0.33
	MuzzleFlashLightClass=class'ROGame.RORifleMuzzleFlashLight'

	// Shell eject FX
	ShellEjectSocket=ShellEjectSocket
	ShellEjectPSCTemplate=ParticleSystem'FX_VN_Weapons.ShellEjects.FX_Wep_ShellEject_VC_AK47'

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Loop_3P', FirstPersonCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Auto_LP')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Single_3P', FirstPersonCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Fire_Single')

	bLoopingFireSnd(DEFAULT_FIREMODE)=true
	WeaponFireLoopEndSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Tail_3P', FirstPersonCue=AkEvent'WW_WEP_L1A1.Play_WEP_L1A1_Auto_Tail')
	bLoopHighROFSounds(DEFAULT_FIREMODE)=true

	bHasIronSights=true;

	//Equip and putdown
	WeaponPutDownAnim=MKB_42_putaway
	WeaponEquipAnim=MKB_42_pullout
	WeaponDownAnim=MKB_42_Down
	WeaponUpAnim=MKB_42_Up

	// Fire Anims
	//Hip fire
	WeaponFireAnim(0)=MKB_42_shoot
	WeaponFireAnim(1)=MKB_42_shoot
	WeaponFireLastAnim=MKB_42_shootLAST
	//Shouldered fire
	WeaponFireShoulderedAnim(0)=MKB_42_shoot
	WeaponFireShoulderedAnim(1)=MKB_42_shoot
	WeaponFireLastShoulderedAnim=MKB_42_shootLAST
	//Fire using iron sights
	WeaponFireSightedAnim(0)=MKB_42_iron_shoot
	WeaponFireSightedAnim(1)=MKB_42_iron_shoot
	WeaponFireLastSightedAnim=MKB_42_iron_shootLAST
	//Fire through scope
	WeaponFireScopedAnim(0)=MKB_42_Scope_shoot
	WeaponFireScopedAnim(1)=MKB_42_Scope_shoot
	WeaponFireLastScopedAnim=MKB_42_Scope_shootLAST

	// Idle Anims
	//Hip Idle
	WeaponIdleAnims(0)=MKB_42_shoulder_idle
	WeaponIdleAnims(1)=MKB_42_shoulder_idle
	// Shouldered idle
	WeaponIdleShoulderedAnims(0)=MKB_42_shoulder_idle
	WeaponIdleShoulderedAnims(1)=MKB_42_shoulder_idle
	//Sighted Idle
	WeaponIdleSightedAnims(0)=MKB_42_iron_idle
	WeaponIdleSightedAnims(1)=MKB_42_iron_idle

	// Prone Crawl
	WeaponCrawlingAnims(0)=MKB_42_CrawlF
	WeaponCrawlStartAnim=MKB_42_Crawl_into
	WeaponCrawlEndAnim=MKB_42_Crawl_out

	//Reloading
	WeaponReloadEmptyMagAnim=MKB_42_reloadempty
	WeaponReloadNonEmptyMagAnim=MKB_42_reloadhalf
	WeaponRestReloadEmptyMagAnim=MKB_42_reloadempty_rest
	WeaponRestReloadNonEmptyMagAnim=MKB_42_reloadhalf_rest
	// Ammo check
	WeaponAmmoCheckAnim=MKB_42_ammocheck
	WeaponRestAmmoCheckAnim=MKB_42_ammocheck_rest

	// Sprinting
	WeaponSprintStartAnim=MKB_42_sprint_into
	WeaponSprintLoopAnim=MKB_42_Sprint
	WeaponSprintEndAnim=MKB_42_sprint_out
	Weapon1HSprintStartAnim=MKB_42_ger_sprint_into
	Weapon1HSprintLoopAnim=MKB_42_ger_sprint
	Weapon1HSprintEndAnim=MKB_42_ger_sprint_out

	// Mantling
	WeaponMantleOverAnim=MKB_42_Mantle

	// Cover/Blind Fire Anims
	WeaponRestAnim=MKB_42_rest_idle
	WeaponEquipRestAnim=MKB_42_pullout_rest
	WeaponPutDownRestAnim=MKB_42_putaway_rest
	WeaponBlindFireRightAnim=MKB_42_BF_Right_Shoot
	WeaponBlindFireLeftAnim=MKB_42_BF_Left_Shoot
	WeaponBlindFireUpAnim=MKB_42_BF_up_Shoot
	WeaponIdleToRestAnim=MKB_42_idleTOrest
	WeaponRestToIdleAnim=MKB_42_restTOidle
	WeaponRestToBlindFireRightAnim=MKB_42_restTOBF_Right
	WeaponRestToBlindFireLeftAnim=MKB_42_restTOBF_Left
	WeaponRestToBlindFireUpAnim=MKB_42_restTOBF_up
	WeaponBlindFireRightToRestAnim=MKB_42_BF_Right_TOrest
	WeaponBlindFireLeftToRestAnim=MKB_42_BF_Left_TOrest
	WeaponBlindFireUpToRestAnim=MKB_42_BF_up_TOrest
	WeaponBFLeftToUpTransAnim=MKB_42_BFleft_toBFup
	WeaponBFRightToUpTransAnim=MKB_42_BFright_toBFup
	WeaponBFUpToLeftTransAnim=MKB_42_BFup_toBFleft
	WeaponBFUpToRightTransAnim=MKB_42_BFup_toBFright
	// Blind Fire ready
	WeaponBF_Rest2LeftReady=MKB_42_restTO_L_ready
	WeaponBF_LeftReady2LeftFire=MKB_42_L_readyTOBF_L
	WeaponBF_LeftFire2LeftReady=MKB_42_BF_LTO_L_ready
	WeaponBF_LeftReady2Rest=MKB_42_L_readyTOrest
	WeaponBF_Rest2RightReady=MKB_42_restTO_R_ready
	WeaponBF_RightReady2RightFire=MKB_42_R_readyTOBF_R
	WeaponBF_RightFire2RightReady=MKB_42_BF_RTO_R_ready
	WeaponBF_RightReady2Rest=MKB_42_R_readyTOrest
	WeaponBF_Rest2UpReady=MKB_42_restTO_Up_ready
	WeaponBF_UpReady2UpFire=MKB_42_Up_readyTOBF_Up
	WeaponBF_UpFire2UpReady=MKB_42_BF_UpTO_Up_ready
	WeaponBF_UpReady2Rest=MKB_42_Up_readyTOrest
	WeaponBF_LeftReady2Up=MKB_42_L_ready_toUp_ready
	WeaponBF_LeftReady2Right=MKB_42_L_ready_toR_ready
	WeaponBF_UpReady2Left=MKB_42_Up_ready_toL_ready
	WeaponBF_UpReady2Right=MKB_42_Up_ready_toR_ready
	WeaponBF_RightReady2Up=MKB_42_R_ready_toUp_ready
	WeaponBF_RightReady2Left=MKB_42_R_ready_toL_ready
	WeaponBF_LeftReady2Idle=MKB_42_L_readyTOidle
	WeaponBF_RightReady2Idle=MKB_42_R_readyTOidle
	WeaponBF_UpReady2Idle=MKB_42_Up_readyTOidle
	WeaponBF_Idle2UpReady=MKB_42_idleTO_Up_ready
	WeaponBF_Idle2LeftReady=MKB_42_idleTO_L_ready
	WeaponBF_Idle2RightReady=MKB_42_idleTO_R_ready

	// MELEE FIREMODE
	WeaponFireTypes(MELEE_ATTACK_FIREMODE)=EWFT_InstantHit
	InstantHitDamageTypes(MELEE_ATTACK_FIREMODE)=class'RODmgType_MeleePierce'

	// Melee anims
	WeaponMeleeAnims(0)=MKB_42_Stab
	WeaponMeleeHardAnim=MKB_42_StabHard
	MeleePullbackAnim=MKB_42_Pullback
	MeleeHoldAnim=MKB_42_Pullback_Hold

	// Melee FX
	MeleeAttackHitFleshSound=AkEvent'WW_WEP_Shared.Play_WEP_Melee_Rifle_Impact'

	// Melee Settings
	MeleeAttackRange=70
	MeleeAttackDamage=110
	MeleeAttackChargeDamage=200
	bAllowMeleeToPenetrate=true

	ReloadMagazinEmptyCameraAnim=CameraAnim'1stperson_Cameras.Anim.Camera_MP40_reloadempty'

	EquipTime=+0.75
	PutDownTime=+0.50

	bDebugWeapon = false

	BoltControllerNames[0]=BoltSlide_MKB42

	ISFocusDepth=20
	ISFocusBlendRadius=8

	// Ammo
	AmmoClass=class'ACAmmo_792x33_MKb42Mag'
	MaxAmmoCount=31
	bUsesMagazines=true
	InitialNumPrimaryMags=6
	bPlusOneLoading=true
	bCanReloadNonEmptyMag=true
	PenetrationDepth=18.42
	MaxPenetrationTests=3
	MaxNumPenetrations=2

	PlayerViewOffset=(X=0.0,Y=8.0,Z=-4)
	ZoomInRotation=(Pitch=-910,Yaw=0,Roll=2910)
	ShoulderedTime=0.35
	ShoulderedPosition=(X=2.0,Y=4.0,Z=-1.5)// (X=-.122,Y=4.881,Z=-1.152)
	ShoulderRotation=(Pitch=-500,Yaw=0,Roll=2500)
	IronSightPosition=(X=0,Y=0.01,Z=-0.055)

	bUsesFreeAim=true

	// Free Aim variables
	FreeAimMaxYawLimit=2000
	FreeAimMinYawLimit=63535
	FreeAimMaxPitchLimit=1500
	FreeAimMinPitchLimit=64035
	FreeAimISMaxYawLimit=500
	FreeAimISMinYawLimit=65035
	FreeAimISMaxPitchLimit=350
	FreeAimISMinPitchLimit=65185
	FullFreeAimISMaxYaw=350
	FullFreeAimISMinYaw=65185
	FullFreeAimISMaxPitch=250
	FullFreeAimISMinPitch=65285
	FreeAimSpeedScale=0.35
	FreeAimISSpeedScale=0.4
	FreeAimHipfireOffsetX=40

	Begin Object Class=ForceFeedbackWaveform Name=ForceFeedbackWaveformShooting1
		Samples(0)=(LeftAmplitude=30,RightAmplitude=30,LeftFunction=WF_Constant,RightFunction=WF_Constant,Duration=0.100)
	End Object
	WeaponFireWaveForm=ForceFeedbackWaveformShooting1

	CollisionCheckLength=36.5

	FireCameraAnim[0]=CameraAnim'1stperson_Cameras.Anim.Camera_MP40_Shoot'
	FireCameraAnim[1]=CameraAnim'1stperson_Cameras.Anim.Camera_MP40_Shoot'

	SightSlideControlName=Sight_Slide
	SightRotControlName=Sight_Rotation

	SightRanges[0]=(SightRange=100,SightPitch=60,SightSlideOffset=-0.35,SightPositionOffset=-0.055)
	SightRanges[1]=(SightRange=200,SightPitch=215,SightSlideOffset=-0.15,SightPositionOffset=-0.12)
	SightRanges[2]=(SightRange=300,SightPitch=375,SightSlideOffset=0.095,SightPositionOffset=-0.19)
	SightRanges[3]=(SightRange=400,SightPitch=575,SightSlideOffset=0.35,SightPositionOffset=-0.285)
	SightRanges[4]=(SightRange=500,SightPitch=800,SightSlideOffset=0.53,SightPositionOffset=-0.38)
	SightRanges[5]=(SightRange=600,SightPitch=1065,SightSlideOffset=0.73,SightPositionOffset=-0.5)
	SightRanges[6]=(SightRange=700,SightPitch=1380,SightSlideOffset=0.9,SightPositionOffset=-0.64)
	SightRanges[7]=(SightRange=800,SightPitch=1725,SightSlideOffset=1.07,SightPositionOffset=-0.792)

	ScopeLenseMICTemplate=MaterialInstanceConstant'M_Common_Weapons.Ger_1_5x_Lense_Material_Mic'

	bHasScopePosition=true
	ScopePosition=(X=-14.0,Y=0.001,Z=-1.11)
	ScopedControlledBreathingSensitivityMod=2.0
	ScopedSensitivityMod=3.0
	ScopeTextureScale=0.3

	ScopeSightRanges[0]=(SightRange=100,SightPositionOffset=-0.01)
	ScopeSightRanges[1]=(SightRange=200,SightPositionOffset=-0.035)
	ScopeSightRanges[2]=(SightRange=300,SightPositionOffset=-0.0525)
	ScopeSightRanges[3]=(SightRange=400,SightPositionOffset=-0.08)
	ScopeSightRanges[4]=(SightRange=500,SightPositionOffset=-0.11)
	ScopeSightRanges[5]=(SightRange=600,SightPositionOffset=-0.14)
}

