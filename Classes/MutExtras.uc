class MutExtras extends ROMutator
	config(MutExtras);

var string                  PlayerName;
var ACPlayerController      ACPC;
var ROGameInfo              ROGI;
var RORoleInfoClasses       RORICSouth;
var RORoleInfoClasses       RORICNorth;
var ROMapInfo               ROMI;

var bool                    bisVanilla;
var array<Byte> 		    HitNum;
var array<String> 	        HitVicName;

var config array<String>    PlayerRankAndUnit;
var config Bool             bLoadGOM, bLoadWW, bInfiniteRoles, bAITRoles;

simulated function PreBeginPlay()
{
    `log ("[MutExtras Debug] init");
    
    if (!IsWWThere() && !IsMutThere("GOM"))
    {
        bisVanilla = true;
        ROGameInfo(WorldInfo.Game).PlayerControllerClass        = class'ACPlayerController';
        ROGameInfo(WorldInfo.Game).PlayerReplicationInfoClass   = class'ACPlayerReplicationInfo';
        ROGameInfo(WorldInfo.Game).PawnHandlerClass             = class'ACPawnHandler';
        ReplacePawns();
    }

    super.PreBeginPlay();
}

function ModifyPlayer(Pawn Other)
{
    //Attach 29th decals onto the headgear mesh
	ACPawn(Other).PlayerRank = ACPlayerReplicationInfo(Other.PlayerReplicationInfo).PlayerRank;
	ACPawn(Other).PlayerUnit = ACPlayerReplicationInfo(Other.PlayerReplicationInfo).PlayerUnit;

    super.ModifyPlayer(Other);
}

simulated function NotifyLogin(Controller NewPlayer)
{
    local ACPCDummy DummyPC;

    if (bisVanilla)
    {
        ACPC = ACPlayerController(NewPlayer);

        if (ACPC == None)
        {
            // `log ("[MutExtras Debug] Error replacing roles");
            return;
        }

        ACPC.ReplacePawnHandler();
        ACPC.ClientReplacePawnHandler();
        ACPC.ReplaceRoles();
        ACPC.ClientReplaceRoles();
        ACPC.ReplaceInventoryManager();
        ACPC.ClientReplaceInventoryManager();

        ACPC.SetupUnitAndRank();
    }
    else if (IsWWThere())
    {
        DummyPC = Spawn(class'ACPCDummy', NewPlayer);
        DummyPC.ReplaceRoles(true, false);
        DummyPC.ClientReplaceRoles(true, false);
        DummyPC.Destroy();
    }
    else if (IsMutThere("GOM"))
    {
        DummyPC = Spawn(class'ACPCDummy', NewPlayer);
        DummyPC.ReplaceRoles(false, true);
        DummyPC.ClientReplaceRoles(false, true);
        DummyPC.Destroy();
    }
    else
    {
        DummyPC = Spawn(class'ACPCDummy', NewPlayer);
        DummyPC.ReplaceRoles(false, false);
        DummyPC.ClientReplaceRoles(false, false);
        DummyPC.Destroy();
    }
 
    super.NotifyLogin(NewPlayer);
}

auto state StartUp
{
    function timer()
    {
        RemoveVolumes();
    }

    function timer2()
    {
        SetVicTeam();
    }

    Begin:
    SetTimer(10, true);
    if (!IsMutThere("Commands"))
    {
        SetTimer(2, true, 'timer2');
    }
}

function RemoveVolumes()
{
    local ROVolumeAmmoResupply ROVAR;

    foreach AllActors(class'ROVolumeAmmoResupply', ROVAR)
    {
        ROVAR.Team = OWNER_Neutral;
    }
}

function SetVicTeam()
{
    local ROVehicle ROV;

    foreach DynamicActors(class'ROVehicle', ROV)
    {
        if (ROV.bDriving == true && ROV.Team != ROV.Driver.GetTeamNum() && !ROV.bDeadVehicle)
        {
            ROV.Team = ROV.Driver.GetTeamNum();
            // `log ("[MutExtras Debug] Set "$ROV$" to team "$ROV.Driver.GetTeamNum());
        }
    }
}

reliable client function ClientInfiniteRoles()
{
    InfiniteRoles();
}

