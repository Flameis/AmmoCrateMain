//=============================================================================
// ACBullet_MKB42
//=============================================================================
// Bullet for the MKb42 Assault Rifle
//=============================================================================
// RO: Heroes of Stalingrad Source
// Copyright (C) 2010 Tripwire Interactive LLC
// - John "Ramm-Jaeger" Gibson
//=============================================================================

class ACBullet_MKB42 extends ROBullet;

//=============================================================================
// defaultproperties
//=============================================================================

defaultproperties
{
	BallisticCoefficient=0.138
	Damage=450
	MyDamageType=class'ACDmgType_ACBullet_MKB42'
	Speed=34300 // 686 M/S
	MaxSpeed=34300 // 686 M/S

	VelocityDamageFalloffCurve=(Points=((InVal=302760000,OutVal=0.46),(InVal=1560250000,OutVal=0.12)))

	DragFunction=RODF_G7
}
