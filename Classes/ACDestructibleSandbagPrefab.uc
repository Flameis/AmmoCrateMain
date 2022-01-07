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

class ACDestructibleSandbagPrefab extends ACDestructiblePrefab;

defaultproperties
{
	StartingHealth=1000

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

	Begin Object Name=DestructibleMeshComponent0
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=-96,Y=128,Z=-0.1)
		Rotation=(Pitch=0,Yaw=0,Roll=0)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false
		
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent0)
	StaticMeshComponent[0]=DestructibleMeshComponent0
	CollisionComponent=DestructibleMeshComponent0

	Begin Object Class=StaticMeshComponent Name=DestructibleMeshComponent1
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu_90deg_left'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=16,Y=128,Z=-0.1)
		Rotation=(Pitch=0,Yaw=0,Roll=0)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false	
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent1)
	StaticMeshComponent[1]=DestructibleMeshComponent1

	Begin Object Class=StaticMeshComponent Name=DestructibleMeshComponent2
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=96,Y=64,Z=-16.1)
		Rotation=(Pitch=0,Yaw=-16384,Roll=0)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false	
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent2)
	StaticMeshComponent[2]=DestructibleMeshComponent2

	Begin Object Class=StaticMeshComponent Name=DestructibleMeshComponent3
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu_90deg_left'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=96,Y=-48,Z=-0.1)
		Rotation=(Pitch=0,Yaw=-16384,Roll=0)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false	
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent3)
	StaticMeshComponent[3]=DestructibleMeshComponent3

	Begin Object Class=StaticMeshComponent Name=DestructibleMeshComponent4
		StaticMesh=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
		CollideActors=true
		BlockActors=true
		BlockZeroExtent=true
		BlockNonZeroExtent=true
		BlockRigidBody=false
		bNotifyRigidBodyCollision=false
		Translation=(X=32,Y=-128,Z=-0.1)
		Rotation=(Pitch=0,Yaw=-32768,Roll=0)
		CastShadow=true
		bCastDynamicShadow=true
		//bAllowMergedDynamicShadows=false
		bUsePrecomputedShadows=false
		bForceDirectLightMap=false	
		LightEnvironment=MyLightEnvironment
	End Object
	Components.Add(DestructibleMeshComponent4)
	StaticMeshComponent[4]=DestructibleMeshComponent4
	

	Begin Object Name=DestroyedPFXComp
		Template=ParticleSystem'FX_VN_Weapons.Explosions.FX_VN_C4'
		bAutoActivate=false
		Translation=(X=0,Y=0,Z=2)
		TranslucencySortPriority=1
	End Object
	DestroyedPFX=DestroyedPFXComp
	Components.Add(DestroyedPFXComp)

	DestructionSound=AkEvent'WW_EXP_C4.Play_EXP_C4_Explosion'
	DestroyedMesh[0]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
	DestroyedMesh[1]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
	DestroyedMesh[2]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
	DestroyedMesh[3]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
	DestroyedMesh[4]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu_90deg_left'
}