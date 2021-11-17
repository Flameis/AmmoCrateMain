//=============================================================================
// PG7VRocket
//=============================================================================
// PG7V Rocket for the RPG-7 Rocket Launcher
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACBullet_PG7VRocket extends PG7VRocket;

simulated singular event HitWall(vector HitNormal, actor Wall, PrimitiveComponent WallComp, optional PhysicalMaterial WallPhysMaterial)
{
	local ImpactInfo CurrentImpact;
	local ROVehicleBase VehBase;
	local ROVehicle ROV;
	local bool bHitAVehicle;
	local array<ImpactInfo> HitInfos;
	local vector ArmorNormal, ImpactLocation;
	local bool bPenetratedAWall;
	local ROPhysicalMaterialProperty PhysicalProperty;
	local int TeamNum;

	// debugging info
	if (bDebugBallistics)
	{
		`log("BulletImpactLoc="$Location@"BulletImpactNormal="$HitNormal);
		`log("BulletImpactVel="$VSize(Velocity) / 50.0$" M/S BulletDist="$(VSize(Location - OrigLoc) / 50.0)$" BulletDrop="$((TraceHitLoc.Z - Location.Z) / 50.0));

		if( WorldInfo.NetMode == NM_DedicatedServer )
		{
			ROPlayerController(Instigator.Controller).ClientDrawLine(Location, OrigLoc, MakeColor(255,255,0));// yellow Line
			ROPlayerController(Instigator.Controller).ClientDrawSphere(Location, 12, MakeColor(0,255,0),true); // green = end
		}
		else
		{
			DrawDebugSphere(Location,4,12,0,255,0,true);// green = end
			DrawDebugLine(Location,OrigLoc,255,255,0,true); // yellow Line
		}
	}

	ImpactedActor = Wall;
	VehBase = ROVehicleBase(Wall);
	ImpactLocation = Location;

	// Handle a big cannon shell penetrating the world
	if( !bDoSmallArmsPenetration && Wall.bWorldGeometry )
	{
		// Convert Trace Information to ImpactInfo type.
		CurrentImpact.HitActor		= Wall;
		CurrentImpact.HitLocation	= Location;
		CurrentImpact.HitNormal		= HitNormal;
		// If the bullet has gone some distance, use the original location
		// instead of velocity for the RayDir. This will give us a more accurate
		// trace back to the original firing location, especially when we
		// replicate this stuff - Ramm
		if( OrigLoc != Location )
		{
		   CurrentImpact.RayDir	= Normal(Location - OrigLoc);
		}
		else
		{
		   CurrentImpact.RayDir	= Normal(Velocity);
		}

		CurrentImpact.HitInfo.HitComponent = WallComp;
		CurrentImpact.HitInfo.PhysMaterial = WallPhysMaterial;

		if( bProjectileIsHEAT && HandleWorldPenetration(Location, CurrentImpact) )
		{
			bPenetratedAWall = true;
		}
	}

	if ( !Wall.bStatic /*&& !Wall.bWorldGeometry*/ ) // Damaging non-Static world geometry so we can damage destructible meshes - Ramm
	{
		if( VehBase != none )
		{
			bHitAVehicle=true;
			`log("TESTING DAMAGE ON "$vehbase.name);
			// On the server do the damage/sounds, on the client just disappear,
			// as we want all effect to be handled server side so we can do stuff
			// like random penetration probability
			if( Role == ROLE_Authority )
			{
				// ReplicatedEffectLocation = Location;
				if (vehbase.name != "GOMVehicle_M113_ACAV_0" || vehbase.name != "GOMVehicle_M113_ACAV_1" || vehbase.name != "GOMVehicle_M113_ACAV_2")
				{
				`log("DAMAGE TEST SUCCESFUL ON "$vehbase.name);
				vehbase.Health -= 100;
				}

				if( bDebugPenetration )
				{
					FlushPersistentDebugLines();
				}

				// This is a penetrating shot
				if( VehBase.ShouldPenetrate(Location, HitNormal, Normal(Velocity), WallComp, Instigator, self, HitInfos, ArmorNormal) ||
					DeflectPenetrate(VehBase, Location, Normal(Velocity), WallComp, Instigator, HitInfos, ArmorNormal) )
				{
					ProcessVehiclePenetration(VehBase, Location, HitNormal, WallComp, HitInfos);
					ImpactedVehicle = VehBase;
					// Continue on if this is HEAT so it also does explosion damage
					if( !bProjectileIsHEAT )
					{
						ImpactedActor = None;
						return;
					}
				}
				// This shot hit and damaged something on the vehicle, but didn't penetrate
				else if( HitInfos.Length > 0 )
				{
					ProcessVehicleNonPenetrationHits(VehBase, Location, HitNormal, WallComp, HitInfos);
					ImpactedVehicle = VehBase;
					if( !bExplodeOnDeflect )
					{
						// Continue on if this is HEAT so it also does explosion damage
						if( !bProjectileIsHEAT )
						{
							ImpactedActor = None;
							return;
						}
					}
				}
				// This is a deflected shot
				else
				{
					ProcessVehicleDeflection(VehBase, Location, HitNormal, !DoDeflection(Location, Normal(Velocity), ArmorNormal));
					// Continue on if its an "explode on deflect" so it can be caused to explode further on in this function
					if( !bExplodeOnDeflect )
					{
						ImpactedActor = None;
						return;
					}
				}
				// If you get here, the code will continue and do regular explosion and effects
			}
			// Client side vehicle hit
			else
			{
				ImpactedActor = None;
				WaitForDestruction();
				return;
			}
		}
		else if ( DamageRadius == 0 )
		{
			Wall.TakeDamage( ImpactDamage, Instigator.Controller, Location, MomentumTransfer * Normal(Velocity), ImpactDamageType,, self);
		}
	}

	if ( !bHitAVehicle && bDoSmallArmsPenetration && Instigator.Weapon != none )
	{
		// Convert Trace Information to ImpactInfo type.
		CurrentImpact.HitActor		= Wall;
		CurrentImpact.HitLocation	= Location;
		CurrentImpact.HitNormal		= HitNormal;
		// If the bullet has gone some distance, use the original location
		// instead of velocity for the RayDir. This will give us a more accurate
		// trace back to the original firing location, especially when we
		// replicate this stuff - Ramm
		if( OrigLoc != Location )
		{
		   CurrentImpact.RayDir	= Normal(Location - OrigLoc);
		}
		else
		{
		   CurrentImpact.RayDir	= Normal(Velocity);
		}

		CurrentImpact.HitInfo.HitComponent = WallComp;
		CurrentImpact.HitInfo.PhysMaterial = WallPhysMaterial;

		Instigator.Weapon.HandleProjectilePenetration(CurrentImpact,OrigLoc,VSizeSq(Velocity)/(MaxSpeed*MaxSpeed));
	}

	if ( !bHitAVehicle && Instigator.Controller != none)
	{
		TeamNum = Instigator.Controller.GetTeamNum();
		foreach WorldInfo.AllPawns(class'ROVehicle', ROV, Location, 1000)
		{
			if ( ROV.Team != TeamNum )
			{
				ROV.LastEnemyEncounterTime = WorldInfo.TimeSeconds;
				ROV.LastCombatEventTime = WorldInfo.TimeSeconds;
			}
		}
	}

	if ( ROVehicle(Instigator) != none )
	{
		ROVehicle(Instigator).LastEnemyEncounterTime = WorldInfo.TimeSeconds;
		ROVehicle(Instigator).LastCombatEventTime = WorldInfo.TimeSeconds;
	}
	else if ( ROWeaponPawn(Instigator) != none )
	{
		ROWeaponPawn(Instigator).MyVehicle.LastEnemyEncounterTime = WorldInfo.TimeSeconds;
		ROWeaponPawn(Instigator).MyVehicle.LastCombatEventTime = WorldInfo.TimeSeconds;
	}

	if( bPenetratedAWall )
	{
		Explode(ImpactLocation, HitNormal);
	}
	else
	{
		PhysicalProperty = WallPhysMaterial == none ? none : ROPhysicalMaterialProperty(WallPhysMaterial.GetPhysicalMaterialProperty(class'ROPhysicalMaterialProperty'));

		if( PhysicalProperty != none && (PhysicalProperty.MaterialType == EMT_Water || PhysicalProperty.MaterialType == EMT_ShallowWater ) )
		{
			bHitWater = true;
		}

		// if we didn't penetrate, that energy is dispersed at the point of impact in the form of a larger blast
		if( Damage < PenetrationDamage )
			Damage = PenetrationDamage;
		if( DamageRadius < PenetrationDamageRadius )
			DamageRadius = PenetrationDamageRadius;
		if( NonPenetrationExplosionTemplate != none )
			ProjExplosionTemplate = NonPenetrationExplosionTemplate;
		Explode(ImpactLocation, HitNormal);
	}

	ImpactedActor = None;
}

