class ACCharCustMannequin extends ROCharCustMannequin
	notplaceable;

var MaterialInstanceConstant 			HeadgearMIC2;
var MaterialInstanceConstant 			HeadgearMIC3;

//var MutExtras							MyMut;

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	PawnHandlerClass = class'ACPawnHandler';
	//MyMut = MutExtras(WorldInfo.Game.BaseMutator);
}

/* function UpdateMannequin(byte TeamIndex, byte ArmyIndex, bool bPilot, int ClassIndex, byte HonorLevel, byte TunicID, byte TunicMaterialID, byte ShirtID, byte HeadID, byte HairID, byte HeadgearID, byte HeadgearMatID, byte FaceItemID, byte FacialHairID, byte TattooID, optional bool bMainMenu)
{
	super.UpdateMannequin(TeamIndex, ArmyIndex, bPilot, ClassIndex, HonorLevel, TunicID, TunicMaterialID, ShirtID, HeadID, HairID, HeadgearID, HeadgearMatID, FaceItemID, FacialHairID, TattooID, bMainMenu);
} */

// Attach headgear. Since the HeadAndArmsMesh is parent anim controlled,
// we cannot attach the headgear mesh to it directly because it will not animate.
// So attach the headgear to the body mesh, but read the socket info from the
// HeadAndArmsMesh so that artists can specify different offsets for different heads
simulated function AttachNewHeadgear(SkeletalMesh NewHeadgearMesh)
{
	local SkeletalMeshSocket 	HeadSocket;
	//local Texture2D				UnitTexture, RankTexture;
	//local texture 				a,b,c,d;
	local array<string>    		SplitArray;
    local string            	Rank, Unit;

	if( ThirdPersonHeadgearMeshComponent.AttachedToSkelComponent != none )
		mesh.DetachComponent(ThirdPersonHeadgearMeshComponent);

	ThirdPersonHeadgearMeshComponent.SetSkeletalMesh(NewHeadgearMesh);
	ThirdPersonHeadgearMeshComponent.SetMaterial(0, HeadgearMIC);

	if( ThirdPersonHeadgearMeshComponent.GetNumElements() > 1 )
	{
		if( !bIsPilot && HairMIC != none )
			ThirdPersonHeadgearMeshComponent.SetMaterial(1, HairMIC);
	}
	if( ThirdPersonHeadgearMeshComponent.GetNumElements() > 2 )
	{
			ThirdPersonHeadgearMeshComponent.SetMaterial(2, NewHeadgearMesh.Materials[2]);
			ThirdPersonHeadgearMeshComponent.SetMaterial(3, NewHeadgearMesh.Materials[3]);
	}

	//`log ("[MutExtras] NewHeadgearMesh.name "$NewHeadgearMesh.name);
	//Attach 29th decals onto the headgear mesh
	if( NewHeadgearMesh.name == '29thHelmet')
	{	
		SplitArray = SplitString(/* MyMut. */ACPawn(ROPC.Pawn).FindCachedPlayerRankAndUnit(ROPC), "*", false); //Split the cached string up into the SteamID and the unit
		Rank = Caps(SplitArray[0]);
    	Unit = Caps(SplitArray[1]); //Capitalize the unit

		//`log ("[MutExtras] GetRankTexture "$Rank);
    	//`log ("[MutExtras] GetUnitTexture "$Unit);

		if(NewHeadgearMesh.Materials[2] != none)
    	{
    	    if(HeadgearMIC2 == none)
    	    {
    	        HeadgearMIC2 = new Class'MaterialInstanceConstant';
    	    }
    	    HeadgearMIC2.SetParent(NewHeadgearMesh.Materials[2]);
		} 
		if(HeadgearMesh.Materials[3] != none)
    	{
    	    if(HeadgearMIC3 == none)
    	    {
    	        HeadgearMIC3 = new Class'MaterialInstanceConstant';
    	    }
    	    HeadgearMIC3.SetParent(HeadgearMesh.Materials[3]);
		}
		switch(Rank)
		{
			case "PVT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.29TH';
			break;

			case "PFC":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.PFC';
			break;

			case "CPL":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CPL';
			break;

			case "SGT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SGT';
			break;

			case "SSGT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SSGT';
			break;

			case "TSGT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.TSGT';
			break;

			case "MSGT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.MSGT';
			break;

			case "FSGT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.FSGT';
			break;

			case "SGTMAJ":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SGTMAJ';
			break;

			case "CSM":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CSM';
			break;


			case "PFCSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.PFCSUB';
			break;

			case "CPLSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CPLSUB';
			break;

			case "SGTSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SGTSUB';
			break;

			case "SSGTSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SSGTSUB';
			break;

			case "TSGTSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.TSGTSUB';
			break;

			case "MSGTSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.MSGTSUB';
			break;

			case "FSGTSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.FSGTSUB';
			break;

			case "SGTMAJSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.SGTMAJSUB';
			break;

			case "CSMSUB":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CSMSUB';
			break;


			case "2LT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.2LT';
			break;

			case "1LT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.1LT';
			break;

			case "CPT":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CPT';
			break;

			case "MAJ":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.MAJ';
			break;

			case "LTCOL":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.LTCOL';
			break;

			case "COL":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.COL';
			break;


			case "T/5":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.T5';
			break;

			case "T/4":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.T4';
			break;

			case "T/3":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.T3';
			break;


			case "WO1":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.WO1';
			break;

			case "CW2":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CW2';
			break;

			case "CW3":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CW3';
			break;

			case "CW4":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CW4';
			break;

			case "CW5":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.CW5';
			break;


			case "NONE":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.zero';
    	    break;
			
			default:
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.29TH';
			break;
		}
		

		switch (Unit)
    	{
			case "REG":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.REG';
    	    break;

			case "BAT1":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.BAT1';
    	    break;

			case "BAT2":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.BAT2';
    	    break;

    	    case "DOG":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DOG';
    	    break;

			case "CHARLIE":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.CHARLIE';
    	    break;

			case "EASY":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.EASY';
    	    break;

			case "FOX":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.FOX';
    	    break;


    	    case "DP1":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP1';
    	    break;

    	    case "DP2":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP2';
    	    break;

    	    case "DP3":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP3';
    	    break;


    	    case "DP1S1":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP1S1';
    	    break;

    	    case "DP1S2":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP1S2';
    	    break;

    	    case "DP1S3":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP1S3';
    	    break;


    	    case "DP2S1":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP2S1';
    	    break;

    	    case "DP2S2":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP2S2';
    	    break;

    	    case "DP2S3":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP2S3';
    	    break;

    	    case "DP2S4":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP2S4';
    	    break;


    	    case "DP3S1":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP3S1';
    	    break;

    	    case "DP3S2":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP3S2';
    	    break;

    	    case "DP3S3":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP3S3';
    	    break;

    	    case "DP3S4":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.DP3S4';
    	    break;


			case "ENG":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.ENG';
    	    break;


			case "NONE":
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.zero';
    	    break;

    	    default:
				HeadgearMIC3 = MaterialInstanceConstant'29thExtras.Materials.29th';
    	    break;
    	}
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