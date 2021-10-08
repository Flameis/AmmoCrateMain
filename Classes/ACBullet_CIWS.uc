//=============================================================================
// ACBullet_CIWS
//=============================================================================
// Tracer Bullet for the CIWS
//=============================================================================

class ACBullet_CIWS extends M2BulletTracer;

DefaultProperties
{
	BallisticCoefficient=0.792 // 706.7gr, 0.50 cal, spitzer
	Damage=135
	MyDamageType=class'RODmgType_M2Bullet'
	Speed=44500    		//890m/s
	MaxSpeed=44500      //890m/s
	
	// Customized to have less falloff damage until it really gets to a long range
	VelocityDamageFalloffCurve=(Points=((InVal=0.0,OutVal=0.0),(InVal=316840000,OutVal=1.0),(InVal=1980250000,OutVal=1.0)))
	// VelocityDamageFalloffCurve=(Points=((InVal=0.0,OutVal=0.0),(InVal=0.4,OutVal=1.0),(InVal=1.0,OutVal=1.0)))
}