defaultproperties
{
	bProjectileIsHEAT=True
	bExplodeOnDeflect=True

	BallisticCoefficient=0.15
	ProjExplosionTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_RPG_impactblast'
	WaterExplosionTemplate=ParticleSystem'FX_VN_Impacts.Water.FX_VN_70mm_Water'
	NonPenetrationExplosionTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_RPG_explosion'
	PenetrationExplosionTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_RPG_exitblast'
	// vehicle penetration
	ProjPenetrateTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_RPG_explosion'
 	ImpactDamage=600
	Damage=150
	DamageRadius=200	// NOTE: This is the exterior damage radius when a rocket penetrates
	PenetrationDamage=300
	PenetrationDamageRadius=500 // This is the interior damage radius when a rocket penetrates and the exterior damage radius when a rocket does NOT penetrate
	MomentumTransfer=50000
	bCollideWorld=true
	Speed=5750		// 115m/s
	MaxSpeed=14750	// 295m/s
	bUpdateSimulatedPosition=true
	ExplosionSound=AkEvent'WW_WEP_RPG.Play_WEP_RPG_Explode'
	PenetrationSound=none //SoundCue'AUD_EXP_AntiTank_German.Discharge.AntiTank_German_Discharge_Cue'
	bRotationFollowsVelocity=true
	MyDamageType=class'RODmgType_RPG7Rocket'
	ImpactDamageType=class'RODmgType_RPG7RocketImpact'
	GeneralDamageType=class'RODmgType_RPG7RocketGeneral'

	AmbientSound=AkEvent'WW_WEP_RPG.Play_WEP_RPG_Projectile_Loop'


	FueledFlightTime=1.5
	InitialAccelerationTime=0.75//0.25
	GradualSpreadMultiplier=2000//600
	SpreadStartDelay=0.35//0
	RocketIgnitionTime=0.11 // seconds after launch when rocket ignites
	Lifespan=4.5

	ShakeScale=5.0//2.3
	//MaxSuppressBlurDuration=12.0 //4.25
	//SuppressBlurScalar=1.4
	//SuppressAnimationScalar=0.6
	//ExplodeExposureScale=0.3//0.45

	Begin Object Name=CollisionCylinder
		CollisionRadius=4
		CollisionHeight=4
		AlwaysLoadOnClient=True
		AlwaysLoadOnServer=True
	End Object

	Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		bIsCharacterLightEnvironment=true
	End Object
	Components.Add(MyLightEnvironment)

	Begin Object Class=StaticMeshComponent Name=ProjectileMesh
		StaticMesh=StaticMesh'WP_VN_3rd_Projectile.Mesh.RPG_Projectile_FinsOut'
		MaxDrawDistance=5000
		CollideActors=true
		CastShadow=false
		LightEnvironment=MyLightEnvironment
		BlockActors=false
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=true
		Scale=1
	End Object
	Components.Add(ProjectileMesh)

	DecalHeight=200
	DecalWidth=200
}