simulated function InfiniteRoles()
{
    local RORoleCount   NorthRoleCount, SouthRoleCount;
    local int           I;
    local bool          FoundNTank, FoundSTank;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    if (IsWWThere())
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
            NorthRoleCount.RoleInfoClass = class'ACRoleInfoTankCrewFinnish';
            ROMI.NorthernRoles.additem(NorthRoleCount);
        }
        if (!FoundSTank)
        {
            NorthRoleCount.RoleInfoClass = ROMI.default.SouthernRoles[7].RoleInfoClass;
            ROMI.SouthernRoles.additem(SouthRoleCount);
        }
    }

    else if (ISMutThere("GOM"))
    {
        NorthRoleCount.RoleInfoClass = class'ACRoleInfoTankCrewNorth';
        ROMI.NorthernRoles.additem(NorthRoleCount);

        SouthRoleCount.RoleInfoClass = class'ACRoleInfoTankCrewSouth';
        ROMI.SouthernRoles.additem(SouthRoleCount);
    }

    for (i = 0; i < ROMI.SouthernRoles.length; i++)
    {
        ROMI.SouthernRoles[i].Count = 255;
    }    
    for (i = 0; i < ROMI.NorthernRoles.length; i++)
    {
        ROMI.NorthernRoles[i].Count = 255;
    }
}

simulated function ReplacePawns()
{
    ROGameInfo(WorldInfo.Game).SouthRoleContentClasses = RORICSouth;
    ROGameInfo(WorldInfo.Game).NorthRoleContentClasses = RORICNorth;
}

function bool IsMutThere(string Mutator)
{
	local Mutator mut;

    mut = ROGameInfo(WorldInfo.Game).BaseMutator;

    for (mut = ROGameInfo(WorldInfo.Game).BaseMutator; mut != none; mut = mut.NextMutator)
    {
        // `log("[MutCommands] IsMutThere test "$string(mut.name));
        if(InStr(string(mut.name), Mutator,,true) != -1) 
        {
            return true;
        }
    }
    return false;
}

function bool IsWWThere()
{
    local string WWName;
    WWName = class'Engine'.static.GetCurrentWorldInfo().GetMapName(true);
    if (InStr(WWName, "WW",,true) != -1)
    {
        // `log ("[MutExtras Debug] Found WinterWar!");
        return true;
    }
    return false;
}

function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

