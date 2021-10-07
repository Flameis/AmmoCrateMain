class AmmoCrateMutator extends ROMutator
	config(AmmoCrate);

var string PlayerName;
var ACPlayerController ACPC;
var ROVolumeMapBounds ROMB;
var ROPawnHandler ROPH;
var ROGameInfo ROGI;
var GameReplicationInfo GRI;
var RORoleInfoClasses RORICSouth;
var RORoleInfoClasses RORICNorth;
//var bool bMatchLive;

function PreBeginPlay()
    {
    local class<Object>          All;
    local ROMapInfo ROMI;
    local ROVolumeNoArtillery ROVA;
    ROMI = ROMapInfo(WorldInfo.GetMapInfo());
    `log("AmmoCrateMutator init");

    DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class');
    DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class');
    DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class');
    DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class');
    DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class');
    DynamicLoadObject("AmmoCrate.TestWeap_M3A1_SMG_Content", class'Class');
    DynamicLoadObject("AmmoCrate.TESTWeap_PPSH41_SMG_Content", class'Class');
    //DynamicLoadObject("GOM3.GOMWeapon_Satchel_ActualContent", class'Class');
    /*DynamicLoadObject("GOM3.GOMWeapon_RPG2_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_PPS_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M38_Carbine_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_Kar98k_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_BowieKnife_ActualContent", class'Class');
    DynamicLoadObject("GOM3.GOMWeapon_M1_Carbine_ActualContent", class'Class');
    */
    
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class'));
    All = class<ROVehicle>(DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class'));
    /*
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_Satchel_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_RPG2_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_PPS_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M38_Carbine_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_Kar98k_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_BowieKnife_ActualContent", class'Class'));
    All = class<ROWeapon>(DynamicLoadObject("GOM3.GOMWeapon_M1_Carbine_ActualContent", class'Class'));
    All = class<ROTurret>(DynamicLoadObject("AmmoCrate.TestWeap_M3A1_SMG_Content", class'Class'));
    All = class<ROTurret>(DynamicLoadObject("AmmoCrate.TESTWeap_PPSH41_SMG_Content", class'Class'));
    */

    ROMI.SharedContentReferences.AddItem(All);

    AddSharedContentRef(All);

    ROGameInfo(WorldInfo.Game).PlayerControllerClass = class'ACPlayerController';
    ROGameInfo(WorldInfo.Game).PlayerReplicationInfoClass = class'ACPlayerReplicationInfo';
    ROGameInfo(WorldInfo.Game).PawnHandlerClass = class'ACPawnHandler';
        
        if (ROGameInfo(WorldInfo.Game).PawnHandlerClass != class'ACPawnHandler')
        {
        `log("Error replacing Pawn Handler");
        }
        Else
        {
        `log("Replaced Pawn Handler");
        }

    foreach allactors(class'ROVolumeNoArtillery', ROVA)
    {
    ROVA.ShutDown();
    ROVA.Destroy();
    }

    super.PreBeginPlay();
    
    StaticSaveConfig();

    }

static function ENorthernForces GetNorthernForce()
{
	return ROMapInfo(default.WorldInfo.GetMapInfo()).default.NorthernForce;
}

static function ESouthernForces GetSouthernForce()
{
	return ROMapInfo(default.WorldInfo.GetMapInfo()).default.SouthernForce;
}

function PostBeginPlay()
{
    `log("PostBeginPlay()");
    ReplacePawns();
}

function AddSharedContentRef(object ObjectToAdd);

/*
function ModifyPlayer(Pawn Other)
    {
    local RORoleInfo RORI;
    local ACPlayerReplicationInfo ACPRI;
    local class<ROWeapon> ROWC;

    ACPRI = ACPlayerReplicationInfo(Other.PlayerReplicationInfo);
    RORI = ACPRI.RoleInfo;

    `log("RORI = " $ RORI);

    ForEach RORI.Items[RORIGM_Default].OtherItems(ROWC)
    {
        `log("Item = " $ ROWC);
    }

    super.ModifyPlayer(Other);
    }
*/

simulated function ReplacePawns()
{
    ROGameInfo(WorldInfo.Game).SouthRoleContentClasses = RORICSouth;
    ROGameInfo(WorldInfo.Game).NorthRoleContentClasses = RORICNorth;
    `log("Pawns replaced");
}

simulated function ModifyPlayer(Pawn Other)
{
    super.ModifyPlayer(Other);

    ReplacePawns();
}

simulated function ModifyPreLogin(string Options, string Address, out string ErrorMessage)
{
    ReplacePawns();
}

function NotifyLogin(Controller NewPlayer)
    {
        ACPC = ACPlayerController(NewPlayer);

        if (ACPC == None)
        {
            `log("Error replacing roles");
            return;
        }

        ACPC.ReplacePawnHandler();
        ACPC.ClientReplacePawnHandler();
        ACPC.ReplaceRoles();
        ACPC.ClientReplaceRoles();
        ACPC.ReplaceInventoryManager();
        ACPC.ClientReplaceInventoryManager();
        
        super.NotifyLogin(NewPlayer);
    }
    
