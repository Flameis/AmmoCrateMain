//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceable extends ROItemPlaceable
	abstract;
	
DefaultProperties
{
	bNoAccuracyStat=true
	WeaponClassType=ROWCT_Equipment

	Begin Object Class=SkeletalMeshComponent Name=PreviewSkeletalMeshComponent
		Materials(0)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(1)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(2)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(3)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		RBChannel=RBCC_Nothing
		DepthPriorityGroup=SDPG_World
		AbsoluteTranslation=true
		AbsoluteRotation=true
		AbsoluteScale=true
		Translation=(X=0,Y=0,Z=0)
		TranslucencySortPriority=9999
	End Object
	PreviewSkeletalMesh=PreviewSkeletalMeshComponent

	Begin Object Class=StaticMeshComponent Name=PreviewStaticMeshComponent
		Materials(0)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(1)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(2)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		Materials(3)=MaterialInstanceConstant'FX_VN_Materials.Materials.M_PlaceableItem'
		CollideActors=false
		BlockActors=false
		BlockZeroExtent=false
		BlockNonZeroExtent=false
		BlockRigidBody=false
		RBChannel=RBCC_Nothing
		DepthPriorityGroup=SDPG_World
		AbsoluteTranslation=true
		AbsoluteRotation=true
		AbsoluteScale=true
		Translation=(X=0,Y=0,Z=0)
		TranslucencySortPriority=9999
	End Object
	PreviewStaticMesh=PreviewStaticMeshComponent

	FiringStatesArray(ALTERNATE_FIREMODE)=none

	PlaceOffset=59
	ForwardPlaceOffset=85
	MaxPlacingSurfaceDegrees=10
	VehicleDetectionRadius=25.0

	TraceForwardOffset=17.5
	TraceDownOffset=90
	TraceExtentSize=3
	MinDistFromTraceLocation=30

	MaxVelBeforeUpdatePlaceLocation=25

	PlaceStandingDist=100
	PlaceCrouchDist=60
	DownTraceDist=25
	MaxAngleForViewDirForStanding=38.2
	MaxAngleForViewDirForCrouching=50

	// Ammo
	MaxAmmoCount=1
	bUsesMagazines=false
	InitialNumPrimaryMags=1
	bPlusOneLoading=false
	bCanReloadNonEmptyMag=false
	PenetrationDepth=0
	MaxPenetrationTests=0
	MaxNumPenetrations=0

	ZoomInTime=0.25//0.3
	ZoomOutTime=0.25

	EquipTime=+0.3//0.5
	PutDownTime=+0.3//0.5

	bUsesFreeAim=false
	bHasIronSights=true

	//PlayerViewOffset=(X=1,Y=5,Z=-2)
	//ShoulderedPosition=(X=3,Y=3.5,Z=-1.0)
	//ShoulderRotation=(Pitch=-300,Yaw=500,Roll=1500)

	PlayerViewOffset=(X=3.0,Y=4.5,Z=-1.25)
	ShoulderedPosition=(X=2.0,Y=2.0,Z=-0.5)
	//ShoulderedTime=0.5//0.35

	Category=ROIC_PlaceableEquipment
	Weight=0 //0.4 // kg

	PlayerIronSightFOV=12.5 // 4X // changed to better fit the scale of the levels

	InventoryWeight=0

	AIRating=0.05

	BadPlacementColour=(R=0.3,G=0.005,B=0.005,A=1.0) 	// Red colour
	GoodPlacementColour=(R=0.3,G=0.3,B=0.3,A=1.0) 	// grey/white colour

	bPlacingUsesSingleAnim=true
	bPlacingLengthBasedOnAnims=false
	PlacingLength=8.0f

	PlacingDirtSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Dirt'
	PlacingRockSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Rock'
	PlacingMetalSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Metal'
	PlacingWoodSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Wood'
	PlacingWaterSound=AkEvent'WW_WEP_Shared.Play_WEP_Placeable_HMG_Place_Down_Water'
}