singular function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
{
    local array<string>         Args;
    local string                command;
    local string                NameValid;

    ROGI = ROGameInfo(WorldInfo.Game);
    Args = SplitString(MutateString, " ", true);
    command = Caps(Args[0]);

    PlayerName = PC.PlayerReplicationInfo.PlayerName;

		Switch (Command)
        {
            case "CHANGERANK":
                ACPlayerController(PC).SetPlayerRank(Args[1]);
                break;

            case "CHANGEUNIT":
                ACPlayerController(PC).SetPlayerUnit(Args[1]);
                break;

            case "RESETMESH":
                ACPawn(PC.Pawn).CreatePawnMesh();
                break;

            case "GIVEB":
                SpawnBarricadeTool(PC, Args[1], int(Args[2]));
                break;

            case "CLEARB":
                ClearBarricades();
                break;

            case "DELB":
                DelBarricade(PC);
                break;

            case "SALUTE":
                Salute(PC);
                break;
        }
        if (!IsMutThere("Commands"))
        {
            switch (command)
            {
                case "GIVEWEAPON":
                    GiveWeapon(PC, Args[1], NameValid, false, 100);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" spawned a "$Args[1]);
                        `log ("[MutExtras Debug] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    else
                    {
                        `log ("[MutExtras Debug] Giveweapon failed! "$PlayerName$" tried to spawn a "$Args[1]);
                        PrivateMessage(PC, "Not a valid weapon name.");
                    }
                    break;

                case "GIVEWEAPONALL":
                    GiveWeapon(PC, Args[1], NameValid, true);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" gave a "$Args[1]$" to everyone");
                        `log ("[MutExtras Debug] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    else
                    {
                        `log ("[MutExtras Debug] Giveweapon failed! "$PlayerName$" tried to spawn a "$Args[1]);
                        PrivateMessage(PC, "Not a valid weapon name.");
                    }
                    break;

                case "GIVEWEAPONNORTH":
                    GiveWeapon(PC, Args[1], NameValid, false, `AXIS_TEAM_INDEX);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" gave a "$Args[1]$" to the north");
                        `log ("[MutExtras Debug] "$PlayerName$" gave a "$Args[1]$" to the north");
                    }
                    else
                    {
                        `log ("[MutExtras Debug] Giveweapon failed! "$PlayerName$" tried to spawn a "$Args[1]);
                        PrivateMessage(PC, "Not a valid weapon name.");
                    }
                    break;

                case "GIVEWEAPONSOUTH":
                    GiveWeapon(PC, Args[1], NameValid, false, `ALLIES_TEAM_INDEX);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" gave a "$Args[1]$" to the south");
                        `log ("[MutExtras Debug] "$PlayerName$" gave a "$Args[1]$" to the south");
                    }
                    else
                    {
                        `log ("[MutExtras Debug] Giveweapon failed! "$PlayerName$" tried to spawn a "$Args[1]);
                        PrivateMessage(PC, "Not a valid weapon name.");
                    }
                    break;

                case "CLEARWEAPONS":
                    ClearWeapons(PC, false, 100);
                    WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" cleared their weapons");
                    `log("[MutCommands] Clearing Weapons");
                    break;
        
                case "CLEARWEAPONSALL":
                    ClearWeapons(PC, true);
                    WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" cleared all weapons");
                    `log("[MutCommands] Clearing Weapons");
                    break;
        
                case "CLEARWEAPONSNORTH":
                    ClearWeapons(PC, false, `AXIS_TEAM_INDEX);
                    WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" cleared north weapons");
                    `log("[MutCommands] Clearing Weapons");
                    break;
        
                case "CLEARWEAPONSSOUTH":
                    ClearWeapons(PC, false, `ALLIES_TEAM_INDEX);
                    WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" cleared south weapons");
                    `log("[MutCommands] Clearing Weapons");
                    break;

                case "SPAWNVEHICLE":
                    SpawnVehicle(PC, Args[1], NameValid);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" spawned a "$Args[1]$"");
                        `log ("[MutExtras Debug] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    else
                    {
                        `log ("[MutExtras Debug] Spawnvehicle failed! "$PlayerName$" tried to spawn a "$Args[1]);
                        PrivateMessage(PC, "Not a valid vehicle name.");
                    }
                    break;

                case "CLEARVEHICLES":
                    ClearVehicles();
                    break;

                case "ADDBOTS":
                    AddBots(int(Args[1]), int(Args[2]), bool(Args[3]));
                    `log ("[MutExtras Debug]Added Bots");
                    break;

                case "REMOVEBOTS":
                    RemoveBots();
                    `log ("[MutExtras Debug]Removed Bots");
                    break;

                /* case "FLY":
                    if (PC.bCheatFlying == false)
                    {
                        CheatManager.Fly();
                        PC.Pawn.AirSpeed = PC.Pawn.Default.AirSpeed * 20;
                        `log ("[MutExtras Debug]Fly");
                    }
                    else
                    {
                        CheatManager.Walk();
                        PC.Pawn.AirSpeed = PC.Pawn.Default.AirSpeed;
                        `log ("[MutExtras Debug]UnFly");
                    }    
                    break; */
            }
        }
    super.Mutate(MutateString, PC);
}

function Salute(PlayerController PC)
{
	ROPawn(PC.Pawn).ArmsMesh.PlayAnim('29thArms1st', ,false, false);
    //ROPawn(PC.Pawn).MyWeapon.PlayArmAnimation();
}

simulated function SpawnBarricadeTool(PlayerController PC, string ObjectName, int Amount)
{
    local ROInventoryManager                InvManager;
    local array<ROWeapon>                   WeaponList;
    local ROWeapon                          Weapon;

    InvManager = ROInventoryManager(PC.Pawn.InvManager);
    //ACIPC = ACItemPlaceableContent(ACIP);
    InvManager.GetWeaponList(WeaponList);
    foreach WeaponList(Weapon)
    {
        if (ClassIsChildOf(Weapon.Class, class'ACItemPlaceable'))
        {
            InvManager.RemoveFromInventory(Weapon); 
        }
    }
    
    switch (ObjectName)
    {
        case "SANDBAGS":
            InvManager.CreateInventory(class'ACItemPlaceableSandbag', false, true);
            break;

        case "SKYRAIDER":
            InvManager.CreateInventory(class'ACItemPlaceableSkyraider', false, true);
            break;

        case "PHANTOM":
            InvManager.CreateInventory(class'ACItemPlaceablePhantom', false, true);
            break;

        case "BIRDDOG":
            InvManager.CreateInventory(class'ACItemPlaceableBirddog', false, true);
            break;

        case "CANBERRA":
            InvManager.CreateInventory(class'ACItemPlaceableCanberra', false, true);
            break;

        case "HOWITZER":
            InvManager.CreateInventory(class'ACItemPlaceableHowitzer', false, true);
            break;

        case "FRENCHBUNKER":
            InvManager.CreateInventory(class'ACItemPlaceableFrenchBunker', false, true);
            break;

        case "BUSH":
            InvManager.CreateInventory(class'ACItemPlaceableBush01', false, true);
            break;

        case "PREFAB":
            InvManager.CreateInventory(class'ACItemPlaceableSandbagPrefab', false, true);
            break;

        case "M2BROWNING":
            InvManager.CreateInventory(class'ACItemPlaceableTurretM2', false, true);
            break;
    }

    InvManager.GetWeaponList(WeaponList);
    foreach WeaponList(Weapon)
    {
        if (ClassIsChildOf(Weapon.Class, class'ACItemPlaceable'))
        {
            Weapon.MaxAmmoCount = Amount;
            Weapon.AmmoCount = Amount;
            InvManager.SetCurrentWeapon(Weapon);
        }
    }
}