function ClearVehicles()
{
	local ROVehicle ROV;

	foreach WorldInfo.AllPawns(class'ROVehicle', ROV)
	{
		if( !ROV.bDriving )
            ROV.ShutDown();
			ROV.Destroy();
	}
}

/*function Slomo( float F )
{
    while (ROGameInfo(WorldInfo.Game).bRoundHasBegun && WorldInfo.TimeDilation != F)
    {
        if (0.25 <= F && F <= 4)
	    {
	        WorldInfo.Game.SetGameSpeed(F);
        }
        else
        {
            WorldInfo.Game.SetGameSpeed(1);
            `log("Error");
        }
    }

    while (!ROGameInfo(WorldInfo.Game).bRoundHasBegun && WorldInfo.TimeDilation != 1)
    {
	    WorldInfo.Game.SetGameSpeed(1);
    }
}*/

function SetJumpZ(PlayerController PC, float F )
{
    //while (ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.JumpZ != F)
    //{
        if (0.5 <= F && F <= 10)
	    {
	        PC.Pawn.JumpZ = F;
        }
        else
        {
            PC.Pawn.JumpZ = 1;
            `log("Error");
        }
    //}

    //while (!ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.JumpZ != 1)
    //{
	//    PC.Pawn.JumpZ = 1;
    //}
}

function SetGravity(PlayerController PC, float F )
{
    //while (ROGameInfo(WorldInfo.Game).bRoundHasBegun && WorldInfo.WorldGravityZ != WorldInfo.Default.WorldGravityZ * F)
    //{
        if (-1000 <= F && F <= 1000)
	    {
            WorldInfo.WorldGravityZ = WorldInfo.Default.WorldGravityZ * F;
        }
        else
        {
            WorldInfo.WorldGravityZ = WorldInfo.Default.WorldGravityZ;
            `log("Error");
        }
    //}

    /*while (!ROGameInfo(WorldInfo.Game).bRoundHasBegun && WorldInfo.WorldGravityZ != WorldInfo.Default.WorldGravityZ)
    {
        WorldInfo.WorldGravityZ = WorldInfo.Default.WorldGravityZ;
    }*/
}

function SetSpeed(PlayerController PC, float F )
{
    //while (ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.GroundSpeed != PC.Pawn.Default.GroundSpeed * F && PC.Pawn.WaterSpeed != PC.Pawn.Default.WaterSpeed * F)
    //{
        if (0.5 <= F && F <= 5)
	    {
            PC.Pawn.GroundSpeed = PC.Pawn.Default.GroundSpeed * F;
	        PC.Pawn.WaterSpeed = PC.Pawn.Default.WaterSpeed * F;
        }
        else
        {
            PC.Pawn.GroundSpeed = PC.Pawn.Default.GroundSpeed;
	        PC.Pawn.WaterSpeed = PC.Pawn.Default.WaterSpeed;
            `log("Error");
        }
    //}

    /*while (!ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.GroundSpeed != PC.Pawn.Default.GroundSpeed && PC.Pawn.WaterSpeed != PC.Pawn.Default.WaterSpeed)
    {
        PC.Pawn.GroundSpeed = PC.Pawn.Default.GroundSpeed;
	    PC.Pawn.WaterSpeed = PC.Pawn.Default.WaterSpeed;
    } */
}

function ChangeSize(PlayerController PC, float F )
{
    //while (ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.CylinderComponent.CollisionHeight != PC.Pawn.Default.CylinderComponent.CollisionHeight * F)
    //{
        if (0.1 <= F && F <= 50)
	    {
            PC.Pawn.CylinderComponent.SetCylinderSize(PC.Pawn.CylinderComponent.CollisionRadius * F / 2, PC.Pawn.CylinderComponent.CollisionHeight * F);
	        PC.Pawn.SetDrawScale(F);
	        PC.Pawn.SetLocation(PC.Pawn.Location);
        }
        else
        {
            PC.Pawn.CylinderComponent.SetCylinderSize(PC.Pawn.Default.CylinderComponent.CollisionRadius, PC.Pawn.Default.CylinderComponent.CollisionHeight);
	        PC.Pawn.SetDrawScale(1);
	        PC.Pawn.SetLocation(PC.Pawn.Location);
            `log("Error");
        }
    //}

    //while (!ROGameInfo(WorldInfo.Game).bRoundHasBegun && PC.Pawn.CylinderComponent.CollisionHeight != PC.Pawn.Default.CylinderComponent.CollisionHeight)
    //{
    //    PC.Pawn.CylinderComponent.SetCylinderSize(PC.Pawn.Default.CylinderComponent.CollisionRadius, PC.Pawn.Default.CylinderComponent.CollisionHeight);
	//    PC.Pawn.SetDrawScale(1);
	//    PC.Pawn.SetLocation(PC.Pawn.Location);
    //}
}

