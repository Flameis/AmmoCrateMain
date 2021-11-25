//=============================================================================
// ROStaticMeshDestructible
//=============================================================================
// Destroyable Static Mesh(replicated via RODestructibleReplicationInfo)
//=============================================================================
// Red Orchestra Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - Dayle "Xienen" Flowers
// All Rights Reserved.
//=============================================================================

class ACDestructible extends Actor
	config(AmmoCrate);

var()	array<class<DamageType> >	AcceptedDamageTypes;	// Types of Damage that harm this Destructible
var()	int							StartingHealth;			// Initial Health of this Destructible
var		int							Health;					// Current Health of this Destructible
var 	StaticMeshComponent 		DestructibleMesh;
var 	StaticMesh 					DestroyedMesh;
var 	ParticleSystemComponent 	DestroyedPFX;
var 	AkBaseSoundObject			DestructionSound;
var 	bool 						bWaitingForEffects;

enum ECrateMeshDisplayStuats
{
	CMDS_Default,
	CMDS_Destroyed,
};

var repnotify ECrateMeshDisplayStuats CrateDisplayStatus;

var() DynamicLightEnvironmentComponent LightEnvironment;

replication
{
	if (Role == ROLE_Authority)
		CrateDisplayStatus;
}

simulated event ReplicatedEvent( name VarName )
{
	if (VarName == 'CrateDisplayStatus')
	{
		UpdateMeshStatus(CrateDisplayStatus);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event PostBeginPlay()
{
	Health = StartingHealth;
	LightEnvironment.SetEnabled(TRUE);
	SetTickIsDisabled(false);
}

event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int i;
	// If we're already dead, bail.
	if( Health <= 0 )
		return;

	for ( i = 0; i < AcceptedDamageTypes.Length; i++ )
	{
		if ( ClassIsChildOf(DamageType, AcceptedDamageTypes[i]) )
		{
			Health -= DamageAmount;
			break;
		}
	}

	if( Health <= 0 )
	{
		// Update our lifespan.
		Lifespan = 60;

		Shutdown();
		SetTimer(Lifespan, false, 'Destroy');
	}
	super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
}

simulated event UpdateMeshStatus(ECrateMeshDisplayStuats newStatus )
{
	CrateDisplayStatus = newStatus;

	if( WorldInfo.NetMode != NM_DedicatedServer )
	{
		if( CrateDisplayStatus == CMDS_Destroyed )
			PlayDestructionEffects();
	}
}

// Overridden so we can hang around for 60 seconds and then get destroyed. -Nate
simulated event ShutDown()
{
	if(Health <= 0 && CrateDisplayStatus != CMDS_Empty)
	{
		UpdateMeshStatus(CMDS_Destroyed);
	}

	SetPhysics(PHYS_None);

	// shut down collision
	SetCollision(false, false);
	if (CollisionComponent != None)
	{
		CollisionComponent.SetBlockRigidBody(false);
	}

	// So joining clients see me.
	ForceNetRelevant();

	if (RemoteRole != ROLE_None)
	{
		// force replicate flags if necessary
		SetForcedInitialReplicatedProperty(Property'Engine.Actor.bCollideActors', (bCollideActors == default.bCollideActors));
		SetForcedInitialReplicatedProperty(Property'Engine.Actor.bBlockActors', (bBlockActors == default.bBlockActors));
		SetForcedInitialReplicatedProperty(Property'Engine.Actor.bHidden', (bHidden == default.bHidden));
		SetForcedInitialReplicatedProperty(Property'Engine.Actor.Physics', (Physics == default.Physics));
	}

	NetUpdateFrequency = 0.1;
	// force immediate network update of these changes
	bForceNetUpdate = TRUE;
}

simulated function PlayDestructionEffects()
{
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		DestructibleMesh.SetStaticMesh(DestroyedMesh);
		DestroyedPFX.SetActive(true);

		if ( DestructionSound != none )
		{
			PlaySoundBase(DestructionSound, true);
		}
	}
}

defaultproperties
{
	RemoteRole=ROLE_SimulatedProxy

	bCollideActors=true
	bBlockActors=true
	CollisionType=COLLIDE_BlockAll
	bProjTarget=true
	bWorldGeometry=true
	bCollideWorld=false

	StartingHealth=500//100

	bStatic=false
	bNoDelete=false
	bHidden=false
	bCanBeDamaged=true

	Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		bIsCharacterLightEnvironment=false//true
	End Object
	Components.Add(MyLightEnvironment)
	LightEnvironment=MyLightEnvironment

	Begin Object Class=StaticMeshComponent Name=DestructibleMeshComponent
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=0,Y=0,Z=2)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false
		MaxDrawDistance=7500
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent)
	DestructibleMesh=DestructibleMeshComponent
	

	Begin Object Class=ParticleSystemComponent Name=DestroyedPFXComp
		Template=ParticleSystem'FX_VEH_Tank_Three.FX_VEH_Tank_B_TankShell_Penetrate'
		bAutoActivate=false
		Translation=(X=0,Y=0,Z=2)
		TranslucencySortPriority=1
	End Object
	DestroyedPFX=DestroyedPFXComp
	Components.Add(DestroyedPFXComp)

	DestructionSound=AkEvent'WW_Global.Play_GLO_Spawn_Tunnel_Destroyed'
	DestroyedMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
}