//=============================================================================
// ROAmmo_762x25_PPSHStick
//=============================================================================
// Ammo properties for the 7.62 x 25 mm PPSH41 Stick magazine
//=============================================================================
// Red Orchestra Source
// Copyright (C) 2008-2011 Tripwire Interactive LLC
// - Dayle "Xienen" Flowers
//=============================================================================

class TestROAmmo_762x25_PPSHStick extends ROAmmunition
	abstract;

defaultproperties
{
	CompatibleWeaponClasses(0)=class'AmmoCrate.TestWeap_PPSH41_SMG'
	CompatibleWeaponClasses(1)=class'ROGame.ROWeap_K50M_SMG'

	InitialAmount=9999
	Weight=0.67
	ClipsPerSlot=3
}