function AddBots(int Num, optional int NewTeam = -1, optional bool bNoForceAdd)
{
	local ROAIController ROBot;
	local byte ChosenTeam;
	local byte SuggestedTeam;
	// GRIP BEGIN
	local ROPlayerReplicationInfo ROPRI;
	// GRIP END
	// do not add bots during server travel
    ROGI = ROGameInfo(WorldInfo.Game);

	if( ROGI.bLevelChange )
	{
		return;
	}

	while ( Num > 0 && ROGI.NumBots + ROGI.NumPlayers < ROGI.MaxPlayers )
	{
		// Create a new Controller for this Bot
	    ROBot = Spawn(ROGI.AIControllerClass);

		// Assign the bot a Player ID
		ROBot.PlayerReplicationInfo.PlayerID = ROGI.CurrentID++;

		// Suggest a team to put the AI on
		if ( ROGI.bBalanceTeams || NewTeam == -1 )
		{
			if ( ROGI.GameReplicationInfo.Teams[`AXIS_TEAM_INDEX].Size - ROGI.GameReplicationInfo.Teams[`ALLIES_TEAM_INDEX].Size <= 0
				&& ROGI.BotCapableNorthernRolesAvailable() )
			{
				SuggestedTeam = `AXIS_TEAM_INDEX;
			}
			else if( ROGI.BotCapableSouthernRolesAvailable() )
			{
				SuggestedTeam = `ALLIES_TEAM_INDEX;
			}
			// If there are no roles available on either team, don't allow this to go any further
			else
			{
				ROBot.Destroy();
				return;
			}
		}
		else if (ROGI.BotCapableNorthernRolesAvailable() || ROGI.BotCapableSouthernRolesAvailable())
		{
			SuggestedTeam = NewTeam;
		}
		else
		{
			ROBot.Destroy();
			return;
		}

		// Put the new Bot on the Team that needs it
		ChosenTeam = ROGI.PickTeam(SuggestedTeam, ROBot);
		// Set the bot name based on team
		ROGI.ChangeName(ROBot, ROGI.GetDefaultBotName(ROBot, ChosenTeam, ROTeamInfo(ROGI.GameReplicationInfo.Teams[ChosenTeam]).NumBots + 1), false);

		ROGI.JoinTeam(ROBot, ChosenTeam);

		ROBot.SetTeam(ROBot.PlayerReplicationInfo.Team.TeamIndex);

		// Have the bot choose its role
		if( !ROBot.ChooseRole() )
		{
			ROBot.Destroy();
			continue;
		}

		ROBot.ChooseSquad();

		// GRIP BEGIN
		// Remove. Debugging purpose only.
		ROPRI = ROPlayerReplicationInfo(ROBot.PlayerReplicationInfo);
		if( ROPRI.RoleInfo.bIsTankCommander )
		{
			ROGI.ChangeName(ROBot, ROPRI.GetHumanReadableName()$" (TankAI)", false);
		}
		// GRIP END

		if ( ROTeamInfo(ROBot.PlayerReplicationInfo.Team) != none && ROTeamInfo(ROBot.PlayerReplicationInfo.Team).ReinforcementsRemaining > 0 )
		{
			// Spawn a Pawn for the new Bot Controller
			ROGI.RestartPlayer(ROBot);
		}

		if ( ROGI.bInRoundStartScreen )
		{
			ROBot.AISuspended();
		}

		// Note that we've added another Bot
		if( !bNoForceAdd )
		ROGI.DesiredPlayerCount++;
	    ROGI.NumBots++;
		Num--;
		ROGI.UpdateGameSettingsCounts();
	}
}

function RemoveBots()
{
    local ROAIController ROB;
    foreach allactors(class'ROAIController', ROB)
    {
        ROB.ShutDown();
        ROB.Destroy();
        ROB.Pawn.ShutDown();
        ROB.Pawn.Destroy();
    }
}

function AllAmmo(PlayerController PC)
{
	ROInventoryManager(PC.Pawn.InvManager).AllAmmo(true);
	ROInventoryManager(PC.Pawn.InvManager).bInfiniteAmmo = true;
	ROInventoryManager(PC.Pawn.InvManager).DisableClientAmmoTracking();
}

function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

function SpawnObject(PlayerController PC, string S)
{
    
}

