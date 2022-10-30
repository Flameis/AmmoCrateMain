class ACpawn extends ROPawn;

var repnotify string PlayerRank, PlayerUnit;

var MaterialInstanceConstant 		HeadgearMIC2;
var MaterialInstanceConstant 		HeadgearMIC3;

var MaterialInstanceConstant HeadgearTemplateMIC2;
var MaterialInstanceConstant HeadgearTemplateMIC3;

replication 
{
	if (bNetDirty)
		PlayerRank, PlayerUnit;
}

/* simulated event ReplicatedEvent(name VarName)
{
    local String Text;

    if (Role == Role_Authority)
    {
      Text = "Server";
    }
    else
    {
      Text = "Client";
    }

	if (VarName == 'PlayerRank')
	{
        `Log(Self$":: Pawn ReplicatedEvent():: PlayerRank is "$PlayerRank$" on the "$Text);
	}
    else if (VarName == 'PlayerUnit')
	{
        `Log(Self$":: Pawn ReplicatedEvent():: PlayerUnit is "$PlayerUnit$" on the "$Text);
	}
	else
	{
		Super.ReplicatedEvent(VarName);
	}
} */

simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}

//Overridden to set the unit and rank of the player before the mesh is created and after the controller is set
function PossessedBy(Controller C, bool bVehicleTransition)
{
	super(Pawn).PossessedBy(C, bVehicleTransition);

	SetUnitAndRank();//29th Helmet

	ClientPossessed();

	if( Role == ROLE_Authority )
	{
		if( AIController(C) != none )
		{
			FriendlyPlayerCollisionType = 0;
		}
		else if( ROGameInfo(WorldInfo.Game) != none )
		{
			FriendlyPlayerCollisionType = ROGameInfo(WorldInfo.Game).FriendlyInfantryCollisionType;
		}
	}

	// Check if we need guys to follow us in single player
	if( ROGameInfoSinglePlayer(WorldInfo.Game) != none && ROPlayerController(Controller) != none )
	{
	   SetTimer( 3.0, true, 'EvaluateFollowFormation' );
	}

	if ( PlayerReplicationInfo != None )
	{
		MyOldPRI = PlayerReplicationInfo;
	}

	if( !bVehicleTransition && ROPlayerReplicationInfo(PlayerReplicationInfo) != none && !bSetFinalMesh )
	{
		if( WorldInfo.NetMode == NM_Standalone || IsLocallyControlled() )
			SetPawnElementsByConfig(false);
		else if( WorldInfo.NetMode != NM_DedicatedServer )
			SetPawnElementsByConfig(true);

		CreatePawnMesh();
		bSetFinalMesh = true;
	}
}

function SetUnitAndRank()
{
	PlayerRank = ACPlayerReplicationInfo(Controller.PlayerReplicationInfo).PlayerRank;
	PlayerUnit = ACPlayerReplicationInfo(Controller.PlayerReplicationInfo).PlayerUnit;
	ServerSetUnitAndRank();
}

reliable server function ServerSetUnitAndRank()
{
	PlayerRank = ACPlayerReplicationInfo(Controller.PlayerReplicationInfo).PlayerRank;
	PlayerUnit = ACPlayerReplicationInfo(Controller.PlayerReplicationInfo).PlayerUnit;
}

simulated function CreatePawnMesh()
{
	SetUnitAndRank();

	super.CreatePawnMesh();
}

//Took me soooooooooo long to get this to work
//Overridden to check if the headgear is the 29th helmet and if so set up the rank on the front and the unit on the side
simulated function AttachNewHeadgear(SkeletalMesh NewHeadgearMesh)
{
	local SkeletalMeshSocket 	HeadSocket;
	
	if( ThirdPersonHeadgearMeshComponent.AttachedToSkelComponent != none )
		mesh.DetachComponent(ThirdPersonHeadgearMeshComponent);

	ThirdPersonHeadgearMeshComponent.SetSkeletalMesh(NewHeadgearMesh);
	ThirdPersonHeadgearMeshComponent.SetMaterial(0, HeadgearMIC);

	if( ThirdPersonHeadgearMeshComponent.GetNumElements() > 1 )
	{
		if( !bIsPilot && HairMIC != none )
			ThirdPersonHeadgearMeshComponent.SetMaterial(1, HairMIC);
		if(NewHeadgearMesh.name != '29thHelmet') //Set to default to avoid overwriting stuff like visors for pilots
		{
			ThirdPersonHeadgearMeshComponent.SetMaterial(2, NewHeadgearMesh.Materials[2]);
			ThirdPersonHeadgearMeshComponent.SetMaterial(3, NewHeadgearMesh.Materials[3]);
		}
	}

	// Set up the MICS for the 29th helmet
	// `log ("[MutExtras Debug] NewHeadgearMesh.name "$NewHeadgearMesh.name);
	if(NewHeadgearMesh.name == '29thHelmet')
	{
		HeadgearTemplateMIC2 = MaterialInstanceConstant(DynamicLoadObject("MutExtrasTBPkg.Materials." $PlayerRank,class'MaterialInstanceConstant',true));
		HeadgearTemplateMIC3 = MaterialInstanceConstant(DynamicLoadObject("MutExtrasTBPkg.Materials." $PlayerUnit,class'MaterialInstanceConstant',true));

		// `log (PlayerRank);
		// `log (PlayerUnit);

		if( HeadgearTemplateMIC2 != none )
			HeadgearMIC2 = new class'MaterialInstanceConstant';
		if( HeadgearTemplateMIC3 != none )
			HeadgearMIC3 = new class'MaterialInstanceConstant';

		HeadgearMIC2.SetParent(HeadgearTemplateMIC2);
		HeadgearMIC3.SetParent(HeadgearTemplateMIC3);
		MeshMICs.AddItem(HeadgearMIC2);
		MeshMICs.AddItem(HeadgearMIC3);
		ThirdPersonHeadgearMeshComponent.SetMaterial(2, HeadgearMIC2);
		ThirdPersonHeadgearMeshComponent.SetMaterial(3, HeadgearMIC3);
	}

	HeadSocket = ThirdPersonHeadAndArmsMeshComponent.GetSocketByName(HeadgearAttachSocket);
	if( HeadSocket!=none )
	{
	   if( mesh.MatchRefBone(HeadSocket.BoneName) != INDEX_NONE )
	   {
	       	ThirdPersonHeadgearMeshComponent.SetShadowParent(mesh);
	       	ThirdPersonHeadgearMeshComponent.SetLODParent(mesh);
	       	mesh.AttachComponent( ThirdPersonHeadgearMeshComponent, HeadSocket.BoneName, HeadSocket.RelativeLocation, HeadSocket.RelativeRotation, HeadSocket.RelativeScale);
	   }
	   else
	   {
			`warn("Bone name specified in socket not found in parent anim component. Headgear component will not be attached");
	   }
	}
}

defaultproperties
{
	PlayerRank="29th"
	PlayerUnit="29th"
}