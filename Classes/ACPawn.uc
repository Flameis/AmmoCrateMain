class ACpawn extends ROPawn;

var MaterialInstanceConstant 	HeadgearMIC2;
var MaterialInstanceConstant 	HeadgearMIC3;

//var MutExtras							MyMut;

var config array<String>    PlayerRankAndUnit;

simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// Create the first and third person meshes
	//MyMut = MutExtras(WorldInfo.Game.BaseMutator);
}

/* simulated function CreatePawnMesh()
{
	local ROMapInfo ROMI;

	BodyMIC.SetScalarParameterValue('Fresnel_Strength', 0.5);
    //BodyMIC2.SetScalarParameterValue('Fresnel_Strength', 0.5);
    GearMIC.SetScalarParameterValue('Fresnel_Strength', 0.5);
    //GearMIC2.SetScalarParameterValue('Fresnel_Strength', 0.5);
    //GearMIC3.SetScalarParameterValue('Fresnel_Strength', 0.5);
    HeadgearMIC.SetScalarParameterValue('Fresnel_Strength', 0.5);
    HeadAndArmsMIC.SetScalarParameterValue('Fresnel_Strength', 0.5);
	
	if (Health <= 0)
	{
		return;
	}
	
	if( HeadAndArmsMIC == none )
		HeadAndArmsMIC = new class'MaterialInstanceConstant';
	if( BodyMIC == none )
		BodyMIC = new class'MaterialInstanceConstant';
	/*if( BodyMIC2 == none )
		BodyMIC2 = new class'MaterialInstanceConstant';*/
	if( GearMIC == none )
		GearMIC = new class'MaterialInstanceConstant';
	/*if( GearMIC2 == none )
		GearMIC2 = new class'MaterialInstanceConstant';
	if( GearMIC3 == none )
		GearMIC3 = new class'MaterialInstanceConstant';*/
	if( HeadgearMIC == none )
		HeadgearMIC = new class'MaterialInstanceConstant';
	if( HairMIC == none && HairMICTemplate != none )
		HairMIC = new class'MaterialInstanceConstant';
	if( FPArmsSleeveMaterial == none && FPArmsSleeveMaterialTemplate != none )
		FPArmsSleeveMaterial = new class'MaterialInstanceConstant';
	if( FPArmsSkinMaterial == none && FPArmsSkinMaterialTemplate != none )
		FPArmsSkinMaterial = new class'MaterialInstanceConstant';

	if( bUseSingleCharacterVariant && BodyMICTemplate_SV != none )
		BodyMIC.SetParent(BodyMICTemplate_SV);
	else
		BodyMIC.SetParent(BodyMICTemplate);
	
	HeadAndArmsMIC.SetParent(HeadAndArmsMICTemplate);
	HeadgearMIC.SetParent(HeadgearMICTemplate);
	
	if( HairMIC != none )
		HairMIC.SetParent(HairMICTemplate);
	
	if( FPArmsSleeveMaterial != none )
		FPArmsSleeveMaterial.SetParent(FPArmsSleeveMaterialTemplate);
	
	if( FPArmsSkinMaterial != none )
		FPArmsSkinMaterial.SetParent(FPArmsSkinMaterialTemplate);
	
	MeshMICs.Length = 0;
	MeshMICs.AddItem(BodyMIC);
	MeshMICs.AddItem(GearMIC);
	//MeshMICs.AddItem(GearMIC2);
	//MeshMICs.AddItem(GearMIC3);
	//MeshMICs.AddItem(BodyMIC2);
	MeshMICs.AddItem(HeadAndArmsMIC);
	MeshMICs.AddItem(HeadgearMIC);
	
	if( ThirdPersonHeadgearMeshComponent.AttachedToSkelComponent != none )
		mesh.DetachComponent(ThirdPersonHeadgearMeshComponent);
	//if( ThirdPersonHairMeshComponent.AttachedToSkelComponent != none )
		//mesh.DetachComponent(ThirdPersonHairMeshComponent);
	if( FaceItemMeshComponent.AttachedToSkelComponent != none )
		mesh.DetachComponent(FaceItemMeshComponent);
	if( FacialHairMeshComponent.AttachedToSkelComponent != none )
		mesh.DetachComponent(FacialHairMeshComponent);
	if( ThirdPersonHeadAndArmsMeshComponent.AttachedToSkelComponent != none )
		DetachComponent(ThirdPersonHeadAndArmsMeshComponent);
	if( TrapDisarmToolMeshTP.AttachedToSkelComponent != none )
		mesh.DetachComponent(TrapDisarmToolMeshTP);
	
	ROMI = ROMapInfo(WorldInfo.GetMapInfo());
	
	if( !bUseSingleCharacterVariant && ROMI != none)
	{
		CompositedBodyMesh = ROMI.GetCachedCompositedPawnMesh(TunicMesh, FieldgearMesh);
	}
	else
	{
		CompositedBodyMesh = PawnMesh_SV;
	}
	
	CompositedBodyMesh.Characterization = PlayerHIKCharacterization;
	ROSkeletalMeshComponent(mesh).ReplaceSkeletalMesh(CompositedBodyMesh);

	GearMIC.SetParent(FieldgearMesh.Materials[0]);
	//GearMIC2.SetParent(FieldgearMesh.Materials[1]);
	//GearMIC3.SetParent(FieldgearMesh.Materials[2]);
	
	/*if (TunicMesh.Materials[2] != FieldgearMesh.Materials[1])
	{
		GearMIC2.SetParent(TunicMesh.Materials[2]);
		AltGear = true;
	}*/

	/* if(HeadgearMesh.Materials[2] != none)
    {
        if(HeadgearMIC2 == none)
        {
            HeadgearMIC2 = new Class'MaterialInstanceConstant';
        }
        HeadgearMIC2.SetParent(HeadgearMesh.Materials[2]);
    }
	if(HeadgearMesh.Materials[3] != none)
    {
        if(HeadgearMIC3 == none)
        {
            HeadgearMIC3 = new Class'MaterialInstanceConstant';
        }
        HeadgearMIC3.SetParent(HeadgearMesh.Materials[3]);
    } */
	
	if (bIsPilot)
	{
		GearMIC.SetParent(FieldgearMesh.Materials[1]);
	}
	
	/*if (BodyMICTemplate2 != none)
	{
		BodyMIC2.SetParent(BodyMICTemplate2);
	}
	else
	{
		BodyMIC2.SetParent(TunicMesh.Materials[4]);
	}*/
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	
	if (bUseSingleCharacterVariant)
	{
		GearMIC.SetParent(PawnMesh_SV.Materials[1]);
	}
	
	// 0 = Main Tunic
	// 1 = Main Gear
	// 2 = Secondary Gear
	// 3 = Alternate Gear
	// 4 = Supporting Tunic
	// 5 = Flamethrower Hose
	
	mesh.SetMaterial(0, BodyMIC);
	mesh.SetMaterial(1, GearMIC);
	//mesh.SetMaterial(2, GearMIC2);
	//mesh.SetMaterial(3, GearMIC3);
	//mesh.SetMaterial(4, BodyMIC2);
	
	//GrimePct = bIsPilot ? 0.2 : (FRand() / 2) + 0.5;

	/*BodyMIC.SetScalarParameterValue('Grime_Scaler', GrimePct);
	BodyMIC2.SetScalarParameterValue('Grime_Scaler', GrimePct);
	GearMIC.SetScalarParameterValue('Grime_Scaler', GrimePct);
	GearMIC2.SetScalarParameterValue('Grime_Scaler', GrimePct);
	GearMIC3.SetScalarParameterValue('Grime_Scaler', GrimePct);
	HeadgearMIC.SetScalarParameterValue('Grime_Scaler', GrimePct);
	HeadAndArmsMIC.SetScalarParameterValue(PawnHandlerClass.default.HeadGrimeParam, GrimePct);
	
	if (GetTeamNum() == `ALLIES_TEAM_INDEX && `getSF == `MACV && !bIsPilot)
	{
		BodyMIC.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
		//BodyMIC2.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
		GearMIC.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
		//GearMIC2.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
		//GearMIC3.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
		HeadgearMIC.SetScalarParameterValue('Mud_Scaler', GrimePct * 5);
	}
	else
	{
		BodyMIC.SetScalarParameterValue('Mud_Scaler', 0.0);
		//BodyMIC2.SetScalarParameterValue('Mud_Scaler', 0.0);
		GearMIC.SetScalarParameterValue('Mud_Scaler', 0.0);
		//GearMIC2.SetScalarParameterValue('Mud_Scaler', 0.0);
		//GearMIC3.SetScalarParameterValue('Mud_Scaler', 0.0);
		HeadgearMIC.SetScalarParameterValue('Mud_Scaler', 0.0);
	}*/
	
	ROSkeletalMeshComponent(mesh).GenerateAnimationOverrideBones(HeadAndArmsMesh);
	ThirdPersonHeadAndArmsMeshComponent.SetSkeletalMesh(HeadAndArmsMesh);
	ThirdPersonHeadAndArmsMeshComponent.SetMaterial(0, HeadAndArmsMIC);
	ThirdPersonHeadAndArmsMeshComponent.SetParentAnimComponent(mesh);
	ThirdPersonHeadAndArmsMeshComponent.SetShadowParent(mesh);
	ThirdPersonHeadAndArmsMeshComponent.SetLODParent(mesh);
	AttachComponent(ThirdPersonHeadAndArmsMeshComponent);

	if( HeadgearMesh != none )
	{
		AttachNewHeadgear(HeadgearMesh);
	}
	
	if( FaceItemMesh != none && !bUseSingleCharacterVariant )
	{
		AttachNewFaceItem(FaceItemMesh);
	}
	
	if( FacialHairMesh != none )
	{
		AttachNewFacialHair(FacialHairMesh);
	}
	
	if ( ArmsMesh != None )
	{
		ArmsMesh.SetSkeletalMesh(ArmsOnlyMeshFP);
		ArmsMesh.SetMaterial(0, FPArmsSkinMaterial);
		ArmsMesh.SetMaterial(1, FPArmsSleeveMaterial);
	}
	
	if ( BandageMesh != none )
	{
		BandageMesh.SetSkeletalMesh(BandageMeshFP);
		BandageMesh.SetHidden(true);
	}
	
	if ( TrapDisarmToolMesh != none )
	{
		TrapDisarmToolMesh.SetSkeletalMesh(GetTrapDisarmToolMesh(true));
	}
	
	if ( TrapDisarmToolMeshTP != none )
	{
		TrapDisarmToolMeshTP.SetSkeletalMesh(GetTrapDisarmToolMesh(false));
	}
	
	if ( TrapDisarmToolMesh != none )
	{
		TrapDisarmToolMesh.SetHidden(true);
	}
	
	if ( TrapDisarmToolMeshTP != none )
	{
		Mesh.AttachComponentToSocket(TrapDisarmToolMeshTP, GrenadeSocket);
		TrapDisarmToolMeshTP.SetHidden(true);
	}
	
	if ( bOverrideLighting )
	{
		ThirdPersonHeadAndArmsMeshComponent.SetLightingChannels(LightingOverride);
		ThirdPersonHeadgearMeshComponent.SetLightingChannels(LightingOverride);
		//ThirdPersonHairMeshComponent.SetLightingChannels(LightingOverride);
	}
	
	if( WorldInfo.NetMode == NM_DedicatedServer )
	{
		mesh.ForcedLODModel = 1000;
		ThirdPersonHeadAndArmsMeshComponent.ForcedLodModel = 1000;
		ThirdPersonHeadgearMeshComponent.ForcedLodModel = 1000;
		//ThirdPersonHairMeshComponent.ForcedLodModel = 1000;
		FaceItemMeshComponent.ForcedLodModel = 1000;
		FacialHairMeshComponent.ForcedLodModel = 1000;
	}
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
		SplitArray = SplitString(FindCachedPlayerRankAndUnit(PlayerController(Controller)), "*", false); //Split the cached string up into the SteamID and the unit
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


			case "T5":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.T5';
			break;

			case "T4":
				HeadgearMIC2 = MaterialInstanceConstant'29thExtras.Materials.T4';
			break;

			case "T3":
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

