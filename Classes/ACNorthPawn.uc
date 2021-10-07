class ACNorthPawn extends RONorthPawn;


simulated event PreBeginPlay()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	super.PreBeginPlay();
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