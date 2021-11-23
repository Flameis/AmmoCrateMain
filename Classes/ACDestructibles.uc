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

class ACDestructibles extends ROStaticMeshDestructible;

defaultproperties
{
	DestructionEmitterTemplate=ParticleSystem'FX_VEH_Tank_Three.FX_VEH_Tank_B_TankShell_Penetrate'
	StartingHealth=800

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
	DynamicLightEnvironment=MyLightEnvironment
	Components.Add(MyLightEnvironment)

	AcceptedDamageTypes(0)=Class'ROGame.RODmgType_RPG7Rocket'
    AcceptedDamageTypes(1)=Class'ROGame.RODmgType_RPG7RocketGeneral'
    AcceptedDamageTypes(2)=Class'ROGame.RODmgType_RPG7RocketImpact'
    AcceptedDamageTypes(3)=Class'ROGame.RODmgType_Type67Grenade'
	AcceptedDamageTypes(4)=Class'ROGame.RODmgType_M61Grenade'
	AcceptedDamageTypes(5)=Class'ROGame.RODmgType_AC47Gunship'
	AcceptedDamageTypes(6)=Class'ROGame.RODmgType_C4_Explosive'
	AcceptedDamageTypes(7)=Class'ROGame.RODmgType_AntiVehicleGeneral'
	AcceptedDamageTypes(8)=Class'ROGame.RODmgType_M18_Claymore'
	AcceptedDamageTypes(9)=Class'ROGame.RODmgType_M79Grenade'
	AcceptedDamageTypes(10)=Class'ROGame.RODmgType_MAS49Grenade'
	AcceptedDamageTypes(11)=Class'ROGame.RODmgType_MattockBash'
	AcceptedDamageTypes(12)=Class'ROGame.RODmgType_Satchel'
	AcceptedDamageTypes(13)=Class'ROGame.RODmgTypeArtillery'

	Begin Object Name=Sphere
		SphereRadius=10.0
	End Object
	DestructionEmitterOffsetVis=Sphere
	Components.Add(Sphere)
}