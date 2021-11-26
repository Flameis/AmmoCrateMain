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

class ACDestructibleSandbag extends ACDestructible;

simulated event PostBeginPlay()
{
	Health = StartingHealth;
	LightEnvironment.SetEnabled(TRUE);
	super.PostBeginPlay();
}

defaultproperties
{
	StartingHealth=800

	AcceptedDamageTypes(0)=Class'ROGame.RODmgType_RPG7Rocket'
    AcceptedDamageTypes(1)=Class'ROGame.RODmgType_RPG7RocketGeneral'
    AcceptedDamageTypes(2)=Class'ROGame.RODmgType_RPG7RocketImpact'
	AcceptedDamageTypes(3)=Class'ROGame.RODmgType_AC47Gunship'
	AcceptedDamageTypes(4)=Class'ROGame.RODmgType_C4_Explosive'
	AcceptedDamageTypes(5)=Class'ROGame.RODmgType_AntiVehicleGeneral'
	AcceptedDamageTypes(6)=Class'ROGame.RODmgType_M18_Claymore'
	AcceptedDamageTypes(7)=Class'ROGame.RODmgType_MattockBash'
	AcceptedDamageTypes(8)=Class'ROGame.RODmgType_Satchel'
	AcceptedDamageTypes(9)=Class'ROGame.RODmgTypeArtillery'

	Begin Object Name=MyLightEnvironment
		bEnabled=true
	   	bAffectedBySmallDynamicLights=FALSE
	   	MinTimeBetweenFullUpdates=0.15
		bShadowFromEnvironment=true
		bForceCompositeAllLights=true
		bDynamic=false
		bIsCharacterLightEnvironment=true
	End Object
	LightEnvironment=MyLightEnvironment
	Components.Add(MyLightEnvironment)

	Begin Object Name=DestructibleMeshComponent
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
	
	Begin Object Name=DestroyedPFXComp
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