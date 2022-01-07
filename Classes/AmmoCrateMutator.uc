class AmmoCrateMutator extends ROMutator
	config(AmmoCrate);

var string              PlayerName;
var ACPlayerController  ACPC;
var ROGameInfo          ROGI;
var RORoleInfoClasses   RORICSouth;
var RORoleInfoClasses   RORICNorth;
var ROMapInfo           ROMI;

var array<Byte> 		HitNum;
var array<String> 	HitVicName;

function PreBeginPlay()
{
    `log("AmmoCrateMutator init");
    
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

    StaticSaveConfig();

    super.PreBeginPlay();
}

auto state StartUp
{
    function timer()
    {
        RemoveVolumes();
    }
        
    Begin:
    SetTimer( 20, true );
}

function ModifyPlayer(Pawn Other)
{
    ReplacePawns();

    super.ModifyPlayer(Other);
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

simulated function ReplacePawns()
{
    ROGameInfo(WorldInfo.Game).SouthRoleContentClasses = RORICSouth;
    ROGameInfo(WorldInfo.Game).NorthRoleContentClasses = RORICNorth;
    //`log("Pawns replaced");
}

function RemoveVolumes()
{
    local ROVolumeNoArtillery ROVNA;
    //local ROVolumeSpawnProtection   ROVSP;
    local int count;
    
    foreach allactors(class'ROVolumeNoArtillery', ROVNA)
    {
    ROVNA.SetEnabled( False );
    ++Count;
    }
    /*foreach allactors(class'ROVolumeSpawnProtection', ROVSP)
    {
    ROVSP.SetEnabled( False );
    ++Count;
    }*/
}

