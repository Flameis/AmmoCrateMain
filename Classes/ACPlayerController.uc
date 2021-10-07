class ACPlayerController extends ROPlayerController;

var byte    TeamIdx;
var array<class<RORoleInfo>	> ACNorthernRoles;
var	array<class<RORoleInfo>	> ACSouthernRoles;

simulated function PreBeginPlay()
{
    super.PreBeginPlay();

    if (WorldInfo.NetMode == NM_Standalone || Role == ROLE_Authority)
    {
        ReplaceRoles();
        ReplaceInventoryManager();
        ReplacePawnHandler();
    }
}

simulated function ReplacePawnHandler()
{
    ROGameInfo(WorldInfo.Game).PawnHandlerClass = class'ACPawnHandler';
    ROGameInfo(WorldInfo.Game).DefaultPawnClass = class'ACPawn';
    ROGameInfo(WorldInfo.Game).AIPawnClass = class'ACPawn';
    `log("Replacing PawnHandler...");
}

reliable client function ClientReplacePawnHandler()
{
    ReplacePawnHandler();
}

simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
    super.ReceivedGameClass(GameClass);

    ReplaceRoles();
    ReplaceInventoryManager();
    ReplacePawnHandler();
}

simulated function ReplaceInventoryManager()
{
    ROPawn(Pawn).InventoryManagerClass = class'ACInventoryManager';
}

reliable client function ClientReplaceInventoryManager()
{
    ReplaceInventoryManager();
}

simulated function ReplaceRoles()
{
    local ROMapInfo ROMI;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    if (ROMI != None)
    { 
        `log("Replacing roles...");
        
        //Old stuff
        /*ROMI.SouthernRoles.length = 10;
        ROMI.SouthernRoles[0].Count = 255;
        ROMI.SouthernRoles[1].Count = 255;
        ROMI.SouthernRoles[2].Count = 255;
        ROMI.SouthernRoles[3].Count = 255;
        ROMI.SouthernRoles[4].Count = 255;
        ROMI.SouthernRoles[5].Count = 255;
        ROMI.SouthernRoles[6].Count = 255;
        ROMI.SouthernRoles[7].Count = 19;
        ROMI.SouthernRoles[8].Count = 255;
        ROMI.SouthernRoles[9].Count = 255;

        ROMI.NorthernRoles.length = 8;
        ROMI.NorthernRoles[0].Count = 255;
        ROMI.NorthernRoles[1].Count = 255;
        ROMI.NorthernRoles[2].Count = 255;
        ROMI.NorthernRoles[3].Count = 255;
        ROMI.NorthernRoles[4].Count = 255;
        ROMI.NorthernRoles[5].Count = 255;
        ROMI.NorthernRoles[6].Count = 255;
        ROMI.NorthernRoles[7].Count = 19;*/

        ROMI.SouthernTeamLeader.roleinfo = none;
        ROMI.NorthernTeamLeader.roleinfo = none;

        ROMI.SouthernTeamLeader.roleinfo = new ACSouthernRoles[6];
        ROMI.NorthernTeamLeader.roleinfo = new ACNorthernRoles[6];
        
        //Gotta make the array length right.
        ROMI.SouthernRoles.length = 11;
        ROMI.NorthernRoles.length = 8;

        //Infinite roles
        ROMI.SouthernRoles[0].Count = 255;
        ROMI.SouthernRoles[1].Count = 255;
        ROMI.SouthernRoles[2].Count = 255;
        ROMI.SouthernRoles[3].Count = 255;
        ROMI.SouthernRoles[4].Count = 255;
        ROMI.SouthernRoles[5].Count = 255;
        ROMI.SouthernRoles[6].Count = 9;
        ROMI.SouthernRoles[7].Count = 255;
        ROMI.SouthernRoles[8].Count = 255;
        ROMI.SouthernRoles[9].Count = 255;
        ROMI.SouthernRoles[10].Count = 255;

        ROMI.NorthernRoles[0].Count = 255;
        ROMI.NorthernRoles[1].Count = 255;
        ROMI.NorthernRoles[2].Count = 255;
        ROMI.NorthernRoles[3].Count = 255;
        ROMI.NorthernRoles[4].Count = 255;
        ROMI.NorthernRoles[5].Count = 255;
        ROMI.NorthernRoles[6].Count = 9;
        ROMI.NorthernRoles[7].Count = 255;

        //Replace the roles
        if (ROMI.SouthernForce == SFOR_USArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanUS';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightUS';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
            ROMI.SouthernRoles[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
            ROMI.SouthernRoles[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
            ROMI.SouthernRoles[10].RoleInfoClass =class'ACRoleInfoTransportPilotSouth';
        }

        if (ROMI.SouthernForce == SFOR_USMC)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanUSMC';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightUSMC';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunUSMC';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
            ROMI.SouthernRoles[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
            ROMI.SouthernRoles[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
            ROMI.SouthernRoles[10].RoleInfoClass =class'ACRoleInfoTransportPilotSouth';
        }

        if (ROMI.SouthernForce == SFOR_AusArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanAUS';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightAUS';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunAUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerAUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanAUS';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportAUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
            ROMI.SouthernRoles[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
            ROMI.SouthernRoles[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
            ROMI.SouthernRoles[10].RoleInfoClass =class'ACRoleInfoTransportPilotSouth';
        }

        if (ROMI.SouthernForce == SFOR_ARVN)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanARVN';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightARVN';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunARVN';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerARVN';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
            ROMI.SouthernRoles[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
            ROMI.SouthernRoles[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
            ROMI.SouthernRoles[10].RoleInfoClass =class'ACRoleInfoTransportPilotSouth';
        }
        
        if (ROMI.NorthernForce == NFOR_NVA)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanPAVN';
            ROMI.NorthernRoles[1].RoleInfoClass = class'ACRoleInfoLightPAVN';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunNorth';
            ROMI.NorthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerPAVN';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            ROMI.NorthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportNorth';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderNorth';
            ROMI.NorthernRoles[7].RoleInfoClass = class'ACRoleInfoTankCrewNorth';
        }

        if (ROMI.NorthernForce == NFOR_NLF)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanNLF';
            ROMI.NorthernRoles[1].RoleInfoClass = class'ACRoleInfoLightNLF';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunNorth';
            ROMI.NorthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerNLF';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            ROMI.NorthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportNorth';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderNorth';
            ROMI.NorthernRoles[7].RoleInfoClass = class'ACRoleInfoTankCrewNorth';
        }

        //Old stuff

        /*if (ROMI.SouthernForce == SFOR_USArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRifleman';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointman';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunner';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksman';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineer';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommander';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilot';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilot';
        }

        if (ROMI.SouthernForce == SFOR_USMC)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRifleman';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointmanUSMC';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunner';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanUSMC';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerUSMC';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderUSMC';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilot';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilot';
        }

        if (ROMI.SouthernForce == SFOR_AusArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRiflemanAUS';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernScoutAUS';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunnerAUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanAUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerAUS';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadierAUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderAUS';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilotAUS';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilotAUS';
        }

        if (ROMI.SouthernForce == SFOR_ARVN)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'RORoleInfoSouthernRiflemanARVN';
            ROMI.SouthernRoles[1].RoleInfoClass = class'RORoleInfoSouthernPointmanARVN';
            ROMI.SouthernRoles[2].RoleInfoClass = class'RORoleInfoSouthernMachineGunnerARVN';
            ROMI.SouthernRoles[3].RoleInfoClass = class'RORoleInfoSouthernMarksmanARVN';
            ROMI.SouthernRoles[4].RoleInfoClass = class'RORoleInfoSouthernEngineerARVN';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSouthernGrenadier';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoSouthernSupport';
            ROMI.SouthernRoles[7].RoleInfoClass = class'RORoleInfoSouthernCommanderARVN';
            ROMI.SouthernRoles[8].RoleInfoClass = class'RORoleInfoSouthernPilotARVN';
            ROMI.SouthernRoles[9].RoleInfoClass = class'RORoleInfoSouthernTransportPilotARVN';
        }
        
        if (ROMI.NorthernForce == NFOR_NVA)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'RORoleInfoNorthernGuerilla';
            ROMI.NorthernRoles[1].RoleInfoClass = class'RORoleInfoNorthernScout';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoNorthernMachineGunner';
            ROMI.NorthernRoles[3].RoleInfoClass = class'RORoleInfoNorthernSniper';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoNorthernSapper';
            ROMI.NorthernRoles[5].RoleInfoClass = class'RORoleInfoNorthernRPG';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoNorthernSupport';
            ROMI.NorthernRoles[7].RoleInfoClass = class'RORoleInfoNorthernCommander';
        }

        if (ROMI.NorthernForce == NFOR_NLF)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'RORoleInfoNorthernRifleman';
            ROMI.NorthernRoles[1].RoleInfoClass = class'RORoleInfoNorthernScoutNLF';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoNorthernMachineGunnerNLF';
            ROMI.NorthernRoles[3].RoleInfoClass = class'RORoleInfoNorthernSniperNLF';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoNorthernSapperNLF';
            ROMI.NorthernRoles[5].RoleInfoClass = class'RORoleInfoNorthernRPGNLF';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoNorthernSupport';
            ROMI.NorthernRoles[7].RoleInfoClass = class'RORoleInfoNorthernCommanderNLF';
        }*/
    }
}

reliable client function ClientReplaceRoles()
{
    ReplaceRoles();
}

simulated function PostBeginPlay()
{
    local ROMapInfo ROMI;
    local RORoleCount RORC;

    `log("ACPlayerController.PostBeginPlay()");

    super.PostBeginPlay();

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    ForEach ROMI.NorthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    }

    ForEach ROMI.SouthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    }
}

function InitialiseCCMs()
{
	local ROCharacterPreviewActor ROCPA, CPABoth;
	local ROCharCustMannequin TempCCM;
	
	if( WorldInfo.NetMode == NM_DedicatedServer )
		return;
	
	if( ROCCC == none )
	{
		ROCCC = Spawn(class'ROCharCustController');
		
		if( ROCCC != none )
			ROCCC.ROPCRef = self;
	}
	
	foreach WorldInfo.DynamicActors(class'ROCharacterPreviewActor', ROCPA)
	{
		if( ROCPA.OwningTeam == EOT_Both )
		{
			CPABoth = ROCPA;
		}
		else if( AllCCMs[ROCPA.OwningTeam] == none )
		{
			AllCCMs[ROCPA.OwningTeam] = Spawn(class'ACCharCustMannequin', self,, ROCPA.Location, ROCPA.Rotation);
		}
	}
	
	if( AllCCMs[0] == none || AllCCMs[1] == none )
	{
		if( CPABoth != none )
			TempCCM = Spawn(class'ACCharCustMannequin', self,, CPABoth.Location, CPABoth.Rotation);
		else
		{
			TempCCM = Spawn(class'ACCharCustMannequin', self, , vect(0,0,100));
		}
		
		TempCCM.SetOwningTeam(EOT_Both);
		
		if( AllCCMs[0] == none )
			AllCCMs[0] = TempCCM;
		
		if( AllCCMs[1] == none )
			AllCCMs[1] = TempCCM;
	}
}

static function string GetClassNameByIndex(int TeamIndex, int ClassIndex, optional bool bShortName)
{
	local int i;
    //local ROMapInfo ROMI;
    //ROMI = ROMapInfo(default.WorldInfo.GetMapInfo());
	
	if (ClassIndex == `ACCI_Commander)
	{
		return (TeamIndex == `AXIS_TEAM_INDEX) ? class'ACRoleInfoCommanderNorth'.static.GetProfileName() : class'ACRoleInfoCommanderSouth'.static.GetProfileName();
	}
	
	if (TeamIndex == `AXIS_TEAM_INDEX)
	{
		for (i = 0; i < default.ACNorthernRoles.Length; i++)
		{
			if (default.ACNorthernRoles[i].default.ClassIndex == ClassIndex)
				return default.ACNorthernRoles[i].static.GetProfileName();
		}
	}
	else
	{
		for (i = 0; i < default.ACSouthernRoles.Length; i++)
		{
			if (default.ACSouthernRoles[i].default.ClassIndex == ClassIndex)
				return default.ACSouthernRoles[i].static.GetProfileName();
		}
	}
    
    return "Error!"; 
}

defaultproperties
{
//CharacterSceneTemplate=ACUISceneCharacter'29thExtras.Character.ACUISceneCharacter2';


/*
ACNorthernRoles(`ACCI_Rifle    )=class'ACRoleInfoRiflemanNLF'
ACNorthernRoles(`ACCI_Light    )=class'ACRoleInfoLightNLF'
ACNorthernRoles(`ACCI_MG       )=class'ACRoleInfoMachineGunNorth'
ACNorthernRoles(`ACCI_CE       )=class'ACRoleInfoCombatEngineerNLF'
ACNorthernRoles(`ACCI_Sniper   )=class'ACRoleInfoMarksmanNorth'
ACNorthernRoles(`ACCI_Radioman )=class'ACRoleInfoSupportNorth'
ACNorthernRoles(`ACCI_Commander)=class'ACRoleInfoCommanderNorth'
ACNorthernRoles(`ACCI_Tank     )=class'ACRoleInfoTankCrewNorth'

ACSouthernRoles(`ACCI_Rifle         )=class'ACRoleInfoRiflemanUS'
ACSouthernRoles(`ACCI_Light         )=class'ACRoleInfoLightUS'
ACSouthernRoles(`ACCI_MG            )=class'ACRoleInfoMachineGunUS'
ACSouthernRoles(`ACCI_CE            )=class'ACRoleInfoCombatEngineerUS'
ACSouthernRoles(`ACCI_Sniper        )=class'ACRoleInfoMarksmanSouth'
ACSouthernRoles(`ACCI_Radioman      )=class'ACRoleInfoSupportUS'
ACSouthernRoles(`ACCI_Commander     )=class'ACRoleInfoCommanderSouth'
ACSouthernRoles(`ACCI_Lineup        )=class'ACRoleInfoLineup'
ACSouthernRoles(`ACCI_Tank          )=class'ACRoleInfoTankCrewSouth'
ACSouthernRoles(`ACCI_CombatPilot   )=class'ACRoleInfoPilotSouth'
ACSouthernRoles(`ACCI_TransportPilot)=class'ACRoleInfoTransportPilotSouth'
*/

ACNorthernRoles={(
                class'ACRoleInfoRiflemanNLF',
                class'ACRoleInfoLightNLF',
                class'ACRoleInfoMachineGunNorth',
                class'ACRoleInfoCombatEngineerNLF',
                class'ACRoleInfoMarksmanNorth',
                class'ACRoleInfoSupportNorth',
                class'ACRoleInfoCommanderNorth',
                class'ACRoleInfoTankCrewNorth'
                )}

ACSouthernRoles={(
                class'ACRoleInfoRiflemanUS',
                class'ACRoleInfoLightUS',
                class'ACRoleInfoMachineGunUS',
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