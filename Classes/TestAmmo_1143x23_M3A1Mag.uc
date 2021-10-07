//=============================================================================
// ROAmmo_1143x23_M3A1Mag
//=============================================================================
// Ammo properties for the 114.3 x 23mm (.45 ACP) M3A1 Greasegun magazine
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class TestAmmo_1143x23_M3A1Mag extends ROAmmunition
    abstract;

defaultproperties
{
    CompatibleWeaponClasses(0)=class'AmmoCrate.TestWeap_M3A1_SMG'

    InitialAmount=1000000
	Weight=0.8
	ClipsPerSlot=3
}
