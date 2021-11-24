//=============================================================================
// ROAmmo_Placeable_AmmoCrate
//=============================================================================
// Ammo properties for the prototype placeable Ammo Crate
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Callum Coombes @ Antimatter Games LTD
//=============================================================================
class ACAmmo_Placeables extends ROAmmunition
	abstract;

defaultproperties
{
	CompatibleWeaponClasses(1)=class'ACItemPlaceable'

	InitialAmount=1
	Weight=0
	ClipsPerSlot=1
}
