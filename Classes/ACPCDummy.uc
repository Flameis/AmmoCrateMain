class ACPCDummy extends Actor;

simulated function ReplaceRoles(bool WW, bool GOM)
{
    local ROMapInfo ROMI;
    local RORoleCount SRC, NRC;
    local array<RORoleCount> RORCAN, RORCAS;
	local int 					I;
    local bool          FoundNTank, FoundSTank;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    RORCAN = ROMI.NorthernRoles;
    RORCAS = ROMI.SouthernRoles;

    ROMI.NorthernRoles.Length = 0;
    ROMI.SouthernRoles.Length = 0;
    ROMI.NorthernRoles.Length = RORCAN.Length;
    ROMI.SouthernRoles.Length = RORCAS.Length;

    ROMI.NorthernRoles = RORCAN;
    ROMI.SouthernRoles = RORCAS;


	if (WW == true)
    {
        for (I=0; I < ROMI.NorthernRoles.length; I++)
        {
            if (instr(ROMI.NorthernRoles[I].RoleInfoClass.Name, "Tank",, true) != -1)
            {
                FoundNTank = true;
                // `log ("[MutExtras Debug] Found NTank");
                break;
            }
        }
        for (I=0; I < ROMI.SouthernRoles.length; I++)
        {
            if (instr(ROMI.SouthernRoles[I].RoleInfoClass.Name, "Tank",, true) != -1)
            {
                FoundSTank = true;
                // `log ("[MutExtras Debug] Found STank");
                break;
            }
        }

        if (!FoundNTank)
        {
            NRC.RoleInfoClass = class'ACRoleInfoTankCrewFinnish';
            ROMI.NorthernRoles.additem(NRC);
        }
        if (!FoundSTank)
        {
            NRC.RoleInfoClass = ROMI.default.SouthernRoles[7].RoleInfoClass;
            ROMI.SouthernRoles.additem(NRC);
        }

        //Infinite roles
        for (i = 0; i < ROMI.SouthernRoles.length; i++)
        {
            ROMI.SouthernRoles[i].Count = 255;
        }    
        for (i = 0; i < ROMI.NorthernRoles.length; i++)
        {
            ROMI.NorthernRoles[i].Count = 255;
        }
    }
    else if (GOM == true)
    {
        SRC.RoleInfoClass = class'ACRoleInfoTankCrewSouth';
        NRC.RoleInfoClass = class'ACRoleInfoTankCrewNorth';
        SRC.Count = 255;
        NRC.Count = 255;

        ROMI.SouthernRoles.AddItem(SRC);
		ROMI.NorthernRoles.AddItem(NRC);

        //Infinite roles
        for (i = 0; i < ROMI.SouthernRoles.length; i++)
        {
            ROMI.SouthernRoles[i].Count = 255;
        }    
        for (i = 0; i < ROMI.NorthernRoles.length; i++)
        {
            ROMI.NorthernRoles[i].Count = 255;
        }
    }
    else
    {
        //Infinite roles
        for (i = 0; i < ROMI.SouthernRoles.length; i++)
        {
            ROMI.SouthernRoles[i].Count = 255;
        }    
        for (i = 0; i < ROMI.NorthernRoles.length; i++)
        {
            ROMI.NorthernRoles[i].Count = 255;
        }
    }
}

reliable client function ClientReplaceRoles(bool WW, bool GOM)
{
    ReplaceRoles(WW, GOM);
}