class ACPawnHandler extends ROPawnHandler
	config(MutExtras_Client);

var config	array<CharacterConfig>	ACNVAConfigsByClass;
var config	array<CharacterConfig>	ACNLFConfigsByClass;
var config	array<CharacterConfig>	ACUSArmyConfigsByClass;
var config	array<CharacterConfig>	ACUSMCConfigsByClass;
var config	array<CharacterConfig>	ACAusArmyConfigsByClass;
var config	array<CharacterConfig>	ACARVNConfigsByClass;

//These are all to save the config to the .ini
static function GetCharConfig(int Team, int ArmyIndex, byte bPilot, int ClassIndex, int HonorLevel, out byte TunicID, out byte TunicMaterialID, out byte ShirtID, out byte HeadID, out byte HairID, out byte HeadgearID, out byte HeadgearMatID, out byte FaceItemID, out byte FacialHairID, out byte TattooID, ROPlayerReplicationInfo ROPRI, optional bool bRandomiseAll, optional bool bInitByMenu, optional out byte bUseBase)
{
	if (bRandomiseAll)
	{
		TunicID = default.RandomConfig.TunicMesh;
		TunicMaterialID = default.RandomConfig.TunicMaterial;
		ShirtID = default.RandomConfig.ShirtTexture;
		HeadID = default.RandomConfig.HeadMesh;
		HairID = default.RandomConfig.HairMaterial;
		HeadgearID = default.RandomConfig.HeadgearMesh;
		HeadgearMatID = default.RandomConfig.HeadgearMaterial;
		FaceItemID = default.RandomConfig.FaceItemMesh;
		FacialHairID = default.RandomConfig.FacialHairMesh;
		TattooID = default.RandomConfig.TattooTex;
		
	}
	else if (Team == `AXIS_TEAM_INDEX)
	{
		switch (ArmyIndex)
		{
			case NFOR_NVA:

				TunicID = default.ACNVAConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACNVAConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACNVAConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACNVAConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACNVAConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACNVAConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACNVAConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACNVAConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACNVAConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACNVAConfigsByClass[ClassIndex].TattooTex;
				break;

			case NFOR_NLF:

				TunicID = default.ACNLFConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACNLFConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACNLFConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACNLFConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACNLFConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACNLFConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACNLFConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACNLFConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACNLFConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACNLFConfigsByClass[ClassIndex].TattooTex;
				break;

			default:
				TunicID = 0;
				TunicMaterialID = 0;
				ShirtID = 0;
				HeadID = 0;
				HairID = 0;
				HeadgearID = 0;
				HeadgearMatID = 0;
				FaceItemID = 0;
				FacialHairID = 0;
				TattooID = 0;
		}
	}
	else
	{
		switch (ArmyIndex)
		{
			case SFOR_USArmy:

				TunicID = default.ACUSArmyConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACUSArmyConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACUSArmyConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACUSArmyConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACUSArmyConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACUSArmyConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACUSArmyConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACUSArmyConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACUSArmyConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACUSArmyConfigsByClass[ClassIndex].TattooTex;
				break;
			
			case SFOR_USMC:

				TunicID = default.ACUSMCConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACUSMCConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACUSMCConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACUSMCConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACUSMCConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACUSMCConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACUSMCConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACUSMCConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACUSMCConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACUSMCConfigsByClass[ClassIndex].TattooTex;
				break;

			case SFOR_AusArmy:

				TunicID = default.ACAusArmyConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACAusArmyConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACAusArmyConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACAusArmyConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACAusArmyConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACAusArmyConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACAusArmyConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACAusArmyConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACAusArmyConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACAusArmyConfigsByClass[ClassIndex].TattooTex;
				break;
			
			case SFOR_ARVN:

				TunicID = default.ACARVNConfigsByClass[ClassIndex].TunicMesh;
				TunicMaterialID = default.ACARVNConfigsByClass[ClassIndex].TunicMaterial;
				ShirtID = default.ACARVNConfigsByClass[ClassIndex].ShirtTexture;
				HeadID = default.ACARVNConfigsByClass[ClassIndex].HeadMesh;
				HairID = default.ACARVNConfigsByClass[ClassIndex].HairMaterial;
				HeadgearID = default.ACARVNConfigsByClass[ClassIndex].HeadgearMesh;
				HeadgearMatID = default.ACARVNConfigsByClass[ClassIndex].HeadgearMaterial;
				FaceItemID = default.ACARVNConfigsByClass[ClassIndex].FaceItemMesh;
				FacialHairID = default.ACARVNConfigsByClass[ClassIndex].FacialHairMesh;
				TattooID = default.ACARVNConfigsByClass[ClassIndex].TattooTex;
				break;	
			
			default:

				TunicID = 0;
				TunicMaterialID = 0;
				ShirtID = 0;
				HeadID = 0;
				HairID = 0;
				HeadgearID = 0;
				HeadgearMatID = 0;
				FaceItemID = 0;
				FacialHairID = 0;
				TattooID = 0;
		}
	}
	
	ValidateCharConfig(Team, ArmyIndex, bPilot, HonorLevel, TunicID, TunicMaterialID, ShirtID, HeadID, HairID, HeadgearID, HeadgearMatID, FaceItemID, FacialHairID, TattooID, ROPRI);
}

static function SaveCharConfig(int Team, int ArmyIndex, byte bPilot, int ClassIndex, int HonorLevel, out byte TunicID, out byte TunicMaterialID, out byte ShirtID, out byte HeadID, out byte HairID, out byte HeadgearID, out byte HeadgearMatID, out byte FaceItemID, out byte FacialHairID, out byte TattooID, byte bUseBase)
{	
	default.ACNVAConfigsByClass.length = `TOTALROLECOUNT_NORTH;
	default.ACNLFConfigsByClass.length = `TOTALROLECOUNT_NORTH;
	
	default.ACUSArmyConfigsByClass.length = `TOTALROLECOUNT_SOUTH;
	default.ACUSMCConfigsByClass.length = `TOTALROLECOUNT_SOUTH;
	default.ACAusArmyConfigsByClass.length = `TOTALROLECOUNT_SOUTH;
	default.ACARVNConfigsByClass.length = `TOTALROLECOUNT_SOUTH;
	
	StaticSaveConfig();
	
	if (Team == `AXIS_TEAM_INDEX)
	{
		switch (ArmyIndex)
		{
			case NFOR_NLF:

				default.ACNLFConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACNLFConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACNLFConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACNLFConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACNLFConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACNLFConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACNLFConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACNLFConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACNLFConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACNLFConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;
			
			case NFOR_NVA:

				default.ACNVAConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACNVAConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACNVAConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACNVAConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACNVAConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACNVAConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACNVAConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACNVAConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACNVAConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACNVAConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;
		}
	}
	else
	{
		switch (ArmyIndex)
		{
			case SFOR_USArmy:

				default.ACUSArmyConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACUSArmyConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACUSArmyConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACUSArmyConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACUSArmyConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACUSArmyConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACUSArmyConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACUSArmyConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACUSArmyConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACUSArmyConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;

			case SFOR_USMC:

				default.ACUSMCConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACUSMCConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACUSMCConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACUSMCConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACUSMCConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACUSMCConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACUSMCConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACUSMCConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACUSMCConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACUSMCConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;
			
			case SFOR_AusArmy:

				default.ACAusArmyConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACAusArmyConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACAusArmyConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACAusArmyConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACAusArmyConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACAusArmyConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACAusArmyConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACAusArmyConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACAusArmyConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACAusArmyConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;
			
			case SFOR_ARVN:

				default.ACARVNConfigsByClass[ClassIndex].TunicMesh = TunicID;
				default.ACARVNConfigsByClass[ClassIndex].TunicMaterial = TunicMaterialID;
				default.ACARVNConfigsByClass[ClassIndex].ShirtTexture = ShirtID;
				default.ACARVNConfigsByClass[ClassIndex].HeadMesh = HeadID;
				default.ACARVNConfigsByClass[ClassIndex].HairMaterial = HairID;
				default.ACARVNConfigsByClass[ClassIndex].HeadgearMesh = HeadgearID;
				default.ACARVNConfigsByClass[ClassIndex].HeadgearMaterial = HeadgearMatID;
				default.ACARVNConfigsByClass[ClassIndex].FaceItemMesh = FaceItemID;
				default.ACARVNConfigsByClass[ClassIndex].FacialHairMesh = FacialHairID;
				default.ACARVNConfigsByClass[ClassIndex].TattooTex = TattooID;
				break;

		}
	}
	
	StaticSaveConfig();
}

