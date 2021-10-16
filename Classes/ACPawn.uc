class ACpawn extends ROPawn;

simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}

simulated function CreatePawnMesh()
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
	
	// GetCachedCompositedPawnMesh() CREATES A LIST OF UNIQUE MATERIALS! IT DOES NOT OVERLAP INDEXES!
	// THAT SHIT TOOK ME ALMOST 12 HOURS STRAIGHT TO FIGURE OUT
	// Wait, no it doesn't??? Seems to be a combination of both! Fuck this stupid system!
	// Certainly doesn't help that GetCachedCompositedPawnMesh() is a NATIVE function...
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// OKAY. SO. IT ONLY TOOK 16 HOURS, BUT IT'S WORKING. FOR FUTURE REFERENCE: GetCachedCompositedPawnMesh()
	// TAKES THE MIC VALUES OF THE SECOND ARGUMENT MESH, AND SYNCS THEM TO ANY MATCHING MICS IN THE FIRST ARGUMENT MESH.
	// HOWEVER, IF A MATERIAL SLOT DOES NOT HAVE ANY PART OF THE MESH ASSIGNED TO IT, IT GETS THROWN OUT OF THE LIST!
	// ALL SLOTS MUST HAVE A PIECE OF THE MESH ASSIGNED TO THEM, EVEN IF IT'S JUST A SINGLE HIDDEN TRIANGLE.
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////// DO NOT FORGET ABOUT THESE VALUES WHEN MODIFYING MESH ////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////////////
	GearMIC.SetParent(FieldgearMesh.Materials[0]);
	//GearMIC2.SetParent(FieldgearMesh.Materials[1]);
	//GearMIC3.SetParent(FieldgearMesh.Materials[2]);
	
	/*if (TunicMesh.Materials[2] != FieldgearMesh.Materials[1])
	{
		GearMIC2.SetParent(TunicMesh.Materials[2]);
		AltGear = true;
	}*/
	
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
}