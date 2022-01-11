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

var()	array<class<DamageType> >			AcceptedDamageTypes;	// Types of Damage that harm this Destructible
var()	int									StartingHealth;			// Initial Health of this Destructible
var		int									Health;					// Current Health of this Destructible
var 	StaticMesh 							DestroyedMesh;
var 	ParticleSystemComponent 			DestroyedPFX;
var 	AkBaseSoundObject					DestructionSound;
var 	bool 								bWaitingForEffects;
var 	vector								ConfigLoc, Bounds;
var 	rotator								ConfigRot;
var		float								DrawSphereRadius;

enum ECrateMeshDisplayStuats
{
	CMDS_Default,
	CMDS_Destroyed,
};

var repnotify ECrateMeshDisplayStuats 			CrateDisplayStatus;
var repnotify StaticMeshComponent				StaticMeshComponent;
var repnotify DynamicLightEnvironmentComponent 	LightEnvironment;

replication
{
	if (bNetDirty)
		CrateDisplayStatus, StaticMeshComponent, LightEnvironment;
}

simulated event ReplicatedEvent( name VarName )
{
	if (VarName == 'CrateDisplayStatus')
	{
		UpdateMeshStatus(CrateDisplayStatus);
	}
	else if (VarName == 'StaticMeshComponent')
	{
		UpdateMeshStatus(CrateDisplayStatus);
	}
	else if (VarName == 'LightEnvironment')
	{
		LightEnvironment.SetEnabled(true);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
}

simulated event PostBeginPlay()
{
	StaticMeshComponent = StaticMeshComponent;
	LightEnvironment = LightEnvironment;
	Health = StartingHealth;
	//`log ("ACDestructible::PostBeginPlay()");
	ForceNetRelevant();
	super.PostBeginPlay();
}

event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	local int i;

	if (ClassIsChildOf(DamageType, class'RODamageType_CannonShell') || ClassIsChildOf(DamageType, class'RODmgType_Satchel'))
	{
		AcceptedDamageTypes.additem(DamageType);
	}
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
		Lifespan = 20;

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
		else
			StaticMeshComponent.SetStaticMesh(StaticMeshComponent.StaticMesh);
	}
}

// Overridden so we can hang around for 60 seconds and then get destroyed.
simulated event ShutDown()
{
	if(Health <= 0)
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

	//NetUpdateFrequency = 0.1;
	// force immediate network update of these changes
	bForceNetUpdate = TRUE;
}

simulated function PlayDestructionEffects()
{
	//local vector HitLoc, HitNorm, StartLoc, EndLoc;
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		StaticMeshComponent.SetStaticMesh(DestroyedMesh);
		
		//StartLoc = self.Location + StaticMeshComponent.Translation;
		//EndLoc = StartLoc;
		//EndLoc.Z = EndLoc.Z - 2000;
		//Trace(HitLoc, HitNorm, EndLoc, StartLoc);
		//StaticMeshComponent.StaticMesh.SetLocation(HitLoc);
		
		DestroyedPFX.SetActive(true);

		if ( DestructionSound != none )
		{
			PlaySoundBase(DestructionSound, true);
		}
	}
}

defaultproperties
{
	ConfigLoc  = (X=0,Y=-55,Z=0)
	ConfigRot  = (Pitch=0,Yaw=90,Roll=90)
	Bounds	   = (X=62,Y=15,Z=32)
	DrawSphereRadius = 66

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

	Begin Object class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		bEnabled=true
	   	/*bAffectedBySmallDynamicLights=FALSE
	   	MinTimeBetweenFullUpdates=0.15
		bShadowFromEnvironment=true
		bForceCompositeAllLights=true
		bDynamic=false
		bIsCharacterLightEnvironment=true*/
	End Object
	LightEnvironment=MyLightEnvironment
	Components.Add(MyLightEnvironment)

	Begin Object class=StaticMeshComponent Name=DestructibleMeshComponent
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
		LightingChannels=(Dynamic=TRUE,Unnamed_1=FALSE,bInitialized=TRUE)
		LightEnvironment = MyLightEnvironment
		CastShadow=true
		DepthPriorityGroup=SDPG_World
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
	End Object
	StaticMeshComponent=DestructibleMeshComponent
	Components.Add(DestructibleMeshComponent)
	CollisionComponent=DestructibleMeshComponent
	
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