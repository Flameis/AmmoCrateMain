/**
 * Copyright 1998-2007 Epic Games, Inc. All Rights Reserved.
 */

/**
 * Class that modifies the stats for RO game.
 * NOTE: This class will normally be code generated, but the tool hasn't
 * been written yet
 */
class ACGameStatsRead extends ROGameStatsRead;

static function string GetClassNameByIndex(int TeamIndex, int ClassIndex, optional bool bShortName)
{
	local int i;

	if( TeamIndex == `AXIS_TEAM_INDEX )
	{
		for( i = 0; i < default.NorthRoles.Length; i++)
		{
			if(default.NorthRoles[i].default.ClassIndex == ClassIndex)
				return default.NorthRoles[i].static.GetProfileName(bShortName);
		}
	}
	else
	{
		for( i = 0; i < default.SouthRoles.Length; i++)
		{
			if(default.SouthRoles[i].default.ClassIndex == ClassIndex)
				return default.SouthRoles[i].static.GetProfileName(bShortName);
		}
	}

	return "Error!";
} 

static function Texture2D GetClassIconByIndex(int TeamIndex, int ClassIndex)
{
	local int i;

	if( TeamIndex == `AXIS_TEAM_INDEX )
	{
		for( i = 0; i < default.NorthRoles.Length; i++)
		{
			if(default.NorthRoles[i].default.ClassIndex == ClassIndex)
				return default.NorthRoles[i].default.ClassIcon;
		}
	}
	else
	{
		for( i = 0; i < default.SouthRoles.Length; i++)
		{
			if(default.SouthRoles[i].default.ClassIndex == ClassIndex)
				return default.SouthRoles[i].default.ClassIcon;
		}
	}

	return none;
}

defaultproperties
{
	NorthRoles={(
                class'ACRoleInfoRiflemanNLF',
                class'ACRoleInfoLightNLF',
                class'ACRoleInfoMachineGunnerNorth',
                class'ACRoleInfoCombatEngineerNLF',
                class'ACRoleInfoMarksmanNorth',
                class'ACRoleInfoSupportNorth',
                class'ACRoleInfoCommanderNorth',
                class'ACRoleInfoTankCrewNorth'
                )}

	SouthRoles={(
                class'ACRoleInfoRiflemanUS',
                class'ACRoleInfoLightUS',
                class'ACRoleInfoMachineGunnerUS',
                class'ACRoleInfoCombatEngineerUS',
                class'ACRoleInfoMarksmanSouth',
                class'ACRoleInfoSupportUS',
                class'ACRoleInfoCommanderSouth',
                class'ACRoleInfoLineup',
                class'ACRoleInfoTankCrewSouth',
                class'ACRoleInfoPilotSouth',
                class'ACRoleInfoTransportPilotSouth'
                )}
}

