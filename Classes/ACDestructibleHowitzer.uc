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

class ACDestructibleHowitzer extends ACDestructible;

defaultproperties
{
	DestructionSound=AkEvent'WW_EXP_C4.Play_EXP_C4_Explosion'
	DestructionEmitterTemplate=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_C4'
	StartingHealth=300

	AcceptedDamageTypes(0)=Class'ROGame.RODmgType_RPG7Rocket'
    AcceptedDamageTypes(1)=Class'ROGame.RODmgType_RPG7RocketGeneral'
    AcceptedDamageTypes(2)=Class'ROGame.RODmgType_RPG7RocketImpact'
	AcceptedDamageTypes(3)=Class'ROGame.RODmgType_AC47Gunship'
	AcceptedDamageTypes(4)=Class'ROGame.RODmgType_C4_Explosive'
	AcceptedDamageTypes(5)=Class'ROGame.RODmgType_AntiVehicleGeneral'
	AcceptedDamageTypes(6)=Class'ROGame.RODmgType_Satchel'
	AcceptedDamageTypes(7)=Class'ROGame.RODmgTypeArtillery'

	bTickIsDisabled=false
	bStatic=false
	bNoDelete=false
	bMovable=true
	bCollideActors=true
	bBlockActors=true
	CollisionType=COLLIDE_BlockAll
	bWorldGeometry=false
	bCollideWorld=false
	bGameRelevant=true
	bCollideWhenPlacing=false
	bCanBeDamaged=true
	bProjTarget=true
	bPathColliding=true
	bCanStepUpOn=true;

	Components.Empty

	Begin Object  Name=MyLightEnvironment
		bEnabled=TRUE
		bDynamic=FALSE
		bCastShadows=true
	    bIsCharacterLightEnvironment=true
	    bAffectedBySmallDynamicLights=FALSE
	    bSynthesizeSHLight=false
	    bUseBooleanEnvironmentShadowing=false
	End Object
	Components.Add(MyLightEnvironment)

	Begin Object Name=Sphere
		SphereRadius=10.0
	End Object
	DestructionEmitterOffsetVis=Sphere
	Components.Add(Sphere)

	Begin Object Name=DestructibleStaticMeshComponent0
		DestructibleAssets(0)=(MeshOverride=StaticMesh'VH_VN_US_M102Howitzer.Meshes.VH_VN_M102_Howitzer_up')
        DestructibleAssets(1)=(MeshOverride=StaticMesh'VH_VN_US_M102Howitzer.Meshes.VH_VN_M102_destroyed')
        StaticMesh=StaticMesh'VH_VN_US_M102Howitzer.Meshes.VH_VN_M102_Howitzer_up'
       	WireframeColor=(B=0,G=80,R=255,A=255)
       	CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false
		MaxDrawDistance=15000
		LightEnvironment=MyLightEnvironment
	End Object
	CollisionComponent=DestructibleStaticMeshComponent0
	DestructibleMeshComponent=DestructibleStaticMeshComponent0
	Components.Add(DestructibleStaticMeshComponent0)
}