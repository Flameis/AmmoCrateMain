//=============================================================================
// ROAmmo_40x46_M79Grenade
//=============================================================================
// Ammo properties for the 40 x 46 mm M79 Grenade
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACAmmo_40x46_M79Grenade extends ROAmmunition;

defaultproperties
{
	CompatibleWeaponClasses(0)=class'ROGame.ROWeap_M79_GrenadeLauncher'
	InitialAmount=1
	Weight=0.25
	ClipsPerSlot=2 // so we can fit 9 grenades into 8 slots (ammo is capped at 8 by inventory manager) - Comment relating to ClipsPerSlot=1.5
}
