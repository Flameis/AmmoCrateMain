//=============================================================================
// ROWeap_M79_GrenadeLauncher_Level2
//=============================================================================
// Level 2 Content for M79 Grenade Launcher - Secondary Buckshot Round
//=============================================================================
// Rising Storm 2 Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M79_MemeLauncher_Content extends ROWeap_M79_GrenadeLauncher_Content;

var bool	bHaveHitPawnThisShot;	// For stat tracking, so we don't break the accuracy stat

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

simulated state Active
{
	/**
	 * AllowCheckAmmo() in the active state
	 */
	simulated function bool AllowCheckAmmo()
	{
		local ROPawn ROP;

		if ( bHidden )
		{
			`log ("[MutExtras Debug]><><><><><><><><><	Disabled ammo check cancel when weapon hidden! Delete me and my inherited state for release!");
			// return false;
		}

		ROP = ROPawn(Instigator);
		if ( ROP == None || ROP.IsProneTransitioning() )
		{
			return false;
		}

		return true;
	}
}

/**
 * Overridden to handle buckshot firing. This version will only fire the ALT fire projectiles/traces
 */
simulated function CustomFire()
{
	local vector StartTrace, EndTrace;
	local Array<ImpactInfo>	ImpactList;
	local ImpactInfo RealImpact, NearImpact;
	local int i, j, k;//, FinalImpactIndex;
	local Array<ImpactInfo>	PenetrationList;
	// Damage reduction from penetration/distance code
	local vector CurrentStart;
	local float PowerLeft;
	local Actor LastHitActor;
	local PhysicalMaterial LastPhysMaterial;
	local ShotgunImpactSpawner	ImpactSpawner;
	local CSHDShotInfo ShotInfo;
	local class<ROBullet> BulletClass;
	local array<PenetrationSortingInfo> HitPawns;
	local bool bContinueSubLoop;

	// Don't custom fire on the server for client side hit detection for
	// players not controlled on the server (i.e. not bots, not the host on a
	// listen server)
	if( Role == ROLE_Authority && FireModeUseClientSideHitDetection[CurrentFireMode]
		&& !Instigator.IsLocallyControlled() )
	{
		ShotInfo.FiringMode = CurrentFireMode;
		ShotInfo.ShotDirection = Normal(EndTrace-StartTrace);
		ShotInfo.ShotOrigin = StartTrace;
		ShotInfo.Time = WorldInfo.TimeSeconds;
		QueuedCSHDShotInfos[QueuedCSHDShotInfos.Length] = ShotInfo;

		return;
	}

	// Spawn the shotgun impact spawner on the server
	// TODO: Add code that will support a listen server replication if we need it
	if( WorldInfo.NetMode == NM_DedicatedServer && NumProjectiles[CurrentFireMode] > 1 )
	{
		// Grab this here for the shotgun impacts
		StartTrace = InstantFireStartTrace();
		EndTrace = HybridPreFireEndTrace(StartTrace);

		// Spawn projectile
		ImpactSpawner = Spawn(class'ShotgunImpactSpawner',Instigator,, StartTrace, Rotator(EndTrace - StartTrace));
		if( ImpactSpawner != none && !ImpactSpawner.bDeleteMe )
		{
			ImpactSpawner.Instigator = Instigator;
			ImpactSpawner.NumEffectsToSpawn = NumProjectiles[CurrentFireMode];
			ImpactSpawner.UsedSpread = GetSpreadMod();
		}
	}

	// if a human is holding and viewing this gun, process the recoil
	if( Instigator.IsFirstPerson() )
	{
		HandleRecoil();
	}

	bHaveHitPawnThisShot = false;

	BulletClass = GetBulletClassByFireMode(CurrentFireMode);

	// Loop through however many projectiles this shell fires
	for(j=0; j<NumProjectiles[CurrentFireMode]; j++)
	{
		// define range to use for CalcWeaponFire()
		StartTrace = InstantFireStartTrace();
		EndTrace = HybridPreFireEndTrace(StartTrace);

		// Reset the arrays for each new pellet
		ImpactList.Length = 0;
		PenetrationList.Length = 0;

		// Debug line drawing to draw where weapon shots start/end
		if( bDebugWeapon || bDebugProjFiring )
		{
			if( WorldInfo.NetMode == NM_DedicatedServer )
			{
				//`log ("[MutExtras Debug]Server View location is "$Instigator.GetPawnViewLocation());
			`ifndef(ShippingPC)
			    ClientDrawLine(StartTrace, EndTrace, MakeColor(255,255,0)); // Yellow Line
			`endif
			}
			else
			{
				//`log ("[MutExtras Debug]Client View location is "$Instigator.GetPawnViewLocation());
				FlushPersistentDebugLines();
				DrawDebugSphere(StartTrace, 4, 8, 0, 255, 0, true);
				DrawDebugLine(StartTrace,EndTrace,0,255,0,true); // Green Line
			}
		}

		// Reset penetration information
		TotalPenetrations=0;
		PenetrationDepth = default.PenetrationDepth;

		// Perform short shot to see if we would hit anything close
		RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

		// We didn't hit anything close, go ahead and spawn a projectile and return
		if( RealImpact.HitActor == none )
		{
		   ProjectileFire();
		   continue;
		}

		CurrentStart = StartTrace;

		PowerLeft = 1.0;
		LastHitActor = RealImpact.HitActor;
		LastPhysMaterial = RealImpact.HitInfo.PhysMaterial;

		SortImpactListToStopHitZoneDamageStacking(HitPawns, ImpactList);

		// Since we already hit something close and didn't spawn a projectile, do the normal instant hit stuff
		for (i = 0; i < ImpactList.length; i++)
		{
			// Only process a single hit for ROPawn's
			if ( ROPawn(ImpactList[i].HitActor) != none )
			{
				bContinueSubLoop = false;
				for ( k = 0; k < HitPawns.Length; k++ )
				{
					if ( HitPawns[k].ROP == ROPawn(ImpactList[i].HitActor) )
					{
						if ( i != HitPawns[k].ImpactIndex )
						{
							bContinueSubLoop = true;
							break;
						}
					}
				}

				if ( bContinueSubLoop ) continue;
			}

			// Scale the damage down after each penetration based on the material type that was penetrated
			if (Role == ROLE_Authority && !ImpactList[i].bExitImpact )
			{
				if( LastHitActor != ImpactList[i].HitActor || LastPhysMaterial != ImpactList[i].HitInfo.PhysMaterial )
				{
					PowerLeft *= GetMaterialDamageScalar(LastPhysMaterial);
					LastHitActor = ImpactList[i].HitActor;
					LastPhysMaterial = ImpactList[i].HitInfo.PhysMaterial;
				}
			}

			// Use special damage handling so we can scale down the damage with penetation/bullet velocity
			ExProcessInstantHit(CurrentFireMode, ImpactList[i], PowerLeft * EvalInterpCurveFloat(BulletClass.default.VelocityDamageFalloffCurve, PowerLeft * BulletClass.static.GetSpeedSq()));
			// ExProcessInstantHit(CurrentFireMode, ImpactList[i], PowerLeft);

			if( !ImpactList[i].bExitImpact )
			{
				// Debug line drawing to draw where weapon shots start/end
				if( bDebugWeapon || bDebugProjFiring )
				{
					if( WorldInfo.NetMode == NM_DedicatedServer )
					{
					`ifndef(ShippingPC)
						ClientDrawSphere(ImpactList[i].HitLocation, 4, MakeColor(255,255,0),true);
					`endif
					}
					else
					{
						DrawDebugSphere(ImpactList[i].HitLocation, 4, 8, 255, 255, 0, true);
					}
				}

				// Warn any players along the path of the bullet that they are being shot at
				WarnPawnsAlongFireLine(CurrentStart, ImpactList[i].HitLocation);

				CurrentStart = ImpactList[i].HitLocation;
			}

			// Generate the list of penetration impacts
			if( ImpactList[i] != RealImpact )
			{
				PenetrationList[PenetrationList.Length] = ImpactList[i];
			}
		}

		// Let the weapon attachment handle the penetration effects if we're not a net client
		if( (WorldInfo.NetMode == NM_ListenServer || WorldInfo.NetMode == NM_Standalone) && PenetrationList.Length > 0 )
		{
		   ROPawn(Instigator).CurrentWeaponAttachment.HandlePenetrationEffects(PenetrationList, Normal(EndTrace-StartTrace), BulletClass.static.IsSuperSonicAtEnergyPct(PowerLeft) );
		}

		if (Role == ROLE_Authority)
		{
			// Set flash location to trigger client side effects.
			// if HitActor == None, then HitLocation represents the end of the trace (maxrange)
			// Remote clients perform another trace to retrieve the remaining Hit Information (HitActor, HitNormal, HitInfo...)
			// Here, The final impact is replicated. More complex bullet physics (bounce, penetration...)
			// would probably have to run a full simulation on remote clients.
			if ( NearImpact.HitActor != None )
			{
				SetFlashLocation(NearImpact.HitLocation);
				// Set a replicated impact only for non-relevant players. SetFlashLocation will handle replicating
				// the impact for relevant players.
				SetReplicatedImpact( NearImpact.HitLocation, Normal(EndTrace - StartTrace), StartTrace, class, 1.0, true );
			}
			else
			{
				SetFlashLocation(RealImpact.HitLocation);
				// Set a replicated impact only for non-relevant players. SetFlashLocation will handle replicating
				// the impact for relevant players.
				SetReplicatedImpact( RealImpact.HitLocation, Normal(EndTrace - StartTrace), StartTrace, class, 1.0, true );
			}
		}
	}
}

