//=============================================================================
// ROItem_PlaceableAmmoCrate
//=============================================================================
// Placeable Ammo Crate, used to place a ammo resupply volume placed by players
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//=============================================================================
// - Many modifications to use faction-based menshes, animations, etc. -Nate
//============================================================================

class ACItemPlaceableSandbags extends ACItemPlaceable
	abstract;

var class<ACDestructibleSandbag>	AmmoCrateClass; 				// Spawning Class Reference
var class<ACDestructibleSandbag>	PhysicalAmmoCrateClass;		// Preview Mesh Reference

// A proxy constructor item placed in the world. Generally, this is spawned and used to play an animation for the thing "deploying" in the world such as an ammo box with it's lid sliding open. -Nate
//var class<ROConstructorProxy> 			ClassConstructorProxy;
//var ROConstructorProxy 					ConstructorProxy;

simulated function PostBeginPlay()
{
	if ( PhysicalAmmoCrateClass != none )
	{
		ReferenceStaticMesh = PhysicalAmmoCrateClass.default.DestructibleStaticMeshComponent0.StaticMesh;
	}
	else
	{
		`Warn("No or Invalid 'PhysicalAmmoCrateClass' set in 'ROItem_PlaceableAmmoCrate'");
	}
	super.PostBeginPlay();
}

simulated exec function IronSights(){}

simulated function BeginFire(Byte FireModeNum)
{
	// Only default fire mode, please.
	if(FireModeNum > DEFAULT_FIREMODE)
		return;
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
	local float TraceBuff, TraceLength, VerticalAngle, LimitedVerticalAngle;

	ROPC = ROPlayerController(Instigator.Controller);

	// If this material physically doesn't support it or we've already got one in the world, bail.
	if(!Super.CanPlace())
	{
		return false;
	}

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

	if (LimitedVerticalAngle < VerticalAngle && VerticalAngle < 120 * DegToRad) // Limit vertical angle to 120º
	{
		TraceStart = Instigator.GetPawnViewLocation();
		TraceEnd = TraceStart + ViewDirection * (TraceLength * TraceBuff * 1.2f);

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_Bullet/**TRACEFLAG_NeedsTerrainMaterial*/); // TRACEFLAG_Bullet |
		if( HitActor != none && HitActor.bWorldGeometry && TraceStart.Z - HitLocation.Z <= 80 )
		{
			ROTI = ROTeamInfo(Instigator.PlayerReplicationInfo.Team);
			// MySquad = ROPlayerReplicationInfo(Instigator.PlayerReplicationInfo).SquadIndex;
			return true;
		}
	}

	// Failsafe.
	return false;
}

// OVERRRIDDEN to use our version of CanPlace which checks for disnace to other ammo crates.
simulated event Tick(float DeltaTime)
{
	if ( Instigator.IsLocallyControlled() ) // Only do these checks on the controlling client, nowhere else
	{
		if (IsInState('Active') && !IsInState('PlacingItem'))
		{
			bLastCheckSuccessful = CanPlace() && CanPhysicallyPlace();

			if(!bLastCheckWasHardFail)
			{
				ShowPreviewMesh();
				UpdatePreviewMesh();
			}
			else
			{
				HidePreviewMesh();
			}
		}
		else
		{
			bLastCheckSuccessful = false;
			bLastCheckWasHardFail = true;
			HidePreviewMesh();
		}
	}

	// Call ROWeapon's super so we can bypass the parent class' version of the checks which would turn on the preview mesh unnecessarily.
	Super(ROweapon).Tick(DeltaTime);
}

simulated function StartPlacingItem()
{
	GotoState('PlacingItem');
}

simulated function SpawnPlaceable()
{
	Super.SpawnPlaceable();
}

function bool DoActualSpawn()
{
	local ROPlaceableAmmoResupply ROPAR;
	local Controller ConOwner;
	local ROPlayerController ROPC;

	ConOwner = (Instigator != none) ? Instigator.Controller : none;

	ROPAR = Spawn(AmmoCrateClass, ConOwner,, PlaceLoc, PlaceRot);

	if ( ROPAR != none )
	{
		ROPC = ROPlayerController(ConOwner);

		if(ROPC != None)
		{
			ROPC.AddPlacedAmmoCrate(ROPAR);
		}

		/*if(Instigator != None && Instigator.InvManager != None)
		{
			Instigator.InvManager.RemoveFromInventory(self);
		}*/

		return true;
	}

	return false;
}

/*simulated function AlertPlacingTime(float PlacingTime)
{
	if ( Role == ROLE_Authority )
	{
	   	// Show the progress bar
	   	if ( ROPawn(Instigator) != none )
	  		ROPawn(Instigator).StartDeployAmmoCrate(PlacingTime);
	}
}*/

DefaultProperties
{
	WeaponContentClass(0)="ROGameContent.ROItem_PlaceableAmmoCrate_Content"
	RoleSelectionImage(0)=Texture2D'VN_UI_Textures.WeaponTex.VN_Binocs'

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

	//bPlacingUsesSingleAnim=true

	PlaceOffset=0

	// Ammo
	AmmoClass=class'ROAmmo_Placeable_AmmoCrate'
	InvIndex=`ROII_Placeable_Ammo
	ROTM_PlacingMessage=ROTMSG_PlaceAmmoCrate

	AmmoCrateClass=class'ROGame.ROPlaceableAmmoResupply'
	PhysicalAmmoCrateClass=class'ROGame.ROPlaceableAmmoResupplyCrate'

	DroppedPickupClass=None
	bCanThrow=false
}
