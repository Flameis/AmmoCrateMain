
class ACSatchelChargeProjectile extends ROSatchelChargeProjectile;

defaultproperties
{
	FuseLength=7.0
	LifeSpan=7.0
	Damage=500
	DamageRadius=1000
	RadialDamageFalloffExponent=3.0
	
	Speed=700
	MinSpeed=400
	MaxSpeed=800
	MinTossSpeed=400
	MaxTossSpeed=600
	MomentumTransfer=9000

	ShakeScale=2.5
	MaxSuppressBlurDuration=5.0
	SuppressBlurScalar=1.75
	SuppressAnimationScalar=0.65
	ExplodeExposureScale=0.40
	
	ExplosionOffsetDist=10
}
