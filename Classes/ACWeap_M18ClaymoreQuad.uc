//-----------------------------------------------------------
// Modified projectile that is allowed to have 4 at a time
// Edited for the 29th by Reimer, Tested and Published by Scovel
//-----------------------------------------------------------
class ACWeap_M18ClaymoreQuad extends ROWeap_M18_Claymore;

DefaultProperties
{
	InitialNumPrimaryMags=4
	MaxAmmoCount=4
	WeaponContentClass(0)="AmmoCrate.ACWeap_M18ClaymoreQuadContent"
	PlantedChargeClass=class'ACM18ClaymoreMine'

	WeaponProjectiles(0)=class'ACM18ClaymoreMine'
}
