//=============================================================================
// ROItem_Placeable
//=============================================================================
// Placeable Item base class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//============================================================================

class ACItemPlaceableSandbagPrefab extends ACItemPlaceableContent;

simulated function UpdatePreviewMesh()
{
	if ( Instigator != none )
	{
		// Move the preview mesh into place

		/*if ( bPreviewIsSkeletal )
		{
			PreviewSkeletalMesh.SetTranslation(PlaceLoc);
			PreviewSkeletalMesh.SetRotation(PlaceRot);
			PreviewMeshMIC.SetVectorParameterValue('color', bLastCheckSuccessful ? GoodPlacementColour : BadPlacementColour);
		}
		else
		{
			PreviewStaticMesh.SetTranslation(PlaceLoc);
			PreviewStaticMesh.SetRotation(PlaceRot);
			PreviewMeshMIC.SetVectorParameterValue('color', bLastCheckSuccessful ? GoodPlacementColour : BadPlacementColour);
		}*/

	//DrawDebugBox(PlaceLoc, Bounds, 0, 20, 255, false);
	DrawDebugSphere(PlaceLoc, DrawSphereRadius, 20, 0, 0, 255, false);
	//`log("Origin:"@string(PreviewStaticMesh.Bounds.Origin));
	//`log("BoxExtent:"@string(PreviewStaticMesh.Bounds.BoxExtent));
	//`log("SphereRadius:"@string(PreviewStaticMesh.Bounds.SphereRadius));
	}
}

			

defaultproperties
{
	ConfigLoc 			= (X=0,Y=0,Z=0)
	ConfigRot 			= (Pitch=0, Yaw=0, Roll=0)
	Bounds 				= (X=192, Y=256, Z=64)
	DrawSphereRadius 	= 150
	DestructibleClass 	= class'ACDestructibleSandbagPrefab'
	ReferenceStaticMesh = None //StaticMesh'ENV_VN_Sandbags.Mesh.S_ENV_Sandbags_112uu'
}
