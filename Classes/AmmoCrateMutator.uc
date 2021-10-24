class AmmoCrateMutator extends ROMutator
	config(AmmoCrate);

var string              PlayerName;
var ACPlayerController  ACPC;
var ROGameInfo          ROGI;
var RORoleInfoClasses   RORICSouth;
var RORoleInfoClasses   RORICNorth;
var ROMapInfo           ROMI;

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

    ACPC.LoadObjects();
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
    SetTimer( 10, true );
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

    ACPC.ClientLoadObjects();

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
    local ROVolumeSpawnProtection ROVSP;
    local int count;

    foreach allactors(class'ROVolumeNoArtillery', ROVNA)
    {
    ROVNA.SetEnabled( False );
    ++Count;
    }
    foreach allactors(class'ROVolumeSpawnProtection', ROVSP)
    {
    ROVSP.SetEnabled( False );
    ++Count;
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

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("AmmoCrate.ACSouthPawn"))
    RORICNorth=(LevelContentClasses=("AmmoCrate.ACNorthPawn"))
}