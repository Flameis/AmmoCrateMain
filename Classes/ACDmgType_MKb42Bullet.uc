//=============================================================================
// ACDmgType_MKb42Bullet
//=============================================================================
// Damage type for a bullet fired from the MKb42 Assault Rifle
//=============================================================================
// RO: Heroes of Stalingrad Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class ACDmgType_MKb42Bullet extends RODmgType_SmallArmsBullet
	abstract;

defaultproperties
{
	WeaponShortName="MKb42"
	KDamageImpulse=300
	BloodSprayTemplate=ParticleSystem'FX_VN_Impacts.BloodNGore.FX_VN_BloodSpray_Clothes_large'
}
