class ACPlayerReplicationInfo extends ROPlayerReplicationInfo;

simulated function ClientInitialize(Controller C)
{
	local ROPlayerController ROPC;
	local bool bNewOwner;
	
	bNewOwner = (Owner != C);
	Super.ClientInitialize(C);
	
	if (bNewOwner)
	{
		self.UsedNames.Length = 0;
	}
	
	ROPC = ROPlayerController(C);
	if ( bNewOwner && ROPC != None && LocalPlayer(ROPC.Player) != None )
	{
		ClientInitializeUnlocks();
	}
	
	PawnHandlerClass = class'ACPawnHandler';
}

function bool SelectRoleByClass(Controller C, class<RORoleInfo> RoleInfoClass,
    optional out WeaponSelectionInfo WeaponSelection, optional out byte NewSquadIndex,
    optional out byte NewClassIndex, optional class<ROVehicle> TankSelection)
{
    // `log("ACPlayerReplicationInfo.SelectRoleByClass()");

    ACPlayerController(C).ReplacePawnHandler();
    ACPlayerController(C).ReplaceRoles();
    ACPlayerController(C).ReplaceInventoryManager();

    return super.SelectRoleByClass(C, RoleInfoClass, WeaponSelection,
        NewSquadIndex, NewClassIndex, TankSelection);

	PawnHandlerClass = class'ACPawnHandler';

	if( bBot )
    {
        PawnHandlerClass = class'ACPawnHandler';
    }
}

defaultproperties
{
	PawnHandlerClass = class'ACPawnHandler';
}