function ClearBarricades()
{
    local ACDestructible                ACD;
    local ACTurret_M2_HMG_Destroyable   ACTM2;

    foreach WorldInfo.AllActors(class'ACDestructible', ACD)
    {
        ACD.Destroy();
    }
    foreach WorldInfo.AllActors(class'ACTurret_M2_HMG_Destroyable', ACTM2)
    {
        ACTM2.Destroy();
    }
}

function DelBarricade(PlayerController PC)
{
    local vector TraceStart, TraceEnd, HitLocation, HitNormal, ViewDirection;
    local float TempFloat, TraceLength;
    local actor HitActor;

    Instigator = PC.Pawn;

    TraceStart = Instigator.GetPawnViewLocation();
	ViewDirection = Vector(Instigator.GetViewRotation());
	TempFloat = sqrt((1 - ViewDirection.Z * ViewDirection.Z) / (ViewDirection.X * ViewDirection.X + ViewDirection.Y * ViewDirection.Y));
	ViewDirection.X *= TempFloat;
	ViewDirection.Y *= TempFloat;
    TraceLength = 10000;

    TraceEnd = TraceStart + ViewDirection * TraceLength;
    
    HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
    if (ClassIsChildOf(HitActor.Class, class'ACDestructible'))
    {
        HitActor.Destroy();
    }

    HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
    if (ClassIsChildOf(HitActor.Class, class'ACDestructible'))
    {
        HitActor.Destroy();
    }
}

function GiveWeapon(PlayerController PC, string WeaponName, out string NameValid, optional bool bGiveAll, optional int TeamIndex)
{
	local ROInventoryManager        InvManager;
    local ROPawn                    ROP;

    NameValid = "True";

    if (PC != none)
    {
        if (bGiveAll)
        { 
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                InvManager = ROInventoryManager(ROP.InvManager);
                DoGiveWeapon(InvManager, WeaponName, NameValid);
            }
        }   

        else if (TeamIndex == `AXIS_TEAM_INDEX)
        {
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                if (ROP.GetTeamNum() == `AXIS_TEAM_INDEX)
                {
                    InvManager = ROInventoryManager(ROP.InvManager);
                    DoGiveWeapon(InvManager, WeaponName, NameValid);
                }
            }
        }

        else if (TeamIndex == `ALLIES_TEAM_INDEX)
        {
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                if (ROP.GetTeamNum() == `ALLIES_TEAM_INDEX)
                {
                    InvManager = ROInventoryManager(ROP.InvManager);
                    DoGiveWeapon(InvManager, WeaponName, NameValid);
                }
            }
        }

        else if (TeamIndex == 100)
        {
            InvManager = ROInventoryManager(PC.Pawn.InvManager);
            DoGiveWeapon(InvManager, WeaponName, NameValid);
        }
    }
    else
    {
        // `log ("[MutExtras Debug]Error: GW PlayerController is none!");
    }
}