reliable server function NameExists(ROVehicleBase VehBase)
{
	local int 				I, MaxHitsForVic;
	local bool 				bNameExists;
	local ROVehicle 		ROV;
    local array<string>     ROVName;

    ROV = ROVehicle(vehbase);
    ROVName = splitstring((string(vehbase.name)), "_", true);

	for (I = 0; I < ROVName.length ; I++)
	{
		if (ROVName[I] ~= "53K"){MaxHitsForVic = 1; break;}
		if (ROVName[I] ~= "HT130"){MaxHitsForVic = 4; break;}
		if (ROVName[I] ~= "T20"){MaxHitsForVic = 3; break;}
		if (ROVName[I] ~= "T26"){MaxHitsForVic = 4; break;}
		if (ROVName[I] ~= "T28"){MaxHitsForVic = 5; break;}
		if (ROVName[I] ~= "Vickers"){MaxHitsForVic = 4; break;}
        else {MaxHitsForVic = 3;}
	}

	for (I = 0; I < HitVicName.Length; I++)
	{
        //`log ("Hitvicname = "$HitVicName[I]$" HitNum = "$HitNum[I]);
		if (HitVicName[I] ~= string(vehbase.name))
		{
		bNameExists = true;
		HitNum[I] += 1;
        PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!");
        PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!");
        `log ("Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
			
            if (HitNum[I] >= MaxHitsForVic)
			{
			ROV.Health = 0;
			ROV.BlowupVehicle();
            ROV.bDeadVehicle = true;
            `log ("Blew up the "$vehbase.name$" on hit # "$HitNum[I]);
            HitVicName.removeitem(HitVicName[I]);
            HitNum.removeitem(HitNum[I]);
			}            
            else {`log("DAMAGE TEST SUCCESFUL ON "$vehbase.name$" Vehicle health = "$vehbase.Health$" Hit #"$HitNum[I]);}
		
        break;
		}
	}

    if (bNameExists == false)
	{
	HitVicName.additem(string(vehbase.name));
	HitNum.additem(byte(1));
    PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!");
    PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!");
    `log ("Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
	`log (vehbase.name$" doesn't exist on the array, adding it");
	}
}

function bool IsMutThere()
{
	local Mutator mut;
    ROGI = ROGameInfo(WorldInfo.Game);
    mut = ROGI.BaseMutator;

    for (mut = ROGI.BaseMutator; mut != none; mut = mut.NextMutator)
    {
    `log("IsMutThere test "$string(mut.name));
        if (string(mut.name) ~= "MutCommands_0")
        {
        `log("MutCommands is activated");
        return true;
        }
    }
}
    
function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

singular function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
{
        local array<string>     Args;
        local string            command;
        local string            NameValid;

        ROGI = ROGameInfo(WorldInfo.Game);
        Args = SplitString(MutateString, " ", true);
        command = Caps(Args[0]);
        PlayerName = PC.PlayerReplicationInfo.PlayerName;

			Switch (Command)
            {
                //case "SPAWNBARRICADE":
                //SpawnBarricade(PC);
                //break;

                case "SPAWNBARRICADETOOL":
                SpawnBarricadeTool(PC, Args[1], int(Args[2]));
                break;

                case "CLEARBARRICADES":
                ClearBarricades();
                break;

                case "ISMUTTHERE":
                IsMutThere();
                break;
            }
            if (!IsMutThere())
            {
                switch (command)
                {
                    case "GIVEWEAPON":
                    GiveWeapon(PC, Args[1], NameValid, false, 100);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" spawned a "$Args[1]);
                        `log("[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    break;

                    case "GIVEWEAPONALL":
                    GiveWeapon(PC, Args[1], NameValid, true);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to everyone");
                        `log("[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    break;

                    case "GIVEWEAPONNORTH":
                    GiveWeapon(PC, Args[1], NameValid, false, `AXIS_TEAM_INDEX);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the north");
                        `log("[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the north");
                    }
                    break;

                    case "GIVEWEAPONSOUTH":
                    GiveWeapon(PC, Args[1], NameValid, false, `ALLIES_TEAM_INDEX);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the south");
                        `log("[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the south");
                    }
                    break;

                    case "SPAWNVEHICLE":
                    SpawnVehicle(PC, Args[1], NameValid);
                    if (NameValid != "False")
                    {
                        WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                        `log("[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                    }
                    else
                    {
                    `log("[MutCommands] Spawnvehicle failed! "$PlayerName$" tried to spawn a "$Args[1]);
                    PrivateMessage(PC, "Not a valid vehicle name.");
                    }
                    break;

                    case "CLEARVEHICLES":
                    ClearVehicles();
                    break;
                }
            }
    super.Mutate(MutateString, PC);
}

/*function SpawnBarricade(PlayerController PC)
{
    local vector                        CamLoc, StartShot, EndShot, X, Y, Z, Hitnormal, BelowVector;
	local rotator                       CamRot;
    local class<ACDestructible2>               DC2;
    //local class<ACDestructible>         SANDBAGS;
    //local class<ACDestructible>         SKYRAIDER;
    //local class<ACDestructible>         PHANTOM;
    //local class<ACDestructible>         BIRDDOG;
    //local class<ACDestructible>         CANBERRA;
    //local class<ACDestructible>         HOWITZER; 

    PC.GetPlayerViewPoint(CamLoc, CamRot);
    GetAxes(CamRot, X, Y, Z );

    StartShot       = CamLoc;
    EndShot         = StartShot + (100.0 * X) + (-50 * Y);   
    Camrot.Roll     = 0;
    CamRot.Pitch    = 0;
    Camrot.Yaw      = Camrot.Yaw + (90 * DegToUnrRot);
    //EndShot.Z       = PC.Pawn.Location.Z - 50;

    BelowVector = EndShot;
    BelowVector.Z = -7000;
    trace(EndShot, Hitnormal, BelowVector, EndShot, true);
    DC2 = class'ACDestructible2';

    spawn(DC2,,, EndShot, CamRot);
}*/

function SpawnBarricadeTool(PlayerController PC, string ObjectName, int Amount)
{
    //local vector                        CamLoc, StartShot, EndShot, X, Y, Z, Hitnormal, BelowVector;
	//local rotator                       CamRot;
    //local ACItemPlaceable                   ACIP;
    //local class<ACItemPlaceableContent>     ACIPC;
    //local class<ACDestructible>             DC;
    local ROInventoryManager                InvManager;
    local array<ROWeapon>                   WeaponList;
    local ROWeapon                          Weapon;
    //local class<ACDestructible>         SANDBAGS;
    //local class<ACDestructible>         SKYRAIDER;
    //local class<ACDestructible>         PHANTOM;
    //local class<ACDestructible>         BIRDDOG;
    //local class<ACDestructible>         CANBERRA;
    //local class<ACDestructible>         HOWITZER; 

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
        InvManager.CreateInventory(class'ACItemPlaceableContent', false, true);
        break;

        case "PHANTOM":
        InvManager.CreateInventory(class'ACItemPlaceableContent', false, true);
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
    local ACDestructible ACD;

    foreach WorldInfo.AllActors(class'AmmoCrate.ACDestructible', ACD)
    {
        ACD.Destroy();
    }
}

function GiveWeapon(PlayerController PC, string WeaponName, out string NameValid, bool GiveAll, optional int TeamIndex)
{
	local ROInventoryManager        InvManager;
    local ROPawn                    ROP;

    NameValid = "True";

    if (GiveAll)
    { 
    foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            InvManager = ROInventoryManager(ROP.InvManager);
            switch (WeaponName)
            {
            `include(AmmoCrate\Classes\WeaponNamesVanilla.uci)     
            }
        }
    }   

    else if (TeamIndex == `AXIS_TEAM_INDEX)
    {
    foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            InvManager = ROInventoryManager(ROP.InvManager);
            if (ROP.GetTeamNum() == `AXIS_TEAM_INDEX)
            {
                switch (WeaponName)
                {
                `include(AmmoCrate\Classes\WeaponNamesVanilla.uci)     
                }
            }
        }
    }    

    else if (TeamIndex == `ALLIES_TEAM_INDEX)
    {
    foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            InvManager = ROInventoryManager(ROP.InvManager);
            if (ROP.GetTeamNum() == `ALLIES_TEAM_INDEX)
            {
                switch (WeaponName)
                {
                `include(AmmoCrate\Classes\WeaponNamesVanilla.uci)     
                }
            }
        }
    }    

    else if (TeamIndex == 100)
    {
    InvManager = ROInventoryManager(PC.Pawn.InvManager);
    switch (WeaponName)
        {
        `include(AmmoCrate\Classes\WeaponNamesVanilla.uci)     
        }
    } 
}

function SpawnVehicle(PlayerController PC, string VehicleName, out string NameValid)
{
    local vector                    CamLoc, StartShot, EndShot, X, Y, Z;
	local rotator                   CamRot;
	local class<ROVehicle>          Cobra;
    local class<ROVehicle>          Loach;
    local class<ROVehicle>          Huey;
    local class<ROVehicle>          Bushranger;
	local ROVehicle                 ROHelo;
    
    NameValid = "True";

    // Do ray check and grab actor
	PC.GetPlayerViewPoint(CamLoc, CamRot);
	GetAxes(CamRot, X, Y, Z );
	StartShot   = CamLoc;
	EndShot     = StartShot + (400.0 * X) + (200 * Z);

    Cobra = class'ROGameContent.ROHeli_AH1G_Content';
    Loach = class'ROGameContent.ROHeli_OH6_Content';
    Huey = class'ROGameContent.ROHeli_UH1H_Content';
    Bushranger = class'ROGameContent.ROHeli_UH1H_Gunship_Content';

    switch (VehicleName)
    {
        // Vanilla
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

        default:
        NameValid = "False";
        break;
    }

    ROHelo.Mesh.AddImpulse(vect(0,0,1), ROHelo.Location);
    ROHelo.bTeamLocked = false;
    ROHelo.Team = 2;
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

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("AmmoCrate.ACSouthPawn"))
    RORICNorth=(LevelContentClasses=("AmmoCrate.ACNorthPawn"))
}