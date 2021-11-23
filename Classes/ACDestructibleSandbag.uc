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

class ACDestructibleSandbag extends ACDestructibles;

defaultproperties
{
	StartingHealth=100

	bEdShouldSnap=true
	bTickIsDisabled=false
	bStatic=false
	bNoDelete=false
	bMovable=false
	bCollideActors=true
	bBlockActors=true
	bWorldGeometry=true
	bGameRelevant=true
	bRouteBeginPlayEvenIfStatic=false
	bCollideWhenPlacing=false
	bCanBeDamaged=true
	bProjTarget=true
	bPathColliding=true

	Components.Empty

	Begin Object Name=MyLightEnvironment
		bEnabled=TRUE
	End Object
	Components.Add(MyLightEnvironment)

	Begin Object Name=Sphere
		SphereRadius=10.0
	End Object
	DestructionEmitterOffsetVis=Sphere
	Components.Add(Sphere)

	Begin Object Name=DestructibleStaticMeshComponent0
		DestructibleAssets(0)=(MeshOverride=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu')
        DestructibleAssets(1)=(MeshOverride=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter')
        StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
       	WireframeColor=(B=0,G=80,R=255,A=255)
       	ReplacementPrimitive=None
       	CachedMaxDrawDistance=12000.000000
       	PreviewEnvironmentShadowing=122
       	bAllowApproximateOcclusion=True
       	bCastDynamicShadow=True
       	LightingChannels=(bInitialized=True,Dynamic=True)
	End Object
	CollisionComponent=DestructibleStaticMeshComponent0
	DestructibleMeshComponent=DestructibleStaticMeshComponent0
	Components.Add(DestructibleStaticMeshComponent0)
}