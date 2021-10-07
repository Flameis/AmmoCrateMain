//=============================================================================
// ROAmmo_792x33_MKb42Mag
//=============================================================================
// Ammo properties for the 7.92 x 33 mm Kurz MKb42 magazine
//=============================================================================
// Project DVA Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class ROAmmo_792x33_MKb42Mag extends ROAmmunition
    abstract;

defaultproperties
{
    CompatibleWeaponClasses(0)=class'AmmoCrate.ROWeap_MKb42_AssaultRifle'

    InitialAmount=30
    Weight=0.64
    ClipsPerSlot=2
}
