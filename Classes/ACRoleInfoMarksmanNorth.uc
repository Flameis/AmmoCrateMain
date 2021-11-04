//=============================================================================
// RORoleInfoNorthernSniper
//=============================================================================
// Default settings for the Vietnamese Sniper role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2017 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// Edited for the 29th by Reimer, Published by Scovel
//=============================================================================
class ACRoleInfoMarksmanNorth extends ACRoleInfoNorthernInfantry
	HideDropDown;

DefaultProperties
{
	RoleType=RORIT_Marksman
	ClassTier=2
	ClassIndex=4


	Items[RORIGM_Default]={(
					PrimaryWeapons=(class'ROGame.ROWeap_MN9130Scoped_Rifle',class'ROGame.ROWeap_MAS49Scoped_Rifle',class'ROGame.ROWeap_M1DGarand_SniperRifle',class'ROGame.ROWeap_SVDScoped_Rifle'),
					SecondaryWeapons=(class'ROGame.ROWeap_TT33_Pistol',class'ROGame.ROWeap_PM_Pistol'),
					OtherItems=(class'ROGame.ROWeap_TripwireTrap_Single',class'ROGame.ROWeap_Type67_GrenadeSingle',class'ROItem_Binoculars'),
		)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_sniper'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_sniper'
}
