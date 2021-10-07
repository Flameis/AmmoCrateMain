//=============================================================================
// MKb42Bullet
//=============================================================================
// Bullet for the MKb42 Assault Rifle
//=============================================================================
// RO: Heroes of Stalingrad Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class MKb42Bullet extends ROBullet;

//=============================================================================
// defaultproperties
//=============================================================================

defaultproperties
{
	BallisticCoefficient=0.138
	Damage=450
	MyDamageType=class'RODmgType_MKb42Bullet'
	Speed=34300 // 686 M/S
	MaxSpeed=34300 // 686 M/S

	VelocityDamageFalloffCurve=(Points=((InVal=302760000,OutVal=0.46),(InVal=1560250000,OutVal=0.12)))

	DragFunction=RODF_G7
}
