//=============================================================================
// M79GrenadeProjectile
//=============================================================================
// 40x46mm grenade projectile for the M79 Grenade Launcher
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACM79GrenadeProjectileWP extends ROImpactGrenadeProjectile;

var float       	    IncDamageRadius; 		// Incremental Damage Radius - grows each time it's called
var float      	    	MaxIncDamageRadius; 	// Max Incremental Damage Radius (damage will stop being delt once IncDamageRadius >= this)
var float     	    	RadiusGrowFactor; 		// Growing Rate Multiplier
var float 				ContinuousDamage; 		// How much damage is delt each second in the fumes (effected by RadialDamageFalloffExponent, set in DoDamageCheck()))
var class<DamageType>	FumeDamageType;			// The fume has it's own damage type to give different results
var bool 				bDebugContinuousDamage; // Debug the radius as a visual sphere
var float 				LastFuseLength;			// Used to track direct FuseLength changes so it can be replicated

simulated function Explode(vector HitLocation, vector HitNormal)
{
	//`log ("[MutExtras Debug]DamageRadius:"@DamageRadius);

	if( !bHitWater )
		SetTimer( 1.0, true, 'DoDamageCheck' );

		// START DEBUG
	if( bShowDamageRadius )
	{
		RenderDamageRadius();
	}
	// END DEBUG

	if (Damage>0 && DamageRadius>0)
	{
		if ( Role == ROLE_Authority  && WorldInfo.NetMode != NM_Client )
			MakeNoise(1.0);
		ProjectileHurtRadius(HitLocation, HitNormal );
	}

	if( bStopAmbientSoundOnExplode && AmbientSound != none && AmbientComponent != none && AmbientComponent.IsPlaying())
	{
		StopAmbientSound();
	}

	if (!bSuppressExplosionFX)
		SpawnExplosionEffects(HitLocation, HitNormal);
}

// It's relevant
simulated function bool EffectIsRelevant(vector SpawnLocation, bool bForceDedicated, optional float VisibleCullDistance = 5000.0, optional float HiddenCullDistance = 350.0)
{
	return true;
}

/** sets any additional particle parameters on the explosion effect required by subclasses */
simulated function SetExplosionEffectParameters(ParticleSystemComponent ProjExplosion)
{
	super.SetExplosionEffectParameters(ProjExplosion);
	ProjExplosion.SetScale(1.f);
}

simulated function DoDamageCheck()
{
	local vector MyGravity;

	if ( Role == ROLE_Authority )
	{
		MyGravity.Z = PhysicsVolume.GetGravityZ();

		RadialDamageFalloffExponent = 0.5;

		// Set all the main values because ProjectileHurtRadius() uses them
		Damage = ContinuousDamage;
		DamageRadius = IncDamageRadius;
		MyDamageType = FumeDamageType;
		MomentumTransfer = 0;

		ProjectileHurtRadius(Location, -Normal(MyGravity));
		//HurtRadius( ContinuousDamage, IncDamageRadius, FumeDamageType, 0, Location, Instigator );
	}

	if ( bDebugContinuousDamage )
	{
   		DrawDebugSphere(Location, IncDamageRadius,8,255,255, 0,true);
	}

	// Semi-deprecated, we're just using a standard radius check now, but this still controls the lifespan of the projectile
	if( IncDamageRadius < MaxIncDamageRadius )
	{
		IncDamageRadius *= RadiusGrowFactor;
	}
	else
	{
		//ClearTimer('DoDamageCheck');
		//ShutDown(); // This forces bWaitForEffects to work and allows our smoke to continue drifting into the air
	}
}

defaultproperties
{
	BallisticCoefficient=1.0
	AccelRate = 1.0
	MyImpactDamageType=class'RODmgType_M79GrenadeImpact'
	MyExpImpactDamageType=class'RODmgType_M79GrenadeExpImpact'
	MyDamageType=class'RODmgType_M34Grenade'
	ImpactDamage=200//85
	Damage=250
	DamageRadius=500
	RadialDamageFalloffExponent=2
	ArmingDistanceSq = 800000.0	// 15m
	bUpdateSimulatedPosition = true;
	MomentumTransfer=1
	Speed=3800 // 76 M/S
	MaxSpeed=3800	// 76 M/S

	//ShakeScale=2.0
	//MaxSuppressBlurDuration=12.0 //4.5
	//SuppressBlurScalar=1.5
	//SuppressAnimationScalar=0.6
	//ExplodeExposureScale=0.45

	ProjExplosionTemplate=ParticleSystem'FX_VN_Phosphor.Explosions.FX_VN_Phosphorus_Grenade'//ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_40mm'
	WaterExplosionTemplate=ParticleSystem'FX_VN_Phosphor.Explosions.FX_VN_Phosphorus_Grenade'
	ExplosionSound=AkEvent'WW_EXP_M34WP.Play_EXP_M34WP_Explosion'
	//AmbientSound=AkEvent'AUD_VN_EXP_Launcher_M79.Fire_3P.Launcher_M79_Projectile_Cue'

	Begin Object Class=StaticMeshComponent Name=ProjectileMesh
		StaticMesh=StaticMesh'WP_VN_3rd_Projectile.Mesh.M79_Projectile'
		MaxDrawDistance=5000
		CollideActors=true
		CastShadow=false
		LightEnvironment=MyLightEnvironment
		BlockActors=false
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false // Must be false to avoid serious collision issues!
		Scale=1
	End Object
	Components.Add(ProjectileMesh)

	bBounce = true			// Low enough volume of these that we can see them bounce around if they don't detonate
	Bounces = 6

	DecalHeight=625
	DecalWidth=625
	
	LifeSpan=6.0
	
	FumeDamageType=class'RODmgType_WhitePhosphorusFumes'
	ContinuousDamage=40//40
	IncDamageRadius=300 //200
	MaxIncDamageRadius=400 //300
	RadiusGrowFactor=1.0//1.1
	bAlwaysRelevant=true
	bNetTemporary=false
}
