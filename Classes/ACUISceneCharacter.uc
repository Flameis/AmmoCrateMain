
class ACUISceneCharacter extends ROUISceneCharacter;

/*function InitPlayerConfig()
{
	local LocalPlayer Player;
	local ROMapInfo ROMI;
	local bool bMainMenu;
	
	Player = GetPlayerOwner();
	if ( Player != none && Player.Actor != none )
	{
		ROPC = ROPlayerController(Player.Actor);
		if(ROPC != none)
		{
			ROMI = ROMapInfo(ROPC.WorldInfo.GetMapInfo());
			
			bMainMenu = ROPC.WorldInfo.GRI.GameClass.static.GetGameType() == ROGT_Default;
			
			if( bMainMenu )
			{
				TeamIndexActual = ROPC.LastDisplayedTeam;
				ArmyIndexActual = ROPC.LastDisplayedArmy;
			}
			else
			{
				TeamIndexActual = ROPC.GetTeamNum();
				
				if( ROMI != none && TeamIndexActual == `ALLIES_TEAM_INDEX )
					ArmyIndexActual = `getSF;
				else if( ROMI != none && TeamIndexActual == `AXIS_TEAM_INDEX )
					ArmyIndexActual = `getNF;
				else
					ArmyIndexActual = 0;
			}
			
			ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);
		}
		
		if(ROPRI != none && ROPRI.RoleInfo != none)
		{
			ClassIndexActual = ROPRI.RoleInfo.ClassIndex;
			bPilotActual = ROPRI.RoleInfo.bIsPilot;
			bCombatPilotActual = bPilotActual && !ROPRI.RoleInfo.bIsTransportPilot;
		}
		else
		{
			if( bMainMenu )
			{
				bPilotActual = ROPC.bLastDisplayedPilot;
				ClassIndexActual = ROPC.LastDisplayedClass;
			}
			else
			{
				bPilotActual = false;
				ClassIndexActual = -1;
			}
		}
		
		ROPC.StatsWrite.UpdateHonorLevel();
		HonorLevel = byte(ROPC.StatsWrite.HonorLevel);
	}
}

function PopulateRoleList()
{
	local int i, ArrayLength;
	local string ClassName;
	
	ROCharCustStringsDataStore.Empty('ROCharCustRoleType');
	ClassListIndexArray.length = 0;
	
	for (i = 0; i <= `ACCI_TransportPilot; i++)
	{
		ClassName = class'ACPlayerController'.static.GetClassNameByIndex(TeamIndex, i);
		
		if (ClassName != "Error!")
		{
			ClassListIndexArray.AddItem(i);
			ROCharCustStringsDataStore.AddStr('ROCharCustRoleType', ClassName);
		}
		if (ClassName == "Error!")
		{
		`log("Error Populating role list");
		}
	}
	
	ArrayLength = ClassListIndexArray.length;
	
	RoleComboBox.ComboList.RefreshSubscriberValue();
	RoleComboBox.ComboList.SetRowCount(ArrayLength);
	RoleComboBox.SetSelection(ClassListIndexArray.Find(ClassIndexActual));
}

function PopulateCopyRoleList()
{
	local int i, ArrayLength, ArmyIndexRaw;
	local string ClassName;

	ROCharCustStringsDataStore.Empty('ROCharCustCopyRoleType');
	ROCharCustStringsDataStore.AddStr('ROCharCustCopyRoleType', AllRoleStrings[byte(bPilot)]);	// All Classes
	CopyRoleListIndexArray.length = 1;
	CopyRoleListIndexArray[0] = -1;

	ArmyIndexRaw = ArmyComboBox.ComboList.GetCurrentItem() - FirstSouthIndex * TeamIndex;

	// Pilot selected?
	if( bPilot )
	{
		// ARVN Combat pilots and Transport pilots are completely different, so never let them copy between each other
		if( ArmyIndexRaw != SFOR_ARVN && ClassIndex != `ACCI_CombatPilot )
		{
			ROCharCustStringsDataStore.AddStr('ROCharCustCopyRoleType', class'ACPlayerController'.static.GetClassNameByIndex(TeamIndex, `ACCI_CombatPilot));
			CopyRoleListIndexArray.AddItem(`ACCI_CombatPilot);
		}

		if( ArmyIndexRaw != SFOR_ARVN && ClassIndex != `ACCI_TransportPilot )
		{
			CopyRoleListIndexArray.AddItem(`ACCI_TransportPilot);
			ROCharCustStringsDataStore.AddStr('ROCharCustCopyRoleType', class'ACPlayerController'.static.GetClassNameByIndex(TeamIndex, `ACCI_TransportPilot));
		}
	}
	// Infantry classes
	else
	{
		for(i=0; i<`ACCI_Tank; i++)
		{
			ClassName = class'ACPlayerController'.static.GetClassNameByIndex(TeamIndex, i);
			if( ClassName != "Error!" && i != ClassIndex )
			{
				CopyRoleListIndexArray.AddItem(i);
				ROCharCustStringsDataStore.AddStr('ROCharCustCopyRoleType', ClassName);
			}
		}
	}

	ArrayLength = CopyRoleListIndexArray.length;

	CopyRoleComboBox.ComboList.RefreshSubscriberValue();
	CopyRoleComboBox.ComboList.SetRowCount(ArrayLength);

 	CopyRoleComboBox.SetSelection(0);
}

function RoleComboUpdated()
{
	local int ArmyIndexRaw;
	
	ClassIndex = ClassListIndexArray[Max(0,RoleComboBox.ComboList.GetCurrentItem())];
	
	ArmyIndexRaw = ArmyComboBox.ComboList.GetCurrentItem() - FirstSouthIndex * TeamIndex;
	
	bPilot = ClassIndex == `ACCI_Tank;
	bPilot = ClassIndex == `ACCI_CombatPilot;
	bPilot = ClassIndex == `ACCI_TransportPilot;
	
	ArmyIndex = ArmyIndexRaw;
	
	GetCurrentConfig();
	
	bUseBaseConfig = 0;
	UseBaselineCheckbox.SetValue(bool(bUseBaseConfig));
	
	bConfigChanged = false;
	ApplyButton.SetEnabled(false);
	CopyRoleButton.SetEnabled(true);
	
	if( bPostFirstRender && bInitialised )
	{
		PopulateCurrentPanel();
		UpdatePreviewMesh();
	}
	
	PopulateCopyRoleList();
}

function SetPawnHandler()
{
	PawnHandlerClass = class'ACPawnHandler';
	
	if (ROCCM != none)
	{
		TunicSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		TunicMatSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		ShirtSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		HeadSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		HairColourSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		HeadgearSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		HeadgearMatSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		FaceItemSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		FacialHairSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		TattooSelectionWidget.PawnHandlerClass = PawnHandlerClass;
		
		TunicSelectionWidget.TeamSplitValue = 1;
		TunicMatSelectionWidget.TeamSplitValue = 1;
		ShirtSelectionWidget.TeamSplitValue = 1;
		HeadSelectionWidget.TeamSplitValue = 1;
		HairColourSelectionWidget.TeamSplitValue = 1;
		HeadgearSelectionWidget.TeamSplitValue = 1;
		HeadgearMatSelectionWidget.TeamSplitValue = 1;
		FaceItemSelectionWidget.TeamSplitValue = 1;
		FacialHairSelectionWidget.TeamSplitValue = 1;
		TattooSelectionWidget.TeamSplitValue = 1;
	}
}

event bool CloseScene(optional UIScene SceneToClose=self, optional bool bCloseChildScenes=true, optional bool bForceCloseImmediately)
{
	local CharacterConfig LastPreviewConfig;
	local bool bMainMenu;
	
	if (ROPC != none)
	{
		bMainMenu = ROPC.WorldInfo.GRI.GameClass.static.GetGameType() == ROGT_Default;
		
		if( bMainMenu && ROPC.ROCCC != none )
		{
			ROPC.ROCCC.SetTargetLocation(ROPC.Location);
			ROPC.ROCCC.SetTargetRotation(ROPC.Rotation);
			ROPC.ROCCC.bDisableOnComplete = true;
		}
		
		ROPC.CloseCharacterMenu();
	}
	
	ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo).ClientSetCustomCharConfig();
	
	if (bMainMenu)
	{
		ROPC.LastDisplayedTeam = TeamIndex;
		ROPC.LastDisplayedArmy = ArmyIndex;
		ROPC.LastDisplayedClass = ClassIndex;
		ROPC.bLastDisplayedPilot = bPilot;
		ROPC.SaveConfig();
		
		LastPreviewConfig = PreviewConfig;
		
		GetCurrentConfig();
		
		if( CurrentCharConfig.TunicMesh == 255 )
			PreviewConfig.TunicMesh = LastPreviewConfig.TunicMesh;
		if( CurrentCharConfig.TunicMaterial == 255 )
			PreviewConfig.TunicMaterial = LastPreviewConfig.TunicMaterial;
		if( CurrentCharConfig.ShirtTexture == 255 )
			PreviewConfig.ShirtTexture = LastPreviewConfig.ShirtTexture;
		if( CurrentCharConfig.HeadMesh == 255 )
			PreviewConfig.HeadMesh = LastPreviewConfig.HeadMesh;
		if( CurrentCharConfig.HairMaterial == 255 )
			PreviewConfig.HairMaterial = LastPreviewConfig.HairMaterial;
		if( CurrentCharConfig.HeadgearMesh == 255 )
			PreviewConfig.HeadgearMesh = LastPreviewConfig.HeadgearMesh;
		if( CurrentCharConfig.FaceItemMesh == 255 )
			PreviewConfig.FaceItemMesh = LastPreviewConfig.FaceItemMesh;
		if( CurrentCharConfig.TattooTex == 255 )
			PreviewConfig.TattooTex = LastPreviewConfig.TattooTex;
		
		UpdatePreviewMesh(bMainMenu);
		ROCCM.PlayTransitionAnim();
		
		if( ROUISceneMainMenu(ROGameViewportClient(GetPlayerOwner().ViewportClient).MainMenuScene) != none && ROPC.bUseMenuMovieBG )
			ROUISceneMainMenu(ROGameViewportClient(GetPlayerOwner().ViewportClient).MainMenuScene).BackgroundMovie.Fade(0.0, 1.0, 0.5);
	}
	
	ROPC = none;
	ROCCM = none;
	ROPRI = none;
	
	return super(ROUIScene).CloseScene(SceneToClose, bCloseChildScenes, bForceCloseImmediately);
}

defaultproperties
{
	
}*/