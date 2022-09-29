class MutExtrasSettings extends MutatorSettings;

/**
 * @brief Initializes the settings screen for this mutator
 */
function InitMutSettings()
{
	//Int
    // if (self.myMut == None){self.SetIntPropertyByName(name(Repl("RoundDuration", ".", "_")), int(class'MutExtras'.default.RoundDuration));}
	// else{self.SetIntPropertyByName(name(Repl("RoundDuration", ".", "_")), int(MutExtras(self.myMut).RoundDuration));};
	// if (self.myMut == None){self.SetIntPropertyByName(name(Repl("AlliesReinforcements", ".", "_")), class'MutExtras'.default.AlliesReinforcements);}
	// else{self.SetIntPropertyByName(name(Repl("AlliesReinforcements", ".", "_")), MutExtras(self.myMut).AlliesReinforcements);};

	//Bool
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("Load GOM3", ".", "_")), int(class'MutExtras'.default.bLoadGOM));}
	else{self.SetIntPropertyByName(name(Repl("Load GOM3", ".", "_")), int(MutExtras(self.myMut).bLoadGOM));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("Load Winter War", ".", "_")), int(class'MutExtras'.default.bLoadWW));}
	else{self.SetIntPropertyByName(name(Repl("Load Winter War", ".", "_")), int(MutExtras(self.myMut).bLoadWW));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bInfiniteRoles", ".", "_")), int(class'MutExtras'.default.bInfiniteRoles));}
	else{self.SetIntPropertyByName(name(Repl("bInfiniteRoles", ".", "_")), int(MutExtras(self.myMut).bInfiniteRoles));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), int(class'MutExtras'.default.bAITRoles));}
	else{self.SetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), int(MutExtras(self.myMut).bAITRoles));};
}

/**
 * @brief Saves the settings for this mutator
 */
function SaveMutSettings()
{
	//Int
    // if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("RoundDuration", ".", "_")), tempValue); class'MutExtras'.default.RoundDuration = self.tempValue;}
	// else {self.GetIntPropertyByName(name(Repl("RoundDuration", ".", "_")), tempValue); MutExtras(self.myMut).RoundDuration  = self.tempValue;}
	// if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("AlliesReinforcements", ".", "_")), tempValue); class'MutExtras'.default.AlliesReinforcements = self.tempValue;}
	// else {self.GetIntPropertyByName(name(Repl("AlliesReinforcements", ".", "_")), tempValue); MutExtras(self.myMut).AlliesReinforcements  = self.tempValue;}

	//Bool
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("Load GOM3", ".", "_")), tempValue); class'MutExtras'.default.bLoadGOM = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("Load GOM3", ".", "_")), tempValue); MutExtras(self.myMut).bLoadGOM  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("Load Winter War", ".", "_")), tempValue); class'MutExtras'.default.bLoadWW = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("Load Winter War", ".", "_")), tempValue); MutExtras(self.myMut).bLoadWW  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bInfiniteRoles", ".", "_")), tempValue); class'MutExtras'.default.bInfiniteRoles = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bInfiniteRoles", ".", "_")), tempValue); MutExtras(self.myMut).bInfiniteRoles  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), tempValue); class'MutExtras'.default.bAITRoles = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), tempValue); MutExtras(self.myMut).bAITRoles  = (self.tempValue != 0);}


	if (self.myMut != None)
		self.myMut.SaveConfig();
	else
		class'MutExtras'.static.StaticSaveConfig();
}


defaultproperties
{
    SettingsGroups(0)=(GroupID="Settings",pMin=600,pMax=700,lMin=0,lMax=0)

	Properties.Add((PropertyId=600,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=601,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=602,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=603,Data=(Type=SDT_Int32,Value1=0)))

	PropertyMappings.Add((Id=600,Name="Load GOM3"))
	PropertyMappings.Add((Id=601,Name="Load Winter War"))
	PropertyMappings.Add((Id=602,Name="bInfiniteRoles"))
	PropertyMappings.Add((Id=603,Name="bAITRoles"))
}