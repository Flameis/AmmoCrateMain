//=============================================================================
// ROVCPlaceableAmmoResupplyCrate
//=============================================================================
// VC Physical representation of the crate and it's collision (not the resupply volume)
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Nate Steger @ Antimatter Games
//=============================================================================

class ACVCPlaceableAmmoResupplyCrate extends ROVCPlaceableAmmoResupplyCrate;

DefaultProperties
{
	RemoteRole=ROLE_SimulatedProxy
	NetPriority = 3
	bAlwaysRelevant = true
}