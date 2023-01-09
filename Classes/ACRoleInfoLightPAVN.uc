// Edited for the 29th by Reimer, Published by Scovel
//=============================================================================
class ACRoleInfoLightPAVN extends ACRoleInfoNorthernInfantry;

DefaultProperties
{
	RoleType=RORIT_Scout
	ClassTier=2
	ClassIndex=1

	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_IZH43_Shotgun',class'ROGame.ROWeap_MAT49_SMG',class'ROGame.ROWeap_K50M_SMG', class'ROGame.ROWeap_MP40_SMG'),
					SecondaryWeapons=(class'ROGame.ROWeap_TT33_Pistol',class'ROGame.ROWeap_PM_Pistol'),
					OtherItems=(class'ROGame.ROWeap_TripwireTrap_Single',class'ROGame.ROWeap_MD82_Mine',class'ROGame.ROWeap_RDG1_Smoke',class'ROGame.ROWeap_Molotov'),
		)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_scout'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_scout'
}