function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
    {
        local array<string> Args;
        local string        command;

        Args = SplitString(MutateString, " ", true);
        command = Caps(Args[0]);
        PlayerName = PC.PlayerReplicationInfo.PlayerName;
        
        //if (!bMatchLive)
        //{
            Switch (Command)
            {
                case "GIVEWEAPON":
                GiveWeapon(PC, Args[1]);
                
                if (Args[1] != -1)
                    {
                        WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" spawned a "$Args[1]$"");
                        `log("[29th Extras] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                else
                    {
                        `log("[29th Extras] Giveweapon failed! "$PlayerName$" tried to spawn a "$Args[1]$"");
                    }
                break;
                
                case "SPAWNVEHICLE":
                SpawnVehicle(PC, Args[1]);
                
                if (SpawnVehicle.ValidName != False)
                    {
                        WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" spawned a "$Args[1]$"");
                        `log("[29th Extras] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                else
                    {
                        `log("[29th Extras] Spawnvehicle failed! "$PlayerName$" tried to spawn a "$Args[1]$" at" $SpawnVehicle.EndShot);
                    }
                break;

                case "CLEARVEHICLES":
                ClearVehicles();
                `log("Clearing Vehicles");
                break;

                //case "SLOMO":
                //Slomo(float(Args[1]));
                //`log("Slomo");
                //break;

                case "SetJumpZ":
                SetJumpZ(PC, float(Args[1]));
                `log("SetJumpZ");
                WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" set their JumpZ to "$Args[1]$"");
                break;

                case "SetGravity":
                SetGravity(PC, float(Args[1]));
                `log("SetGravity");
                WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" set gravity to "$Args[1]$"");
                break;

                case "SetSpeed":
                SetSpeed(PC, float(Args[1]));
                `log("SetSpeed");
                WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" set their speed to "$Args[1]$"");
                break;

                case "ChangeSize":
                ChangeSize(PC, float(Args[1]));
                `log("ChangeSize");
                WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" set their size to "$Args[1]$"");
                break;

                case "ADDBOTS":
                AddBots(int(Args[1]), int(Args[2]), bool(Args[3]));
                `log("Added Bots");
                break;

                case "REMOVEBOTS":
                RemoveBots();
                `log("Removed Bots");
                break;

                case "ALLAMMO":
                AllAmmo(PC);
                `log("Infinite Ammo");
                WorldInfo.Game.Broadcast(self, "[29th Extras] "$PlayerName$" toggled AllAmmo");
                break;
            }
        //}
        //Else
        //{
        //    PrivateMessage(PC, "Command failed: LIVE has been called");
        //}

    super.Mutate(MutateString, PC);
    }

function int StringToInt(PlayerController PC, string String)
    {
        switch (string)
        {
            case "VCAMMO":

            break;

            case "BHP":

            break;

            case "M79WP":

            break;

            case "MEME":

            break;

            case "MG34":

            break;

            case "DSHK":

            break;

            case "AKM":

            break;

            case "C4":

            break;

            case "F1":

            break;

            case "FOUGASSE":

            break;

            case "IZH43":

            break;

            case "K50M":

            break;

            case "L1A1":

            break;

            case "L2A1":

            break;

            case "M1CARBINE":

            break;

            case "M14":

            break;

            case "M1630RND":

            break;

            case "TYPE56":

            break;

            case "M16":

            break;

            case "CLAYMORE":

            break;

            case "M18SMOKE":

            break;

            case "M1911":

            break;

            case "REVOLVER":

            break;

            case "BAR":

            break;

            case "M1919":

            break;

            case "TYPE56-1":

            break;

            case "THOMPSON":

            break;

            case "M1DGARAND":

            break;

            case "M1GARAND":

            break;

            case "M2CARBINE":

            break;

            case "WP":

            break;

            case "DUCKBILL":

            break;

            case "STAKEOUT":

            break;

            case "TRENCH":

            break;

            case "M40":

            break;

            case "M60":

            break;

            case "M61":

            break;

            case "M61QUAD":

            break;

            case "M79":

            break;

            case "M79BUCKSHOT":

            break;

            case "M79SMOKE":

            break;

            case "M8SMOKE":

            break;

            case "FLAMETHROWER":

            break;

            case "MAS49":

            break;

            case "MAS49GRENADE":

            break;

            case "MAS49SNIPER":

            break;

            case "MAT49":

            break;

            case "MD82":

            break;

            case "MOSIN":

            break;

            case "MOSINSNIPER":

            break;

            case "MOLOTOV":

            break;

            case "MP40":

            break;

            case "OWEN":

            break;

            case "MAKAROV":

            break;

            case "PPSH":

            break;

            case "PPSHDRUM":

            break;

            case "RDG1SMOKE":

            break;

            case "RP46":

            break;

            case "RPD":

            break;

            case "RPG7":

            break;

            case "PUNJI":

            break;
    
            case "RDG1SMOKE":
            return 62;
            break;
        
            case "RP46":
            return 63;
            break;
        
        
            return 64;
            case "RPD":
            break;
        
            case "RPG7":
            return 65;
            break;
        
            case "SKS":
            return 66;
            break;
        
            case "SVD":
            return 67;
            break;

            case "TRIPWIRE":
            return 68;
            break;

            case "TT33":
            return 69;
            break;

            case "TYPE67":
            return 70;
            break;

            case "SATCHEL":
            return 71;
            break;

            case "XM17730RND":
            return 72;
            break;

            case "XM177":
            return 73;
            break;

            case "XM21SNIPER":
            return 74;
            break;

            case "XM21SILENCED":
            return 75;
            break;

            case "M18YELLOW":
            return 87;
            break;

            case "M18RED":
            return 88;
            break;

            case "M18PURPLE":
            return 89;
            break;

            case "M18GREEN":
            return 90;
            break;

            /*case "RPG2":
            return 91;
            break;

            case "RPDSAWNOFF":
            return 92;
            break;

            case "PPS43":
            return 93;
            break;

            case "M38CARBINE":
            return 94;
            break;

            case "M7RIFLENADE":
            return 95;
            break;

            case "KAR98K":
            return 96;
            break;

            case "BOWIE":
            return 97;
            break;

            case "GOMCARBINE":
            return 98;
            break;

            case "M113":
            return 99;
            break;

            case "MG34HMG":
            return 102;
            break;
            */
            case "MKB42":
            return 101;
            break;

            case "CIWS":
            return 102;
            break;

            case "RPPG":
            return 103;
            break;

            case "SALUTE":
            return 104;
            break;

            default:
        }
    }

function SpawnVehicle(PlayerController PC, string VehicleName)
{
	local vector                    CamLoc, StartShot, EndShot, X, Y, Z;
	local rotator                   CamRot;
	local class<ROVehicle>          Cobra;
    local class<ROVehicle>          Loach;
    local class<ROVehicle>          Huey;
    local class<ROVehicle>          Bushranger;
    local class<ROVehicle>          M113ACAV;
    local class<ROVehicle>          T20;
    local class<ROVehicle>          T26;
    local class<ROVehicle>          T28;
    local class<ROVehicle>          HT130;
    local class<ROVehicle>          ATGun;
    local class<ROVehicle>          Vickers;
    //local class<ROVehicle>          M113;
	local ROVehicle ROHelo;
    local bool ValidName;

	ACPC.GetPlayerViewPoint(CamLoc, CamRot);
	// Do ray check and grab actor
	GetAxes(CamRot, X, Y, Z );
	StartShot   = PC.Pawn.Location;
	EndShot     = StartShot + (450.0 * X) + (300 * Z);

	Cobra = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_AH1G_Content", class'Class'));
    Loach = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_OH6_Content", class'Class'));
    Huey = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Content", class'Class'));
    Bushranger = class<ROVehicle>(DynamicLoadObject("ROGameContent.ROHeli_UH1H_Gunship_Content", class'Class'));
    M113ACAV = class<ROVehicle>(DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class'));
    T20 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class'));
    T26 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class'));
    T28 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class'));
    HT130 = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class'));
    ATGun = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class'));
    Vickers = class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class'));
    //M113 = class<ROVehicle>(DynamicLoadObject("AmmoCrate.ACVehicle_M113_APC_Content", class'Class'));

    switch (VehicleName)
    {
        case "Cobra":
        ROHelo = Spawn(Cobra, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "Loach":
        ROHelo = Spawn(Loach, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "Huey":
        ROHelo = Spawn(Huey, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "Bushranger":
        ROHelo = Spawn(Bushranger, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "M113ACAV":
        ROHelo = Spawn(M113ACAV, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "T20":
		ROHelo = Spawn(T20, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "T26":
		ROHelo = Spawn(T26, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "T28":
		ROHelo = Spawn(T28, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "HT130":
		ROHelo = Spawn(HT130, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        case "Vickers":
		ROHelo = Spawn(VICKERS, , , EndShot);
		ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
        break;

        default:
        ValidName = False;
        break;
    }
}

function GiveWeapon(PlayerController PC, string WeaponName)
    {
	local ROInventoryManager InvManager;
	InvManager = ROInventoryManager(PC.Pawn.InvManager);        
        switch (WeaponName)
        {
            case "USAMMO":
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_USAmmoCrate_Content", false, true);
            break;

            case "VCAMMO":
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_VCAmmoCrate_Content", false, true);
            break;

            case "BHP":
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_BHP_Pistol_Content", false, true);
            break;

            case "M79WP":
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M79_GrenadeLauncher_Level3", false, true);
            break;

            case "MEME":

            break;

            case "MG34":

            break;

            case "DSHK":

            break;

            case "AKM":

            break;

            case "C4":

            break;

            case "F1":

            break;

            case "FOUGASSE":

            break;

            case "IZH43":

            break;

            case "K50M":

            break;

            case "L1A1":

            break;

            case "L2A1":

            break;

            case "M1CARBINE":

            break;

            case "M14":

            break;

            case "M1630RND":

            break;

            case "TYPE56":

            break;

            case "M16":

            break;

            case "CLAYMORE":

            break;

            case "M18SMOKE":

            break;

            case "M1911":

            break;

            case "REVOLVER":

            break;

            case "BAR":

            break;

            case "M1919":

            break;

            case "TYPE56-1":

            break;

            case "THOMPSON":

            break;

            case "M1DGARAND":

            break;

            case "M1GARAND":

            break;

            case "M2CARBINE":

            break;

            case "WP":

            break;

            case "DUCKBILL":

            break;

            case "STAKEOUT":

            break;

            case "TRENCH":

            break;

            case "M40":

            break;

            case "M60":

            break;

            case "M61":

            break;

            case "M61QUAD":

            break;

            case "M79":

            break;

            case "M79BUCKSHOT":

            break;

            case "M79SMOKE":

            break;

            case "M8SMOKE":

            break;

            case "FLAMETHROWER":

            break;

            case "MAS49":

            break;

            case "MAS49GRENADE":

            break;

            case "MAS49SNIPER":

            break;

            case "MAT49":

            break;

            case "MD82":

            break;

            case "MOSIN":

            break;

            case "MOSINSNIPER":

            break;

            case "MOLOTOV":

            break;

            case "MP40":

            break;

            case "OWEN":

            break;

            case "MAKAROV":

            break;

            case "PPSH":

            break;

            case "PPSHDRUM":

            break;

            case "RDG1SMOKE":

            break;

            case "RP46":

            break;

            case "RPD":

            break;

            case "RPG7":

            break;

            case "PUNJI":

            break;
    
            case "RDG1SMOKE":
            return 62;
            break;
        
            case "RP46":
            return 63;
            break;
        
        
            return 64;
            case "RPD":
            break;
        
            case "RPG7":
            return 65;
            break;
        
            case "SKS":
            return 66;
            break;
        
            case "SVD":
            return 67;
            break;

            case "TRIPWIRE":
            return 68;
            break;

            case "TT33":
            return 69;
            break;

            case "TYPE67":
            return 70;
            break;

            case "SATCHEL":
            return 71;
            break;

            case "XM17730RND":
            return 72;
            break;

            case "XM177":
            return 73;
            break;

            case "XM21SNIPER":
            return 74;
            break;

            case "XM21SILENCED":
            return 75;
            break;

            case "M18YELLOW":
            return 87;
            break;

            case "M18RED":
            return 88;
            break;

            case "M18PURPLE":
            return 89;
            break;

            case "M18GREEN":
            return 90;
            break;

            /*case "RPG2":
            return 91;
            break;

            case "RPDSAWNOFF":
            return 92;
            break;

            case "PPS43":
            return 93;
            break;

            case "M38CARBINE":
            return 94;
            break;

            case "M7RIFLENADE":
            return 95;
            break;

            case "KAR98K":
            return 96;
            break;

            case "BOWIE":
            return 97;
            break;

            case "GOMCARBINE":
            return 98;
            break;

            case "M113":
            return 99;
            break;

            case "MG34HMG":
            return 102;
            break;
            */
            case "MKB42":
            return 101;
            break;

            case "CIWS":
            return 102;
            break;

            case "RPPG":
            return 103;
            break;

            case "SALUTE":
            return 104;
            break;

            default:
            `log("[29th Extras] Giveweapon failed! "$PlayerName$" tried to spawn a "$WeaponName$"");
            PrivateMessage(PC, "Not a valid weapon name.");
            break;
        }

        if (WeaponName == -1)
        {
            PrivateMessage(PC, "Not a valid weapon name.");
        }
        if (WeaponName == 1)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_USAmmoCrate_Content", false, true);
        }
        if (WeaponName == 2)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_VCAmmoCrate_Content", false, true);
        }
        if (WeaponName == 3)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_BHP_Pistol_Content", false, true);
        }
        if (WeaponName == 4)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M79_GrenadeLauncher_Level3", false, true);
        }
        if (WeaponName == 5)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M79_MemeLauncher_Content", false, true);
        }
        if (WeaponName == 6)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_MG34_LMG_Content", false, true);
        }
        if (WeaponName == 7)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROItem_PlaceableHMG_Content", false, true);
        }
        if (WeaponName == 8)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_AKM", false, true);
        }
        if (WeaponName == 10)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_C4_Explosive_Content", false, true);
        }
        if (WeaponName == 11)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_DP28_LMG_Content", false, true);
        }
        if (WeaponName == 12)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_F1_SMG_Content", false, true);
        }
        if (WeaponName == 13)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Fougasse_Mine_Content", false, true);
        }
        if (WeaponName == 14)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_IZH43_Shotgun_Content", false, true);
        }
        if (WeaponName == 15)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_K50M_SMG_Content", false, true);
        }
        if (WeaponName == 16)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_L1A1_Rifle_Content", false, true);
        }
        if (WeaponName == 17)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_L2A1_LMG_Content", false, true);
        }
        if (WeaponName == 18)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1_Carbine_30rd", false, true);
        }
        if (WeaponName == 19)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M14_Rifle_Content", false, true);
        }
        if (WeaponName == 20)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M16A1_AssaultRifle_30rd", false, true);
        }
        if (WeaponName == 21)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_Type56", false, true);
        }
        if (WeaponName == 22)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M16A1_AssaultRifle_Content", false, true);
        }
        if (WeaponName == 23)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M18_Claymore_Content", false, true);
        }
        if (WeaponName == 24)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M18_SignalSmoke_Purple", false, true);
        }
        if (WeaponName == 25)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1911_Pistol_Content", false, true);
        }
        if (WeaponName == 26)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1917_Pistol_Content", false, true);
        }
        if (WeaponName == 27)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1918_BAR_Content", false, true);
        }
        if (WeaponName == 28)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1919A6_LMG_Content", false, true);
        }
        if (WeaponName == 29)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_AK47_AssaultRifle_Type56_1", false, true);
        }
        if (WeaponName == 30)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1A1_SMG_Content", false, true);
        }
        if (WeaponName == 31)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1DGarand_SniperRifle_Content", false, true);
        }
        if (WeaponName == 32)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M1Garand_Rifle_Content", false, true);
        }
        if (WeaponName == 33)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M2_Carbine_Content", false, true);
        }
        if (WeaponName == 34)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M34_WP_Content", false, true);
        }
        if (WeaponName == 35)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Duckbill", false, true);
        }
        if (WeaponName == 36)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Stakeout", false, true);
        }
        if (WeaponName == 37)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M37_Shotgun_Trench", false, true);
        }
        if (WeaponName == 38)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M3A1_SMG_Content", false, true);
        }
        if (WeaponName == 39)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M40Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 40)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M60_GPMG_Level2", false, true);
        }
        if (WeaponName == 41)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M61_Grenade_Content", false, true);
        }
        if (WeaponName == 42)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M61_Grenade_ContentQuad", false, true);
        }
        if (WeaponName == 43)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Content", false, true);
        }
        if (WeaponName == 44)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Level2", false, true);
        }
        if (WeaponName == 45)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M79_GrenadeLauncher_Level3", false, true);
        }
        if (WeaponName == 46)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M8_Smoke_Content", false, true);
        }
        if (WeaponName == 47)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_M9_Flamethrower_Content", false, true);
        }
        if (WeaponName == 48)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49_Rifle_Content", false, true);
        }
        if (WeaponName == 49)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49_Rifle_Grenade_Content", false, true);
        }
        if (WeaponName == 50)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAS49Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 51)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MAT49_SMG_Content", false, true);
        }
        if (WeaponName == 52)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MD82_Mine_Content", false, true);
        }
        if (WeaponName == 53)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MN9130_Rifle_Content", false, true);
        }
        if (WeaponName == 54)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MN9130Scoped_Rifle_Content", false, true);
        }
        if (WeaponName == 55)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Molotov_Content", false, true);
        }
        if (WeaponName == 56)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_MP40_SMG_Content", false, true);
        }
        if (WeaponName == 57)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Owen_SMG_Content", false, true);
        }
        if (WeaponName == 58)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PM_Pistol_Content", false, true);
        }
        if (WeaponName == 59)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PPSH41_SMG_Content", false, true);
        }
        if (WeaponName == 60)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PPSH41_SMG_Drum", false, true);
        }
        if (WeaponName == 61)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_PunjiTrap_Content", false, true);
        }
        if (WeaponName == 62)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RDG1_Smoke_Content", false, true);
        }
        if (WeaponName == 63)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RP46_LMG_Content", false, true);
        }
        if (WeaponName == 64)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RPD_LMG_200rd", false, true);
        }
        if (WeaponName == 65)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_RPG7_RocketLauncher_Content", false, true);
        }
        if (WeaponName == 66)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_SKS_Rifle_Content", false, true);
        }
        if (WeaponName == 67)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_SVDScoped_Rifle_Content", false, true);
        }
        if (WeaponName == 68)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_TripwireTrap_Content", false, true);
        }
        if (WeaponName == 69)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_TT33_Pistol_Content", false, true);
        }
        if (WeaponName == 70)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_Type67_Grenade_Content", false, true);
        }
        if (WeaponName == 71)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_VietSatchel_Content", false, true);
        }
        if (WeaponName == 72)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM177E1_Carbine_30rd", false, true);
        }
        if (WeaponName == 73)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM177E1_Carbine_Content", false, true);
        }
        if (WeaponName == 74)
        {
            InvManager.LoadAndCreateInventory("ROGameContent.ROWeap_XM21Scoped_Rifle_Level2", false, true);
        }
        if (WeaponName == 75)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_XM21Scoped_Rifle_Suppressed", false, true);
        }
        if (WeaponName == 87)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Yellow_Content", false, true);
        }
        if (WeaponName == 88)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Red_Content", false, true);
        }
        if (WeaponName == 89)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Purple_Content", false, true);
        }
        if (WeaponName == 90)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACWeap_M18_SignalSmoke_Green_Content", false, true);
        }
        /*if (WeaponName == 91)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_RPG2_ActualContent", false, true);
        }
        if (WeaponName == 92)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_RPD_SawnOff_ActualContent", false, true);
        }
        if (WeaponName == 93)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_PPS_ActualContent", false, true);
        }
        if (WeaponName == 94)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M38_Carbine_ActualContent", false, true);
        }
        if (WeaponName == 95)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M7RifleGrenade_ActualContent", false, true);
        }
        if (WeaponName == 96)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_Kar98k_ActualContent", false, true);
        }
        if (WeaponName == 97)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_BowieKnife_ActualContent", false, true);
        }
        if (WeaponName == 98)
        {
            InvManager.LoadAndCreateInventory("GOM3.GOMWeapon_M1_Carbine_ActualContent", false, true);
        }*/
        if (WeaponName == 100)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACItem_PlaceableHMG_MG34_Content", false, true);
        }
        if (WeaponName == 101)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ROWeap_MKb42_AssaultRifle_Content", false, true);
        }
        if (WeaponName == 102)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.TestWeap_M3A1_SMG_Content", false, true);
        }
        if (WeaponName == 103)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.TESTWeap_PPSH41_SMG_Content", false, true);
        }
        if (WeaponName == 104)
        {
            InvManager.LoadAndCreateInventory("AmmoCrate.ACSaluteHands", false, true);
        }
    }

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("AmmoCrate.ACSouthPawn"))
    RORICNorth=(LevelContentClasses=("AmmoCrate.ACNorthPawn"))
}

        /*if(String ~= "USAMMO")
        {
            return 1;
        }
        else if(String ~= "VCAMMO")
        {
            return 2;
        }
        else if(String ~= "BHP")
        {
            return 3;
        }
        else if(String ~= "M79WP")
        {
            return 4;
        }
        else if(String ~= "MEME")
        {
            return 5;
        }
        else if(String ~= "MG34")
        {
            return 6;
        }
        else if(String ~= "DSHK")
        {
            return 7;
        }
        else if(String ~= "AKM")
        {
            return 8;
        }
        else if(String ~= "C4")
        {
            return 10;
        }
        else if(String ~= "DP28")
        {
            return 11;
        }
        else if(String ~= "F1")
        {
            return 12;
        }
        else if(String ~= "FOUGASSE")
        {
            return 13;
        }
        else if(String ~= "IZH43")
        {
            return 14;
        }
        else if(String ~= "K50M")
        {
            return 15;
        }
        else if(String ~= "L1A1")
        {
            return 16;
        }
        else if(String ~= "L2A1")
        {
            return 17;
        }
        else if(String ~= "M1CARBINE")
        {
            return 18;
        }
        else if(String ~= "M14")
        {
            return 19;
        }
        else if(String ~= "M1630RND")
        {
            return 20;
        }
        else if(String ~= "TYPE56")
        {
            return 21;
        }
        else if(String ~= "M16")
        {
            return 22;
        }
        else if(String ~= "CLAYMORE")
        {
            return 23;
        }
        else if(String ~= "M18SMOKE")
        {
            return 24;
        }
        else if(String ~= "M1911")
        {
            return 25;
        }
        else if(String ~= "REVOLVER")
        {
            return 26;
        }
        else if(String ~= "BAR")
        {
            return 27;
        }
        else if(String ~= "M1919")
        {
            return 28;
        }
        else if(String ~= "TYPE56-1")
        {
            return 29;
        }
        else if(String ~= "THOMPSON")
        {
            return 30;
        }
        else if(String ~= "M1DGARAND")
        {
            return 31;
        }
        else if(String ~= "M1GARAND")
        {
            return 32;
        }
        else if(String ~= "M2CARBINE")
        {
            return 33;
        }
        else if(String ~= "M34WP")
        {
            return 34;
        }
        else if(String ~= "DUCKBILL")
        {
            return 35;
        }
        else if(String ~= "STAKEOUT")
        {
            return 36;
        }
        else if(String ~= "TRENCH")
        {
            return 37;
        }
        else if(String ~= "GREASEGUN")
        {
            return 38;
        }
        else if(String ~= "M40")
        {
            return 39;
        }
        else if(String ~= "M60")
        {
            return 40;
        }
        else if(String ~= "M61")
        {
            return 41;
        }
        else if(String ~= "M61QUAD")
        {
            return 42;
        }
        else if(String ~= "M79")
        {
            return 43;
        }
        else if(String ~= "M79BUCKSHOT")
        {
            return 44;
        }
        else if(String ~= "M79SMOKE")
        {
            return 45;
        }
        else if(String ~= "M8SMOKE")
        {
            return 46;
        }
        else if(String ~= "FLAMETHROWER")
        {
            return 47;
        }
        else if(String ~= "MAS49")
        {
            return 48;
        }
        else if(String ~= "MAS49GRENADE")
        {
            return 49;
        }
        else if(String ~= "MAS49SNIPER")
        {
            return 50;
        }
        else if(String ~= "MAT49")
        {
            return 51;
        }
        else if(String ~= "MD82")
        {
            return 52;
        }
        else if(String ~= "MOSIN")
        {
            return 53;
        }
        else if(String ~= "MOSINSNIPER")
        {
            return 54;
        }
        else if(String ~= "MOLOTOV")
        {
            return 55;
        }
        else if(String ~= "MP40")
        {
            return 56;
        }
        else if(String ~= "OWEN")
        {
            return 57;
        }
        else if(String ~= "MAKAROV")
        {
            return 58;
        }
        else if(String ~= "PPSH")
        {
            return 59;
        }
        else if(String ~= "PPSHDRUM")
        {
            return 60;
        }
        else if(String ~= "PUNJI")
        {
            return 61;
        }
        */