function ClearWeapons(PlayerController PC, bool GiveAll, optional int TeamIndex)
{
    local array<ROWeapon>       WeaponsToRemove;
    local ROWeapon              Weapon;
    local ROInventoryManager    ROIM;
    local ROPawn                ROP;

    if (GiveAll)
    { 
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            ROIM = ROInventoryManager(ROP.InvManager);
            ROIM.GetWeaponList(WeaponsToRemove);

            foreach WeaponsToRemove(Weapon)
            {
                ROIM.RemoveFromInventory(Weapon);
                // `log("Removed "$Weapon);
            }
        }
    }   

    else if (TeamIndex == `AXIS_TEAM_INDEX)
    {
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            if (ROP.GetTeamNum() == `AXIS_TEAM_INDEX)
            {
                ROIM = ROInventoryManager(ROP.InvManager);
                ROIM.GetWeaponList(WeaponsToRemove);

                foreach WeaponsToRemove(Weapon)
                {
                    ROIM.RemoveFromInventory(Weapon);
                    // `log("Removed "$Weapon);
                }
            }
        }
    }

    else if (TeamIndex == `ALLIES_TEAM_INDEX)
    {
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            if (ROP.GetTeamNum() == `ALLIES_TEAM_INDEX)
            {
                ROIM = ROInventoryManager(ROP.InvManager);
                ROIM.GetWeaponList(WeaponsToRemove);

                foreach WeaponsToRemove(Weapon)
                {
                    ROIM.RemoveFromInventory(Weapon);
                    // `log("Removed "$Weapon);
                }
            }
        }
    }

    else if (TeamIndex == 100)
    {
        ROIM = ROInventoryManager(PC.Pawn.InvManager);
        ROIM.GetWeaponList(WeaponsToRemove);

        foreach WeaponsToRemove(Weapon)
        {
            ROIM.RemoveFromInventory(Weapon);
            // `log("Removed "$Weapon);
        }
    }
}

function SpawnVehicle(PlayerController PC, string VehicleName, out string NameValid)
{
    local vector                    CamLoc, StartShot, EndShot, X, Y, Z;
	local rotator                   CamRot;
	local class<ROVehicle>          Cobra, Loach, Huey, Bushranger, ACCobra, ACLoach, ACHuey, ACBushranger, BlueHuey, GreenHuey, GreenBushranger;
	local ROVehicle                 ROHelo;
    
    NameValid = "True";

    // Do ray check and grab actor
	PC.GetPlayerViewPoint(CamLoc, CamRot);
	GetAxes(CamRot, X, Y, Z );
	StartShot   = CamLoc;
	EndShot     = StartShot + (500 * X) + (200 * Z);

    Cobra = class'ROGameContent.ROHeli_AH1G_Content';
    Loach = class'ROGameContent.ROHeli_OH6_Content';
    Huey = class'ROGameContent.ROHeli_UH1H_Content';
    Bushranger = class'ROGameContent.ROHeli_UH1H_Gunship_Content';

    ACCobra = class'ACHeli_AH1G_Content';
    ACLoach = class'ACHeli_OH6_Content';
    ACHuey = class'ACHeli_UH1H_Content';
    ACBushranger = class'ACHeli_UH1H_Gunship_Content';

    BlueHuey = class'GreenMenMod.GMHeli_Blue_UH1H';
    GreenHuey = class'GreenMenMod.GMHeli_Green_UH1H';
    GreenBushranger = class'GreenMenMod.GMHeli_Green_UH1H_Gunship_Content';

    switch (VehicleName)
    {
        case "Cobra":
            ROHelo = Spawn(Cobra, , , EndShot, camrot);
            break;

        case "Loach":
            ROHelo = Spawn(Loach, , , EndShot, camrot);
            break;

        case "Huey":
            ROHelo = Spawn(Huey, , , EndShot, camrot);
            break;

        case "Bushranger":
            ROHelo = Spawn(Bushranger, , , EndShot, camrot);
            break;

        case "ACCobra":
            ROHelo = Spawn(ACCobra, , , EndShot, camrot);
            break;

        case "ACLoach":
            ROHelo = Spawn(ACLoach, , , EndShot, camrot);
            break;
        
        case "ACHuey":
            ROHelo = Spawn(ACHuey, , , EndShot, camrot);
            break;

        case "ACBushranger":
            ROHelo = Spawn(ACBushranger, , , EndShot, camrot);
            break;

        case "BlueHuey":
            ROHelo = Spawn(BlueHuey, , , EndShot, camrot);
            break;

        case "GreenHuey":
            ROHelo = Spawn(GreenHuey, , , EndShot, camrot);
            break;

        case "GreenBushranger":
            ROHelo = Spawn(GreenBushranger, , , EndShot, camrot);
            break;

        default:
            NameValid = "False";
            break;
    }

    ROHelo.Mesh.AddImpulse(vect(0,0,-1), ROHelo.Location);
    ROHelo.bTeamLocked = false;
}

