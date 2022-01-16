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

class ACDestructiblePrefab extends ACDestructible
	config(AmmoCrate);

var() 	array<StaticMeshComponent>			StaticMeshComponent;
var 	array<StaticMesh>					DestroyedMesh;

simulated function PlayDestructionEffects()
{
	//local vector HitLoc, HitNorm, StartLoc, EndLoc;
	local int I;
	if ( WorldInfo.NetMode != NM_DedicatedServer )
	{
		for (I=0; I<StaticMeshComponent.Length; I++)
		{
			StaticMeshComponent[I].SetStaticMesh(DestroyedMesh[I]);
			
			//StartLoc = self.Location + StaticMeshComponent[I].Translation;
			//EndLoc = StartLoc;
			//EndLoc.Z = EndLoc.Z - 20000;
			//Trace(HitLoc, HitNorm, EndLoc, StartLoc);
			//StaticMeshComponent[I].SetTranslation(HitLoc);
		}

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
	StartingHealth=500//100

	Begin Object Name=MyLightEnvironment
		bEnabled=true
	End Object
	LightEnvironment=MyLightEnvironment
	Components.Add(MyLightEnvironment)

	Begin Object class=StaticMeshComponent Name=DestructibleMeshComponent0
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
	StaticMeshComponent[0]=DestructibleMeshComponent0
	Components.Add(DestructibleMeshComponent0)
	CollisionComponent=DestructibleMeshComponent0
	
	Begin Object Name=DestroyedPFXComp
		Template=ParticleSystem'FX_VEH_Tank_Three.FX_VEH_Tank_B_TankShell_Penetrate'
		bAutoActivate=false
		Translation=(X=0,Y=0,Z=2)
		TranslucencySortPriority=1
	End Object
	DestroyedPFX=DestroyedPFXComp
	Components.Add(DestroyedPFXComp)

	DestructionSound=AkEvent'WW_Global.Play_GLO_Spawn_Tunnel_Destroyed'
	DestroyedMesh[0]=StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_scatter'
}