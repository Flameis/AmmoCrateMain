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

class ACDestructible2 extends Actor;

var ROPlaceableAmmoResupply OwningVolume; // Linked Owning Volume

var 	int 				Health;

var 	StaticMeshComponent 	CrateMesh;
var 	StaticMesh 			DestroyedMesh;

var 	ParticleSystemComponent DestroyedPFX;

var 	bool 					bWaitingForEffects;

var 	AkBaseSoundObject		DestructionSound;


var PhysicsAsset 				DamagedPhys;

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

event TakeDamage(int DamageAmount, Controller EventInstigator, vector HitLocation, vector Momentum, class<DamageType> DamageType, optional TraceHitInfo HitInfo, optional Actor DamageCauser)
{
	// If we're already dead, bail.
	if( Health <= 0 )
		return;

	if( class<RODamageType>(DamageType) != none )
	{
		// Force napalm to insta-kill tunnels
		if( ClassIsChildOf(DamageType, class'RODmgType_Napalm') )
			Health = 0;
		else if( class<RODamageType>(DamageType).default.bCanDamageTunnels )
			Health -= DamageAmount;
	}

	if( Health <= 0 )
	{
		// Update our lifespan.
		Lifespan = 60;

		Shutdown();
		SetTimer(Lifespan, false, 'Destroy');
	}
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
		CrateMesh.SetStaticMesh(DestroyedMesh);
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
	bWorldGeometry=false
	bCollideWorld=false

	Health=200//100

	bStatic=false
	bNoDelete=false
	bHidden=false
	bCanBeDamaged=true

	Begin Object Class=DynamicLightEnvironmentComponent Name=MyLightEnvironment
		bDynamic=false
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
	CrateMesh=DestructibleMeshComponent
	

	Begin Object Class=ParticleSystemComponent Name=DestroyedPFXComp
		Template=ParticleSystem'FX_VEH_Tank_Three.FX_VEH_Tank_B_TankShell_Penetrate'
		bAutoActivate=false
		Translation=(X=0,Y=0,Z=2)
		TranslucencySortPriority=1
	End Object
	DestroyedPFX=DestroyedPFXComp
	Components.Add(DestroyedPFXComp)

	DestructionSound=AkEvent'WW_WEP_Shared.Play_WEP_AmmoCrate_Destroy'
	DestroyedMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
}