function ClearVehicles()
{
	local ROVehicle ROV;

	foreach WorldInfo.AllActors(class'ROVehicle', ROV)
	{
		if( !ROV.bDriving )
            ROV.ShutDown();
			ROV.Destroy();
	}
}

function AddBots(int Num, optional int NewTeam = -1, optional bool bNoForceAdd)
{
	local ROAIController ROBot;
    local ROPlayerReplicationInfo ROPRI;
	local byte ChosenTeam;
	local byte SuggestedTeam;
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
        ROPRI = ROPlayerReplicationInfo(ROBot.PlayerReplicationInfo);

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
        if (ROPRI.ClassIndex == 11 || ROPRI.ClassIndex == 8)
        {
            if (ROBot.PlayerReplicationInfo.Team.TeamIndex == `AXIS_TEAM_INDEX)
            {
                ROPRI.SelectRoleByClass(ROBot, class'RORoleInfoNorthernRifleman');
            }
            else
            {
                ROPRI.SelectRoleByClass(ROBot, class'RORoleInfoSouthernRifleman');
            }   
        }

		ROBot.ChooseSquad();

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
        ROB.Pawn.ShutDown();
        ROB.Pawn.Destroy();
        ROB.ShutDown();
        ROB.Destroy();
    }
}

/* function Fly(PlayerController PC)
{
    if ((PC.Pawn != None) && PC.bCheatFlying == false)
	{
        PC.Pawn.CheatFly();
		PC.ClientMessage("You feel much lighter");
		PC.bCheatFlying = true;
		PC.Outer.GotoState('PlayerFlying');
	}
	else if (PC.Pawn != None)
	{
        PC.Pawn.CheatWalk();
        PC.bCheatFlying = false;
		PC.Restart(false);
	}
} */

simulated function NameExists(ROVehicleBase VehBase)
{
	local int 				I, MaxHitsForVic;
	local bool 				bNameExists;
	local ROVehicle 		ROV;
    local array<string>     ROVName;

    ROV = ROVehicle(vehbase);
    ROVName = splitstring((string(vehbase.name)), "_", true);

	for (I = 0; I < ROVName.length ; I++)
	{
        if      (ROVName[I] ~= "T20"     ){MaxHitsForVic = 3; break;}
        else if (ROVName[I] ~= "T26"     ){MaxHitsForVic = 4; break;}
        else if (ROVName[I] ~= "T28"     ){MaxHitsForVic = 5; break;}  
		else if (ROVName[I] ~= "53K"     ){MaxHitsForVic = 1; break;}
        else if (ROVName[I] ~= "HT130"   ){MaxHitsForVic = 4; break;}
        else if (ROVName[I] ~= "Vickers" ){MaxHitsForVic = 4; break;}
        else    {MaxHitsForVic = 3;}
	}

	for (I = 0; I < HitVicName.Length; I++)
	{
        //`log ("[MutExtras Debug]Hitvicname = "$HitVicName[I]$" HitNum = "$HitNum[I]);
		if (HitVicName[I] ~= string(vehbase.name))
		{
		    bNameExists = true;
		    HitNum[I] += 1;
            /* PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!");
            PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!"); */
            `log ("[MutExtras Debug] Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
    
            if (HitNum[I] >= MaxHitsForVic)
		    {
		        ROV.Health = 0;
		        ROV.BlowupVehicle();
                ROV.bDeadVehicle = true;
                `log ("[MutExtras Debug]Blew up the "$vehbase.name$" on hit # "$HitNum[I]);
                HitVicName.removeitem(HitVicName[I]);
                HitNum.removeitem(HitNum[I]);
		    }            
            else {`log ("[MutExtras Debug] DAMAGE TEST SUCCESFUL ON "$vehbase.name$" Vehicle health = "$vehbase.Health$" Hit #"$HitNum[I]);}
		
        break;
		}
	}

    if (bNameExists == false)
	{
	    HitVicName.additem(string(vehbase.name));
	    HitNum.additem(byte(1));
        /* PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!");
        PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!"); */
        `log ("[MutExtras Debug] Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
	    `log (vehbase.name$" doesn't exist on the array, adding it");
	}
}

// At the end here so I can read error messages easier
function DoGiveWeapon(ROInventoryManager InvManager, string WeaponName, out string NameValid)
{
    switch (WeaponName)
    {
        `include(MutExtrasTB\Classes\WeaponNamesVanilla.uci)
    }
}

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("MutExtras.ACPawnSouth"))
    RORICNorth=(LevelContentClasses=("MutExtras.ACPawnNorth"))
}