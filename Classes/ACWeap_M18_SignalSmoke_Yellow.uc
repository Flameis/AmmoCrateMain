//=============================================================================
// ROWeap_M18_SignalSmoke
//=============================================================================
// Weapon class for the American M18 Signal Smoke Grenade
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M18_SignalSmoke_Yellow extends ROEggGrenadeWeapon
	abstract;

//`include(ROVoiceComs.uci)

simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		local ROPlayerController ROPC;
		super.BeginState(PreviousStateName);

		ROPC = ROPlayerController(Instigator.Controller);

		if ( ROPC != none )
		{
			ROPC.TriggerHint(ROHTrig_SignalSmokeGrenades);
		}
	}
}

defaultproperties
{
	WeaponContentClass(0)="AmmoCrate.ACWeap_M18_SignalSmoke_Yellow_Content"
	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.US_Weap_M18_SignalSmoke'

	WeaponClassType=ROWCT_SignalSmoke

	TeamIndex=`ALLIES_TEAM_INDEX

	InvIndex=`ROII_M18_SmokeGrenade
	Category=ROIC_SmokeGrenade // ROIC_SpecialGrenade
	InventoryWeight=1

	PlayerViewOffset=(X=5,Y=4.5,Z=-1.75)
	ShoulderedPosition=(X=3,Y=3.5,Z=-0.5)
	//ShoulderRotation=(Pitch=-300,Yaw=500,Roll=1500)

	// Anims
	WeaponPullPinAnim=M8_Smoke_pullpin
	WeaponPutDownAnim=M8_Smoke_Putaway
	WeaponEquipAnim=M8_Smoke_Pullout
	WeaponDownAnim=M8_Smoke_Down
	WeaponUpAnim=M8_Smoke_Up

	// Prone Crawl
	WeaponCrawlingAnims(0)=M8_Smoke_CrawlF
	WeaponCrawlStartAnim=M8_Smoke_Crawl_into
	WeaponCrawlEndAnim=M8_Smoke_Crawl_out

	// Sprinting
	WeaponSprintStartAnim=M8_Smoke_sprint_into
	WeaponSprintLoopAnim=M8_Smoke_Sprint
	WeaponSprintEndAnim=M8_Smoke_sprint_out

	// Mantling
	WeaponMantleOverAnim=M8_Smoke_Mantle

	// Cover/Blind Fire Anims
	WeaponBF_LeftPullpin=M8_Smoke_L_Pullpin
	WeaponBF_RightPullpin=M8_Smoke_R_Pullpin
	WeaponBF_UpPullpin=M8_Smoke_Up_Pullpin
	// Blind Fire ready
	WeaponBF_Rest2LeftReady=M8_Smoke_idleTO_L_ready
	WeaponBF_Rest2RightReady=M8_Smoke_idleTO_R_ready
	WeaponBF_Rest2UpReady=M8_Smoke_idleTO_Up_ready
	WeaponBF_LeftReady2Rest=M8_Smoke_L_readyTOidle
	WeaponBF_RightReady2Rest=M8_Smoke_R_readyTOidle
	WeaponBF_UpReady2Rest=M8_Smoke_Up_readyTOidle
	WeaponBF_LeftReady2Up=M8_Smoke_L_ready_toUp_ready
	WeaponBF_LeftReady2Right=M8_Smoke_Up_ready_toL_ready
	WeaponBF_UpReady2Left=M8_Smoke_Up_ready_toL_ready
	WeaponBF_UpReady2Right=M8_Smoke_Up_ready_toR_ready
	WeaponBF_RightReady2Up=M8_Smoke_R_ready_toUp_ready
	WeaponBF_RightReady2Left=M8_Smoke_R_ready_toL_ready
	WeaponBF_LeftReady2Idle=M8_Smoke_L_readyTOidle
	WeaponBF_RightReady2Idle=M8_Smoke_R_readyTOidle
	WeaponBF_UpReady2Idle=M8_Smoke_Up_readyTOidle
	WeaponBF_Idle2UpReady=M8_Smoke_idleTO_Up_ready
	WeaponBF_Idle2LeftReady=M8_Smoke_idleTO_L_ready
	WeaponBF_Idle2RightReady=M8_Smoke_idleTO_R_ready
	// Blind Fire ready (Armed)
	ArmedBF_Rest2LeftReady=M8_Smoke_idleHold_TO_L_Hold
	ArmedBF_Rest2RightReady=M8_Smoke_idleHold_TO_R_Hold
	ArmedBF_Rest2UpReady=M8_Smoke_idleHold_TO_Up_Hold
	ArmedBF_LeftReady2Rest=M8_Smoke_L_HoldTOidleHold
	ArmedBF_RightReady2Rest=M8_Smoke_R_HoldTOidleHold
	ArmedBF_UpReady2Rest=M8_Smoke_Up_HoldTOidleHold
	ArmedBF_LeftReady2Up=M8_Smoke_L_Hold_toUp_Hold
	ArmedBF_LeftReady2Right=M8_Smoke_LHold_ready_toR_Hold
	ArmedBF_UpReady2Left=M8_Smoke_Up_Hold_toL_Hold
	ArmedBF_UpReady2Right=M8_Smoke_Up_Hold_toR_Hold
	ArmedBF_RightReady2Up=M8_Smoke_R_Hold_toUp_Hold
	ArmedBF_RightReady2Left=M8_Smoke_R_Hold_toL_Hold
	ArmedBF_LeftReady2Idle=M8_Smoke_L_HoldTOidleHold
	ArmedBF_RightReady2Idle=M8_Smoke_R_HoldTOidleHold
	ArmedBF_UpReady2Idle=M8_Smoke_Up_HoldTOidleHold
	ArmedBF_Idle2UpReady=M8_Smoke_idleHold_TO_Up_Hold
	ArmedBF_Idle2LeftReady=M8_Smoke_idleHold_TO_L_Hold
	ArmedBF_Idle2RightReady=M8_Smoke_idleHold_TO_R_Hold

	// Enemy Spotting
	WeaponSpotEnemyAnim=M8_Smoke_SpotEnemy

	// Melee anims
	WeaponMeleeAnims(0)=M8_Smoke_Bash
	WeaponMeleeHardAnim=M8_Smoke_BashHard
	MeleePullbackAnim=M8_Smoke_Pullback
	MeleeHoldAnim=M8_Smoke_Pullback_Hold

	FuzeLength = 1.5//4.5
	bUseFuseTimeForProj=false

	bHasIronSights=false;

	MuzzleFlashSocket=MuzzleFlashSocket

	AmmoClass=class'ACAmmo_M18_Smoke_Yellow'

	// MAIN FIREMODE
	FiringStatesArray(0)=WeaponSingleFiring
	WeaponProjectiles(0)=class'ACM18SmokeProjectileYellow'
	WeaponThrowAnim(0)=M8_Smoke_throw
	WeaponIdleAnims(0)=M8_Smoke_idle
	ExplosiveBlindFireRightAnim(0)=M8_Smoke_R_throw
	ExplosiveBlindFireLeftAnim(0)=M8_Smoke_L_throw
	ExplosiveBlindFireUpAnim(0)=M8_Smoke_Up_throw

	// ALT FIREMODE
	FiringStatesArray(ALTERNATE_FIREMODE)=none
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'M18SmokeProjectilePurple'
	WeaponThrowAnim(ALTERNATE_FIREMODE)=M8_Smoke_toss
	WeaponIdleAnims(ALTERNATE_FIREMODE)=M8_Smoke_idle
	ExplosiveBlindFireRightAnim(ALTERNATE_FIREMODE)=M8_Smoke_R_toss
	ExplosiveBlindFireLeftAnim(ALTERNATE_FIREMODE)=M8_Smoke_L_throw
	ExplosiveBlindFireUpAnim(ALTERNATE_FIREMODE)=M8_Smoke_toss

	Weight=0.0//KG
	//RoleEncumbranceModifier=0.0
	MaxAmmoCount=1
	InitialNumPrimaryMags=2

	ThrowSpawnModifier=0.55
	TossSpawnModifier=0.5

	ThrowingBattleChatterIndex=`BATTLECHATTER_ThrowingSmoke

	// AI
	MinBurstAmount=1
	MaxBurstAmount=1
	BurstWaitTime=5.0

	EquipTime=+0.45//0.25

	PrimeSound=AkEvent'WW_EXP_Shared.Play_EXP_Grenade_Safety_Release'
}

