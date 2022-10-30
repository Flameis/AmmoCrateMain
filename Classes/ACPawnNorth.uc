class ACPawnNorth extends ACpawn;

simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
}

simulated event byte ScriptGetTeamNum()
{
	return `AXIS_TEAM_INDEX;
}

/*function HandleSuppressionEvent(float SuppressionPower, ESuppressionEventType SuppressionType, optional class<DamageType> DamageType, optional Actor Suppressor)
{
	switch (SuppressionPower)
	{
		case class'ROGame.ROWeap_AK47_AssaultRifle_NLF':
		case class'ROGame.ROWeap_AK47_AssaultRifle':
		case class'ROGame.RODmgType_DP28Bullet':
		case class'ROGame.RODmgType_DShKBullet':
		case class'ROGame.RODmgType_F1Bullet':
		case class'ROGame.RODmgType_IZH43Buckshot':
		case class'ROGame.RODmgType_IZH43BuckshotCoach':
		case class'ROGame.RODmgType_IZH43BuckshotSawnOff':
		case class'ROGame.RODmgType_IZH43Slug':
		case class'ROGame.RODmgType_IZH43SlugCoach':
		case class'ROGame.RODmgType_K50MBullet':
		case class'ROGame.RODmgType_L1A1Bullet':
		case class'ROGame.RODmgType_L2A1Bullet':
		case class'ROGame.RODmgType_M134Bullet':
		case class'ROGame.RODmgType_M134Bullet_AH1G':
		case class'ROGame.RODmgType_M134Bullet_OH6':
		case class'ROGame.RODmgType_M134Bullet_UH1H':
		case class'ROGame.RODmgType_M14Bullet':
		case class'ROGame.RODmgType_M16A1Bullet':
		case class'ROGame.RODmgType_M1911Bullet':
		case class'ROGame.RODmgType_M1917Bullet':
		case class'ROGame.RODmgType_M1918Bullet':
		case class'ROGame.RODmgType_M1919Bullet':
		case class'ROGame.RODmgType_M1A1Bullet':
		case class'ROGame.RODmgType_M1CarbineBullet':
		case class'ROGame.RODmgType_M1DGarandBullet':
		case class'ROGame.RODmgType_M1GarandBullet':
		case class'ROGame.RODmgType_M2Bullet':
		case class'ROGame.RODmgType_M2CarbineBullet':
		case class'ROGame.RODmgType_M37BuckNo4_Duckbill':
		case class'ROGame.RODmgType_M37BuckNo4_Stakeout':
		case class'ROGame.RODmgType_M37BuckNo4_Trench':
		case class'ROGame.RODmgType_M37Buckshot':
		case class'ROGame.RODmgType_M37BuckshotNo4':
		case class'ROGame.RODmgType_M37Buck_Duckbill':
		case class'ROGame.RODmgType_M37Buck_Stakeout':
		case class'ROGame.RODmgType_M37Buck_Trench':
		case class'ROGame.RODmgType_M3A1Bullet':
		case class'ROGame.RODmgType_M40Bullet':
		case class'ROGame.RODmgType_M60Bullet':
		case class'ROGame.RODmgType_M60DBullet':
		case class'ROGame.RODmgType_M79Buckshot':
		case class'ROGame.RODmgType_MAS49Bullet':
		case class'ROGame.RODmgType_MAS49ScopedBullet':
		case class'ROGame.RODmgType_MAT49Bullet':
		case class'ROGame.RODmgType_MAT49Bullet_762mm':
		case class'ROGame.RODmgType_MN9130Bullet':
		case class'ROGame.RODmgType_MN9130ScopedBullet':
		case class'ROGame.RODmgType_MontagnardBolt':
		case class'ROGame.RODmgType_MP40Bullet':
		case class'ROGame.RODmgType_OwenBullet':
		case class'ROGame.RODmgType_PMBullet':
		case class'ROGame.RODmgType_PPSH41Bullet':
		case class'ROGame.RODmgType_RP46Bullet':
		case class'ROGame.RODmgType_RPDBullet':
		case class'ROGame.RODmgType_SKSBullet':
		case class'ROGame.RODmgType_SmallArmsBullet':
		case class'ROGame.RODmgType_SVDScopedBullet':
		case class'ROGame.RODmgType_TT33Bullet':
		case class'ROGame.RODmgType_Type56Bullet':
		case class'ROGame.RODmgType_Type56_1Bullet':
		case class'ROGame.RODmgType_XM177E1Bullet':
		case class'ROGame.RODmgType_XM21ScopedBullet':
		case class'ROGame.RODmgType_XM21SubsonicBullet':
			SuppressionPower = int(SuppressionPower * 1.25);
			break;
		default:
			break;
	}
}*/

defaultproperties
{
	// Meshes
	TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Long_Mesh'
	HeadAndArmsMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head1_Mesh'
	FieldgearMesh=SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Rifleman'
	// Single-variant mesh
	PawnMesh_SV=SkeletalMesh'CHR_VN_NVA.Mesh_Low.NVA_Tunic_Low_Mesh'
	// First person arms mesh
	ArmsOnlyMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_VC_Long_Mesh',
	HeadgearMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Pith'

	// Third person sockets
	HeadgearAttachSocket=helmet

	// MIC(s)
	BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST'
	HeadAndArmsMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Long_INST'
	HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_INST'

	// Northern forces specific animset
	Begin Object Name=ROPawnSkeletalMeshComponent
		AnimSets(0)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Stand_anim'
		AnimSets(1)=AnimSet'CHR_Playeranim_Master.Anim.CHR_ChestCover_anim'
		AnimSets(2)=AnimSet'CHR_Playeranim_Master.Anim.CHR_WaistCover_anim'
		AnimSets(3)=AnimSet'CHR_Playeranim_Master.Anim.CHR_StandCover_anim'
		AnimSets(4)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Crouch_anim'
		AnimSets(5)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Prone_anim'
		AnimSets(6)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Hand_Poses_Master'
		AnimSets(7)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Death_anim'
		AnimSets(8)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Tripod_anim'
		AnimSets(9)=AnimSet'CHR_Playeranim_Master.Anim.Special_Actions'
		AnimSets(10)=AnimSet'CHR_Playeranim_Master.Anim.CHR_Melee'
		AnimSets(11)=AnimSet'CHR_Playeranim_Master.Anim.CHR_German_Unique'
		AnimSets(12)=None	// Reserved for weapon specific animations
		AnimSets(13)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Tripod_anim'
		AnimSets(14)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Stand_anim'
		AnimSets(15)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_ChestCover_anim'
		AnimSets(16)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_WaistCover_anim'
		AnimSets(17)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_StandCover_anim'
		AnimSets(18)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Crouch_anim'
		AnimSets(19)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Prone_anim'
		AnimSets(20)=AnimSet'CHR_VN_Playeranim_Master.Anim.CHR_VN_Hand_Poses_Master'
		AnimSets(21)=AnimSet'CHR_VN_Playeranim_Master.Anim.VN_Special_Actions' // Package containing vine ladder anims.
	End Object

	// Gore
	Gore_LeftHand=(GibClass=class'ROGameContent.ROGib_HumanArm_Gore_BareArm')
	Gore_RightHand=(GibClass=class'ROGameContent.ROGib_HumanArm_Gore_BareArm')
	Gore_LeftLeg=(GibClass=class'ROGameContent.ROGib_HumanLeg_Gore_BareLeg')
	Gore_RightLeg=(GibClass=class'ROGameContent.ROGib_HumanLeg_Gore_BareLeg')

	bSingleHandedSprinting=true

	bHeadGearIsHelmet=true
	bCanCamouflage=true

	FootstepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Dirt')()
	FootstepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Gravel'))
	FootstepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Dirt'))
	FootstepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Metal'))
	FootstepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Wood'))
	FootstepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Grass'))
	FootstepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Metal'))
	FootstepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Wood'))
	FootstepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Mud'))
	FootstepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Dirt'))
	FootstepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Water'))
	FootstepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Mud'))
	FootstepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Gravel'))
	FootstepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Mud'))
	FootstepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Rock'))
	FootstepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Jog_Dirt'))

	CrawlFootStepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Dirt'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Gravel'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Dirt'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Metal'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Wood'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Grass'))
	CrawlFootStepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Metal'))
	CrawlFootStepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Wood'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Mud'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Dirt'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Water'))
	CrawlFootStepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Water'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Gravel'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Mud'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Rock'))
	CrawlFootStepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crawl_Dirt'))

	SprintFootStepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Dirt'))
	SprintFootStepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Gravel'))
	SprintFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Dirt'))
	SprintFootStepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Metal'))
	SprintFootStepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Wood'))
	SprintFootStepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Grass'))
	SprintFootStepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Metal'))
	SprintFootStepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Wood'))
	SprintFootStepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Mud'))
	SprintFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Dirt'))
	SprintFootStepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Water'))
	SprintFootStepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Mud'))
	SprintFootStepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Gravel'))
	SprintFootStepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Mud'))
	SprintFootStepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Rock'))
	SprintFootStepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Sprint_Dirt'))

	WalkFootStepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Dirt'))
	WalkFootStepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Gravel'))
	WalkFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Dirt'))
	WalkFootStepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Metal'))
	WalkFootStepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Wood'))
	WalkFootStepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Grass'))
	WalkFootStepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Metal'))
	WalkFootStepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Wood'))
	WalkFootStepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Mud'))
	WalkFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Dirt'))
	WalkFootStepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Water'))
	WalkFootStepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Mud'))
	WalkFootStepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Gravel'))
	WalkFootStepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Mud'))
	WalkFootStepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Rock'))
	WalkFootStepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Dirt'))

	CrouchFootStepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Gravel'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Metal'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Wood'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Grass'))
	CrouchFootStepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Metal'))
	CrouchFootStepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Wood'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Water'))
	CrouchFootStepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Gravel'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchFootStepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))

	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Default,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Rock,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Gravel'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Metal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Metal'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Wood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Wood'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Asphalt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_RedBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_WhiteBrick,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Plant,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Grass'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_HollowMetal,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Metal'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_HollowWood,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Wood'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Mud,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Dirt,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Water,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Walk_Water'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_ShallowWater,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Gravel,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Gravel'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Plaster,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Concrete,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Poop,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Mud'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Plastic,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Rock'))
	CrouchWalkFootStepSounds.Add((MaterialType=EMT_Clay,Sound=AkEvent'WW_FOL_VC.Play_FS_VC_Crouch_Dirt'))
}