reliable client function string FindCachedPlayerRankAndUnit(PlayerController Player)
{
    local ROPlayerController        ROPC;
    local ROPlayerReplicationInfo   ROPRI;
    local array<string>             SplitArray;
    local int                       i;

    ROPC = ROPlayerController(Player);
    ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);
    //Go through the array
    for (i = 0; i < PlayerRankAndUnit.Length; i++) 
    {
        SplitArray = SplitString(PlayerRankAndUnit[I], "-", false); //Split the cached string up into the SteamID and the unit
        if (SplitArray[0] == class'OnlineSubsystem'.static.UniqueNetIdToString(ROPRI.UniqueId))
        {
            return SplitArray[1]; //If the ID matches then return the unit
        }
    }
    `log ("[MutExtras] Couldn't find the players unit!");
    return "NONE";
}

reliable client function int FindCachedPlayerRankAndUnitIndex(PlayerController Player)
{
    local ROPlayerController        ROPC;
    local ROPlayerReplicationInfo   ROPRI;
    local array<string>             SplitArray;
    local int                       i;

    ROPC = ROPlayerController(Player);
    ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);
    //Go through the array
    for (i = 0; i < PlayerRankAndUnit.Length; i++) 
    {
        SplitArray = SplitString(PlayerRankAndUnit[I], "-", false); //Split the cached string up into the SteamID and the unit
        if (SplitArray[0] == class'OnlineSubsystem'.static.UniqueNetIdToString(ROPRI.UniqueId))
        {
            return I; //If the ID matches then return the unit
        }
    }
    `log ("[MutExtras] Couldn't find the players unit index!");
    return -1;
}

