//=============================================================================
// RORoleInfoNorthernScout
//=============================================================================
// Default settings for the Vietnamese Scout role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games 
// Edited for the 29th by Reimer, Published by Scovel
//=============================================================================
class ACRoleInfoLightNLF extends RORoleInfoNorthernInfantry;

DefaultProperties
{
	RoleType=RORIT_Scout
	ClassTier=2
	ClassIndex=1

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_IZH43_Shotgun',class'ROGame.ROWeap_MAT49_SMG',class'ROGame.ROWeap_PPSH41_SMG',class'ROGame.ROWeap_MP40_SMG',class'ROGame.ROWeap_K50M_SMG',class'ROGame.ROWeap_IZH43_Shotgun'),
					SecondaryWeapons=(class'ROGame.ROWeap_TT33_Pistol',class'ROGame.ROWeap_PM_Pistol'),
					OtherItems=(class'AmmoCrate.ACWeap_MolotovTriad',class'AmmoCrate.ACWeap_TripwireTrapQuadAllowable',class'AmmoCrate.ACWeap_FougQuadAllowable',class'ROGame.ROWeap_RDG1_Smoke',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(1, 1, 1, 1, 1, 0),
					NumOtherItemsForPrimary=(5, 5, 5, 5, 5, 1),
	)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_scout'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_scout'
}
