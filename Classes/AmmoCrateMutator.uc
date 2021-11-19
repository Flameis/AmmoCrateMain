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
    local array<string> ROVName;
    
    bNameExists = false;

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
        `log ("Hitvicname = "$HitVicName[I]$" HitNum = "$HitNum[I]);
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

    for (mut = ROGI.BaseMutator; mut !=none; mut = mut.NextMutator)
    {
        `log("IsMutThere test "$mut.name);
    }

    if ((string(mut.name)) ~= "MutCommands_0" || (string(mut.NextMutator.name)) ~= "MutCommands_0" || (string(mut.NextMutator.NextMutator.name)) ~= "MutCommands_0" || (string(mut.NextMutator.NextMutator.NextMutator.name)) ~= "MutCommands_0" 
    || (string(mut.NextMutator.NextMutator.NextMutator.NextMutator.name)) ~= "MutCommands_0" || (string(mut.NextMutator.NextMutator.NextMutator.NextMutator.NextMutator.name)) ~= "MutCommands_0" 
    || (string(mut.NextMutator.NextMutator.NextMutator.NextMutator.NextMutator.NextMutator.NextMutator.name)) ~= "MutCommands_0")
    {
        `log("MutCommands is activated");
        return true;
    }
    else
    {
        `log("MutCommands is not activated");
        return false;
    }
}
    
function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

/*static function ENorthernForces GetNorthernForce()
{
	return ROMapInfo(default.WorldInfo.GetMapInfo()).default.NorthernForce;
}

static function ESouthernForces GetSouthernForce()
{
	return ROMapInfo(default.WorldInfo.GetMapInfo()).default.SouthernForce;
}*/

function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
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
                case "GIVEWEAPON":
                GiveWeapon(PC, Args[1], NameValid, false, 100);
                if (NameValid != "False" && !IsMutThere())
                {
                    WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" spawned a "$Args[1]);
                    `log("[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                }
                break;

                case "GIVEWEAPONALL":
                GiveWeapon(PC, Args[1], NameValid, true);
                if (NameValid != "False" && !IsMutThere())
                {
                    WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to everyone");
                    `log("[29thExtras] "$PlayerName$" spawned a "$Args[1]$"");
                }
                break;

                case "GIVEWEAPONNORTH":
                GiveWeapon(PC, Args[1], NameValid, false, `AXIS_TEAM_INDEX);
                if (NameValid != "False" && !IsMutThere())
                {
                    WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the north");
                    `log("[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the north");
                }
                break;

                case "GIVEWEAPONSOUTH":
                GiveWeapon(PC, Args[1], NameValid, false, `ALLIES_TEAM_INDEX);
                if (NameValid != "False" && !IsMutThere())
                {
                    WorldInfo.Game.Broadcast(self, "[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the south");
                    `log("[29thExtras] "$PlayerName$" gave a "$Args[1]$" to the south");
                }
                break;
            }
    super.Mutate(MutateString, PC);
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("AmmoCrate.ACSouthPawn"))
    RORICNorth=(LevelContentClasses=("AmmoCrate.ACNorthPawn"))
}