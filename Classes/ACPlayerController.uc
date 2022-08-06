class ACPlayerController extends ROPlayerController;

var ROMapInfo                   ROMI;

var array<class<RORoleInfo> > ACNorthernRoles;
var	array<class<RORoleInfo> > ACSouthernRoles;

simulated function PreBeginPlay()
{
    super.PreBeginPlay();

	if (WorldInfo.NetMode == NM_Standalone || Role == ROLE_Authority)
    {
    	ReplacePawnHandler();
    	//ClientReplacePawnHandler();
    	ReplaceRoles();
    	//ClientReplaceRoles();
    	ReplaceInventoryManager();
    	//ClientReplaceInventoryManager();
	}
}

simulated function PostBeginPlay()
{
    //local RORoleCount RORC;

    // `log("ACPlayerController.PostBeginPlay()");

    super.PostBeginPlay();

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    /* ForEach ROMI.NorthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    }

    ForEach ROMI.SouthernRoles(RORC)
    {
        `log("RoleInfoClass = " $ RORC.RoleInfoClass);
    } */
}

simulated function ReceivedGameClass(class<GameInfo> GameClass)
{
    super.ReceivedGameClass(GameClass);
    ReplaceRoles();
    ReplaceInventoryManager();
    ReplacePawnHandler();
}

simulated function ReplacePawnHandler()
{
    ROGameInfo(WorldInfo.Game).PawnHandlerClass = class'ACPawnHandler';
    ROGameInfo(WorldInfo.Game).DefaultPawnClass = class'ACPawn';
    ROGameInfo(WorldInfo.Game).AIPawnClass = class'ACPawn';
    //`log("Replacing PawnHandler...");
}