/**
 * Overridden to handle buckshot firing. This version will only fire the ALT fire projectiles/traces
 */
simulated function CustomFireClientSide()
{
	local vector StartTrace, EndTrace;
	local Array<ImpactInfo>	ImpactList;
	local ImpactInfo RealImpact;
	local int i,j;
	//local ImpactInfo SendImpactList[16];
	local vector HitLocation, HitNormal;

	if( Role == ROLE_Authority )
	{
		return;
	}

	// if a human is holding and viewing this gun, process the recoil
	if( Instigator.IsFirstPerson() )
	{
		HandleRecoil();
	}

	StartTrace = InstantFireStartTrace();

	if( NumProjectiles[CurrentFireMode] > 1 && StartTrace != vect(0,0,0) )
		SpawnImpactEffects(StartTrace, rotator(GetAdjustedAimVector(StartTrace, true)));

	bHaveHitPawnThisShot = false;

	// Loop through however many projectiles are required
	for(j=0; j<NumProjectiles[CurrentFireMode]; j++)
	{
		// define range to use for CalcWeaponFire()
		EndTrace = HybridPreFireEndTrace(StartTrace);

		// Reset the arrays for each new pellet
		ImpactList.Length = 0;

		// Debug line drawing to draw where weapon shots start/end
		if( bDebugWeapon || bDebugProjFiring )
		{
			`log ("[MutExtras Debug]Client View location is "$Instigator.GetPawnViewLocation());
			FlushPersistentDebugLines();
			DrawDebugSphere(StartTrace, 4, 8, 0, 255, 0, true);
			DrawDebugLine(StartTrace,EndTrace,0,255,0,true); // Green Line
		}

		// Reset penetration information
		TotalPenetrations=0;
		PenetrationDepth = default.PenetrationDepth;

		// Perform short shot to see if we would hit anything close
		RealImpact = CalcWeaponFire(StartTrace, EndTrace, ImpactList);

		// We didn't hit anything close, go ahead and spawn a projectile and return
		if( RealImpact.HitActor == none )
		{
			// Trace out and approximate where this shot would go so we can bullet
			// whiz pawns getting shot at
			GetTraceOwner().Trace(HitLocation, HitNormal, StartTrace + 50000 * Normal(EndTrace - StartTrace), StartTrace, TRUE, vect(0,0,0),, TRACEFLAG_Bullet);
			ServerWarnPawnsAlongFireLine(StartTrace, HitLocation, CurrentFireMode);
			ProjectileFire();
			continue;
		}

		// Since we already hit something close and didn't spawn a projectile, do the normal instant hit stuff
		for (i = 0; i < ImpactList.length; i++)
		{
			ProcessInstantHit(CurrentFireMode, ImpactList[i]);

			if( !ImpactList[i].bExitImpact )
			{
				// Debug line drawing to draw where weapon shots start/end
				if( bDebugWeapon || bDebugProjFiring )
				{
					DrawDebugSphere(ImpactList[i].HitLocation, 4, 8, 255, 255, 0, true);
				}
			}
		}

		// Send hits off to server to be processed
		SendClientHitsToServer(ImpactList, CurrentFireMode, RealImpact, StartTrace, false);
	}
}

simulated function SpawnImpactEffects(vector StartLoc, rotator ShotDir)
{
	local ShotgunImpactSpawner	ImpactSpawner;

	// Spawn shotgun impact spawner
	ImpactSpawner = Spawn(class'ShotgunImpactSpawner', Instigator,, StartLoc, ShotDir);
	if( ImpactSpawner != none && !ImpactSpawner.bDeleteMe )
	{
		ImpactSpawner.Instigator = Instigator;
		ImpactSpawner.NumEffectsToSpawn = NumProjectiles[CurrentFireMode];
		ImpactSpawner.UsedSpread = GetSpreadMod();

		if( Role < ROLE_Authority )
			ImpactSpawner.SpawnImpacts();
	}

	if( Role < ROLE_Authority )
		ServerSendImpactEffects(StartLoc, ShotDir);
}

reliable private server function ServerSendImpactEffects(vector StartLoc, rotator ShotDir)
{
	// Spawn the shotgun impact spawner on the server
	if( WorldInfo.NetMode == NM_DedicatedServer && NumProjectiles[CurrentFireMode] > 1 )
	{
		SpawnImpactEffects(StartLoc, ShotDir);
	}
}

// function LogM79Ammo()
// {
	// `log ("[MutExtras Debug]PrimaryAmmoCount:"@PrimaryAmmoCount);
	// `log ("[MutExtras Debug]CurrentPrimaryMagCount:"@CurrentPrimaryMagCount);
	// `log ("[MutExtras Debug]SecondaryAmmoCount:"@SecondaryAmmoCount);
	// `log ("[MutExtras Debug]CurrentSecondaryMagCount:"@CurrentSecondaryMagCount);
	// `log ("[MutExtras Debug]AmmoCount:"@AmmoCount);
	// `log ("[MutExtras Debug]CurrentMagCount:"@CurrentMagCount);
// }

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
			ShowBuckshot();
		}
	}
	else
	{
		if(bUsingAltAmmo)
		{
			ShowBuckshot();
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
	WeaponFireTypes(ALTERNATE_FIREMODE)=EWFT_Custom
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'ACM79GrenadeProjectileWP'
	FireInterval(ALTERNATE_FIREMODE)=0.15
	DelayedRecoilTime(ALTERNATE_FIREMODE)=0.01
	Spread(ALTERNATE_FIREMODE)=0.8
	NumProjectiles(ALTERNATE_FIREMODE)=100

	SecondaryRecoilMod=0.75	//0.5

	InstantHitDamage(ALTERNATE_FIREMODE)=36
	// InstantHitDamage(ALTERNATE_FIREMODE)=85
	InstantHitDamageTypes(ALTERNATE_FIREMODE)=class'RODmgType_M79Buckshot'

	InitialNumPrimaryMags=6
	MaxNumPrimaryMags=6

	PrimaryAmmoClass=class'ROAmmo_40x46_M79Grenade'
	SecondaryAmmoClass=class'ROAmmo_M34_WP'
	InitialNumSecondaryMags=1	//6
	MaxNumSecondaryMags=1		//6

	PrimaryAmmoIndex=0
	SecondaryAmmoIndex=1

	PerformAmmoSwitchPct=0.88f

	// Weapon SkeletalMesh
	Begin Object Name=FirstPersonMesh
		//Materials(0)=
	End Object

	FireModeCanUseClientSideHitDetection[ALTERNATE_FIREMODE]=false

	SecondarySuppressionPower=5

	NumHeloPenetrations=1

	SecondarySightRanges[0]=(SightRange=50,SightPitch=0,SightSlideOffset=0.0,SightPositionOffset=-0.0)

	AltFireModeType=ROAFT_SwitchAmmo

	WeaponFireSnd(DEFAULT_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')
	WeaponFireSnd(ALTERNATE_FIREMODE)=(DefaultCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single_3P',FirstPersonCue=AkEvent'WW_WEP_M79.Play_WEP_M79_Fire_Single')
}
