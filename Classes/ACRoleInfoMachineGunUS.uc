//=============================================================================
// RORoleInfoSouthernMachineGunnerARVN
//=============================================================================
// Default settings for the ARVN Machine Gunner role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2018 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// Edited for the 29th by Reimer, Published by Scovel
//=============================================================================
class ACRoleInfoMachineGunUS extends RORoleInfoSouthernInfantry
	HideDropDown;

DefaultProperties
{
	RoleType=RORIT_MachineGunner
	ClassTier=2
	ClassIndex=2


	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M1919A6_LMG',class'ROGame.ROWeap_M1918_BAR',class'ROGame.ROWeap_M60_GPMG'),
					SecondaryWeapons=(class'ROGame.ROWeap_M1911_Pistol',class'ROGame.ROWeap_M1917_Pistol',),
					OtherItems=(class'ROGame.ROWeap_M61_GrenadeDouble',class'ROGame.ROItem_BinocularsUS'),
		)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_mg'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_mg'
}
