//RPG Rocket for killing tanks
//=============================================================================
class ACBullet_PG7VRocket extends PG7VRocket;

var MutExtras 	ACM;

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
	local int TeamNum, I;
	local array<string> ROVName;
	local bool bNameIsBad;
	//local ROProjectile ROProj;
	local ROGameInfo ROGI;

	// debugging info
	if (bDebugBallistics)
	{
		`log ("[MutExtras Debug]BulletImpactLoc="$Location@"BulletImpactNormal="$HitNormal);
		`log ("[MutExtras Debug]BulletImpactVel="$VSize(Velocity) / 50.0$" M/S BulletDist="$(VSize(Location - OrigLoc) / 50.0)$" BulletDrop="$((TraceHitLoc.Z - Location.Z) / 50.0));

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
	ROV = ROVehicle(VehBase);

	if ( !Wall.bStatic /*&& !Wall.bWorldGeometry*/ ) // Damaging non-Static world geometry so we can damage destructible meshes - Ramm
	{
		if( VehBase != none )
		{
			bHitAVehicle=true;
			// On the server do the damage/sounds, on the client just disappear,
			// as we want all effect to be handled server side so we can do stuff
			// like random penetration probability
			if( Role == ROLE_Authority )
			{	
				// ReplicatedEffectLocation = Location;
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				//Split the name into an array 
				ROVName = splitstring((string(vehbase.name)), "_", true);
				//`log ("[MutExtras Debug]TESTING DAMAGE ON "$vehbase.name);

				//Sees if the vehicle is a vehicle we don't want to damage
				for (I = 0; I < ROVName.length ; I++)
				{
					if (ROVName[I] ~= "ACAV" || ROVName[I] ~= "ROHeli" || ROVName[I] ~= "Skis")
					{
					bNameIsBad = true;
					//`log ("[MutExtras Debug]bNameIsBad = true");
					}
				}

				//If it isn't then see if it needs to be blown up
				if (!bNameIsBad && !ROV.bDeadVehicle)
				{
					ROGI = ROGameInfo(WorldInfo.Game);
					ACM = MutExtras(ROGI.BaseMutator);			
					ACM.NameExists(VehBase);
				}
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	ImpactDamage=350
	Damage=100
	DamageRadius=200
	MomentumTransfer=43000
	
	Caliber=85
	ActualRHA=58
	TestPlateHardness=400
	SlopeEffect=0.09559
	ShatterNumber=0.85
	ShatterTd=0.85
	ShatteredPenEffectiveness=0.8
	
	PenetrationDepth=95
	MaxPenetrationTests=6
}