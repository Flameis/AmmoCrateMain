//=============================================================================
// ROWeap_M18_SignalSmoke
//=============================================================================
// Weapon class for the American M18 Signal Smoke Grenade
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACWeap_M18_SignalSmoke_Yellow extends ROWeap_M18_SignalSmoke
	abstract;

defaultproperties
{
	WeaponContentClass(0)="AmmoCrate.ACWeap_M18_SignalSmoke_Yellow_Content"
	AmmoClass=class'ACAmmo_M18_Smoke_Yellow'
	WeaponProjectiles(0)=class'ACM18SmokeProjectileYellow'
	WeaponProjectiles(ALTERNATE_FIREMODE)=class'ACM18SmokeProjectileYellow'
	InitialNumPrimaryMags=2
}

