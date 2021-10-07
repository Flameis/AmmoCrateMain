//=============================================================================
// RORoleInfoNorthernGuerilla
//=============================================================================
// Default settings for the Vietnamese Guerilla (Rifleman) role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2016 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// Edited for the 29th by Reimer, Published by Scovel
//=============================================================================
class ACRoleInfoTankCrewSouth extends RORoleInfoSouthernInfantry
	HideDropDown;

defaultproperties
{
	RoleType=RORIT_Tank
	ClassTier=4
	ClassIndex=8
	bIsTankCommander=true

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_XM177E1_Carbine'),
					SecondaryWeapons=(class'ROGame.ROWeap_M1911_Pistol',class'ROGame.ROWeap_M1917_Pistol',class'ROGame.ROWeap_BHP_Pistol'),				
		)}

	ClassIcon=Texture2D'VN_UI_Textures.OverheadMap.ui_overheadmap_icons_friendly_tank'
	ClassIconLarge=Texture2D'VN_UI_Textures.OverheadMap.ui_overheadmap_icons_friendly_tank'
}
