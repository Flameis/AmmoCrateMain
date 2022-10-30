class MutExtrasSettings extends MutatorSettings;

/**
 * @brief Initializes the settings screen for this mutator
 */
function InitMutSettings()
{
	//Int

	//Bool
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bLoadGOM3", ".", "_")), int(class'MutExtras'.default.bLoadGOM3));}
	else{self.SetIntPropertyByName(name(Repl("bLoadGOM3", ".", "_")), int(MutExtras(self.myMut).bLoadGOM3));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bLoadWinterWar", ".", "_")), int(class'MutExtras'.default.bLoadWW));}
	else{self.SetIntPropertyByName(name(Repl("bLoadWinterWar", ".", "_")), int(MutExtras(self.myMut).bLoadWW));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), int(class'MutExtras'.default.bAITRoles));}
	else{self.SetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), int(MutExtras(self.myMut).bAITRoles));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bNewTankPhysics", ".", "_")), int(class'MutExtras'.default.bNewTankPhys));}
	else{self.SetIntPropertyByName(name(Repl("bNewTankPhysics", ".", "_")), int(MutExtras(self.myMut).bNewTankPhys));};
	if (self.myMut == None){self.SetIntPropertyByName(name(Repl("bLoadGOM4", ".", "_")), int(class'MutExtras'.default.bLoadGOM4));}
	else{self.SetIntPropertyByName(name(Repl("bLoadGOM4", ".", "_")), int(MutExtras(self.myMut).bLoadGOM4));};
}

/**
 * @brief Saves the settings for this mutator
 */
function SaveMutSettings()
{
	//Int

	//Bool
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bLoadGOM3", ".", "_")), tempValue); class'MutExtras'.default.bLoadGOM3 = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bLoadGOM3", ".", "_")), tempValue); MutExtras(self.myMut).bLoadGOM3  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bLoadWinterWar", ".", "_")), tempValue); class'MutExtras'.default.bLoadWW = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bLoadWinterWar", ".", "_")), tempValue); MutExtras(self.myMut).bLoadWW  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), tempValue); class'MutExtras'.default.bAITRoles = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bAITRoles", ".", "_")), tempValue); MutExtras(self.myMut).bAITRoles  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bNewTankPhysics", ".", "_")), tempValue); class'MutExtras'.default.bNewTankPhys = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bNewTankPhysics", ".", "_")), tempValue); MutExtras(self.myMut).bNewTankPhys  = (self.tempValue != 0);}
	if (self.myMut == None) {self.GetIntPropertyByName(name(Repl("bLoadGOM4", ".", "_")), tempValue); class'MutExtras'.default.bLoadGOM4 = (self.tempValue != 0);}
	else {self.GetIntPropertyByName(name(Repl("bLoadGOM4", ".", "_")), tempValue); MutExtras(self.myMut).bLoadGOM4  = (self.tempValue != 0);}


	if (self.myMut != None)
		self.myMut.SaveConfig();
	else
		class'MutExtras'.static.StaticSaveConfig();
}


defaultproperties
{
    SettingsGroups(0)=(GroupID="Settings",pMin=1000,pMax=1100,lMin=0,lMax=0)

	Properties.Add((PropertyId=1000,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=1001,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=1002,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=1003,Data=(Type=SDT_Int32,Value1=0)))
	Properties.Add((PropertyId=1004,Data=(Type=SDT_Int32,Value1=0)))

	PropertyMappings.Add((Id=1000,Name="bLoadGOM3"))
	PropertyMappings.Add((Id=1001,Name="bLoadWinterWar"))
	PropertyMappings.Add((Id=1002,Name="bAITRoles"))
	PropertyMappings.Add((Id=1003,Name="bNewTankPhysics"))
	PropertyMappings.Add((Id=1004,Name="bLoadGOM4"))
}