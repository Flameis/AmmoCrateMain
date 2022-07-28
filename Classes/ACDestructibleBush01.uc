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

class ACDestructibleBush01 extends ACDestructible;

defaultproperties
{
	StartingHealth=1

	AcceptedDamageTypes(0)=Class'ROGame.RODmgType_RPG7Rocket'
    AcceptedDamageTypes(1)=Class'ROGame.RODmgType_RPG7RocketGeneral'
    AcceptedDamageTypes(2)=Class'ROGame.RODmgType_RPG7RocketImpact'
	AcceptedDamageTypes(3)=Class'ROGame.RODmgType_AC47Gunship'
	AcceptedDamageTypes(4)=Class'ROGame.RODmgType_C4_Explosive'
	AcceptedDamageTypes(5)=Class'ROGame.RODmgType_AntiVehicleGeneral'
	AcceptedDamageTypes(6)=Class'ROGame.RODmgType_Satchel'
	AcceptedDamageTypes(7)=Class'ROGame.RODmgTypeArtillery'
	
	Components.Empty

	Begin Object Name=MyLightEnvironment
		bIsCharacterLightEnvironment=false//true
		bUseBooleanEnvironmentShadowing=false
	End Object
	Components.Add(MyLightEnvironment)
	LightEnvironment=MyLightEnvironment

	Begin Object Name=DestructibleMeshComponent
		StaticMesh=StaticMesh'ENV_JungleTree.Mesh.S_ENV_BushV2_01'
		CollideActors=false
		BlockActors=false
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
		
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent)
	StaticMeshComponent=DestructibleMeshComponent
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
	DestroyedMesh=StaticMesh'ENV_JungleTree.Mesh.S_ENV_Tree_Debris_01'
}