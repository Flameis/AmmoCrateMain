
// ROItem_PlaceableAmmoCrate
// Placeable Ammo Crate, used to place a ammo resupply volume placed by players
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//=============================================================================
// - Many modifications to use faction-based menshes, animations, etc. -Nate
//============================================================================

class ACItem_AmmoCrate extends ROItem_PlaceableAmmoCrate;

simulated function PostBeginPlay()
{
	if ( PhysicalAmmoCrateClass != none )
	{
		ReferenceSkeletalMesh = PhysicalAmmoCrateClass.default.CrateMesh.SkeletalMesh;
	}
	else
	{
		`Warn("No or Invalid 'PhysicalAmmoCrateClass' set in 'ROItem_PlaceableAmmoCrate'");
	}

	MinDistFromOtherAmmoCratesSq = MinDistFromOtherAmmoCrates * MinDistFromOtherAmmoCrates;
	super.PostBeginPlay();
}

simulated function BeginFire(Byte FireModeNum)
{
	// Only default fire mode, please.
	if(FireModeNum > DEFAULT_FIREMODE)
		return;

	TeamIdx = Instigator.Controller.GetTeamNum();

	// Set our arms animation set to our team's one.
	ArmsAnimSet = ArmsAnimSets[TeamIdx];

	Super.BeginFire(FireModeNum);
}


// @TODO: Move this up to the parent class?
simulated function bool CanPlace(optional bool bIsInitialCheck = true)
{
	local ROPlayerController ROPC;
	local ROTeamInfo ROTI;
	// local byte MySquad;
	local int i;
	local Actor	HitActor;
	local vector	HitNormal, HitLocation, ViewDirection, TraceEnd, TraceStart;
	local TraceHitInfo HitInfo;
	local ROPlaceableAmmoResupply ROAC;
	local float TraceBuff, TraceLength, VerticalAngle, LimitedVerticalAngle;

	ROPC = ROPlayerController(Instigator.Controller);

	// If this material physically doesn't support it or we've already got one in the world, bail.
	if(!Super.CanPlace() || ROPC.NumPlacedAmmoCrates > 0)
	{
		return false;
	}

	// Finally, make sure we're not within a certain range (30m by default) of another ammo resupply crate.
	VerticalAngle = acos(-ViewDirection.Z);
	ViewDirection = Vector(Instigator.GetViewRotation());
	TraceBuff = (Role == Role_Authority || IsInState('PlacingItem')) ? 1.15f : 1.0f; // I'm giving the server a buff as it often seems to have about 10UU differencein height

	if( Instigator.bIsCrouched )
	{
		TraceLength = PlaceCrouchDist;
		LimitedVerticalAngle = FMin(VerticalAngle, 45 * DegToRad);
	}
	else
	{
		TraceLength = PlaceStandingDist;
		LimitedVerticalAngle = FMin(VerticalAngle, 46 * DegToRad);
	}

	if (LimitedVerticalAngle < VerticalAngle && VerticalAngle < 120 * DegToRad) // Limit vertical angle to 120à¸¢à¸š
	{
		TraceStart = Instigator.GetPawnViewLocation();
		TraceEnd = TraceStart + ViewDirection * (TraceLength * TraceBuff * 1.2f);

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_Bullet/**TRACEFLAG_NeedsTerrainMaterial*/); // TRACEFLAG_Bullet |
		if( HitActor != none && HitActor.bWorldGeometry && TraceStart.Z - HitLocation.Z <= 80 )
		{
			ROTI = ROTeamInfo(Instigator.PlayerReplicationInfo.Team);
			// MySquad = ROPlayerReplicationInfo(Instigator.PlayerReplicationInfo).SquadIndex;

			if(ROTI != None)
			{
				for(i = 0; i < 10	; i++)
				{
					// Bypassing the "Squad" check for now because potentially we could have a couple combat engineers/sappers in our squad. -Nate
					if(/*i != MySquad
						&&*/ ROTI.PlaceableAmmoCrates[i] != None
						&& VSizeSq(HitLocation - ROTI.PlaceableAmmoCrates[i].Location) <  MinDistFromOtherAmmoCratesSq
						)
					{
						if(ROPC != None)
						{
							ROPC.ReceiveLocalizedMessage(class'ROLocalMessagePlantedItem', ROTMSG_PlaceAmmoTooCloseToOtherCrate);

							HidePreviewMesh();
							return false;
						}
					}
				}

				// Or too close to other placeable ammo crates being placed.
				if( !IsInState('PlacingItem') )
				{
					foreach CollidingActors(class'ROPlaceableAmmoResupply', ROAC, MinDistFromOtherAmmoCrates * 2, HitLocation)
					{
						if( ROAC != none )
						{
							if (ROPC != none)
							{
								ROPC.ReceiveLocalizedMessage(class'ROLocalMessagePlantedItem', ROTMSG_PlaceAmmoTooCloseToOtherCrate);
							}

							HidePreviewMesh();
							return false;
						}
					}
				}
			}
			else // If we can't get our team info, bail.
			{
				HidePreviewMesh();
				return false;
			}

			return true;
		}
	}

	// Failsafe.
	return false;
}

DefaultProperties
{
	WeaponContentClass(0)="AmmoCrate.ACItem_AmmoCrate_Content"
	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_mg'

	WeaponIdleAnims(0)=Placeable_idle
	WeaponIdleAnims(ALTERNATE_FIREMODE)=Placeable_idle

	// Anims
	WeaponPutDownAnim=Placeable_Putaway
	WeaponEquipAnim=Placeable_Pullout
	WeaponDownAnim=Placeable_Down
	WeaponUpAnim=Placeable_Up

	// Prone Crawl
	WeaponCrawlingAnims(0)=Placeable_CrawlF
	WeaponCrawlStartAnim=Placeable_Crawl_into
	WeaponCrawlEndAnim=Placeable_Crawl_out

	// Sprinting
	WeaponSprintStartAnim=Placeable_sprint_into
	WeaponSprintLoopAnim=Placeable_Sprint
	WeaponSprintEndAnim=Placeable_sprint_out

	// Mantling
	WeaponMantleOverAnim=Placeable_Mantle

	// Enemy Spotting
	WeaponSpotEnemyAnim=Placeable_SpotEnemy

	WeaponPlaceAnimCameraAnim=CameraAnim'1stperson_Cameras.Anim.TunnelTool_Dig'
	WeaponPlaceAnim=Placeable_Open_Crate

	// Melee
	WeaponMeleeAnims(0)=Placeable_Bash
	WeaponMeleeHardAnim=Placeable_BashHard
	MeleePullbackAnim=Placeable_Pullback
	MeleeHoldAnim=Placeable_Pullback_Hold

	// Crate-specific
	IdleClosedAnim=Idle_Closed
	IdleOpenAnim=Idle_Open
	OpenCrateAnim=Open_Crate

	//bPlacingUsesSingleAnim=true

	PlaceOffset=0

	// Ammo
	AmmoClass=class'ROAmmo_Placeable_AmmoCrate'
	Category=ROIC_PlaceableEquipment
	ROTM_PlacingMessage=ROTMSG_PlaceAmmoCrate

	Weight=8 //KG

	AmmoCrateClass=class'ROGame.ROPlaceableAmmoResupply'
	PhysicalAmmoCrateClass=class'ROGame.ROPlaceableAmmoResupplyCrate'

	MinDistFromOtherAmmoCrates=50 // 30m = 30 * 50. 30m sq. = 30 * 50 ^ 2

	bCanThrow=false
	DroppedPickupMesh=None
	PickupFactoryMesh=None
}