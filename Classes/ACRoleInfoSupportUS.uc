
class ACRoleInfoSupportUS extends ACRoleInfoSouthernInfantry;

DefaultProperties
{
	RoleType=RORIT_Radioman
	ClassTier=3
	ClassIndex=5
	bIsRadioman=true


	Items[RORIGM_Default]={(
					// Primary : DEFAULTS
					PrimaryWeapons=(class'ROGame.ROWeap_M16A1_AssaultRifle',class'ROGame.ROWeap_M14_Rifle'),
					SecondaryWeapons=(class'ROGame.ROWeap_M1911_Pistol',class'ROGame.ROWeap_M1917_Pistol'),
					// Other items
					OtherItems=(class'ROGame.ROWeap_M8_Smoke',class'MutExtrasTB.ACItem_USAmmoCrate',class'ROGame.ROItem_BinocularsUS'),
					OtherItemsStartIndexForPrimary=(0, 0),
					NumOtherItemsForPrimary=(0, 0)
		)}

	ClassIcon=Texture2D'VN_UI_Textures.menu.class_icon_radioman'
	ClassIconLarge=Texture2D'VN_UI_Textures.menu.ProfileStats.class_icon_large_radioman'

}