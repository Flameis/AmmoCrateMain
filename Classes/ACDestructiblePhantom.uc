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

class ACDestructiblePhantom extends ACDestructible;

defaultproperties
{
	DestructionSound=AkEvent'WW_EXP_C4.Play_EXP_C4_Explosion'
	DestructionEmitterTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_C4'
	StartingHealth=300

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
		DestructibleAssets(0)=(MeshOverride=StaticMesh'VH_VN_ARVN_Skyraider.Meshes.Skyraider_SM')
        DestructibleAssets(1)=(MeshOverride=StaticMesh'VH_VN_ARVN_Skyraider.Meshes.Skyraider_Wreck_SM')
        StaticMesh=StaticMesh'VH_VN_ARVN_Skyraider.Meshes.Skyraider_SM'
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