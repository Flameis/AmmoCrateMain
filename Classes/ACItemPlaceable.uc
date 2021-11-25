//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceable extends ROItemPlaceable
	abstract;

var class<ACDestructible>	DestructibleClass; 				// Spawning Class Reference
var vector						ConfigLoc;
var rotator						ConfigRot;

simulated function PostBeginPlay()
{

	if ( DestructibleClass != none )
	{
		ReferenceStaticMesh = DestructibleClass.default.DestructibleMeshComponent.StaticMesh;
	}
	else
	{
		`Warn("No or Invalid 'DestructibleClass' set in 'ROItem_PlaceableAmmoCrate'");
	}
	super.PostBeginPlay();
}

simulated function AlertPlacingTime(float PlacingTime)
{
	if ( Role == ROLE_Authority )
	{
	   	// Show the progress bar
	   	if ( ROPawn(Instigator) != none )
	  		ROPawn(Instigator).StartDeployAmmoCrate(PlacingTime);
	}
}

simulated function PlayPlacingItem()
{
	local float PlacingTime;

	HidePreviewMesh();

	// Get Placing Time before Out Anim Plays and scale it based on that one only!
	PlacingTime = 0.01;

	if ( Instigator.IsLocallyControlled() )
	{
		PlacingFinishInto();
	}

	SetTimer(PlacingTime, false, 'SpawnPlaceable');
	SetTimer(PlacingTime, false, 'GotoActiveState');
}

simulated function SpawnPlaceable()
{
	HidePreviewMesh();

	if ( Role == ROLE_Authority )
	{
		if ( bRedoPlacementCheckBeforeSpawn || bPlantedWhileMovingFast )
		{
			// Make sure a camera shift hasn't moved our aim to somewhere that we can't place
			if ( !CanPhysicallyPlace(false) )
			{
				if ( Instigator != none && PlayerController(Instigator.Controller) != none )
				{
					PlayerController(Instigator.Controller).ClientMessage("Failed To Spawn Placeable In Location");
				}

				CancelWeaponAction(true, true);
				GotoActiveState();
				return;
			}
		}

		if ( DoActualSpawn() )
		{
		  	/*if ( Instigator != None && Instigator.InvManager != None )
			{
		 		Instigator.InvManager.RemoveFromInventory(Self);
		 	}*/

			AmmoCount -= 1;

			// Stop Firing
			ForceEndFire();

			// Detach weapon components from instigator
			//DetachWeapon();

			// Tell the client the weapon has been thrown
			//ClientWeaponThrown();

			//PostPlacement();

			//Destroy();
			if( AmmoCount < 1 )
			{
				if ( Instigator != none )
				{
				DetachWeapon();
				ClientWeaponThrown();
				Destroy();
				}
			}
		}
		else
		{
			if ( Instigator != none && PlayerController(Instigator.Controller) != none )
			{
				PlayerController(Instigator.Controller).ClientMessage("Failed To Spawn Placeable");
			}
			GotoActiveState();
		}
	}
}

simulated function bool CanPhysicallyPlace(optional bool bIsInitialCheck = true)
{
	local Actor		HitActor, HitActorSecondary;
	local vector	HitNormal, HitLocation, HitLocationFloatingPoint, TraceEnd, TraceStart, TraceExtent;
	local vector	HitNormalSecondary, HitLocationSecondary, TraceStartSecondary, TraceEndSecondary, X, Y, Z;
	local vector    ViewDirection, ViewDirectionFlattened;
	local float     VerticalAngle, LimitedVerticalAngle, TempFloat, TraceLength, SurfaceNormalDegrees;
	local rotator 	TempRot;
	local TraceHitInfo HitInfo, HitInfoSecondary;
	local ROPlayerController	ROPC;
	local ROPhysicalMaterialProperty PhysicalProperty;
	local byte 		GroundTraceCompletionMethod;
	local byte 		AdditionalFailType;
	local vector 	DebugVect;
	local SVehicle	TempVehicle;

	ROPC = ROPlayerController(Instigator.Controller);
	bLastCheckWasHardFail = false;
	bLastTraceWasDirect = true;
	bLastTraceWasExtent = true;
	GroundTraceCompletionMethod = 0;

	// Make sure rules wise we can actually place this
	if ( !CanPlace(bIsInitialCheck) )
	{
		bLastCheckWasHardFail = true;
`ifndef(ShippingPC)
		LastFailReason = "Failed Rules Check";
`endif
		//return false;
	}

	TraceStart = Instigator.GetPawnViewLocation();
	ViewDirection = Vector(Instigator.GetViewRotation());
	VerticalAngle = acos(-ViewDirection.Z);

	// Rotate in the players view direction with the Pitch/Roll flattened
	PlaceRot = Instigator.GetViewRotation();
	GetAxes(PlaceRot, X, Y, Z );

	TraceStart         = TraceStart + (ConfigLoc.X * X) + (ConfigLoc.Y * Y) + (ConfigLoc.Z * Z);  
	PlaceRot.Pitch = 0 + (ConfigRot.Pitch * DegToUnrRot);
	PlaceRot.Roll = 0 + (ConfigRot.Roll * DegToUnrRot);
	PlaceRot.Yaw = PlaceRot.Yaw + (ConfigRot.Yaw * DegToUnrRot);

	ViewDirectionFlattened = Vector(PlaceRot);

	if ( !bUsesAltTraceMethod )
	{
		if( Instigator.bIsCrouched )
		{
			TraceLength = PlaceCrouchDist;
			LimitedVerticalAngle = FMin(VerticalAngle, MaxAngleForViewDirForCrouching * DegToRad);
		}
		else
		{
			TraceLength = PlaceStandingDist;
			LimitedVerticalAngle = FMin(VerticalAngle, MaxAngleForViewDirForStanding * DegToRad);
		}

		if (LimitedVerticalAngle < VerticalAngle)
		{
			ViewDirection.Z = -cos(LimitedVerticalAngle);
			TempFloat = sqrt((1 - ViewDirection.Z * ViewDirection.Z) / (ViewDirection.X * ViewDirection.X + ViewDirection.Y * ViewDirection.Y));
			ViewDirection.X *= TempFloat;
			ViewDirection.Y *= TempFloat;
			bLastTraceWasDirect = false;
		}

		TraceEnd = TraceStart + ViewDirection * TraceLength;

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_PhysicsVolumes );

		if( HitActor != None && WaterVolume(HitActor) != None )
		{
			bLastCheckWasHardFail = true;
	`ifndef(ShippingPC)
			LastFailReason = "Physics Volume";
	`endif
			//return false;
		}

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_Bullet);

		// First Ground Trace Failed, Lets Try Again But Directly Down!
		if( HitActor == none )
		{
			GroundTraceCompletionMethod = 1;

			TraceStart = TraceEnd;
			TraceEnd = TraceEnd - (vect(0,0,1)*DownTraceDist);
			HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_Bullet);
		}
	}
	else // Alt Trace Method (start loc is player, but takes a flattened forward and traces down)
	{
		// Forward trace
		TraceStart = Instigator.GetPawnViewLocation();
		TraceEnd = Instigator.GetPawnViewLocation() + (ViewDirectionFlattened*TraceForwardOffset);

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_PhysicsVolumes );

		if( WaterVolume(HitActor) != None )
		{
			bLastCheckWasHardFail = true;
	`ifndef(ShippingPC)
			LastFailReason = "Physics Volume Forward Trace";
	`endif
			//return false;
		}

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_Bullet);

		if ( HitActor != none )
		{
			bLastCheckWasHardFail = true;
	`ifndef(ShippingPC)
			LastFailReason = "Something is right infront of us!";
	`endif
			//return false;
		}

		// Down trace to find ground
		TraceStart = Instigator.GetPawnViewLocation() + (ViewDirectionFlattened*TraceForwardOffset);
		TraceEnd = TraceStart + (vect(0,0,-1)*TraceDownOffset);

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo, TRACEFLAG_PhysicsVolumes );

		if( WaterVolume(HitActor) != None )
		{
			bLastCheckWasHardFail = true;
	`ifndef(ShippingPC)
			LastFailReason = "Physics Volume Down Trace";
	`endif
			//return false;
		}

		TraceExtent = vect(1,1,0) * TraceExtentSize;
		TraceExtent.Z = 0.1;

		// TraceStart += (ViewDirectionFlattened * (TraceExtentSize/2));
		// TraceEnd = TraceStart + (vect(0,0,-1)*TraceDownOffset);

		HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false, TraceExtent, HitInfo);

		if ( HitActor == none )
		{
			bLastTraceWasExtent = false;
			HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart, false,, HitInfo);
		}

		DebugVect = VLerp(TraceStart, TraceEnd, 0.5f);

		if ( bDebugPlacing ) DrawDebugBox(DebugVect, TraceExtent + (vect(0,0,0.5f) * (TraceEnd-TraceStart)), 0, 192 ,0, false);

		if ( VSizeSq(HitLocation-TraceStart) <= Square(MinDistFromTraceLocation) )
		{
			bLastCheckWasHardFail = true;
	`ifndef(ShippingPC)
			LastFailReason = "Plant Attempt Was Below The Min Threshold (Too High)"@VSize(HitLocation-TraceStart)$"uu/"$MinDistFromTraceLocation$"uu";
	`endif
			//return false;
		}
	}

	// We've hit something solid, it's not a hard fail!
	if( HitActor != none && HitActor.bWorldGeometry )
	{
		HitLocationFloatingPoint = TraceLocFloatingPointFix(HitActor, TraceStart, TraceEnd, HitLocation);

		// It's probably going to be a soft fail from here so either way update the preview mesh location
		SetPlaceLocWithOffsets(HitLocationFloatingPoint);

		if ( bDebugPlacing )
		{
			if ( GroundTraceCompletionMethod == 0 ) DrawDebugSphere(HitLocation, 3, 8, 0, 0, 255, false);
			else if ( GroundTraceCompletionMethod == 1 ) DrawDebugSphere(HitLocation, 3, 8, 255, 255, 0, false);
			else DrawDebugSphere(HitLocation, 3, 8, 0, 0, 0, false);
		}

		// Make sure a vehicle isn't too close (if they spawn inside one it's not good)
		foreach OverlappingActors(class'SVehicle', TempVehicle, VehicleDetectionRadius, TraceStart, TRUE)
	    {
	        if ( TempVehicle != none )
	        {
				bLastCheckWasHardFail = false;
		`ifndef(ShippingPC)
				LastFailReason = "Vehicle Too Close!";
		`endif
				//return false;
	        }
	    }

		// Calc the degrees of the surface we're trying to plant on
		SurfaceNormalDegrees = (RadToDeg * acos(vect(0,0,1) dot HitNormal));

		if ( WaterVolume(HitActor) != None )
		{
			bLastCheckWasHardFail = true;
`ifndef(ShippingPC)
			LastFailReason = "Water Volume";
`endif
			//return false;
		}
		// If the surface is too uneven
		else if( SurfaceNormalDegrees > MaxPlacingSurfaceDegrees  )
		{
`ifndef(ShippingPC)
			LastFailReason = "Uneven Surface ="@SurfaceNormalDegrees$"/"$MaxPlacingSurfaceDegrees$"(degrees)";
			DrawDebugLine(HitLocationFloatingPoint,(HitLocationFloatingPoint+(HitNormal*50)),255,0,0,false); // Green Line
`endif
			//return false;
		}

		if ( HitInfo.PhysMaterial != None )
		{
			PhysicalProperty = ROPhysicalMaterialProperty(HitInfo.PhysMaterial.GetPhysicalMaterialProperty(class'ROPhysicalMaterialProperty'));
			CurMatType = (PhysicalProperty != None) ? PhysicalProperty.MaterialType : EMT_Default;
		}
		else
		{
			CurMatType = EMT_Default;
		}

		TraceStartSecondary = HitLocationFloatingPoint + (vect(0,0,1)*2.0f);
		TraceEndSecondary = TraceStartSecondary + (vect(0,0,1)*GetHeightOffset());

		if ( !bUsesAltTraceMethod )
		{
			// This is the up trace to check if we're trying to plant under something
			HitActorSecondary = Trace(HitLocationSecondary, HitNormalSecondary, TraceEndSecondary, TraceStartSecondary, true,, HitInfoSecondary);

			if ( bDebugPlacing )
			{
				DrawDebugSphere(TraceEndSecondary, 3, 8, 255, 255, 0, false);
				DrawDebugLine(TraceStartSecondary,TraceEndSecondary,128,255,128,false);
				DrawDebugSphere(HitLocationSecondary, 3, 8, 0, 255, 255, false);
			}

			if( HitActorSecondary != none )
			{
	`ifndef(ShippingPC)
				LastFailReason = "Up Trace Colliding, Hit Actor: "$HitActorSecondary.Name;
	`endif
				//return false;
			}
		}

		TraceStart = TraceEndSecondary;
		TempRot.Yaw = Instigator.GetViewRotation().Yaw;
		TraceEndSecondary = TraceEndSecondary + (Vector(TempRot)*ForwardPlaceOffset);

		// Forward trace to check the top surface of the plantable
		HitActorSecondary = Trace(HitLocationSecondary, HitNormalSecondary, TraceEndSecondary, TraceStart, true,, HitInfoSecondary, TRACEFLAG_Bullet);

		if ( bDebugPlacing )
		{
			DrawDebugSphere(TraceEndSecondary, 3, 8, 255, 0, 0, false);
			DrawDebugLine(TraceStart,TraceEndSecondary,0,255,0,false);
			DrawDebugSphere(HitLocationSecondary, 3, 8, 0, 0, 255, false);
		}

		if( HitActorSecondary != none )
		{
`ifndef(ShippingPC)
			LastFailReason = "High Forward Trace Colliding";
`endif
			//return false;
		}

		// Subclasses can have their own checks
		if ( !AdditionalCanPhysicallyPlaceTraces(HitLocation, AdditionalFailType) )
		{
			if ( AdditionalFailType == 2 )
			{
				bLastCheckWasHardFail = true;
			}
			//return false;
		}

		if ( ROPC != none )
		{
			ROPC.ReceiveLocalizedMessage(class'ROLocalMessagePlantedItem', ROTM_PlacingMessage, , , ROPC);
		}

		return true;
	}

	bLastCheckWasHardFail = true;
`ifndef(ShippingPC)
	LastFailReason = "Main trace didn't hit anything solid!";
`endif

	if ( bDebugPlacing )
	{
		DrawDebugSphere(TraceStart, 3, 8, 0, 0, 255, false); 	// First Trace End Loc
		DrawDebugSphere(TraceEnd, 3, 8, 255, 255, 0, false);	// Second Trace End Loc
		DrawDebugLine(TraceStart,TraceEnd,0,255,0,false); 		// Line of Second Trace
	}

	return true;
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
	//local ROPlayerController ROPC;
	//local ROTeamInfo ROTI;
	// local byte MySquad;
	//local int i;
	local Actor	HitActor;
	local vector	HitNormal, HitLocation, ViewDirection, TraceEnd, TraceStart;
	local TraceHitInfo HitInfo;
	//local ACDestructible ROAC;
	local float TraceBuff, TraceLength, VerticalAngle, LimitedVerticalAngle;

	//ROPC = ROPlayerController(Instigator.Controller);

	// If this material physically doesn't support it or we've already got one in the world, bail.
	if(!Super.CanPlace())
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
			return true;
		}
	}

	// Failsafe.
	return true;
}

// OVERRRIDDEN to use our version of CanPlace which checks for disnace to other ammo crates.
simulated event Tick(float DeltaTime)
{
	CanPhysicallyPlace();
	if ( Instigator.IsLocallyControlled() ) // Only do these checks on the controlling client, nowhere else
	{
		if (IsInState('Active') && !IsInState('PlacingItem'))
		{
			bLastCheckSuccessful = CanPlace();

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

function bool DoActualSpawn()
{
	local ACDestructible ACD;
	local Controller ConOwner;
	//local ROPlayerController ROPC;

	ConOwner = (Instigator != none) ? Instigator.Controller : none;

	ACD = Spawn(DestructibleClass, ConOwner,, PlaceLoc, PlaceRot);

	if ( ACD != none )
	{
		return true;
	}

	return false;
}
	
DefaultProperties
{
	ConfigLoc  = (X=0,Y=-55,Z=0)
	ConfigRot  = (Pitch=0,Roll=0,Yaw=90)

	WeaponContentClass(0)="ACItemPlaceableContent"

	bNoAccuracyStat=true
	WeaponClassType=ROWCT_Equipment

	Begin Object Name=PreviewStaticMeshComponent
		Materials(0)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(1)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(2)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(3)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		RBChannel=RBCC_Nothing
		DepthPriorityGroup=SDPG_World
		AbsoluteTranslation=true
		AbsoluteRotation=true
		AbsoluteScale=true
		Translation=(X=0,Y=0,Z=0)
		TranslucencySortPriority=9999
	End Object
	PreviewStaticMesh=PreviewStaticMeshComponent

	FiringStatesArray(ALTERNATE_FIREMODE)=none

	PlaceOffset=0
	ForwardPlaceOffset=85
	MaxPlacingSurfaceDegrees=10
	VehicleDetectionRadius=25.0

	TraceForwardOffset=17.5
	TraceDownOffset=90
	TraceExtentSize=3
	MinDistFromTraceLocation=30

	MaxVelBeforeUpdatePlaceLocation=25

	PlaceStandingDist=100
	PlaceCrouchDist=60
	DownTraceDist=25
	MaxAngleForViewDirForStanding=38.2
	MaxAngleForViewDirForCrouching=50

	// Ammo
	MaxAmmoCount=1
	AmmoCount = 1
	bUsesMagazines=true
	InitialNumPrimaryMags=0
	bPlusOneLoading=false
	bCanReloadNonEmptyMag=false
	PenetrationDepth=0
	MaxPenetrationTests=0
	MaxNumPenetrations=0

	ZoomInTime=0.25//0.3
	ZoomOutTime=0.25

	EquipTime=+0.3//0.5
	PutDownTime=+0.3//0.5

	bUsesFreeAim=false
	bHasIronSights=true

	//PlayerViewOffset=(X=1,Y=5,Z=-2)
	//ShoulderedPosition=(X=3,Y=3.5,Z=-1.0)
	//ShoulderRotation=(Pitch=-300,Yaw=500,Roll=1500)

	PlayerViewOffset=(X=3.0,Y=4.5,Z=-1.25)
	ShoulderedPosition=(X=2.0,Y=2.0,Z=-0.5)
	//ShoulderedTime=0.5//0.35

	Category=ROIC_PlaceableEquipment
	Weight=0 //0.4 // kg

	PlayerIronSightFOV=12.5 // 4X // changed to better fit the scale of the levels

	InventoryWeight=0

	AIRating=0.05

	BadPlacementColour=(R=0.3,G=0.005,B=0.005,A=1.0) 	// Red colour
	GoodPlacementColour=(R=0.3,G=0.3,B=0.3,A=1.0) 	// grey/white colour

	bPlacingUsesSingleAnim=false
	bPlacingLengthBasedOnAnims=false
	PlacingLength=0.01

	PlacingDirtSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Dirt'
	PlacingRockSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Rock'
	PlacingMetalSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Metal'
	PlacingWoodSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Wood'
	PlacingWaterSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Water'

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

	// Melee
	WeaponMeleeAnims(0)=Placeable_Bash
	WeaponMeleeHardAnim=Placeable_BashHard
	MeleePullbackAnim=Placeable_Pullback
	MeleeHoldAnim=Placeable_Pullback_Hold

	// Ammo
	AmmoClass=class'ACAmmo_Placeables'
	InvIndex=`ROII_Placeable_Ammo
	ROTM_PlacingMessage=ROTMSG_PlaceAmmoCrate

	DroppedPickupClass=None
	bCanThrow=false
}