static function bool CopyConfigToClass(int Team, int ArmyIndex, int SourceClassIndex, int TargetClassIndex)
{
	local int i;
	
	if (Team == `AXIS_TEAM_INDEX)
	{
		switch (ArmyIndex)
		{
			case NFOR_NLF:
			for (i = 0; i < default.ACNLFConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACNLFConfigsByClass[i].TunicMesh		= default.ACNLFConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACNLFConfigsByClass[i].TunicMaterial	= default.ACNLFConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACNLFConfigsByClass[i].ShirtTexture		= default.ACNLFConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACNLFConfigsByClass[i].HeadMesh			= default.ACNLFConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACNLFConfigsByClass[i].HairMaterial		= default.ACNLFConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACNLFConfigsByClass[i].HeadgearMesh		= default.ACNLFConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACNLFConfigsByClass[i].HeadgearMaterial	= default.ACNLFConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACNLFConfigsByClass[i].FaceItemMesh		= default.ACNLFConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACNLFConfigsByClass[i].FacialHairMesh	= default.ACNLFConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACNLFConfigsByClass[i].TattooTex		= default.ACNLFConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;
			
			case NFOR_NVA:
			for (i = 0; i < default.ACNVAConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACNVAConfigsByClass[i].TunicMesh		= default.ACNVAConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACNVAConfigsByClass[i].TunicMaterial	= default.ACNVAConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACNVAConfigsByClass[i].ShirtTexture	= default.ACNVAConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACNVAConfigsByClass[i].HeadMesh		= default.ACNVAConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACNVAConfigsByClass[i].HairMaterial	= default.ACNVAConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACNVAConfigsByClass[i].HeadgearMesh	= default.ACNVAConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACNVAConfigsByClass[i].HeadgearMaterial= default.ACNVAConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACNVAConfigsByClass[i].FaceItemMesh	= default.ACNVAConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACNVAConfigsByClass[i].FacialHairMesh	= default.ACNVAConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACNVAConfigsByClass[i].TattooTex		= default.ACNVAConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;
		}
	}
	else if (SourceClassIndex < `ACCI_CombatPilot)
	{
		switch (ArmyIndex)
		{
			case SFOR_USArmy:
			for (i = 0; i < default.ACUSArmyConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACUSArmyConfigsByClass[i].TunicMesh		= default.ACUSArmyConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACUSArmyConfigsByClass[i].TunicMaterial	= default.ACUSArmyConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACUSArmyConfigsByClass[i].ShirtTexture		= default.ACUSArmyConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACUSArmyConfigsByClass[i].HeadMesh			= default.ACUSArmyConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACUSArmyConfigsByClass[i].HairMaterial		= default.ACUSArmyConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACUSArmyConfigsByClass[i].HeadgearMesh		= default.ACUSArmyConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACUSArmyConfigsByClass[i].HeadgearMaterial	= default.ACUSArmyConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACUSArmyConfigsByClass[i].FaceItemMesh		= default.ACUSArmyConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACUSArmyConfigsByClass[i].FacialHairMesh	= default.ACUSArmyConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACUSArmyConfigsByClass[i].TattooTex		= default.ACUSArmyConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;
			
			case SFOR_USMC:
			for (i = 0; i < default.ACUSMCConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACUSMCConfigsByClass[i].TunicMesh			= default.ACUSMCConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACUSMCConfigsByClass[i].TunicMaterial		= default.ACUSMCConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACUSMCConfigsByClass[i].ShirtTexture		= default.ACUSMCConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACUSMCConfigsByClass[i].HeadMesh			= default.ACUSMCConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACUSMCConfigsByClass[i].HairMaterial		= default.ACUSMCConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACUSMCConfigsByClass[i].HeadgearMesh		= default.ACUSMCConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACUSMCConfigsByClass[i].HeadgearMaterial	= default.ACUSMCConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACUSMCConfigsByClass[i].FaceItemMesh		= default.ACUSMCConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACUSMCConfigsByClass[i].FacialHairMesh		= default.ACUSMCConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACUSMCConfigsByClass[i].TattooTex			= default.ACUSMCConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;

			case SFOR_ARVN:
			for (i = 0; i < default.ACARVNConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACARVNConfigsByClass[i].TunicMesh			= default.ACARVNConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACARVNConfigsByClass[i].TunicMaterial		= default.ACARVNConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACARVNConfigsByClass[i].ShirtTexture		= default.ACARVNConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACARVNConfigsByClass[i].HeadMesh			= default.ACARVNConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACARVNConfigsByClass[i].HairMaterial		= default.ACARVNConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACARVNConfigsByClass[i].HeadgearMesh		= default.ACARVNConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACARVNConfigsByClass[i].HeadgearMaterial	= default.ACARVNConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACARVNConfigsByClass[i].FaceItemMesh		= default.ACARVNConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACARVNConfigsByClass[i].FacialHairMesh		= default.ACARVNConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACARVNConfigsByClass[i].TattooTex			= default.ACARVNConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;
			
			case SFOR_AusArmy:
			for (i = 0; i < default.ACAusArmyConfigsByClass.length; i++)
			{
				if (i <= `ACCI_Tank)
				{
					default.ACAusArmyConfigsByClass[i].TunicMesh		= default.ACAusArmyConfigsByClass[SourceClassIndex].TunicMesh;
					default.ACAusArmyConfigsByClass[i].TunicMaterial	= default.ACAusArmyConfigsByClass[SourceClassIndex].TunicMaterial;
					default.ACAusArmyConfigsByClass[i].ShirtTexture	= default.ACAusArmyConfigsByClass[SourceClassIndex].ShirtTexture;
					default.ACAusArmyConfigsByClass[i].HeadMesh		= default.ACAusArmyConfigsByClass[SourceClassIndex].HeadMesh;
					default.ACAusArmyConfigsByClass[i].HairMaterial	= default.ACAusArmyConfigsByClass[SourceClassIndex].HairMaterial;
					default.ACAusArmyConfigsByClass[i].HeadgearMesh	= default.ACAusArmyConfigsByClass[SourceClassIndex].HeadgearMesh;
					default.ACAusArmyConfigsByClass[i].HeadgearMaterial= default.ACAusArmyConfigsByClass[SourceClassIndex].HeadgearMaterial;
					default.ACAusArmyConfigsByClass[i].FaceItemMesh	= default.ACAusArmyConfigsByClass[SourceClassIndex].FaceItemMesh;
					default.ACAusArmyConfigsByClass[i].FacialHairMesh	= default.ACAusArmyConfigsByClass[SourceClassIndex].FacialHairMesh;
					default.ACAusArmyConfigsByClass[i].TattooTex		= default.ACAusArmyConfigsByClass[SourceClassIndex].TattooTex;
				}
			}
			break;
		}
	}
	
	StaticSaveConfig();
	
	return true;
}

static function array<TunicInfo> GetTunicArray(byte TeamIndex, byte ArmyIndex, optional byte bPilot)
{
	if( TeamIndex == `AXIS_TEAM_INDEX )
	{
		if( ArmyIndex == NFOR_NVA )
			return default.NVATunics;
		else
			return default.NLFTunics;
	}
	else
	{
		if( ArmyIndex == SFOR_AusArmy )
		{
			if( bPilot > 0 )
				return default.AusPilotTunics;
			else
				return default.AusArmyTunics;
		}
		else if( ArmyIndex == SFOR_ARVN )
		{
			if( bPilot > 1 )
				return default.USPilotTunics;
			else if( bPilot == 1 )
				return default.ARVNPilotTunics;
			else
				return default.ARVNTunics;
		}
		else
		{
			if( bPilot > 0 )
				return default.USPilotTunics;
			else if( ArmyIndex == SFOR_USMC )
				return default.USMCTunics;
			else
				return default.USArmyTunics;
		}
	}
}

defaultproperties
{
	/****************************
	  * North Vietnamese Army
	  ***************************/
	// Tunics
	// Full tunic
	NVATunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Long_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_NVA_Long_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_NVA_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_NVA_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_NVA_Camo_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong2_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_NVA_Camo_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_NVA_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_NVA_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_NVA_Camo_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong2_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_NVA_Camo_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadHands,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NVA_Long',
				   )}

	// Full tunic, rolled sleeves and pants
	NVATunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Tied_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_NVA_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_NVA_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_Rolled_NVA_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong2_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_Rolled_NVA_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_NVA_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_NVA_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_Rolled_NVA_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong2_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_VN_1stP_Rolled_NVA_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadForearms,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NVA_Rolled',
				    requiredlevel=1
				   )}

	// Full tunic, torn and tattered sleeves and pants
	NVATunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Torn_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadAndArms,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NVA_Torn',
				    requiredlevel=1
				   )}

	// Pants only
	NVATunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Long_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Long_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaistAndFeet,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NVA_Long',
				    requiredlevel=1
				   )}

	// Pants only, legs rolled up, boots
	NVATunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Tied_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Tied_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaist,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NVA_Rolled',
				    requiredlevel=1,
				    DLCPackID=DLC_HosHeroes
				   )}

	// Pants only, legs rolled up and torn
	NVATunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_NVA.Mesh.NVA_Tunic_Torn_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Camo_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Camo_Tunic_Torn_DacCong2_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_DaCong2',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaistAndFeet,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NVA_Torn',
				    requiredlevel=1
				   )}

	// Officer's Uniform
	NVATunics(6)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_CandC.Mesh.NVA_Tunic_Officer_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_CandC.Mesh.VN_1stP_NVA_Officer_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CandC.Materials.M_NVA_Tunic_Officer_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_NVA_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan')),
				    SkinToShow=STS_HeadOnly,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_NVA_Officer',
				    RequiredLevel=255,
				    DLCPackID=DLC_PullingRank,
				    StoreListPreviewPos=1
				   )}

	// Smock Hood Down
	NVATunics(7)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.NVA_Tunic_Hooded_Down_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.VN_1stP_NVA_Hooded_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Down_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Tan_HL'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Down_Green_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_Green_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Green_HL'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Down_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Tan_HL_Foliage',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Down_Green_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_Green_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Green_HL_Foliage',requiredlevel=1)),
				    SkinToShow=STS_HeadHands,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_NVA_SniperUniform_HL',
				    RequiredLevel=255,
				    DLCPackID=DLC_HomelandSec,
				   )}

	// Smock Hood Up
	NVATunics(8)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.NVA_Tunic_Hooded_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.VN_1stP_NVA_Hooded_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Tan_HL'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Green_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_Green_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Green_HL'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Tan_HL_Foliage',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_NVA_Tunic_Hooded_Green_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_1stP_NVA_Hooded_Green_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_NVA_Green_HL_Foliage',requiredlevel=1)),
				    SkinToShow=STS_HeadHands,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_NVA_SniperUniformHood_HL',
				    bCoversHead=true,
				    RequiredLevel=255,
				    DLCPackID=DLC_HomelandSec,
				    StoreListPreviewPos=1
				   )}

	// Sapper outfit, shorts and sandals only
	NVATunics(9)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VC_Tunic_Sapper_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Camo_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Camo_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo_Leaf')),
				    SkinToShow=STS_Everything,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_NVA_SapperShortsTan',
				    RequiredLevel=255,
				    DLCPackID=DLC_SpecialForces,
				   )}

	NVATunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_NVA.Mesh_Low.NVA_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST');
	NVATunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_NVA.Mesh_Low.NVA_Tunic_Low_Radio_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_NVA.Materials.M_NVA_Tunic_Long_INST');

	// Shirts and bandages
	NVAShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	NVAShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	NVAShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	NVAShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tanshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tan',requiredlevel=1)
	NVAShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tanshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tan_Bandages',requiredlevel=1)
	NVAShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_TanVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Tan',requiredlevel=1)
	NVAShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_TanVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Tan_Bandages',requiredlevel=1)
	NVAShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Warm',requiredlevel=1,DLCPackID=DLC_HosHeroes)

	// Tattoos, camo paint, misc other skin coverings
	NVATattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	NVATattoos(1)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Fish',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Fish',requiredlevel=1)
	NVATattoos(2)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Croc',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Croc',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NVATattoos(3)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Dongson',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_DongSon',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NVATattoos(4)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Dragon',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Dragon',requiredlevel=1,DLCPackID=DLC_HosHeroes,StoreListPreviewPos=2)
	NVATattoos(5)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.VN_Bathtub',UOffset=-5.1452,VOffset=-7.8002,DrawScale=12.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_Bathtub',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	NVATattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVATattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVATattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Lotus',UOffset=-0.6978,VOffset=-8.155801,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Lotus_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVATattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Phoenix',UOffset=-0.3078,VOffset=-2.9691,DrawScale=3.96,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Phoenix_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVATattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_SmallDragon',UOffset=-1.9012,VOffset=-2.9682,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_SmallDragon_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVATattoos(11)=(TattooTex=Texture2D'CHR_VN_DLC_SpecOps.Tattoos.VN_GreaseAsh',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_NVA_BlackGrease',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	// Fieldgear by role first and tunic mesh type second (for tunic types, 0 = Pants and Top, 1 = Pants Only)
	NVAFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Rifleman'))
	NVAFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Scout',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Scout'))
	NVAFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Machinegunner'))
	NVAFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Sniper',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Sniper'))
	NVAFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_RPG',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_RPG'))
	NVAFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Radio',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Radio'))
	NVAFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Commander',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Commander'))
	NVAFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Gear_Long_Commander',SkeletalMesh'CHR_VN_NVA.GearMesh.NVA_Camo_Gear_Long_Commander'))

	// Headgear
	NVAHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_PithNVA'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Pith')
	NVAHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_PithCoverCamo'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_PithCamo',requiredlevel=1)
	NVAHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_HatNVA'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Hat',requiredlevel=1)
	NVAHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Cap'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Cap',requiredlevel=1)
	NVAHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Cool'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Ushanka',requiredlevel=1)
	NVAHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Cap_Camo'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_CapCamo',requiredlevel=1)
	NVAHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Cool_Camo'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_UshankaCamo',requiredlevel=1,DLCPackID=DLC_DigitalDeluxe)
	NVAHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Buzz'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_BuzzHair',requiredlevel=1)
	NVAHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_ShortSuper'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_SShortHair',requiredlevel=1)
	NVAHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Short'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_ShortHair',requiredlevel=1)
	NVAHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Medium'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_MediumHair',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NVAHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_M56'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_M56',requiredlevel=1)
	NVAHeadgear(12)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.VN_Headgear_DD_Boonie'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_CamoHat',RequiredLevel=255,DLCPackID=DLC_DigitalDeluxe,StoreListPreviewPos=1)
	NVAHeadgear(13)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CandC.Mesh.NVA_Headgear_OfficerCap'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_OfficersCap',RequiredLevel=255,DLCPackID=DLC_PullingRank)
	NVAHeadgear(14)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_long'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_LongHair',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVAHeadgear(15)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_crewcut'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_CrewCut',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVAHeadgear(16)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_buzzswept'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_BuzzSwept',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NVAHeadgear(17)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_M56'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_FlagPaintedM56_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	NVAHeadgear(18)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_NVA.Mesh.VN_Headgear_PithNVA_Net'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_PithNet',RequiredLevel=255,DLCPackID=DLC_GOM)
	NVAHeadgear(19)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_NVA.Mesh.VN_Headgear_PithPara'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_PithPara',RequiredLevel=255,DLCPackID=DLC_GOM)
	NVAHeadgear(20)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_NVA.Mesh.VN_Headgear_PithPara_Net'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_PithParaNet',RequiredLevel=255,DLCPackID=DLC_GOM)
	NVAHeadgear(21)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_NVA.Mesh.VN_Headgear_PLA'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_PLA',RequiredLevel=255,DLCPackID=DLC_GOM)
	NVAHeadgear(22)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VN_Headgear_JungleOp'),HeadgearMICs=(8,9),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_SapperCapTan',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	NVAHeadgearMICS(0)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_NVA_Headgear_INST')
	NVAHeadgearMICS(1)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_INST')
	NVAHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_Hair_INST')
	NVAHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DigitalDeluxe.Materials.M_VN_Headgear_DD_Boonie')
	NVAHeadgearMICs(4)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CandC.Materials.M_NVA_Headgear_OfficerCap_INST')
	NVAHeadgearMICs(5)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_Headgear_PaintedHelms_INST')
	NVAHeadgearMICs(6)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_NVA.Materials.M_NVA_Headgear_PithPara_INST')
	NVAHeadgearMICs(7)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_Headgear2_INST')
	NVAHeadgearMICs(8)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Headgear_JungleOp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan')
	NVAHeadgearMICs(9)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Headgear_JungleOp_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Camo')

	/****************************
	  * National Liberation Front (Viet Cong)
	  ***************************/
	// Tunics
	// Full "Pyjamas" Tunic, Black
	NLFTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Long_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_VC_Long_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_VC_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Grey_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_VC_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Blue_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_VC_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_Brown_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_VC_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_White_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_VC_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_VC_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Grey_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_VC_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Blue_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_VC_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_Brown_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_VC_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_White_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_VC_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadHands,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NLF_Long'
				   )}

	// Full "Pyjamas" Tunic, Black, Sleeves rolled up, Boots
	NLFTunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Tied_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_VC_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Grey_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_VC_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Blue_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_VC_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_Brown_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_Rolled_VC_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_White_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_Rolled_VC_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_VC_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Grey_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_VC_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Blue_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_VC_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_Brown_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_Rolled_VC_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_White_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_1stP_Rolled_VC_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadForearms,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NLF_Rolled',
				    requiredlevel=1
				   )}

	// Black "Pyjamas" Tunic, torn sleeves
	NLFTunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Torn_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_HeadAndArms,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_NLF_Torn',
				    requiredlevel=1
				   )}

	// Black "Pyjamas" Tunic, Pants only
	NLFTunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Long_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Long_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaistAndFeet,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NLF_Long',
				    requiredlevel=1
				   )}

	// Black "Pyjamas" Tunic, Pants only, legs rolled up, boots
	NLFTunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Tied_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Tied_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Tied_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaist,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_VCBoot",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NLF_Rolled',
				    requiredlevel=1,
				    DLCPackID=DLC_HosHeroes
				   )}

	// Black "Pyjamas" Tunic, Pants only, legs rolled up and torn
	NLFTunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_Vietcong.Mesh.VC_Tunic_Torn_Pants_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_Brown',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_White',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Grey_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Grey_Leaf',requiredlevel=1),
				    			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Torn_Blue_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Blue_Leaf',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_Brown_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_BrownFoliage',RequiredLevel=255,DLCPackID=DLC_GOM),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VC_Tunic_Torn_White_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_VC_WhiteFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)),
				    SkinToShow=STS_AboveWaistAndFeet,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_NLF_Torn',
				    requiredlevel=1
				   )}

	// Sapper outfit, shorts and sandals only
	NLFTunics(6)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VC_Tunic_Sapper_Mesh',
				    ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
				    BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_VC_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_VC_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NLF_Black_Leaf'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_NVA_Tunic_Sapper_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_NVA_Tan_Leaf')),
				    SkinToShow=STS_Everything,
				    UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				    LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				    LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_BareLeg",
				    ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_NVA_SapperShorts',
				    RequiredLevel=255,
				    DLCPackID=DLC_SpecialForces,
				   )}

	NLFTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_Vietcong.Mesh_Low.VC_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST');
	NLFTunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_Vietcong.Mesh_Low.VC_Tunic_Low_Radio_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Vietcong.Materials.M_VC_Tunic_Long_INST');

	// Shirts and bandages
	NLFShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	NLFShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	NLFShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	NLFShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_blackshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Black',requiredlevel=1)
	NLFShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_blackshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Black_Bandages',requiredlevel=1)
	NLFShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_BlackVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Black',requiredlevel=1)
	NLFShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_BlackVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Vest_Black_Bandages',requiredlevel=1)
	NLFShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_VN_CoolVest.Head_Generic_Coolvest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Warm',requiredlevel=1,DLCPackID=DLC_HosHeroes)

	// Tattoos, camo paint, misc other skin coverings
	NLFTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	NLFTattoos(1)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Fish',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Fish',requiredlevel=1)
	NLFTattoos(2)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Croc',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Croc',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NLFTattoos(3)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Dongson',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_DongSon',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NLFTattoos(4)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Dragon',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Dragon',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NLFTattoos(5)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.VN_Bathtub',UOffset=-5.1452,VOffset=-7.8002,DrawScale=12.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_Bathtub',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	NLFTattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFTattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFTattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Lotus',UOffset=-0.6978,VOffset=-8.155801,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Lotus_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFTattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Phoenix',UOffset=-0.3078,VOffset=-2.9691,DrawScale=3.96,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Phoenix_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFTattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_SmallDragon',UOffset=-1.9012,VOffset=-2.9682,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_SmallDragon_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFTattoos(11)=(TattooTex=Texture2D'CHR_VN_DLC_SpecOps.Tattoos.VN_GreaseAsh',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_NVA_BlackGrease',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	// Fieldgear by role first and tunic mesh type second (for tunic types, 0 = Pants and Top, 1 = Pants Only)
	NLFFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Rifleman'))
	NLFFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Scout',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Scout'))
	NLFFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Machinegunner'))
	NLFFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Sniper',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Sniper'))
	NLFFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_RPG',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_RPG'))
	NLFFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Radio',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Radio'))
	NLFFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Commander',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Commander'))
	NLFFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Gear_Long_Commander',SkeletalMesh'CHR_VN_Vietcong.GearMesh.VC_Camo_Gear_Long_Commander'))

	// Headgear
	NLFHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Pith'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_Pith')
	NLFHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Pithcover'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_PithCover',requiredlevel=1)
	NLFHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Hat'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_Hat',requiredlevel=1)
	NLFHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_HatNVA'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_Hat',requiredlevel=1)
	NLFHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Ruspot'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_SSh39',requiredlevel=1)
	NLFHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Scarf'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_Scarf',requiredlevel=1,DLCPackID=DLC_DigitalDeluxe)
	NLFHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Buzz'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_BuzzHair',requiredlevel=1)
	NLFHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_ShortSuper'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_SShortHair',requiredlevel=1)
	NLFHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Short'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_ShortHair',requiredlevel=1)
	NLFHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Medium'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_MediumHair',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	NLFHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_headgear_var1'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NLF_NonLa',requiredlevel=1)
	NLFHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.VN_Headgear_DD_Boonie'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_NVA_CamoHat',RequiredLevel=255,DLCPackID=DLC_DigitalDeluxe)
	NLFHeadgear(12)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_long'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_LongHair',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFHeadgear(13)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_crewcut'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_CrewCut',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFHeadgear(14)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_buzzswept'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_BuzzSwept',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	NLFHeadgear(15)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Ruspot'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NLF_FlagPaintedRuspot_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	NLFHeadgear(16)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.VN_Headgear_Hair_Scarf_Red'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_Viet_RedChequerBandana_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	NLFHeadgear(17)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Homeland.Mesh.VN_headgear_ricehat'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NLF_RiceHat_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	NLFHeadgear(18)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_VC.Mesh.VN_Headgear_Pith_Foliage'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NLF_PithFoliage',RequiredLevel=255,DLCPackID=DLC_GOM)
	NLFHeadgear(19)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_VC.Mesh.VN_Headgear_WW2Japan'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NLF_WW2Japan',RequiredLevel=255,DLCPackID=DLC_GOM)
	NLFHeadgear(20)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VN_Headgear_JungleOp'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_NVA_SapperCapBlack',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	NLFHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_INST')
	NLFHeadgearMICS(1)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_NVA_Headgear_INST')
	NLFHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_Headgear_Hair_INST')
	NLFHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DigitalDeluxe.Materials.M_VN_Headgear_DD_Boonie')
	NLFHeadgearMICs(4)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_Headgear_Ricehat_INST')
	NLFHeadgearMICs(5)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Homeland.Materials.M_VN_Headgear_PaintedHelms_INST')
	NLFHeadgearMICs(6)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_VC.Materials.M_VN_Headgear2_INST')
	NLFHeadgearMICs(7)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_VC_Headgear_JungleOp_INST')

	/**
	 * Available heads for all Vietnamese forces
	 */
	// Head and arms meshes
	VietnameseHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head1_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Long_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Tied_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Torn_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_01_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_CandC.HeadMaterials.M_VN_Head_01_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_01_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_01')
	VietnameseHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head2_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_02_Long_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_02_Tied_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_02_Torn_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_02_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_02_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_CandC.HeadMaterials.M_VN_Head_02_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_02_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_02')
	VietnameseHeads(2)=(HeadMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head3_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_03_Long_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_03_Tied_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_03_Torn_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_03_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_03_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_CandC.HeadMaterials.M_VN_Head_03_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_03_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_03')
	VietnameseHeads(3)=(HeadMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head4_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_04_Long_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_04_Tied_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_04_Torn_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_04_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_04_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_CandC.HeadMaterials.M_VN_Head_04_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_04_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_04')
	VietnameseHeads(4)=(HeadMesh=SkeletalMesh'CHR_VN_VN_Heads.Mesh.VN_Head5_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_05_Long_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_05_Tied_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_05_Torn_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_05_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_VN_Heads.Materials.M_VN_Head_05_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_CandC.HeadMaterials.M_VN_Head_05_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_05_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_05')
	VietnameseHeads(5)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_VN_Heads.Mesh.VN_Head6_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Tied_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_06_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_06_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_06')
	VietnameseHeads(6)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_VN_Heads.Mesh.VN_Head7_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Tied_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_07_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_07_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_07')
	VietnameseHeads(7)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_VN_Heads.Mesh.VN_Head8_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Tied_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Tied_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Torn_Pants_INST',MaterialInstanceConstant'CHR_VN_DLC_VN_Heads.Materials.M_VN_Head_08_Officer_INST',MaterialInstanceConstant'CHR_VN_DLC_SpecOps.HeadMaterials.M_VN_Head_08_Sapper_INST'),SkinToneID=2,HairColours=49,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_Viet_08')

	// Face Items
	VietFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None')
	VietFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Glasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_Glasses',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	VietFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Shades',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_Shades',requiredlevel=1,DLCPackID=DLC_HosHeroes)
	VietFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Eyebandage',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_EyeBandage',requiredlevel=1)
	VietFaceItems(4)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_CandC.Mesh_eyewear.ALL_Mouth_Cigar',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_Cigar',RequiredLevel=255,DLCPackID=DLC_PullingRank)
	VietFaceItems(5)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_PT_Cig',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	VietFaceItems(6)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh_eyewear.VN_mouth_pipe',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_WoodenSmokingPipe_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	VietFaceItems(7)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh_eyewear.VN_eyewear_facemask_straps_red',FaceItemSocket=helmet,bCoversFace=true,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_FaceMaskRedChequer_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec,StoreListPreviewPos=2)
	VietFaceItems(8)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh_eyewear.VN_eyewear_facemask_straps_blue',FaceItemSocket=helmet,bCoversFace=true,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_FaceMaskBlueChequer_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	VietFaceItems(9)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh_eyewear.VN_eyewear_facemask_straps',FaceItemSocket=helmet,bCoversFace=true,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_FaceMaskBlack_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)
	VietFaceItems(10)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Homeland.Mesh_eyewear.VN_eyewear_rocketgoggles',FaceItemSocket=helmet,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_RocketGoggles_HL',RequiredLevel=255,DLCPackID=DLC_HomelandSec)

	// Facial Hair
	VietFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None')
	VietFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_01',requiredlevel=1)
	VietFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_mouth_longstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_02',requiredlevel=1,DLCPackID=DLC_HosHeroes,StoreListPreviewPos=1)
	VietFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_Goatee',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	VietFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_goatlong',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_GoatLong',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	VietFacialHair(5)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_FullBeard',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)


	/****************************
	  * US Army
	  ***************************/
	// Tunics
	// Full Tunic
	USArmyTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Long',
					  )}

	// Tunic with sleeves and pant legs rolled up
	USArmyTunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Rolled',
					   requiredlevel=1
					  )}

	// Tunic with sleeves torn off and tattered trousers
	USArmyTunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Torn',
					   requiredlevel=1
					  )}

	// Tunic pants only
	USArmyTunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Long_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USArmy_Long',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs rolled up
	USArmyTunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Rolled_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USArmy_Rolled',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs ripped and tattered
	USArmyTunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Torn_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USArmy_Torn',
					   requiredlevel=1
					  )}

	// Full Tunic with Flak Jacket
	USArmyTunics(6)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Vest_Long',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic and Flak Jacket with tunic sleeves and pant legs rolled up
	USArmyTunics(7)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Vest_Rolled',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic and Flak Jacket with tunic sleeves torn off and tattered trousers
	USArmyTunics(8)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Vest_Torn',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic pants only with Flak Jacket
	USArmyTunics(9)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USArmy_Vest_Pants',
					   AltGearMeshID=2,
					   requiredlevel=1,
					   DLCPackID=DLC_BornInTheUSA
					  )}

	// Air Cavalry tunic with yellow ascot and wristwatch
	USArmyTunics(10)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_CandC.Mesh.US_Tunic_Officer_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_CandC.Mesh.VN_1stP_US_Officer_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CandC.Materials.M_US_Tunic_Officer_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_CavalryAscot',
					   RequiredLevel=255,
					   DLCPackID=DLC_PullingRank
					  )}

	// Military Police tunic with rolled sleeves
	USArmyTunics(11)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Tunic_MP_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Remf.Materials.M_US_Tunic_MP_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_MilitaryPolice',
					   RequiredLevel=255,
					   DLCPackID=DLC_RearEchelon
					  )}

	// Full Tunic in Tigerstripe
	USArmyTunics(12)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_US_Tigerstripe.Mesh.US_Tunic_Tigerstripe_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials.M_US_Tunic_Tigerstripe_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials_1stP.M_VN_1stP_US_Tigerstripe_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_TigerStripe',
					   requiredlevel=1
					  )}

	// Tunic pants only in Tigerstripe
	USArmyTunics(13)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_US_Tigerstripe.Mesh.US_Tunic_Tigerstripe_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials.M_US_Tunic_Tigerstripe_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_TigerStripePants',
					   requiredlevel=1
					  )}

	// Tunic and Unbuttoned Flak Jacket with tunic sleeves and pant legs rolled up
	USArmyTunics(14)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Tunic_Vest_Open_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs)),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_VestOpen',
					   AltGearMeshID=3,
					   RequiredLevel=255,
					   DLCPackID=DLC_GOM
					  )}

	// MACV SOG
	USArmyTunics(15)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.US_Tunic_MACVSOG_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VN_1stP_US_MACVSOG_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_US_Tunic_MACVSOG_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_SOG',
					   RequiredLevel=255,
					   DLCPackID=DLC_SpecialForces
					  )}

	USArmyTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST');
	USArmyTunicSVFlamer=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Flamethrower_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST');
	USArmyTunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Radioman_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST');

	// Shirts and bandages
	USArmyShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	USArmyShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	USArmyShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	USArmyShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive',requiredlevel=1)
	USArmyShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive_Bandages',requiredlevel=1)
	USArmyShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger',requiredlevel=1)
	USArmyShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger_Bandages',requiredlevel=1)
	USArmyShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive',requiredlevel=1)
	USArmyShirts(8)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive_Bandages',requiredlevel=1)
	USArmyShirts(9)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White',requiredlevel=1)
	USArmyShirts(10)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White_Bandages',requiredlevel=1)
	USArmyShirts(11)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_blackshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Black',RequiredLevel=255,DLCPackID=DLC_RearEchelon)

	// Tattoos, camo paint, misc other skin coverings
	USArmyTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	USArmyTattoos(1)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_Bornfree',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_BornFree',requiredlevel=1,DLCPackID=DLC_BornInTheUSA,StoreListPreviewPos=1)
	USArmyTattoos(2)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_pinup',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Pinup',requiredlevel=1)
	USArmyTattoos(3)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_gamble',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Gamble',requiredlevel=1)
	USArmyTattoos(4)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_reaper',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Reaper',requiredlevel=1)
	USArmyTattoos(5)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_camo_paint',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_CamoPaint',requiredlevel=1)
	USArmyTattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey',UOffset=-3.5439,VOffset=-4.8956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_CocoMonko',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	USArmyTattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USArmyTattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USArmyTattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Freedom',UOffset=-0.6978,VOffset=-8.155801,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Freedom_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USArmyTattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Panther',UOffset=-4.8801,VOffset=-6.3677,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Panther_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USArmyTattoos(11)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Snake',UOffset=-1.9016,VOffset=-2.9097,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Snake_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USArmyTattoos(12)=(TattooTex=Texture2D'CHR_VN_DLC_SpecOps.Tattoos.US_CamoV2',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	// Fieldgear by role first and tunic mesh type second (for tunic types, 0 = Pants and Top, 1 = Pants Only)
	USArmyFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))
	USArmyFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Pointman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Pointman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Pointman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Pointman'))
	USArmyFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Machinegunner',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Machinegunner',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Machinegunner'))
	USArmyFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Marksman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Marksman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Marksman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Marksman'))
	USArmyFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Grenadier',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Grenadier',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Grenadier',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Grenadier'))
	USArmyFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Radioman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Radioman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Radioman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Radioman'))
	USArmyFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))
	USArmyFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	USArmyFieldgearByRole(`ACCI_CombatPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	USArmyFieldgearByRole(`ACCI_TransportPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	USArmyFieldgearByRole(`ACCI_Lineup)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))

	// Flamethrower gear
	USArmyFlamerFieldgear=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Flamethrower',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Flamethrower',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Flamethrower',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Flamethrower'))


	/****************************
	  * US Marines
	  ***************************/
	// Tunics
	// Full Tunic
	USMCTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Long'
					  )}

	// Tunic with sleeves and pant legs rolled up
	USMCTunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Rolled',
					   requiredlevel=1
					  )}

	// Tunic with sleeves torn off and tattered trousers
	USMCTunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Torn',
					   requiredlevel=1
					  )}

	// Tunic pants only
	USMCTunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Long_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USMC_Long',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs rolled up
	USMCTunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Rolled_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USMC_Rolled',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs ripped and tattered
	USMCTunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Torn_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Pants_USMC_Torn',
					   requiredlevel=1
					  )}

	// Full Tunic with Flak Jacket
	USMCTunics(6)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Vest_Long',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic and Flak Jacket with tunic sleeves and pant legs rolled up
	USMCTunics(7)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Vest_Rolled',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic and Flak Jacket with tunic sleeves torn off and tattered trousers
	USMCTunics(8)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Torn_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Torn_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Vest_Torn',
					   AltGearMeshID=2,
					   requiredlevel=1
					  )}

	// Tunic pants only with Flak Jacket
	USMCTunics(9)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Vest_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Long_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_USMC_Vest_Pants',
					   AltGearMeshID=2,
					   requiredlevel=1,
					   DLCPackID=DLC_BornInTheUSA
					  )}

	// Military Police tunic with rolled sleeves
	USMCTunics(10)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Tunic_MP_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Remf.Materials.M_US_Tunic_MP_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_MilitaryPolice',
					   RequiredLevel=255,
					   DLCPackID=DLC_RearEchelon
					  )}

	// Full Tunic in Tigerstripe
	USMCTunics(11)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_US_Tigerstripe.Mesh.US_Tunic_Tigerstripe_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials.M_US_Tunic_Tigerstripe_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials_1stP.M_VN_1stP_US_Tigerstripe_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_TigerStripe',
					   requiredlevel=1
					  )}

	// Tunic pants only in Tigerstripe
	USMCTunics(12)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_US_Tigerstripe.Mesh.US_Tunic_Tigerstripe_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_US_Tigerstripe.Materials.M_US_Tunic_Tigerstripe_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_TigerStripePants',
					   requiredlevel=1
					  )}

	// Tunic and Unbuttoned Flak Jacket with tunic sleeves and pant legs rolled up
	USMCTunics(13)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Tunic_Vest_Open_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Rolled_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL',requiredlevel=1),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_Dev.Materials.M_US_Tunic_Rolled_Dev_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_Rolled_US_Dev_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_DEV_Tigerstripe',RequiredLevel=255,DLCPackID=DLC_Devs),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Rolled_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_VestOpenLowland',
					   AltGearMeshID=3,
					   RequiredLevel=255,
					   DLCPackID=DLC_GOM
					  )}

	// Force Recon
	USMCTunics(14)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.US_Tunic_MACVSOG_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.VN_1stP_US_MACVSOG_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_US_Tunic_MACVSOG_Lowland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_Camo_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_LowlandERDL'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_US_Tunic_MACVSOG_Highland_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Second.Materials.M_VN_1stP_US_Camo_Highland_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USMC_HighlandERDL'),
							    (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_US_Tunic_MACVSOG_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_US_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_USArmy_Olive')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_US_SOGLowland',
					   RequiredLevel=255,
					   DLCPackID=DLC_SpecialForces
					  )}

	USMCTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST');
	USMCTunicSVFlamer=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Flamethrower_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST');
	USMCTunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Low_Radioman_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_USMC_Tunic_Long_INST');

	// Shirts and bandages
	USMCShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	USMCShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	USMCShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	USMCShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive',requiredlevel=1)
	USMCShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive_Bandages',requiredlevel=1)
	USMCShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger',requiredlevel=1)
	USMCShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger_Bandages',requiredlevel=1)
	USMCShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive',requiredlevel=1)
	USMCShirts(8)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive_Bandages',requiredlevel=1)
	USMCShirts(9)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White',requiredlevel=1)
	USMCShirts(10)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White_Bandages',requiredlevel=1)
	USMCShirts(11)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_blackshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Black',RequiredLevel=255,DLCPackID=DLC_RearEchelon)

	// Tattoos, camo paint, misc other skin coverings
	USMCTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	USMCTattoos(1)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_Bornfree',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_BornFree',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USMCTattoos(2)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_pinup',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Pinup',requiredlevel=1)
	USMCTattoos(3)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_gamble',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Gamble',requiredlevel=1)
	USMCTattoos(4)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_reaper',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Reaper',requiredlevel=1)
	USMCTattoos(5)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.US_camo_paint',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_CamoPaint',requiredlevel=1)
	USMCTattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey',UOffset=-3.5439,VOffset=-4.8956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_CocoMonko',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	USMCTattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USMCTattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USMCTattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Freedom',UOffset=-0.6978,VOffset=-8.155801,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Freedom_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USMCTattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Panther',UOffset=-4.8801,VOffset=-6.3677,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Panther_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USMCTattoos(11)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Snake',UOffset=-1.9016,VOffset=-2.9097,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_US_Snake_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USMCTattoos(12)=(TattooTex=Texture2D'CHR_VN_DLC_SpecOps.Tattoos.US_CamoV2',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	// Fieldgear by role first and tunic mesh type second (for tunic types, 0 = Pants and Top, 1 = Pants Only)
	USMCFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))
	USMCFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Pointman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Pointman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Pointman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Pointman'))
	USMCFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Machinegunner',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Machinegunner',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Machinegunner'))
	USMCFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Marksman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Marksman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Marksman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Marksman'))
	USMCFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Grenadier',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Grenadier',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Grenadier',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Grenadier'))
	USMCFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Radioman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Radioman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Radioman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Radioman'))
	USMCFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))
	USMCFieldgearByRole(`ACCI_Lineup)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Rifleman'))
	USMCFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	USMCFieldgearByRole(`ACCI_CombatPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	USMCFieldgearByRole(`ACCI_TransportPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))


	// Flamethrower gear
	USMCFlamerFieldgear=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Long_Flamethrower',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pants_Flamethrower',SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Vest_Flamethrower',SkeletalMesh'CHR_VN_DLC_CGOM_US.GearMesh.US_Gear_OpenVest_Flamethrower'))


	/****************************
	  * US Pilots
	 ***************************/
	// Tunics
	USPilotTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Pilot_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Pilot_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_A_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Pilot_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_Pilot_Green'),
					   			(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_B_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Pilot_Navy_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_Pilot_Navy',requiredlevel=1),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_C_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Pilot_Tan_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_Pilot_Tan',requiredlevel=1)),
					   SkinToShow=STS_HeadOnly,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_Pilot'
					  )}

	USPilotTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Pilot_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_A_INST');

	// Headgear
	USPilotHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Base_Up'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_Base')
	USPilotHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Cav_Up'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_AirCav',requiredlevel=1)
	USPilotHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_DarkHorse_Up'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_DarkHorse',requiredlevel=1,DLCPackID=DLC_DigitalDeluxe)
	USPilotHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Mustang_Up'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_Mustang',requiredlevel=1)
	USPilotHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_USA_Up'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_USA',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USPilotHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Death_Up'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_Death',requiredlevel=1)
	USPilotHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Base'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_BaseVisor',requiredlevel=1)
	USPilotHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Cav'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_AirCavVisor',requiredlevel=1)
	USPilotHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_DarkHorse'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_DarkHorseVisor',requiredlevel=1)
	USPilotHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Mustang'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_MustangVisor',requiredlevel=1)
	USPilotHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_USA'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_USAVisor',requiredlevel=1,DLCPackID=DLC_BornInTheUSA,StoreListPreviewPos=2)
	USPilotHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.PilotMesh.US_Headgear_Pilot_Death'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_USPilot_DeathVisor',requiredlevel=1)

	// Shirts and bandages
	USPilotShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')

	// Tattoos, camo paint, misc other skin coverings
	USPilotTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')

	// Face items
	USPilotFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')

	/**
	 * Available heads for all US forces
	 */
	// Head and arms meshes
	USAHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head1_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_01_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_01_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_01_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_01_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_01_Pilot_INST'),SkinToneID=1,HairColours=1,HeadgearSubIndex=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_01')
	USAHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head2_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_02')
	USAHeads(2)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head3_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_03')
	USAHeads(3)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head4_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_04_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_04_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_04_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_04_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_04_Pilot_INST'),SkinToneID=1,HairColours=1,HeadgearSubIndex=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_04')
	USAHeads(4)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head5_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_05')
	USAHeads(5)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head6_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Long_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Rolled_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Torn_INST',MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_06')
	USAHeads(6)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head7_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Torn_US_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_03')
	USAHeads(7)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head9_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Torn_US_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_01')
	USAHeads(8)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head10_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Torn_US_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_04')
	USAHeads(9)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_US_Heads.Mesh.US_Head11_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Rolled_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_11_Pilot_INST'),SkinToneID=2,HairColours=3,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_US_11')
	USAHeads(10)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_US_Heads.Mesh.US_Head12_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_12_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_12_Rolled_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_12_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_12_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_12_Pilot_INST'),SkinToneID=2,HairColours=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_US_12')
	USAHeads(11)=(HeadMesh=SkeletalMesh'CHR_VN_DLC_US_Heads.Mesh.US_Head13_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_13_Long_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_13_Rolled_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_13_Torn_INST',MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_13_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_DLC_US_Heads.Materials.M_US_Head_13_Pilot_INST'),SkinToneID=2,HairColours=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_US_13')

	// Headgear
	USAHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_var1',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_var1_2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Standard')
	USAHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_var2',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_var2_2'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_ERDL',requiredlevel=1,DLCPackID=DLC_DigitalDeluxe)
	USAHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Ace',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Ace2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Ace',requiredlevel=1)
	USAHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Kill',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Kill2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Kill',requiredlevel=1)
	USAHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Smokes',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Smokes2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Smokes',requiredlevel=1)
	USAHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Peace',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Peace2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Peace',requiredlevel=1)
	USAHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Rookie',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Rookie2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Rookie',requiredlevel=1)
	USAHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Skull',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Skull2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Skull',requiredlevel=1)
	USAHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Boonie',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Boonie2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Boonie',requiredlevel=1)
	USAHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Cap',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Cap2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Cap',requiredlevel=1)
	USAHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Aircap',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Aircap2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_AirCap',requiredlevel=1)
	USAHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Buzz',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Buzz2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_BuzzHair',requiredlevel=1)
	USAHeadgear(12)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Short',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Short2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_ShortHair',requiredlevel=1)
	USAHeadgear(13)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Mullet',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Mullet'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Mullet',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USAHeadgear(14)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_smallband',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_smallband2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Bandana',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USAHeadgear(15)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_bigband',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_headgear_bigband2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_DoRag',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USAHeadgear(16)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Test',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Test2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_BornToTest',RequiredLevel=255,DLCPackID=DLC_BetaTesters)
	USAHeadgear(17)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.US_Headgear_DD_Boonie',SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.US_Headgear_DD_Boonie2'),HeadgearMICs=(8),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_TigerBoonie',RequiredLevel=255,DLCPackID=DLC_DigitalDeluxe,StoreListPreviewPos=2)
	USAHeadgear(18)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PCGamer.Mesh.US_Headgear_Makemods',SkeletalMesh'CHR_VN_DLC_PCGamer.Mesh.US_Headgear_Makemods2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_MakeMods',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	USAHeadgear(19)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_long',SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_long2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_PT_LongHair',RequiredLevel=255,DLCPackID=DLC_PersonalTouch))
	USAHeadgear(20)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_crewcut',SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_crewcut2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_PT_CrewCut',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAHeadgear(21)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_mohawk',SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_mohawk2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_PT_Mohawk',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAHeadgear(22)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_Driverhelm',SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_Driverhelm2'),HeadgearMICs=(12),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_DriverHelmet',RequiredLevel=255,DLCPackID=DLC_RearEchelon)
	USAHeadgear(23)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_MP',SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_MP2'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_MPGreen',RequiredLevel=255,DLCPackID=DLC_RearEchelon)
	USAHeadgear(24)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_MP',SkeletalMesh'CHR_VN_DLC_Remf.Mesh.US_Headgear_MP2'),HeadgearMICs=(14),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_MPBlack',RequiredLevel=255,DLCPackID=DLC_RearEchelon,StoreListPreviewPos=1)
	USAHeadgear(25)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_HelmetText.Mesh.US_Headgear_Text',SkeletalMesh'CHR_VN_DLC_HelmetText.Mesh.US_Headgear_Text2'),HeadgearMICs=(0,15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Standard',RequiredLevel=255,DLCPackID=DLC_Xmas)
	USAHeadgear(26)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_Modders.Mesh.US_headgear_sandbag',SkeletalMesh'CHR_VN_DLC_Modders.Mesh.US_headgear_sandbag2'),HeadgearMICs=(16),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_SandbagHat',RequiredLevel=255,DLCPackID=DLC_Modders)
	USAHeadgear(27)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Animal',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Animal2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Animal',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(28)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Backwards',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Backwards2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Backwards',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(29)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_BloodType',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_BloodType2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_BloodType',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(30)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_FuckIt',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_FuckIt2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_FuckIt',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(31)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Grenades',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Grenades2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Grenades',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(32)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Home',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Home2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Home',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(33)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Mags',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Mags2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Mags',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(34)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_MakeWar',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_MakeWar2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_MakeWar',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(35)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Pins',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Pins2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Pins',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(36)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Tourist',SkeletalMesh'CHR_VN_DLC_CGOM_US.Mesh.US_Headgear_Tourist2'),HeadgearMICs=(17,18),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Tourist',RequiredLevel=255,DLCPackID=DLC_GOM)
	USAHeadgear(37)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.US_Headgear_GreenBand',SkeletalMesh'CHR_VN_DLC_SpecOps.Mesh.US_Headgear_GreenBand2'),HeadgearMICs=(19),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_OpsGreenBandana',RequiredLevel=255,DLCPackID=DLC_SpecialForces)

	USArmyHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Cavhat',SkeletalMesh'CHR_VN_US_Headgear.Mesh.US_Headgear_Cavhat2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_Cavalry',requiredlevel=1)
	USArmyHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CandC.Mesh.US_Headgear_Beret',SkeletalMesh'CHR_VN_DLC_CandC.Mesh.US_Headgear_Beret2'),HeadgearMICs=(9),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_US_Beret',RequiredLevel=255,DLCPackID=DLC_PullingRank,StoreListPreviewPos=2)

	USMCHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CandC.Mesh.US_Headgear_Drill',SkeletalMesh'CHR_VN_DLC_CandC.Mesh.US_Headgear_Drill2'),HeadgearMICs=(10),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_USMC_CampaignHat',requiredlevel=1,DLCPackID=DLC_PullingRank)

	USAHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HeadgearMats.HeadgearMat_US_Leaf')
	USAHeadgearMICs(1)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Hair_INST')
	USAHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_INST')
	USAHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_Cav_INST')
	USAHeadgearMICs(4)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_DarkHorse_INST')
	USAHeadgearMICs(5)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_Mustangs_INST')
	USAHeadgearMICs(6)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_USA_INST')
	USAHeadgearMICs(7)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Pilot_Death_INST')
	USAHeadgearMICs(8)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DigitalDeluxe.Materials.M_US_Headgear_DD_Boonie')
	USAHeadgearMICs(9)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CandC.Materials.M_US_Headgear_Beret_INST')
	USAHeadgearMICs(10)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CandC.Materials.M_US_Headgear_Drill_INST')
	USAHeadgearMICs(11)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_PCGamer.Materials.M_US_Makemods_INST')
	USAHeadgearMICs(12)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Remf.Materials.M_US_headgear_Driverhelm_INST')
	USAHeadgearMICs(13)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Remf.Materials.M_US_headgear_MPHelmGreen_INST')
	USAHeadgearMICs(14)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Remf.Materials.M_US_headgear_MPHelmBlack_INST')
	USAHeadgearMICs(15)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_HeadgearCamo.Materials.M_US_Headgear_Clouds_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HeadgearMats.HeadgearMat_US_Cloud')
	USAHeadgearMICs(16)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_Modders.Materials.M_US_headgear_sandbag_INST')
	USAHeadgearMICs(17)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_US.Materials.M_US_Headgear_M1Leaf_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HeadgearMats.HeadgearMat_US_Leaf')
	USAHeadgearMICs(18)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_HeadgearCamo.Materials.M_US_Headgear_M1Clouds_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HeadgearMats.HeadgearMat_US_Cloud')
	USAHeadgearMICs(19)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_SpecOps.Materials.M_US_Headgear_GreenBand_INST')

	USAFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
	USAFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_GIglasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Glasses',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USAFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_aviator',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Aviators',requiredlevel=1)
	USAFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_CandC.Mesh_eyewear.ALL_Mouth_Cigar',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_US_Cigar',RequiredLevel=255,DLCPackID=DLC_PullingRank)
	USAFaceItems(4)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Cig',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(5)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_blue',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Blue',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(6)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_green',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Green',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(7)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_orange',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Orange',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(8)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_red',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Red',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(9)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_purple',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Purple',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFaceItems(10)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_rose',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_PT_Shades_Rose',RequiredLevel=255,DLCPackID=DLC_PersonalTouch,StoreListPreviewPos=2)
	USAFaceItems(11)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Remf.Mesh_eyewear.US_eyewear_drivergoggles',FaceItemSocket=helmet,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_US_DriverGoggles',RequiredLevel=255,DLCPackID=DLC_RearEchelon)
	USAFaceItems(12)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_Remf.Mesh_eyewear.US_eyewear_gasmask',FaceItemAltMesh=SkeletalMesh'CHR_VN_DLC_Remf.Mesh_eyewear.US_eyewear_gasmask_hidden',FaceItemSocket=helmet,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_US_M17GasMask',RequiredLevel=255,DLCPackID=DLC_RearEchelon,StoreListPreviewPos=2)

	USAFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
	USAFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_01',requiredlevel=1)
	USAFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_mediumstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_02',requiredlevel=1)
	USAFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_longstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_03',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	USAFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_Goatee',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	USAFacialHair(5)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_chops',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_MouthChops',RequiredLevel=255,DLCPackID=DLC_PersonalTouch,StoreListPreviewPos=1)
	USAFacialHair(6)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_PT_FullBeard',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	/****************************
	  * Australian Army
	  ***************************/
	// Tunics
	// Full Tunic
	AusArmyTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_AUS_1stP_Hands.Mesh.VN_1stP_AUS_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_AUS_1stP_Hands.Materials.M_VN_1stP_AUS_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Long',
					  )}

	// Tunic with sleeves and pant legs rolled up
	AusArmyTunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_AUS_1stP_Hands.Materials.M_VN_1stP_Rolled_AUS_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Rolled',
					   requiredlevel=1
					  )}

	// Tunic with sleeves torn off and tattered trousers
	AusArmyTunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Torn',
					   requiredlevel=1
					  )}

	// Tunic pants only
	AusArmyTunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Long_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Pants',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs rolled up
	AusArmyTunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Rolled_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_RolledPants',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs ripped and tattered
	AusArmyTunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Torn_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_JungleGreen')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_TornPants',
					   requiredlevel=1
					  )}

	AusArmyTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_AUS.Mesh_Low.AUS_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Long_INST');
	AusArmyTunicSVFlamer=(TunicMesh_SV=SkeletalMesh'CHR_VN_AUS.Mesh_Low.AUS_Tunic_Low_Flamethrower_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Long_INST');
	AusArmyTunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_AUS.Mesh_Low.AUS_Tunic_Low_Radioman_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Long_INST');

	// Shirts and bandages
	AusArmyShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	AusArmyShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	AusArmyShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	AusArmyShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive',requiredlevel=1)
	AusArmyShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive_Bandages',requiredlevel=1)
	AusArmyShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive',requiredlevel=1)
	AusArmyShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive_Bandages',requiredlevel=1)
	AusArmyShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White',requiredlevel=1)
	AusArmyShirts(8)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White_Bandages',requiredlevel=1)
	AusArmyShirts(9)=(ShirtD=Texture2D'CHR_VN_Dev.Textures.AUS_BlueVest_Dev_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Vest_Blue',RequiredLevel=255,DLCPackID=DLC_Devs)

	// Tattoos, camo paint, misc other skin coverings
	AusArmyTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	AusArmyTattoos(1)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Stars',UOffset=-3.764500,VOffset=-2.216000,DrawScale=6.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_SouthernCross',requiredlevel=1,DLCPackID=DLC_DownUnder)
	AusArmyTattoos(2)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Flag',UOffset=-3.6428,VOffset=-5.554501,DrawScale=9.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Flag',requiredlevel=1,DLCPackID=DLC_DownUnder,StoreListPreviewPos=2)
	AusArmyTattoos(3)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Pinup',UOffset=-0.574,VOffset=-4.6627,DrawScale=6.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Pinup',requiredlevel=1)
	AusArmyTattoos(4)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Tiger',UOffset=-3.6532,VOffset=-4.9956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Tiger',requiredlevel=1)
	AusArmyTattoos(5)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Kangaroo',UOffset=-0.574,VOffset=-4.6627,DrawScale=6.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Kangaroo',requiredlevel=1,DLCPackID=DLC_DownUnder)
	AusArmyTattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey',UOffset=-3.5439,VOffset=-4.8956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_CocoMonko',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	AusArmyTattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyTattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyTattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Panther',UOffset=-4.8801,VOffset=-6.3677,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Panther_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyTattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Snake',UOffset=-1.9016,VOffset=-2.9097,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Snake_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	// Headgear
	AusArmyHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Giggle',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Giggle2'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_GreenGiggle')
	AusArmyHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDown',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDown2'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_DroopyGreenGiggle',requiredlevel=1)
	AusArmyHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Giggle',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Giggle2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_BrownGiggle',requiredlevel=1)
	AusArmyHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDown',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDown2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_DroopyBrownGiggle',requiredlevel=1)
	AusArmyHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleB',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleB2'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_GreenGiggleBand',requiredlevel=1)
	AusArmyHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDownB',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDownB2'),HeadgearMICs=(0),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_DroopyGreenGiggleBand',requiredlevel=1)
	AusArmyHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleB',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleB2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_BrownGiggleBand',requiredlevel=1)
	AusArmyHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDownB',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_GiggleDownB2'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_DroopyBrownGiggleBand',requiredlevel=1)
	AusArmyHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_M1Bare',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_M1Bare2'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_UncoveredM1',requiredlevel=1)
	AusArmyHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_M1Cover',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_M1Cover2'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_USHelmetM1',requiredlevel=1)
	AusArmyHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Buzz',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Buzz2'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_BuzzHair',requiredlevel=1)
	AusArmyHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortBasic',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortBasic2'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_ShortHair',requiredlevel=1)
	AusArmyHeadgear(12)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortSwept',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortSwept2'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_SweptHair',requiredlevel=1)
	AusArmyHeadgear(13)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortBalding',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_ShortBalding2'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_Balding',requiredlevel=1)
	AusArmyHeadgear(14)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Band',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Band2'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_SweatRagBandana',requiredlevel=1,DLCPackID=DLC_DownUnder)
	AusArmyHeadgear(15)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_SlouchB',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_SlouchB2'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_SlouchHat',requiredlevel=1,DLCPackID=DLC_DownUnder,StoreListPreviewPos=1)
	AusArmyHeadgear(16)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Slouch',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Slouch2'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_ParadeSlouchHat',requiredlevel=1)
	AusArmyHeadgear(17)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Lemon',SkeletalMesh'CHR_VN_AUS_Headgear.Mesh.AUS_Headgear_Lemon2'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_KiwiLemonSqueezer',requiredlevel=1)
	AusArmyHeadgear(18)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_long',SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_long2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_PT_LongHair',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyHeadgear(19)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_crewcut',SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.US_headgear_hair_crewcut2'),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUS_PT_CrewCut',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)


	// Face items
	AusArmyFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
	AusArmyFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_GIglasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Glasses',requiredlevel=1)
	AusArmyFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_eyewear_aviator',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_US_Aviators',requiredlevel=1)
	AusArmyFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Cig',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(4)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_blue',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Blue',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(5)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_green',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Green',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(6)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_orange',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Orange',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(7)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_red',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Red',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(8)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_purple',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Purple',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFaceItems(9)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_eyewear_tinted_rose',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_AUS_PT_Shades_Rose',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	// Facial Hair
	AusArmyFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
	AusArmyFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_01',requiredlevel=1)
	AusArmyFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_mediumstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_02',requiredlevel=1)
	AusArmyFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_longstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_03',requiredlevel=1,DLCPackID=DLC_BornInTheUSA)
	AusArmyFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Moustache_AUS_PT_Goatee',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	AusArmyFacialHair(5)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_chops',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Moustache_AUS_PT_MouthChops',RequiredLevel=255,DLCPackID=DLC_PersonalTouch,StoreListPreviewPos=1)
	AusArmyFacialHair(6)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.US_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Moustache_AUS_PT_FullBeard',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	// Fieldgear by role first and tunic mesh type second (for tunic types, 0 = Pants and Top, 1 = Pants Only)
	AusArmyFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Rifleman_B',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Rifleman_B'))
	AusArmyFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Pointman',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Pointman'))
	AusArmyFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Machinegunner'))
	AusArmyFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Marksman',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Marksman'))
	AusArmyFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Grenadier',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Grenadier'))
	AusArmyFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Radioman',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Radioman'))
	AusArmyFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Commander',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Commander'))
	AusArmyFieldgearByRole(`ACCI_Lineup)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Commander',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Commander'))
	AusArmyFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	AusArmyFieldgearByRole(`ACCI_CombatPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	AusArmyFieldgearByRole(`ACCI_TransportPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))

	// Flamethrower gear
	AusArmyFlamerFieldgear=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Long_Flamethrower',SkeletalMesh'CHR_VN_AUS.GearMesh.AUS_Gear_Pants_Flamethrower'))


	/****************************
	  * Australian Pilots
	 ***************************/
	// Tunics
	AusPilotTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_AUS.Mesh.AUS_Tunic_Pilot_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Pilot_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Pilot_A_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_AUS_1stP_Hands.Materials.M_VN_1stP_AUS_Pilot_A_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_Pilot_Green'),
					   				(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Pilot_C_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_AUS_1stP_Hands.Materials.M_VN_1stP_AUS_Pilot_C_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_Pilot_GreenAndWhite',requiredlevel=1),
					   				(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Pilot_B_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_AUS_1stP_Hands.Materials.M_VN_1stP_AUS_Pilot_B_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_AUS_Pilot_PaleBlue',requiredlevel=1)),
					   SkinToShow=STS_HeadOnly,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_AUS_Pilot'
					  )}

	AusPilotTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_AUS.Mesh_Low.AUS_Tunic_Low_Pilot_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_AUS.Materials.M_AUS_Tunic_Pilot_A_INST');

	// Headgear
	AusPilotHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_Standard')
	AusPilotHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(8),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_RAAF',requiredlevel=1)
	AusPilotHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(9),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_Roo',requiredlevel=1)
	AusPilotHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(10),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_Kiwi',requiredlevel=1)
	AusPilotHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(11),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_White',requiredlevel=1)
	AusPilotHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base_Up'),HeadgearMICs=(12),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_AussieFlag',requiredlevel=1,DLCPackID=DLC_DownUnder)
	AusPilotHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_StandardVisor',requiredlevel=1)
	AusPilotHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(8),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_RAAFVisor',requiredlevel=1)
	AusPilotHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(9),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_RooVisor',requiredlevel=1)
	AusPilotHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(10),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_KiwiVisor',requiredlevel=1)
	AusPilotHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(11),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_WhiteVisor',requiredlevel=1)
	AusPilotHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_AUS_Headgear.PilotMesh.AUS_Headgear_Pilot_Base'),HeadgearMICs=(12),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_AUSPilot_AussieFlagVisor',requiredlevel=1,DLCPackID=DLC_DownUnder)

	// Currently pulling items from US arrays as they're identical. Change if we need different unlock levels or unique items
	// Face items
	/*AusPilotFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')
	AusPilotFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_smallstache',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_01',requiredlevel=1)
	AusPilotFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_mediumstache',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_02',requiredlevel=1)
	AusPilotFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_US_Headgear.Mesh_eyewear.US_mouth_longstache',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_US_03',requiredlevel=1)*/

	/**
	 * Available heads for Australian forces
	 */
	// Head and arms meshes
	AustralianHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head7_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_07_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_03')
	AustralianHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head8_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_08_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_08_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_08_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_08_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_08_Pilot_INST'),SkinToneID=1,HairColours=1,HeadgearSubIndex=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_02')
	AustralianHeads(2)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head9_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_09_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_01')
	AustralianHeads(3)=(HeadMesh=SkeletalMesh'CHR_VN_AUS_Heads.Mesh.AUS_Head10_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_10_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_AUS_04')
	AustralianHeads(4)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head2_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_02_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_02_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_02_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_02_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_02_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_02')
	AustralianHeads(5)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head3_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_03_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_03_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_03_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_03_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_03_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_03')
	AustralianHeads(6)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head5_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_05_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_05_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_05_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_05_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_05_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_05')
	AustralianHeads(7)=(HeadMesh=SkeletalMesh'CHR_VN_US_Heads.Mesh.US_Head6_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_06_Long_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_06_Rolled_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_06_Torn_INST',MaterialInstanceConstant'CHR_VN_AUS_Heads.Materials.M_AUS_Head_06_Pants_Torn_INST',,MaterialInstanceConstant'CHR_VN_US_Heads.Materials.M_US_Head_06_Pilot_INST'),SkinToneID=0,HairColours=15,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Heads.Head_US_06')

	AusHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Giggle_INST')
	AusHeadgearMICs(1)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_GiggleB_INST')
	AusHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_M1Bare_INST')
	AusHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_M1Cover_INST')
	AusHeadgearMICs(4)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Band_INST')
	AusHeadgearMICs(5)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Slouch_INST')
	AusHeadgearMICs(6)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_US_Headgear_Hair_INST')
	AusHeadgearMICs(7)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_INST')
	AusHeadgearMICs(8)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_RAAF_INST')
	AusHeadgearMICs(9)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_Roo_INST')
	AusHeadgearMICs(10)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_Nz_INST')
	AusHeadgearMICs(11)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_White_INST')
	AusHeadgearMICs(12)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Pilot_Aus_INST')
	AusHeadgearMICs(13)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Lemon_INST')


	/****************************
	  * Army of the Republic of Vietnam
	  ***************************/

	// Tunics
	// Full Tunic
	ARVNTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Long_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_ARVN_1stP_Hands.Mesh.VN_1stP_ARVN_Long_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_ARVN_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_Tiger_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_ARVN_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_ARVNerdl_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_ARVN_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Long_Airborne_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_VN_1stP_ARVN_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Long_BeoGam_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_VN_1stP_ARVN_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_HeadHands,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_Long',
					  )}

	// Tunic with sleeves and pant legs rolled up
	ARVNTunics(1)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Rolled_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Rolled_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_Rolled_ARVN_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_Tiger_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_Rolled_ARVN_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_ARVNerdl_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_ARVN_1stP_Hands.Materials.M_VN_1stP_Rolled_ARVN_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Rolled_Airborne_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_VN_1stP_Rolled_ARVN_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Rolled_BeoGam_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_VN_1stP_Rolled_ARVN_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_HeadForearms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_Rolled',
					   requiredlevel=1
					  )}

	// Tunic with sleeves torn off and tattered trousers
	ARVNTunics(2)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Torn_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_HeadAndArms,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_Torn',
					   requiredlevel=1
					  )}

	// Tunic pants only
	ARVNTunics(3)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Long_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Long_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Long_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_LongPants',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs rolled up
	ARVNTunics(4)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Rolled_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Rolled_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Rolled_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Rolled_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_RolledPants',
					   requiredlevel=1
					  )}

	// Tunic pants only, legs ripped and tattered
	ARVNTunics(5)={( TunicMesh=SkeletalMesh'CHR_VN_ARVN.Mesh.ARVN_Tunic_Torn_Pants_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL',requiredlevel=1),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne',RequiredLevel=255,DLCPackID=DLC_GOM),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_TornPants',
					   requiredlevel=1,
					   DLCPackID=DLC_SouthernStyle
					  )}

	// Sat Cong (pants, no tunic top, unbuttoned flak vest)
	ARVNTunics(6)={( TunicMesh=SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.Mesh.ARVN_Tunic_SatCong_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_ALL_Bare_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_OliveDrab'),
					   			 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_Tiger_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_TigerStripe'),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Torn_ARVNerdl_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_ERDL'),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_Airborne_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_Airborne'),
								 (BodyMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Tunic_Torn_BeoGam_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.TunicMats.TunicMat_ARVN_BeoGam')),
					   SkinToShow=STS_AboveWaist,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tunics.Tunic_ARVN_SatCong',
					   AltGearMeshID=2,
					   RequiredLevel=255,
					   DLCPackID=DLC_GOM
					  )}


	ARVNTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_ARVN.Mesh_Low.ARVN_Tunic_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_INST');
	ARVNTunicSVFlamer=(TunicMesh_SV=SkeletalMesh'CHR_VN_ARVN.Mesh_Low.ARVN_Tunic_Low_Flamethrower_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_INST');
	ARVNTunicSVRadioman=(TunicMesh_SV=SkeletalMesh'CHR_VN_ARVN.Mesh_Low.ARVN_Tunic_Low_Radioman_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN.Materials.M_ARVN_Tunic_Long_INST');

	// Shirts and bandages
	ARVNShirts(0)=(ShirtD=none,ShirtN=none,ShirtS=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None') // This should never be accessed, but it keeps the compiler happy
	ARVNShirts(1)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_Bandages',requiredlevel=1)
	ARVNShirts(2)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandagesB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_bandages_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.ShirtS.Shirt_None_BandagesDirty',requiredlevel=1)
	ARVNShirts(3)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive',requiredlevel=1)
	ARVNShirts(4)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_greenshirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Olive_Bandages',requiredlevel=1)
	ARVNShirts(5)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive',requiredlevel=1)
	ARVNShirts(6)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_GreenVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_Olive_Bandages',requiredlevel=1)
	ARVNShirts(7)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVest_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_Vest_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White',requiredlevel=1)
	ARVNShirts(8)=(ShirtD=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_WhiteVestB_D',ShirtN=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_N',ShirtS=Texture2D'CHR_VN_Common.Textures_Vest.Head_Generic_VestB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Vest_White_Bandages',requiredlevel=1)
	ARVNShirts(9)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirt_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirt_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger',requiredlevel=1,DLCPackID=DLC_SouthernStyle,StoreListPreviewPos=2)
	ARVNShirts(10)=(ShirtD=Texture2D'CHR_VN_Common.Textures.Head_Generic_tigershirtB_D',ShirtN=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_N',ShirtS=Texture2D'CHR_VN_Common.Textures.Head_Generic_shirtB_S',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Shirts.Shirt_Tiger_Bandages',requiredlevel=1)

	// Tattoos, camo paint, misc other skin coverings
	ARVNTattoos(0)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.no_tattoo',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Blank')
	ARVNTattoos(1)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Fish',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Fish',requiredlevel=1)
	ARVNTattoos(2)=(TattooTex=Texture2D'CHR_VN_Common.Tattoos.VN_Croc',ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_Viet_Croc',requiredlevel=1)
	ARVNTattoos(3)=(TattooTex=Texture2D'CHR_VN_AUS_Common.Tattoos.AUS_Tiger',UOffset=-3.6532,VOffset=-4.9956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Tiger',requiredlevel=1,DLCPackID=DLC_SouthernStyle)
	ARVNTattoos(4)=(TattooTex=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey',UOffset=-3.5439,VOffset=-4.8956,DrawScale=8.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_PCG_CocoMonko',RequiredLevel=255,DLCPackID=DLC_PCGamer)
	ARVNTattoos(5)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Eye',UOffset=-1.139,VOffset=-2.0539,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_EyeScar_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNTattoos(6)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.ALL_Cut_Mouth',UOffset=-1.9602,VOffset=-2.722,DrawScale=7.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_CutMouth_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNTattoos(7)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Lotus',UOffset=-0.6978,VOffset=-8.155801,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Lotus_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNTattoos(8)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.VN_Phoenix',UOffset=-0.3078,VOffset=-2.9691,DrawScale=3.96,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tattoos.Tattoo_VN_Phoenix_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNTattoos(9)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Panther',UOffset=-4.8801,VOffset=-6.3677,DrawScale=10.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Panther_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNTattoos(10)=(TattooTex=Texture2D'CHR_VN_DLC_PersonalTouch.Tattoos.US_Snake',UOffset=-1.9016,VOffset=-2.9097,DrawScale=5.0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_AUS_Snake_PT',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)


	// Headgear
	ARVNHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_UncoveredM1')
	ARVNHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearMICs=(1),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_CamoM1',requiredlevel=1,DLCPackID=DLC_SouthernStyle,StoreListPreviewPos=1)
	ARVNHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearMICs=(2),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_Ranger',requiredlevel=1)
	ARVNHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearMICs=(3),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_CamoRanger',requiredlevel=1)
	ARVNHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Cover'),HeadgearMICs=(4),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_USPattern',requiredlevel=1)
	ARVNHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Cover'),HeadgearMICs=(5),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_LowlandERDL',requiredlevel=1)
	ARVNHeadgear(6)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Cover'),HeadgearMICs=(6),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_TigerStripe',requiredlevel=1)
	ARVNHeadgear(7)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_Cap'),HeadgearMICs=(7),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_Cap',requiredlevel=1)
	ARVNHeadgear(8)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_Cap'),HeadgearMICs=(8),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_CamoCap',requiredlevel=1)
	ARVNHeadgear(9)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_Beret'),HeadgearMICs=(9),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_BlackBeret',requiredlevel=1)
	ARVNHeadgear(10)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_Beret'),HeadgearMICs=(10),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_CamoBeret',requiredlevel=1)
	ARVNHeadgear(11)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_Boonie'),HeadgearMICs=(11),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_Boonie',requiredlevel=1)
	ARVNHeadgear(12)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_PinnedBoonie'),HeadgearMICs=(11),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_PinnedBoonie',requiredlevel=1,DLCPackID=DLC_SouthernStyle)
	ARVNHeadgear(13)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_TiedSlouch'),HeadgearMICs=(12),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_TiedSlouch',requiredlevel=1)
	ARVNHeadgear(14)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Buzz'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_BuzzHair',requiredlevel=1)
	ARVNHeadgear(15)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_ShortSuper'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_SShortHair',requiredlevel=1)
	ARVNHeadgear(16)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Short'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_ShortHair',requiredlevel=1)
	ARVNHeadgear(17)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_VN_Headgear.Mesh.VN_Headgear_Hair_Medium'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_MediumHair',requiredlevel=1)
	ARVNHeadgear(18)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_long'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_LongHair',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNHeadgear(19)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_crewcut'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_CrewCut',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNHeadgear(20)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh.VN_headgear_hair_buzzswept'),HeadgearMICs=(13),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_Viet_PT_BuzzSwept',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNHeadgear(21)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.US_Headgear_DD_Boonie'),HeadgearMICs=(17),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Headgear.Headgear_US_TigerBoonie',RequiredLevel=255,DLCPackID=DLC_DigitalDeluxe)
	ARVNHeadgear(22)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DigitalDeluxe.Mesh.US_Headgear_DD_Boonie'),HeadgearMICs=(18),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_BoonieBeoGam',RequiredLevel=255,DLCPackID=DLC_GOM)
	ARVNHeadgear(23)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearMICs=(19),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_M1BareFlag',RequiredLevel=255,DLCPackID=DLC_GOM)
	ARVNHeadgear(24)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.Mesh.ARVN_Headgear_M1Bare'),HeadgearMICs=(20),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_M1BareRanger3',RequiredLevel=255,DLCPackID=DLC_GOM)
	ARVNHeadgear(25)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.Mesh.ARVN_Headgear_M1Bare_Bullets'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVN_M1BareBullets',RequiredLevel=255,DLCPackID=DLC_GOM)

	ARVNFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None')
	ARVNFaceItems(1)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Glasses',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_Glasses',requiredlevel=1)
	ARVNFaceItems(2)=(FaceItemMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_Eyewear_Shades',FaceItemSocket=eyewear,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_Shades',requiredlevel=1,DLCPackID=DLC_SouthernStyle)
	ARVNFaceItems(3)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_CandC.Mesh_eyewear.ALL_Mouth_Cigar',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Face.Face_Viet_Cigar',RequiredLevel=255,DLCPackID=DLC_PullingRank)
	ARVNFaceItems(4)=(FaceItemMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.ALL_Mouth_Cigarette',FaceItemSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_Viet_PT_Cig',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	ARVNFacialHair(0)=(FacialHairMesh=none,FacialHairSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None')
	ARVNFacialHair(1)=(FacialHairMesh=SkeletalMesh'CHR_VN_VN_Headgear.Mesh_eyewear.VN_mouth_smallstache',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_01',requiredlevel=1,DLCPackID=DLC_SouthernStyle)
	ARVNFacialHair(2)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_goat',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_Goatee',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNFacialHair(3)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_goatlong',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_GoatLong',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)
	ARVNFacialHair(4)=(FacialHairMesh=SkeletalMesh'CHR_VN_DLC_PersonalTouch.Mesh_eyewear.VN_mouth_full',FacialHairSocket=mouth,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Moustache_Viet_PT_FullBeard',RequiredLevel=255,DLCPackID=DLC_PersonalTouch)

	ARVNFieldgearByRole(`ACCI_Rifle)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Rifleman'))
	ARVNFieldgearByRole(`ACCI_Light)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Pointman',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Pointman',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Pointman'))
	ARVNFieldgearByRole(`ACCI_MG)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Machinegunner',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Machinegunner',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Machinegunner'))
	ARVNFieldgearByRole(`ACCI_Sniper)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Marksman',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Marksman',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Marksman'))
	ARVNFieldgearByRole(`ACCI_Lineup)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Rifleman',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Rifleman',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Rifleman'))
	ARVNFieldgearByRole(`ACCI_CE)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Grenadier',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Grenadier',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Grenadier'))
	ARVNFieldgearByRole(`ACCI_Radioman)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Radioman',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Radioman',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Radioman'))
	ARVNFieldgearByRole(`ACCI_Commander)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Commander',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Commander',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Commander'))
	ARVNFieldgearByRole(`ACCI_Tank)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Commander',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Commander',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Commander'))
	ARVNFieldgearByRole(`ACCI_CombatPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))
	ARVNFieldgearByRole(`ACCI_TransportPilot)=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_US_Army.GearMesh.US_Gear_Pilot'))

	// Flamethrower gear
	ARVNFlamerFieldgear=(FieldgearByTunicType=(SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Long_Flamethrower',SkeletalMesh'CHR_VN_ARVN.GearMesh.ARVN_Gear_Pants_Flamethrower',SkeletalMesh'CHR_VN_DLC_CGOM_ARVN.GearMesh.ARVN_Gear_OpenVest_Flamethrower'))

	/****************************
	  * ARVN Pilots
	 ***************************/

	// Tunics
	ARVNPilotTunics(0)={( TunicMesh=SkeletalMesh'CHR_VN_US_Army.Mesh.US_Tunic_Pilot_Mesh',
					   ArmsMeshFP=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Pilot_Mesh',
					   BodyMICs=((BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_A_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Pilot_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_Pilot_Green'),
								(BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_C_INST',SleeveMICFP=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Pilot_Tan_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.TunicMats.TunicMat_Pilot_Tan',requiredlevel=1)),
					   SkinToShow=STS_HeadOnly,
					   UberGoreMesh=SkeletalMesh'CHR_VN_Gore.Mesh.Gore_Main_Mesh',
				       LeftHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       RightHandGibClass="ROGameContent.ROGib_HumanArm_Gore_BareArm",
				       LeftLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   RightLegGibClass="ROGameContent.ROGib_HumanLeg_Gore_USBoot",
					   ThumbnailImage=Texture2D'VN_UI_Textures_Character.Tunics.Tunic_Pilot'
					  )}

	ARVNPilotTunicSV=(TunicMesh_SV=SkeletalMesh'CHR_VN_US_Army.Mesh_Low.US_Tunic_Pilot_Low_Mesh',BodyMICTemplate=MaterialInstanceConstant'CHR_VN_US_Army.Materials.M_US_Tunic_Pilot_A_INST');

	// Headgear
	ARVNPilotHeadgear(0)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base_Up'),HeadgearMICs=(14),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_Standard') // Standard
	ARVNPilotHeadgear(1)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base_Up'),HeadgearMICs=(15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_VNAF',requiredlevel=1) // VNAF
	ARVNPilotHeadgear(2)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base_Up'),HeadgearMICs=(16),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_Spirit',requiredlevel=1,DLCPackID=DLC_SouthernStyle) // Spirit
	ARVNPilotHeadgear(3)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base'),HeadgearMICs=(14),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_StandardVisor',requiredlevel=1) // Standard + Visor
	ARVNPilotHeadgear(4)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base'),HeadgearMICs=(15),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_VNAFVisor',requiredlevel=1) // VNAF + Visor
	ARVNPilotHeadgear(5)=(HeadgearMeshes=(SkeletalMesh'CHR_VN_ARVN_Headgear.PilotMesh.ARVN_Headgear_Pilot_Base'),HeadgearMICs=(16),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Headgear.Headgear_ARVNPilot_SpiritVisor',requiredlevel=1,DLCPackID=DLC_SouthernStyle) // Spirit + Visor

	ARVNPilotFaceItems(0)=(FaceItemMesh=none,FaceItemSocket=none,ThumbnailImage=Texture2D'VN_UI_Textures_Character.Face.Face_None_US')

	/**
	 * Available heads for ARVN forces
	 */
	// Head and arms meshes
	SthVietnameseHeads(0)=(HeadMesh=SkeletalMesh'CHR_VN_ARVN_Heads.Mesh.ARVN_Head6_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Long_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Rolled_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Torn_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Pants_INST',,MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_06_Pilot_INST'),SkinToneID=2,HairColours=17,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_ARVN_01')
	SthVietnameseHeads(1)=(HeadMesh=SkeletalMesh'CHR_VN_ARVN_Heads.Mesh.ARVN_Head7_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_07_Long_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_07_Rolled_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_07_Torn_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_07_Pants_INST',,MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_07_Pilot_INST'),SkinToneID=2,HairColours=17,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_ARVN_02')
	SthVietnameseHeads(2)=(HeadMesh=SkeletalMesh'CHR_VN_ARVN_Heads.Mesh.ARVN_Head8_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_08_Long_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_08_Rolled_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_08_Torn_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_08_Pants_INST',,MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_08_Pilot_INST'),SkinToneID=2,HairColours=17,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_ARVN_03')
	SthVietnameseHeads(3)=(HeadMesh=SkeletalMesh'CHR_VN_ARVN_Heads.Mesh.ARVN_Head9_Mesh',HeadMICTemplates=(MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_09_Long_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_09_Rolled_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_09_Torn_INST',MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_09_Pants_INST',,MaterialInstanceConstant'CHR_VN_ARVN_Heads.Materials.M_ARVN_Head_09_Pilot_INST'),SkinToneID=2,HairColours=17,ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Heads.Head_ARVN_04')

	ARVNHeadgearMICs(0)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_INST')
	ARVNHeadgearMICs(1)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_Camo_INST')
	ARVNHeadgearMICs(2)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_Ranger2_INST')
	ARVNHeadgearMICs(3)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_Ranger1_INST')
	ARVNHeadgearMICs(4)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Cover_INST')
	ARVNHeadgearMICs(5)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Cover_Camo_INST')
	ARVNHeadgearMICs(6)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Cover_Tiger_INST')
	ARVNHeadgearMICs(7)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Cap_INST')
	ARVNHeadgearMICs(8)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Cap_Camo_INST')
	ARVNHeadgearMICs(9)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Beret_INST')
	ARVNHeadgearMICs(10)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Beret_Camo_INST')
	ARVNHeadgearMICs(11)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Boonie_Camo')
	ARVNHeadgearMICs(12)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_AUS_Headgear.Materials.M_AUS_Headgear_Slouch_INST')
	ARVNHeadgearMICs(13)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_VN_Headgear.Materials.M_VN_NVA_Headgear_INST')
	ARVNHeadgearMICs(14)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Pilot_INST')
	ARVNHeadgearMICs(15)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Pilot_Second_INST')
	ARVNHeadgearMICs(16)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_Pilot_SpiritStyle_INST')
	ARVNHeadgearMICs(17)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DigitalDeluxe.Materials.M_US_Headgear_DD_Boonie')
	ARVNHeadgearMICs(18)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Headgear_Boonie_BeoGam')
	ARVNHeadgearMICs(19)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Headgear_M1Bare_Flag_INST')
	ARVNHeadgearMICs(20)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_DLC_CGOM_ARVN.Materials.M_ARVN_Headgear_M1Bare_Ranger3_INST')


	/****************************
	  * Universal Items
	 ***************************/

	// Hair colour MICs
	HairMICs(0)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_Bla_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_Black')
	HairMICs(1)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_Brown')
	HairMICs(2)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_Blon_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_Blonde')
	HairMICs(3)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_Gin_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_Ginger')
	HairMICs(4)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_Gre_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_Greying')
	HairMICs(5)=(HairMIC=MaterialInstanceConstant'CHR_VN_US_Headgear.Materials.M_Hair_A_Sil_NoTransp_INST',ThumbnailImage=Texture2D'VN_UI_Textures_Character.HairMats.HairMat_FullGrey')

	// Skin textures for matching FP arms with a player's chosen TP head
	FPSkinToneMICs(0)=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Bare_INST'
	FPSkinToneMICs(1)=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Bare_Tone2_INST'
	FPSkinToneMICs(2)=MaterialInstanceConstant'CHR_VN_1stP_Hands_Master.Materials.M_VN_1stP_Bare_Tone3_INST'

	// Gore textures for matching gore mesh skin tone with the skin tone of the original player
	GoreSkinToneMICs(0)=MaterialInstanceConstant'CHR_VN_Gore.Materials.M_Main_Gore_INST'
	GoreSkinToneMICs(1)=MaterialInstanceConstant'CHR_VN_Gore.Materials.M_Main_Gore_Tone2_INST'
	GoreSkinToneMICs(2)=MaterialInstanceConstant'CHR_VN_Gore.Materials.M_Main_Gore_INST'

	// Material parameters
	ShirtDiffuseParam=Undershirt_D
	ShirtNormalParam=Undershirt_N
	ShirtSpecParam=Undershirt_S
	TattooParam=Tattoo_D
	TattooUOffsetParam=Tattoo_Offset_U
	TattooVOffsetParam=Tattoo_Offset_V
	TattooDrawScaleParam=Tattoo_Scale
	HeadGrimeParam=Grime_Scaler
	HeadMudParam=Mud_Scaler
	HeadWetnessParam=fWetness
	TunicGrimeParam=Grime_Scaler
	TunicMudParam=Mud_Scaler
	TunicWetnessParam=fWetness

	RandomConfig=(TunicMesh=255,TunicMaterial=255,ShirtTexture=255,HeadMesh=255,HeadgearMesh=255,TattooTex=255)

	USArmyTattoos(13)=(TattooTex=Texture2D'29thExtras.Tattoos.US_CamoV3',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2')
	USArmyTattoos(14)=(TattooTex=Texture2D'29thExtras.Tattoos.US_CamoV4',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2')
	USArmyTattoos(15)=(TattooTex=Texture2D'29thExtras.Tattoos.Joker',ThumbnailImage=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey')

	USMCTattoos(13)=(TattooTex=Texture2D'29thExtras.Tattoos.US_CamoV3',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2')
	USMCTattoos(14)=(TattooTex=Texture2D'29thExtras.Tattoos.US_CamoV4',ThumbnailImage=Texture2D'VN_UI_Textures_Character_Two.Tattoos.Tattoo_US_Camo2')
	USMCTattoos(15)=(TattooTex=Texture2D'29thExtras.Tattoos.Joker',ThumbnailImage=Texture2D'CHR_VN_DLC_PCGamer.Tattoos.AUS_CoconutMonkey')

	//NVAHeadgear(23)=(HeadgearMeshes=(SkeletalMesh'29thExtras.Mesh.29thHelmet'),HeadgearMICs=(10),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'29thExtras.Textures.29th')
	//NLFHeadgear(21)=(HeadgearMeshes=(SkeletalMesh'29thExtras.Mesh.29thHelmet'),HeadgearMICs=(8),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'29thExtras.Textures.29th')
	USAHeadgear(38)=(HeadgearMeshes=(SkeletalMesh'29thExtras.Mesh.29thHelmet'),HeadgearMICs=(20),HeadgearSocket=helmet,bIsHelmet=0,ThumbnailImage=Texture2D'29thExtras.Textures.29th')
	AusArmyHeadgear(20)=(HeadgearMeshes=(SkeletalMesh'29thExtras.Mesh.29thHelmet'),HeadgearMICs=(14),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'29thExtras.Textures.29th')
	ARVNHeadgear(26)=(HeadgearMeshes=(SkeletalMesh'29thExtras.Mesh.29thHelmet'),HeadgearSocket=helmet,bIsHelmet=1,ThumbnailImage=Texture2D'29thExtras.Textures.29th')

	//NVAHeadgearMICs(10)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_INST')
	//NLFHeadgearMICs(8)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_INST')
	USAHeadgearMICs(20)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_INST')
	AusHeadgearMICs(14)=(HeadgearMICTemplate=MaterialInstanceConstant'CHR_VN_ARVN_Headgear.Materials.M_ARVN_Headgear_M1Bare_INST')
}