reliable client function ClientReplacePawnHandler()
{
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
	local int 					I;
	local bool 					FoundPilot;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

	if (ROMI != None)
    { 
        //`log("Replacing roles...");

		for (I=0; I < ROMI.SouthernRoles.length; I++)
        {
			if (instr(ROMI.SouthernRoles[I].RoleInfoClass.Name, "Pilot",, true) != -1)
            {
                FoundPilot = true;
                `log("[MutExtras] FoundPilot");
				break;
            }
        }
        
        //Gotta make the array length right.
        ROMI.SouthernRoles.length = 9;
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
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        if (ROMI.SouthernForce == SFOR_USMC)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanUSMC';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightUSMC';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerUSMC';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        if (ROMI.SouthernForce == SFOR_AusArmy)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanAUS';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightAUS';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerAUS';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerAUS';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanAUS';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportAUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        if (ROMI.SouthernForce == SFOR_ARVN)
        {
            ROMI.SouthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanARVN';
            ROMI.SouthernRoles[1].RoleInfoClass = class'ACRoleInfoLightARVN';
            ROMI.SouthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerARVN';
            ROMI.SouthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerARVN';
            ROMI.SouthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            ROMI.SouthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            ROMI.SouthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
            ROMI.SouthernRoles[7].RoleInfoClass = class'ACRoleInfoLineup';
        }
        
        if (ROMI.NorthernForce == NFOR_NVA)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanPAVN';
            ROMI.NorthernRoles[1].RoleInfoClass = class'ACRoleInfoLightPAVN';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerNorth';
            ROMI.NorthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerPAVN';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            ROMI.NorthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportNorth';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderNorth';
        }

        if (ROMI.NorthernForce == NFOR_NLF)
        {
            ROMI.NorthernRoles[0].RoleInfoClass = class'ACRoleInfoRiflemanNLF';
            ROMI.NorthernRoles[1].RoleInfoClass = class'ACRoleInfoLightNLF';
            ROMI.NorthernRoles[2].RoleInfoClass = class'ACRoleInfoMachineGunnerNorth';
            ROMI.NorthernRoles[3].RoleInfoClass = class'ACRoleInfoCombatEngineerNLF';
            ROMI.NorthernRoles[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            ROMI.NorthernRoles[5].RoleInfoClass = class'ACRoleInfoSupportNorth';
            ROMI.NorthernRoles[6].RoleInfoClass = class'ACRoleInfoCommanderNorth';
        }

		ROMI.SouthernRoles[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
		ROMI.NorthernRoles[7].RoleInfoClass = class'ACRoleInfoTankCrewNorth';

		if (FoundPilot)
		{
			ROMI.SouthernRoles.length = 11;
			ROMI.SouthernRoles[9].Count = 255;
        	ROMI.SouthernRoles[10].Count = 255;
			ROMI.SouthernRoles[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
			ROMI.SouthernRoles[10].RoleInfoClass = class'ACRoleInfoTransportPilotSouth';
		}

		ROMI.SouthernTeamLeader.roleinfo = none;
        ROMI.NorthernTeamLeader.roleinfo = none;

        ROMI.SouthernTeamLeader.roleinfo = new ROMI.SouthernRoles[6].RoleInfoClass;
        ROMI.NorthernTeamLeader.roleinfo = new ROMI.NorthernRoles[6].RoleInfoClass;
    }
    /* if (ROMI != None)
    { 
		for (I=0; I < ROMI.SouthernRoles.length; I++)
        {
			if (instr(ROMI.SouthernRoles[I].RoleInfoClass.Name, "Pilot",, true) != -1)
            {
                FoundPilot = true;
                `log("[MutExtras] FoundPilot");
				break;
            }
        }

        //`log("Replacing roles...");
		ROMI.SouthernRoles.Remove(0, ROMI.SouthernRoles.length);
		ROMI.NorthernRoles.Remove(0, ROMI.NorthernRoles.length);

        //Gotta make the array length right
        ROMI.SouthernRoles.length = 11;
        ROMI.NorthernRoles.length = 8;

		ROMI.SouthernTeamLeader.roleinfo = none;
        ROMI.NorthernTeamLeader.roleinfo = none;

		ROMI.SouthernTeamLeader.roleinfo = new ACSouthernRoles[0];
        ROMI.NorthernTeamLeader.roleinfo = new ACNorthernRoles[0];

		RORCS.length = 9;
        RORCN.length = 8;

		RORCS[6].RoleInfoClass = class'ACRoleInfoCommanderSouth';
		RORCN[6].RoleInfoClass = class'ACRoleInfoCommanderNorth';

		for (i = 0; i < ROMI.SouthernRoles.length; i++)
    	{
        	RORCS[i].Count = 255;
			RORCN[i].ReverseCount = 255;
    	}    
    	for (i = 0; i < ROMI.NorthernRoles.length; i++)
    	{
        	RORCN[i].Count = 255;
			RORCN[i].ReverseCount = 255;
    	}

		RORCS[6].Count = 9;
		RORCS[6].ReverseCount = 9;
		RORCN[6].Count = 9;
		RORCN[6].ReverseCount = 9;

        //Replace the roles
        if (ROMI.SouthernForce == SFOR_USArmy)
        {
            RORCS[0].RoleInfoClass = class'ACRoleInfoRiflemanUS';
            RORCS[1].RoleInfoClass = class'ACRoleInfoLightUS';
            RORCS[2].RoleInfoClass = class'ACRoleInfoMachineGunnerUS';
            RORCS[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            RORCS[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            RORCS[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            RORCS[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        else if (ROMI.SouthernForce == SFOR_USMC)
        {
            RORCS[0].RoleInfoClass = class'ACRoleInfoRiflemanUSMC';
            RORCS[1].RoleInfoClass = class'ACRoleInfoLightUSMC';
            RORCS[2].RoleInfoClass = class'ACRoleInfoMachineGunnerUSMC';
            RORCS[3].RoleInfoClass = class'ACRoleInfoCombatEngineerUS';
            RORCS[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            RORCS[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            RORCS[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        else if (ROMI.SouthernForce == SFOR_AusArmy)
        {
            RORCS[0].RoleInfoClass = class'ACRoleInfoRiflemanAUS';
            RORCS[1].RoleInfoClass = class'ACRoleInfoLightAUS';
            RORCS[2].RoleInfoClass = class'ACRoleInfoMachineGunnerAUS';
            RORCS[3].RoleInfoClass = class'ACRoleInfoCombatEngineerAUS';
            RORCS[4].RoleInfoClass = class'ACRoleInfoMarksmanAUS';
            RORCS[5].RoleInfoClass = class'ACRoleInfoSupportAUS';
            RORCS[7].RoleInfoClass = class'ACRoleInfoLineup';
        }

        else if (ROMI.SouthernForce == SFOR_ARVN)
        {
            RORCS[0].RoleInfoClass = class'ACRoleInfoRiflemanARVN';
            RORCS[1].RoleInfoClass = class'ACRoleInfoLightARVN';
            RORCS[2].RoleInfoClass = class'ACRoleInfoMachineGunnerARVN';
            RORCS[3].RoleInfoClass = class'ACRoleInfoCombatEngineerARVN';
            RORCS[4].RoleInfoClass = class'ACRoleInfoMarksmanSouth';
            RORCS[5].RoleInfoClass = class'ACRoleInfoSupportUS';
            RORCS[7].RoleInfoClass = class'ACRoleInfoLineup';
        }
        
        if (ROMI.NorthernForce == NFOR_NVA)
        {
            RORCN[0].RoleInfoClass = class'ACRoleInfoRiflemanPAVN';
            RORCN[1].RoleInfoClass = class'ACRoleInfoLightPAVN';
            RORCN[2].RoleInfoClass = class'ACRoleInfoMachineGunnerNorth';
            RORCN[3].RoleInfoClass = class'ACRoleInfoCombatEngineerPAVN';
            RORCN[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            RORCN[5].RoleInfoClass = class'ACRoleInfoSupportNorth';

        }

        else if (ROMI.NorthernForce == NFOR_NLF)
        {
            RORCN[0].RoleInfoClass = class'ACRoleInfoRiflemanNLF';
            RORCN[1].RoleInfoClass = class'ACRoleInfoLightNLF';
            RORCN[2].RoleInfoClass = class'ACRoleInfoMachineGunnerNorth';
            RORCN[3].RoleInfoClass = class'ACRoleInfoCombatEngineerNLF';
            RORCN[4].RoleInfoClass = class'ACRoleInfoMarksmanNorth';
            RORCN[5].RoleInfoClass = class'ACRoleInfoSupportNorth';
        }

		RORCS[8].RoleInfoClass = class'ACRoleInfoTankCrewSouth';
		RORCN[7].RoleInfoClass = class'ACRoleInfoTankCrewNorth';

		if (FoundPilot)
		{
			RORCS.length = 11;
			RORCS[9].RoleInfoClass = class'ACRoleInfoPilotSouth';
			RORCS[10].RoleInfoClass =class'ACRoleInfoTransportPilotSouth';
		}

		ROMI.SouthernRoles = RORCS;
		ROMI.NorthernRoles = RORCN;
    } */
}

reliable client function ClientReplaceRoles()
{
    ReplaceRoles();
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

function UpdateLoachRecon(vector HeloLocation, optional bool bPilot)
{
	local Pawn TempPawn;
	local ROPlayerReplicationInfo TempPRI;
	local ROTeamInfo Team, EnemyTeam;
	local int TeamIndex, Index, i;
	local int NumControllerChecks;
	local ROVehicleHelicopter ROVH;

	if( bPilot )
	{
		// Check that we are alive and still the pilot of the Loach
		if ( !IsFlyingHelicopter(ROVH) || ACHeli_OH6_Content(ROVH) == none || ROPlayerReplicationInfo(PlayerReplicationInfo) == none ||
			 ROPlayerReplicationInfo(PlayerReplicationInfo).RoleInfo == none || !ROPlayerReplicationInfo(PlayerReplicationInfo).RoleInfo.bIsPilot )
		{
			//bSentRadioContactMessage = false;
			return;
		}
	}
	else
	{
		// Check that we're the commander
		if ( ROPlayerReplicationInfo(PlayerReplicationInfo) == none
			|| ROPlayerReplicationInfo(PlayerReplicationInfo).RoleInfo == none )
		{
			//bSentRadioContactMessage = false;
			return;
		}
	}

	// TODO: Clean this up. If we don't introduce a commander/radio proximity requirement for loach spotting, then remove this commented out stuff and "if" statement
	// Make sure we're still close enough to the Radio to "hear" it(within 15 meters currently: (15 * 50)^2 = 562500)
	if( IsInRadioHelo() ) //( (AerialReconRadio != none && VSizeSq(Pawn.Location - AerialReconRadio.Location) <= 562500) || ROPlayerReplicationInfo(PlayerReplicationInfo).RoleInfo.bCanBeTankCrew )
	{
		TeamIndex = GetTeamNum();
		i = 0;

		Team = ROTeamInfo(WorldInfo.GRI.Teams[TeamIndex]);
		EnemyTeam = ROTeamInfo(WorldInfo.GRI.Teams[1 - TeamIndex]);

		if ( NextAerialReconController == none )
		{
			if ( PrevAerialReconController != none && PrevAerialReconController.NextController != none )
			{
				NextAerialReconController = PrevAerialReconController.NextController;
			}
			else
			{
				NextAerialReconController = WorldInfo.ControllerList;
				i++;
			}

			if ( NextAerialReconController == none )
			{
				return;
			}
		}

		if ( NextAerialReconController.Pawn == none || NextAerialReconController.GetTeamNum() == TeamIndex
			|| CCSTankController(NextAerialReconController) != none )
		{
			PrevAerialReconController = NextAerialReconController;

			do
			{
				NumControllerChecks++;

				if( NumControllerChecks > 1000 )
				{
				   `log(self@GetFuncName()$" exiting because we're stuck in an infinite loop looking for controllers for the Loach and would crash");
				}

				if ( NextAerialReconController.NextController != none )
				{
					NextAerialReconController = NextAerialReconController.NextController;
				}
				else
				{
					NextAerialReconController = WorldInfo.ControllerList;
				}
			} until ( (NextAerialReconController.Pawn != none && CCSTankController(NextAerialReconController) == none && NextAerialReconController.GetTeamNum() != TeamIndex) || NextAerialReconController == PrevAerialReconController || NumControllerChecks > 1000 );
		}

		if ( NextAerialReconController.Pawn != none )
		{
			TempPawn = NextAerialReconController.Pawn;

			if ( TempPawn.PlayerReplicationInfo != none )
			{
				TempPRI = ROPlayerReplicationInfo(TempPawn.PlayerReplicationInfo);
			}
			else if ( ROVehicle(TempPawn) != none )
			{
				TempPRI = ROPlayerReplicationInfo(ROVehicle(TempPawn).GetValidPRI());
			}

			// Enemy Vehicles must be within 500 meters(500 * 50)^2 = 1250000000) and Infantry within 150 meters(150 * 50)^2 = 56,250,000)
			if ( TempPawn.Health > 0 && TempPawn.GetTeamNum() != TeamIndex &&
				 (Vehicle(TempPawn) != none ? VSizeSq(TempPawn.Location - HeloLocation) < 1250000000.0 : VSizeSq(TempPawn.Location - HeloLocation) < 56250000.0) &&
				 FastTrace(TempPawn.Location, HeloLocation) && (ROPawn(TempPawn) == none || !ROPawn(TempPawn).IsInCamo()) )
			{
				Index = -1;
				for ( i = 0; i < `MAX_PLAYERS_PER_TEAM; i++ )
				{
					if ( Team.EnemyPRIArray[i] == TempPRI )
					{
						Index = i;
						break;
					}
					else if ( Index == -1 && Team.EnemyPRIArray[i] == none )
					{
						Index = i;
					}
				}

				if(ROPlayerReplicationInfo(PlayerReplicationInfo) != none)
				{
					TempPRI.LastPRIToSpotMeIndex = ROPlayerReplicationInfo(PlayerReplicationInfo).TeamPRIArrayIndex; // Let this player know I (this ROPC) have spotted him, so if he dies I can get points for an assist
				}

				Team.EnemyPRIArray[Index] = TempPRI;
				Team.SetEnemyLocationEntry(Index, TempPawn.Location);
				Team.EnemySpottedFadeTime[Index] = WorldInfo.GRI.ElapsedTime + 3;

				if ( ROVehicle(TempPawn) != none && ROVehicle(TempPawn).static.IsTank() )
				{
					Team.EnemyType[Index] = RORIT_SpottedByPlane + RORIT_Tank;
				}
				else if ( Team.EnemyType[Index] != RORIT_None )
				{
					if ( Team.EnemyType[Index] < RORIT_SpottedByPlane )
					{
						Team.EnemyType[Index] += RORIT_SpottedByPlane;
					}
				}
				// else if ( TempPRI != none && TempPRI.RoleInfo != none )
				// {
				// 	Team.EnemyType[Index] = RORIT_SpottedByPlane + TempPRI.RoleInfo.RoleType;
				// }
				else if ( TempPRI != none && TempPRI.RoleInfo != none && TempPRI.RoleInfo.RoleType == RORIT_AntiTank )
				{
					Team.EnemyType[Index] = RORIT_SpottedByPlane + RORIT_AntiTank;
				}
				else
				{
					Team.EnemyType[Index] = RORIT_SpottedByPlane + RORIT_Rifleman;
				}
			}
			else
			{
				for ( i = 0; i < `MAX_PLAYERS_PER_TEAM; i++ )
				{
					if ( Team.EnemyPRIArray[i] == TempPRI )
					{
						Team.EnemyPRIArray[i] = none;
					}
				}
			}
		}

		PrevAerialReconController = NextAerialReconController;
		NextAerialReconController = NextAerialReconController.NextController;

		for ( i = 0; i < `MAX_PLAYERS_PER_TEAM; i++ )
		{
			if ( Team.EnemyPRIArray[i] == none && Team.EnemySpottedFadeTime[i] < WorldInfo.GRI.ElapsedTime )
			{
				Team.SetEnemyLocationInvalid(i);
			}
		}

		// Now checking for tunnels
		for ( i = 0; i < `MAX_SQUADS; i++ )
		{
			if( EnemyTeam.SpawnTunnels[i] != none )
			{
				// Tunnels must be within 125m to be spotted
				if ( VSizeSq(EnemyTeam.SpawnTunnels[i].Location - HeloLocation) < 39062500 &&
				 	(Team.GetTeamNum() == `ALLIES_TEAM_INDEX ? FastTrace(EnemyTeam.SpawnTunnels[i].Location, HeloLocation) : true) )
				{
					Team.EnemySpawnTunnels[i] = EnemyTeam.SpawnTunnels[i];
					Team.SetTunnelLocationVector(i, EnemyTeam.SpawnTunnels[i].Location);
					Team.TunnelSpottedFadeTime[i] = WorldInfo.GRI.ElapsedTime + class'ROPlaceableSpawn'.default.AutoSpotRecheckTime;
					Team.TunnelSpottedBy[i] = 1;
				}
				else if( EnemyTeam.SpawnTunnels[i] == Team.EnemySpawnTunnels[i] && Team.TunnelSpottedFadeTime[i] < WorldInfo.GRI.ElapsedTime )
				{
					Team.EnemySpawnTunnels[i] = none;
					Team.SetTunnelLocationInvalid(i);
				}
			}
			else if ( EnemyTeam.SpawnTunnels[i] == none && Team.TunnelSpottedFadeTime[i] < WorldInfo.GRI.ElapsedTime)
			{
				Team.EnemySpawnTunnels[i] = none;
				Team.SetTunnelLocationInvalid(i);
			}
		}
	}
	else
	{
		if ( !bSentRadioContactMessage )
		{
  			ReceiveLocalizedMessage(class'ROLocalMessageGameAlert', ROMSG_MaintainRadioContactAerialRecon);

			bSentRadioContactMessage = true;
		}
	}
}

function OnFailedToDefendObjective(float FullScreenFadeInDelay)
{
	local UIScene TempScene;

	if ( CurrentSinglePlayerDeadScene == none || !CurrentSinglePlayerDeadScene.IsSceneActive() )
	{
		LocalPlayer(Player).ViewportClient.UIController.SceneClient.OpenScene(SinglePlayerDeadSceneTemplate, , TempScene);
		CurrentSinglePlayerDeadScene = ROUISceneSPPlayerDead(TempScene);
		CurrentSinglePlayerDeadScene.InitializeFallingBackScene(self);
	}

	SetTimer(FullScreenFadeInDelay, false, 'StartFullscreenFadeIn');
} 