reliable client function ChangeRank(PlayerController PC, string NewRank)
{
    local ROPlayerController        ROPC;
    local ROPlayerReplicationInfo   ROPRI;
    local array<string>             SplitArray, SplitArray2;
    local int                       i;

    ROPC = ROPlayerController(PC);
    ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);

    i = FindCachedPlayerRankAndUnitIndex(PC);

    if (i != -1)
    {
        SplitArray = SplitString(PlayerRankAndUnit[I], "-", false);
        SplitArray2 = SplitString(SplitArray[1], "*", false);

        PlayerRankAndUnit[I] = SplitArray[0]$"-"$NewRank$"*"$SplitArray2[1];
        SaveConfig();
    }
    else
    {
        PlayerRankAndUnit.AddItem(class'OnlineSubsystem'.static.UniqueNetIdToString(ROPRI.UniqueId)$"-"$NewRank$"*");
        SaveConfig();
    }
}

reliable client function ChangeUnit(PlayerController PC, string NewUnit)
{
    local int   i;
    local array<string>             SplitArray, SplitArray2;

    i = FindCachedPlayerRankAndUnitIndex(PC);

    if (i != -1)
    {
        SplitArray = SplitString(PlayerRankAndUnit[I], "-", false);
        SplitArray2 = SplitString(SplitArray[1], "*", false);

        PlayerRankAndUnit[I] = SplitArray[0]$"-"$SplitArray2[0]$"*"$NewUnit;
        SaveConfig();
    }
    else
    {
        PlayerRankAndUnit.AddItem(class'OnlineSubsystem'.static.UniqueNetIdToString(PC.PlayerReplicationInfo.UniqueId)$"-"$"*"$NewUnit);
        SaveConfig();
    }
}