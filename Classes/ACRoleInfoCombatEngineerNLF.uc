//=============================================================================
// RORoleInfoNorthernRPG
//=============================================================================
// Default settings for the Vietnamese RPG Soldier role.
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
// Edited for the 29th by Reimer, published by Scovel
//=============================================================================
class ACRoleInfoCombatEngineerNLF extends ACRoleInfoNorthernInfantry;

DefaultProperties
{
	RoleType=RORIT_Engineer
	ClassTier=2
	ClassIndex=3
	//bCanCompleteMiniObjectives=true

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_IZH43_Shotgun',class'ROGame.ROWeap_SKS_Rifle',class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_AK47_AssaultRifle',class'ROGame.ROWeap_MAS49_Rifle_Grenade'),
					SecondaryWeapons=(class'ROGame.ROWeap_TT33_Pistol',class'ROGame.ROWeap_PM_Pistol'),
					OtherItems=(class'ROGame.ROWeap_RPG7_RocketLauncher',class'AmmoCrate.ACWeap_VietSatchel',class'ROGame.ROItem_Binoculars'),
					OtherItemsStartIndexForPrimary=(0, 0, 0, 1, 0),
					NumOtherItemsForPrimary=(0, 0, 0, 0, 255),
		)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_sapper'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_sapper'
}
