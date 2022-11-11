// 29th Extras Mutator
// Created by T/5 Scovel for the 29th Infantry Division Realism Unit
// ====================================================
// Test Branch Update (November 2022)
// ====================================================
// Code tech: T/5 Scovel
// ====================================================
class MutExtras extends ROMutator
	config(MutExtras_Server);

var RORoleInfoClasses       RORICSouth;
var RORoleInfoClasses       RORICNorth;
var array<ACDummyActor>     DummyActors;

var bool                    bisVanilla;
var array<Byte> 		    HitNum;
var array<String> 	        HitVicName;

var config array<String>    PlayerRankAndUnit;
var config Bool             bLoadGOM3, bLoadGOM4, bLoadWW, bAITRoles, bNewTankPhys;

simulated function PreBeginPlay()
{
    `log ("[MutExtras Debug] init");
    
    if (!IsWWThere() && !IsMutThere("GOM"))
    {
        bisVanilla = true;
        ROGameInfo(WorldInfo.Game).PlayerControllerClass        = class'ACPlayerController';
        ROGameInfo(WorldInfo.Game).PlayerReplicationInfoClass   = class'ACPlayerReplicationInfo';
        ROGameInfo(WorldInfo.Game).PawnHandlerClass             = class'ACPawnHandler';
        
        ROGameInfo(WorldInfo.Game).SouthRoleContentClasses = RORICSouth;
        ROGameInfo(WorldInfo.Game).NorthRoleContentClasses = RORICNorth;
    }

    super.PreBeginPlay();
}

function ModifyPlayer(Pawn Other)
{
    //Make sure the pawns on the server have the rank and unit for the 29th helmet
	ACPawn(Other).PlayerRank = ACPlayerReplicationInfo(Other.PlayerReplicationInfo).PlayerRank;
	ACPawn(Other).PlayerUnit = ACPlayerReplicationInfo(Other.PlayerReplicationInfo).PlayerUnit;

    super.ModifyPlayer(Other);
}

simulated function NotifyLogin(Controller NewPlayer)
{
    local ACPlayerController      ACPC;
    local ACDummyActor DummyActor;

    DummyActor = Spawn(class'ACDummyActor', NewPlayer);
    DummyActors.AddItem(DummyActor);
    //`log ("[MutExtras LogIn] Spawning "$DummyActor);

    //SetTimer(10, false, 'CheckLoaded');

    if (bisVanilla)
    {
        ACPC = ACPlayerController(NewPlayer);

        if (ACPC != None)
        {
            ACPC.ReplacePawnHandler();
            ACPC.ClientReplacePawnHandler();
            ACPC.ReplaceRoles(bAITRoles);
            ACPC.ClientReplaceRoles(bAITRoles);
            ACPC.ReplaceInventoryManager();
            ACPC.ClientReplaceInventoryManager();

            ACPC.SetupUnitAndRank();
        } 
    }
    else
    {
        DummyActor.ReplaceRoles(IsWWThere(), IsMutThere("GOM"));
        DummyActor.ClientReplaceRoles(IsWWThere(), IsMutThere("GOM"));
    }

    super.NotifyLogin(NewPlayer);
}

simulated function NotifyLogout(Controller Exiting)
{
    local ACDummyActor DummyActor;

    foreach DummyActors(DummyActor)
    {
        if (DummyActor.Owner == Exiting)
        {
            //`log ("[MutExtras LogOut] Destoying "$DummyActor);
            DummyActor.Destroy();
            break;
        }
    }

    super.NotifyLogout(Exiting);
}

auto state StartUp
{
    function timer()
    {
        ModifyVolumes();
    }

    function timer2()
    {
        SetVicTeam();
    }

    Begin:
    SetTimer(1, false, 'LoadObjects');
    //SetTimer(10, false, 'CheckLoaded');
    SetTimer(2, true, 'timer2');
    SetTimer(10, true);
}

function CheckLoaded()
{
    local ROMapInfo               ROMI;
    local int i;
    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    for (i=0; i<ROMI.SharedContentReferences.length; i++)
    {
        `log ("[MutExtras CheckLoaded] SharedContentReferences = "$ROMI.SharedContentReferences[i]);
    }
}

function LoadObjects()
{
    local ROMapInfo               ROMI;

    ROMI = ROMapInfo(WorldInfo.GetMapInfo());

    //`log ("[MutExtras LoadObjects]");
    ROMI.SharedContentReferences.AddItem(class<Settings>(DynamicLoadObject("MutExtrasTB.MutExtrasSettings", class'Class')));

    if (bLoadGOM3)
    {
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("GOM3.GOMVehicle_M113_ACAV_ActualContent", class'Class')));
    }
    if (bLoadGOM4)
    {
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("GOM4.GOMVehicle_M113_ACAV_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("GOM4.GOMVehicle_M113_APC_ARVN", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("GOM4.GOMVehicle_M151_MUTT_US", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("GOM4.GOMVehicle_T34_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_38Bodyguard_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_BarShotgun_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Bayonet_M4_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Bayonet_M5_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Bayonet_M7_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_BowieKnife_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Crossbow_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_DP27", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_DPM", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_F1_Grenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_FusilRobust_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_K50M_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Kar98Scoped_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Kar98k_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_L1A1_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_LPO50_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M12_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M14_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M16A1_Scoped_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M16A1_XM148_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M1897_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M18_Recoilless_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M1911A1_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M1A1_Stockless", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M7RifleGrenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M37_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M37_Riot", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M44_Carbine_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M60_200", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_M72_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_MAC10_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_MAC10_Silenced", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_MG34_Drum", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_MG42_Drum", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_P38_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_PPS_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_RGD33_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_RPD_SawnOff_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_RPG2_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_SKS_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_SVD_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Satchel_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_SodaGrenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_SodaMine_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Stel_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Sten_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Stevens_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Stoner63A_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_TUL_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_Type63_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_UZI_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VCGrenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VCKnife_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VZ23", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VZ25", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VZ58_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_VZ61_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_XM177E2_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_XM177E2_30", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_XM21_Content", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("GOM4.GOMWeapon_XM21_Suppressed", class'Class')));
    }
    if (bLoadWW)
    {
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T20_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T26_EarlyWar_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_T28_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_HT130_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_53K_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<ROVehicle>(DynamicLoadObject("WinterWar.WWVehicle_Vickers_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_AntiTankMine_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_AVS36_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Binoculars_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_DP28_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_F1Grenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Kasapanos_FactoryIssue_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Kasapanos_Improvised_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_KP31_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_L35_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_LahtiSaloranta_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Luger_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_M20_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_M32Grenade_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Maxim_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN27_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN38_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN91_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN9130_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN9130_Dyakonov_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_MN9130_Scoped_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Molotov_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_NagantRevolver_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_PPD34_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_QuadMaxims_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_RDG1_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_RGD33_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Satchel_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_Skis_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_SVT38_ActualContent", class'Class')));
        ROMI.SharedContentReferences.AddItem(class<Inventory>(DynamicLoadObject("WinterWar.WWWeapon_TT33_ActualContent", class'Class')));
    }
}

function PrivateMessage(PlayerController receiver, coerce string msg)
{
    receiver.TeamMessage(None, msg, '');
}

singular function Mutate(string MutateString, PlayerController PC) //no prefixes, also call super function!
{
    local array<string>         Args;
    local string                command;
    local string                PlayerName;

    Args = SplitString(MutateString, " ", true);
    command = Caps(Args[0]);

    PlayerName = PC.PlayerReplicationInfo.PlayerName;

	Switch (Command)
    {
        case "SWITCHTANKPHYS":
            if (!bNewTankPhys)
                bNewTankPhys=true;
            else
                bNewTankPhys=false;
            break;

        case "CHANGERANK":
            ACPlayerController(PC).SetPlayerRank(Args[1]);
            break;

        case "CHANGEUNIT":
            ACPlayerController(PC).SetPlayerUnit(Args[1]);
            break;

        case "RESETMESH":
            ACPawn(PC.Pawn).CreatePawnMesh();
            break;

        case "GIVEB":
            SpawnBarricadeTool(PC, Args[1], int(Args[2]));
            break;

        case "CLEARB":
            ClearBarricades();
            break;

        case "DELB":
            DelBarricade(PC);
            break;

        case "SALUTE":
            Salute(PC);
            break;

        case "GIVEWEAPON":
            GiveWeapon(PC, Args[1], false, 100);
            break;

        case "GIVEWEAPONALL":
            GiveWeapon(PC, Args[1], true);
            break;

        case "GIVEWEAPONNORTH":
            GiveWeapon(PC, Args[1], false, `AXIS_TEAM_INDEX);
            break;

        case "GIVEWEAPONSOUTH":
            GiveWeapon(PC, Args[1], false, `ALLIES_TEAM_INDEX);
            break;

        case "CLEARWEAPONS":
            ClearWeapons(PC, false, 100);
            break;
    
        case "CLEARWEAPONSALL":
            ClearWeapons(PC, true);
            break;
    
        case "CLEARWEAPONSNORTH":
            ClearWeapons(PC, false, `AXIS_TEAM_INDEX);
            break;
    
        case "CLEARWEAPONSSOUTH":
            ClearWeapons(PC, false, `ALLIES_TEAM_INDEX);
            WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" cleared south weapons");
            break;

        case "SPAWNVEHICLE":
            if (SpawnVehicle(PC, Args[1]))
            {
                WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" spawned a "$Args[1]$"");
                `log ("[MutExtras Debug] "$PlayerName$" spawned a "$Args[1]$"");
            }
            break;

        case "CLEARVEHICLES":
            ClearVehicles();
            break;

        case "ADDBOTS":
            AddBots(int(Args[1]), int(Args[2]), bool(Args[3]));
            `log ("[MutExtras Debug]Added Bots");
            break;

        case "REMOVEBOTS":
            RemoveBots();
            `log ("[MutExtras Debug]Removed Bots");
            break;

        case "SetSpeed":
            SetSpeed(PC, float(Args[1]), Args[2]);
            `log("[MutExtras Debug] SetSpeed");
            if (Args[2] ~= "all")
            {
                WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" set everyone's speed to "$Args[1]);
            }
            else
            {
                WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" set their speed to "$Args[1]);
            }
            break;

        case "ALLAMMO":
            AllAmmo(PC);
            `log("[MutExtras Debug] Infinite Ammo");
            WorldInfo.Game.Broadcast(self, "[MutExtras] "$PlayerName$" toggled AllAmmo");
            break;
    }
    super.Mutate(MutateString, PC);
}

function Salute(PlayerController PC)
{
	ROPawn(PC.Pawn).ArmsMesh.PlayAnim('29thArms1st', ,false, false);
    //ROPawn(PC.Pawn).MyWeapon.PlayArmAnimation();
}

simulated function SpawnBarricadeTool(PlayerController PC, string ObjectName, int Amount)
{
    local ROInventoryManager                InvManager;
    local array<ROWeapon>                   WeaponList;
    local ROWeapon                          Weapon;

    InvManager = ROInventoryManager(PC.Pawn.InvManager);
    //ACIPC = ACItemPlaceableContent(ACIP);
    InvManager.GetWeaponList(WeaponList);
    foreach WeaponList(Weapon)
    {
        if (ClassIsChildOf(Weapon.Class, class'ACItemPlaceable'))
        {
            InvManager.RemoveFromInventory(Weapon); 
        }
    }
    
    switch (ObjectName)
    {
        case "SANDBAGS":
            InvManager.CreateInventory(class'ACItemPlaceableSandbag', false, true);
            break;

        case "SKYRAIDER":
            InvManager.CreateInventory(class'ACItemPlaceableSkyraider', false, true);
            break;

        case "PHANTOM":
            InvManager.CreateInventory(class'ACItemPlaceablePhantom', false, true);
            break;

        case "BIRDDOG":
            InvManager.CreateInventory(class'ACItemPlaceableBirddog', false, true);
            break;

        case "CANBERRA":
            InvManager.CreateInventory(class'ACItemPlaceableCanberra', false, true);
            break;

        case "HOWITZER":
            InvManager.CreateInventory(class'ACItemPlaceableHowitzer', false, true);
            break;

        case "FRENCHBUNKER":
            InvManager.CreateInventory(class'ACItemPlaceableFrenchBunker', false, true);
            break;

        case "BUSH":
            InvManager.CreateInventory(class'ACItemPlaceableBush01', false, true);
            break;

        case "PREFAB":
            InvManager.CreateInventory(class'ACItemPlaceableSandbagPrefab', false, true);
            break;

        case "M2BROWNING":
            InvManager.CreateInventory(class'ACItemPlaceableTurretM2', false, true);
            break;
    }

    InvManager.GetWeaponList(WeaponList);
    foreach WeaponList(Weapon)
    {
        if (ClassIsChildOf(Weapon.Class, class'ACItemPlaceable'))
        {
            Weapon.MaxAmmoCount = Amount;
            Weapon.AmmoCount = Amount;
            InvManager.SetCurrentWeapon(Weapon);
        }
    }
}

function ClearBarricades()
{
    local ACDestructible                ACD;
    local ACTurret_M2_HMG_Destroyable   ACTM2;

    foreach WorldInfo.AllActors(class'ACDestructible', ACD)
    {
        ACD.Destroy();
    }
    foreach WorldInfo.AllActors(class'ACTurret_M2_HMG_Destroyable', ACTM2)
    {
        ACTM2.Destroy();
    }
}

function DelBarricade(PlayerController PC)
{
    local vector TraceStart, TraceEnd, HitLocation, HitNormal, ViewDirection;
    local float TempFloat, TraceLength;
    local actor HitActor;

    Instigator = PC.Pawn;

    TraceStart = Instigator.GetPawnViewLocation();
	ViewDirection = Vector(Instigator.GetViewRotation());
	TempFloat = sqrt((1 - ViewDirection.Z * ViewDirection.Z) / (ViewDirection.X * ViewDirection.X + ViewDirection.Y * ViewDirection.Y));
	ViewDirection.X *= TempFloat;
	ViewDirection.Y *= TempFloat;
    TraceLength = 10000;

    TraceEnd = TraceStart + ViewDirection * TraceLength;
    
    HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
    if (ClassIsChildOf(HitActor.Class, class'ACDestructible'))
    {
        HitActor.Destroy();
    }

    HitActor = Trace(HitLocation, HitNormal, TraceEnd, TraceStart);
    if (ClassIsChildOf(HitActor.Class, class'ACDestructible'))
    {
        HitActor.Destroy();
    }
}

function GiveWeapon(PlayerController PC, string WeaponName, optional bool bGiveAll, optional int TeamIndex)
{
	local ROInventoryManager        InvManager;
    local ROPawn                    ROP;
    local string                    ActualName;

    if (PC != none)
    {
        if (bGiveAll)
        { 
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                InvManager = ROInventoryManager(ROP.InvManager);

                ActualName = DoGiveWeapon(PC, InvManager, WeaponName);
                if (ActualName != "true")
                    break;
            }
            if (ActualName == "true")
                WorldInfo.Game.Broadcast(self, "[MutExtrasTB] "$PC.PlayerReplicationInfo.PlayerName$" gave a "$WeaponName$" to everyone");
        }   
        else if (TeamIndex == `AXIS_TEAM_INDEX)
        {
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                if (ROP.GetTeamNum() == `AXIS_TEAM_INDEX)
                {
                    InvManager = ROInventoryManager(ROP.InvManager);

                    ActualName = DoGiveWeapon(PC, InvManager, WeaponName);
                    if (ActualName != "true")
                        break;
                }
            }
            if (ActualName == "true")
                WorldInfo.Game.Broadcast(self, "[MutExtrasTB] "$PC.PlayerReplicationInfo.PlayerName$" gave a "$WeaponName$" to the north");
        }
        else if (TeamIndex == `ALLIES_TEAM_INDEX)
        {
            foreach worldinfo.allpawns(class'ROPawn', ROP)
            {
                if (ROP.GetTeamNum() == `ALLIES_TEAM_INDEX)
                {
                    InvManager = ROInventoryManager(ROP.InvManager);

                    ActualName = DoGiveWeapon(PC, InvManager, WeaponName);
                    if (ActualName != "true")
                        break;
                }
            }
            if (ActualName == "true")
                WorldInfo.Game.Broadcast(self, "[MutExtrasTB] "$PC.PlayerReplicationInfo.PlayerName$" gave a "$WeaponName$" to the south");
        }
        else if (TeamIndex == 100)
        {
            InvManager = ROInventoryManager(PC.Pawn.InvManager);

            ActualName = DoGiveWeapon(PC, InvManager, WeaponName);
            if (ActualName == "true")
                WorldInfo.Game.Broadcast(self, "[MutExtrasTB] "$PC.PlayerReplicationInfo.PlayerName$" spawned a "$WeaponName);
        }
    }
    else
    {
        // `log ("[MutExtras Debug] Error: GW PlayerController is none!");
    }

    if (ActualName == "false")
    {
        PrivateMessage(PC, "Not a valid weapon name.");
    }
    else if (InStr(ActualName, "WinterWar") != -1 && !bLoadWW)
    {
        PrivateMessage(PC, "bLoadWinterWar must be enabled in the WebAdmin mutators settings for you to spawn this weapon!");
    }
    else if (InStr(ActualName, "GOM4") != -1 && !bLoadGOM4)
    {
        PrivateMessage(PC, "bLoadGOM4 must be enabled in the WebAdmin mutators settings for you to spawn this weapon!");
    }
    else if (InStr(ActualName, "GOM3") != -1 && !bLoadGOM3)
    {
        PrivateMessage(PC, "bLoadGOM3 must be enabled in the WebAdmin mutators settings for you to spawn this weapon!");
    }
}

function ClearWeapons(PlayerController PC, bool ClearAll, optional int TeamIndex)
{
    local array<ROWeapon>       WeaponsToRemove;
    local ROWeapon              Weapon;
    local ROInventoryManager    ROIM;
    local ROPawn                ROP;

    if (ClearAll)
    { 
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            ROIM = ROInventoryManager(ROP.InvManager);
            ROIM.GetWeaponList(WeaponsToRemove);

            foreach WeaponsToRemove(Weapon)
            {
                ROIM.RemoveFromInventory(Weapon);
                // `log("Removed "$Weapon);
            }
        }
        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PC.PlayerReplicationInfo.PlayerName$" cleared all weapons");
    }   

    else if (TeamIndex == `AXIS_TEAM_INDEX)
    {
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            if (ROP.GetTeamNum() == `AXIS_TEAM_INDEX)
            {
                ROIM = ROInventoryManager(ROP.InvManager);
                ROIM.GetWeaponList(WeaponsToRemove);

                foreach WeaponsToRemove(Weapon)
                {
                    ROIM.RemoveFromInventory(Weapon);
                    // `log("Removed "$Weapon);
                }
            }
        }
        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PC.PlayerReplicationInfo.PlayerName$" cleared north weapons");
    }

    else if (TeamIndex == `ALLIES_TEAM_INDEX)
    {
        foreach worldinfo.allpawns(class'ROPawn', ROP)
        {
            if (ROP.GetTeamNum() == `ALLIES_TEAM_INDEX)
            {
                ROIM = ROInventoryManager(ROP.InvManager);
                ROIM.GetWeaponList(WeaponsToRemove);

                foreach WeaponsToRemove(Weapon)
                {
                    ROIM.RemoveFromInventory(Weapon);
                    // `log("Removed "$Weapon);
                }
            }
        }
        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PC.PlayerReplicationInfo.PlayerName$" cleared south weapons");
    }

    else if (TeamIndex == 100)
    {
        ROIM = ROInventoryManager(PC.Pawn.InvManager);
        ROIM.GetWeaponList(WeaponsToRemove);

        foreach WeaponsToRemove(Weapon)
        {
            ROIM.RemoveFromInventory(Weapon);
            // `log("Removed "$Weapon);
        }
        WorldInfo.Game.Broadcast(self, "[MutExtras] "$PC.PlayerReplicationInfo.PlayerName$" cleared their weapons");
    }

    `log("[MutExtras] Clearing Weapons");
}

function bool SpawnVehicle(PlayerController PC, string VehicleName)
{
	local vector                    CamLoc, StartShot, EndShot, X, Y, Z;
	local rotator                   CamRot;
    local String                    Vehicle;
	local ROVehicle                 ROV;
    local class<ROVehicle>          VehicleClass;
    local ROPawn                    ROP;
    local bool                      bLandVic;

    ROP = ROPawn(PC.Pawn);
	PC.GetPlayerViewPoint(CamLoc, CamRot);
	GetAxes(CamRot, X, Y, Z );
	StartShot   = CamLoc;
	EndShot     = StartShot + (400.0 * X) + (200 * Z);

	switch (VehicleName)
    {
        // Vanilla
        case "Cobra":
        Vehicle = "ROGameContent.ROHeli_AH1G_Content";
        break;

        case "Loach":
        Vehicle = "ROGameContent.ROHeli_OH6_Content";
        break;

        case "Huey":
        Vehicle = "ROGameContent.ROHeli_UH1H_Content";
        break;

        case "Bushranger":
        Vehicle = "ROGameContent.ROHeli_UH1H_Gunship_Content";
        break;

        // MutExtras
        case "ACCobra":
        Vehicle = "MutExtrasTB.ACHeli_AH1G_Content";
        break;

        case "ACLoach":
        Vehicle = "MutExtrasTB.ACHeli_OH6_Content";
        break;
        
        case "ACHuey":
        Vehicle = "MutExtrasTB.ACHeli_UH1H_Content";
        break;

        case "ACBushranger":
        Vehicle = "MutExtrasTB.ACHeli_UH1H_Gunship_Content";
        break;

        // Green Army Men
        case "BlueHuey":
        Vehicle = "GreenMenMod.GMHeli_Blue_UH1H";
        break;

        case "GreenHuey":
        Vehicle = "GreenMenMod.GMHeli_Green_UH1H";
        break;

        case "GreenBushranger":
        Vehicle = "GreenMenMod.GMHeli_Green_UH1H_Gunship_Content";
        break;

        //GOM
        case "M113ACAV":
        Vehicle = "GOM3.GOMVehicle_M113_ACAV_ActualContent";
        bLandVic = true;
        break;

        case "GOM4M113ACAV":
        Vehicle = "GOM4.GOMVehicle_M113_ACAV_ActualContent";
        bLandVic = true;
        break;

        case "M113ARVN":
		Vehicle = "GOM4.GOMVehicle_M113_APC_ARVN";
        bLandVic = true;
        break;

        case "MUTT":
		Vehicle = "GOM4.GOMVehicle_M151_MUTT_US";
        bLandVic = true;
        break;

        case "T34":
		Vehicle = "GOM4.GOMVehicle_T34_ActualContent";
        bLandVic = true;
        break;

        //Winter War
        case "T20":
		Vehicle = "WinterWar.WWVehicle_T20_ActualContent";
        bLandVic = true;
        break;

        case "T26":
		Vehicle = "WinterWar.WWVehicle_T26_EarlyWar_ActualContent";
        bLandVic = true;
        break;

        case "T28":
		Vehicle = "WinterWar.WWVehicle_T28_ActualContent";
        bLandVic = true;
        break;

        case "HT130":
		Vehicle = "WinterWar.WWVehicle_HT130_ActualContent";
        bLandVic = true;
        break;

        case "ATGun":
		Vehicle = "WinterWar.WWVehicle_53K_ActualContent";
        break;

        case "Vickers":
		Vehicle = "WinterWar.WWVehicle_Vickers_ActualContent";
        bLandVic = true;
        break;

        case "Skis":
        Vehicle = "WinterWar.WWVehicle_Vickers_ActualContent";
        bLandVic = true;
        break;

        default:
        return false;
    }

    if (InStr(Vehicle, "WinterWar") != -1 && !bLoadWW)
    {
        PrivateMessage(PC, "bLoadWW must be enabled in the WebAdmin mutators settings for you to spawn this vehicle!");
        return false;
    }
    else if (InStr(Vehicle, "GOM3") != -1 && !bLoadGOM3)
    {
        PrivateMessage(PC, "bLoadGOM3 must be enabled in the WebAdmin mutators settings for you to spawn this vehicle!");
        return false;
    }
    else if (InStr(Vehicle, "GOM4") != -1 && !bLoadGOM4)
    {
        PrivateMessage(PC, "bLoadGOM4 must be loaded in the WebAdmin mutators settings for you to spawn this vehicle!");
        return false;
    }

    VehicleClass = class<ROVehicle>(DynamicLoadObject(Vehicle, class'Class'));

    if (VehicleClass != none)
    {
        ROV = Spawn(VehicleClass, , , EndShot, camrot);
        ROV.Mesh.AddImpulse(vect(0,0,1), ROV.Location);
        ROV.bTeamLocked = false;

        // ROV.GroundSpeed=520
	    // ROV.MaxSpeed=940 //67 km/h

        if (bLandVic && bNewTankPhys)
        {
            ROV.Mesh.SetRBCollidesWithChannel(RBCC_Default, false);
            ROV.Mesh.SetRBCollidesWithChannel(RBCC_BlockingVolume, false);
        }

        if (VehicleName ~= "Skis")
        {
            ROV.TryToDrive(ROP);
        }
        return true;
    }
}

function ClearVehicles()
{
	local ROVehicle ROV;

	foreach WorldInfo.AllActors(class'ROVehicle', ROV)
	{
		if( !ROV.bDriving )
        {
            ROV.ShutDown();
			ROV.Destroy();  
        }
	}
}

function AddBots(int Num, optional int NewTeam = -1, optional bool bNoForceAdd)
{
    local ROGameInfo              ROGI;
	local ROAIController ROBot;
    local ROPlayerReplicationInfo ROPRI;
	local byte ChosenTeam;
	local byte SuggestedTeam;
	// do not add bots during server travel
    ROGI = ROGameInfo(WorldInfo.Game);

	if( ROGI.bLevelChange )
	{
		return;
	}

	while ( Num > 0 && ROGI.NumBots + ROGI.NumPlayers < ROGI.MaxPlayers )
	{
		// Create a new Controller for this Bot
	    ROBot = Spawn(ROGI.AIControllerClass);
        ROPRI = ROPlayerReplicationInfo(ROBot.PlayerReplicationInfo);

		// Assign the bot a Player ID
		ROBot.PlayerReplicationInfo.PlayerID = ROGI.CurrentID++;

		// Suggest a team to put the AI on
		if ( ROGI.bBalanceTeams || NewTeam == -1 )
		{
			if ( ROGI.GameReplicationInfo.Teams[`AXIS_TEAM_INDEX].Size - ROGI.GameReplicationInfo.Teams[`ALLIES_TEAM_INDEX].Size <= 0
				&& ROGI.BotCapableNorthernRolesAvailable() )
			{
				SuggestedTeam = `AXIS_TEAM_INDEX;
			}
			else if( ROGI.BotCapableSouthernRolesAvailable() )
			{
				SuggestedTeam = `ALLIES_TEAM_INDEX;
			}
			// If there are no roles available on either team, don't allow this to go any further
			else
			{
				ROBot.Destroy();
				return;
			}
		}
		else if (ROGI.BotCapableNorthernRolesAvailable() || ROGI.BotCapableSouthernRolesAvailable())
		{
			SuggestedTeam = NewTeam;
		}
		else
		{
			ROBot.Destroy();
			return;
		}

		// Put the new Bot on the Team that needs it
		ChosenTeam = ROGI.PickTeam(SuggestedTeam, ROBot);
		// Set the bot name based on team
		ROGI.ChangeName(ROBot, ROGI.GetDefaultBotName(ROBot, ChosenTeam, ROTeamInfo(ROGI.GameReplicationInfo.Teams[ChosenTeam]).NumBots + 1), false);

		ROGI.JoinTeam(ROBot, ChosenTeam);

		ROBot.SetTeam(ROBot.PlayerReplicationInfo.Team.TeamIndex);

		// Have the bot choose its role
		if( !ROBot.ChooseRole() )
		{
			ROBot.Destroy();
			continue;
		}
        if (ROPRI.ClassIndex == 11 || ROPRI.ClassIndex == 8)
        {
            if (ROBot.PlayerReplicationInfo.Team.TeamIndex == `AXIS_TEAM_INDEX)
            {
                ROPRI.SelectRoleByClass(ROBot, class'RORoleInfoNorthernRifleman');
            }
            else
            {
                ROPRI.SelectRoleByClass(ROBot, class'RORoleInfoSouthernRifleman');
            }   
        }

		ROBot.ChooseSquad();

		if ( ROTeamInfo(ROBot.PlayerReplicationInfo.Team) != none && ROTeamInfo(ROBot.PlayerReplicationInfo.Team).ReinforcementsRemaining > 0 )
		{
			// Spawn a Pawn for the new Bot Controller
			ROGI.RestartPlayer(ROBot);
		}

		if ( ROGI.bInRoundStartScreen )
		{
			ROBot.AISuspended();
		}

		// Note that we've added another Bot
		if( !bNoForceAdd )
		ROGI.DesiredPlayerCount++;
	    ROGI.NumBots++;
		Num--;
		ROGI.UpdateGameSettingsCounts();
	}
}

function RemoveBots()
{
    local ROAIController ROB;
    foreach allactors(class'ROAIController', ROB)
    {
        ROB.Pawn.ShutDown();
        ROB.Pawn.Destroy();
        ROB.ShutDown();
        ROB.Destroy();
    }
}

function SetSpeed(PlayerController PC, float F, string S)
{
    if (S ~= "all")
    {
        ForEach WorldInfo.AllControllers(class'PlayerController', PC)
        {
            if (0.5 <= F && F <= 20)
            {
                PC.Pawn.GroundSpeed =   PC.Pawn.Default.GroundSpeed * F;
	            PC.Pawn.WaterSpeed =    PC.Pawn.Default.WaterSpeed * F;
                PC.Pawn.AirSpeed =      PC.Pawn.Default.AirSpeed * F;
                PC.Pawn.LadderSpeed =   PC.Pawn.Default.LadderSpeed * F;
            }
            else
            {
                PC.Pawn.GroundSpeed =   PC.Pawn.Default.GroundSpeed;
	            PC.Pawn.WaterSpeed =    PC.Pawn.Default.WaterSpeed;
                PC.Pawn.AirSpeed =      PC.Pawn.Default.AirSpeed;
                PC.Pawn.LadderSpeed =   PC.Pawn.Default.LadderSpeed;
                // `log("Error");
            }
        }
    }
    if (0.1 <= F && F <= 20)
	{
        PC.Pawn.GroundSpeed = PC.Pawn.Default.GroundSpeed * F;
	    PC.Pawn.WaterSpeed = PC.Pawn.Default.WaterSpeed * F;
        PC.Pawn.AirSpeed = PC.Pawn.Default.AirSpeed * F;
        PC.Pawn.LadderSpeed = PC.Pawn.Default.LadderSpeed * F;
    }
    else
    {
        PC.Pawn.GroundSpeed = PC.Pawn.Default.GroundSpeed;
	    PC.Pawn.WaterSpeed = PC.Pawn.Default.WaterSpeed;
        PC.Pawn.AirSpeed = PC.Pawn.Default.AirSpeed;
        PC.Pawn.LadderSpeed = PC.Pawn.Default.LadderSpeed;
        // `log("Error");
    }
}

function AllAmmo(PlayerController PC)
{
	ROInventoryManager(PC.Pawn.InvManager).AllAmmo(true);
	ROInventoryManager(PC.Pawn.InvManager).bInfiniteAmmo = true;
	ROInventoryManager(PC.Pawn.InvManager).DisableClientAmmoTracking();
}

simulated function NameExists(ROVehicleBase VehBase)
{
	local int 				I, MaxHitsForVic;
	local bool 				bNameExists;
	local ROVehicle 		ROV;
    local array<string>     ROVName;

    ROV = ROVehicle(vehbase);
    ROVName = splitstring((string(vehbase.name)), "_", true);

	for (I = 0; I < ROVName.length ; I++)
	{
        if      (ROVName[I] ~= "T20"     ){MaxHitsForVic = 3; break;}
        else if (ROVName[I] ~= "T26"     ){MaxHitsForVic = 4; break;}
        else if (ROVName[I] ~= "T28"     ){MaxHitsForVic = 5; break;}  
		else if (ROVName[I] ~= "53K"     ){MaxHitsForVic = 1; break;}
        else if (ROVName[I] ~= "HT130"   ){MaxHitsForVic = 4; break;}
        else if (ROVName[I] ~= "Vickers" ){MaxHitsForVic = 4; break;}
        else    {MaxHitsForVic = 3;}
	}

	for (I = 0; I < HitVicName.Length; I++)
	{
        //`log ("[MutExtras Debug]Hitvicname = "$HitVicName[I]$" HitNum = "$HitNum[I]);
		if (HitVicName[I] ~= string(vehbase.name))
		{
		    bNameExists = true;
		    HitNum[I] += 1;
            /* PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!");
            PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-HitNum[I]$" hits left before your vehicle is blown up!"); */
            `log ("[MutExtras Debug] Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
    
            if (HitNum[I] >= MaxHitsForVic)
		    {
		        ROV.Health = 0;
		        ROV.BlowupVehicle();
                ROV.bDeadVehicle = true;
                `log ("[MutExtras Debug]Blew up the "$vehbase.name$" on hit # "$HitNum[I]);
                HitVicName.removeitem(HitVicName[I]);
                HitNum.removeitem(HitNum[I]);
		    }            
            else {`log ("[MutExtras Debug] DAMAGE TEST SUCCESFUL ON "$vehbase.name$" Vehicle health = "$vehbase.Health$" Hit #"$HitNum[I]);}
		
        break;
		}
	}

    if (bNameExists == false)
	{
	    HitVicName.additem(string(vehbase.name));
	    HitNum.additem(byte(1));
        /* PrivateMessage(PlayerController(ROV.Seats[0].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!");
        PrivateMessage(PlayerController(ROV.Seats[1].StoragePawn.Controller), "You have "$MaxHitsForVic-1$" hits left before your vehicle is blown up!"); */
        `log ("[MutExtras Debug] Hitvicname "$HitVicName[I]$" has "$MaxHitsForVic-HitNum[I]$" hits remaining");
	    `log (vehbase.name$" doesn't exist on the array, adding it");
	}
}

function ModifyVolumes()
{
    local ROVolumeAmmoResupply ROVAR;

    foreach AllActors(class'ROVolumeAmmoResupply', ROVAR)
    {
        ROVAR.Team = OWNER_Neutral;
    }
}

function SetVicTeam()
{
    local ROVehicle ROV;

    foreach DynamicActors(class'ROVehicle', ROV)
    {
        if (ROV.bDriving == true && ROV.Team != ROV.Driver.GetTeamNum() && !ROV.bDeadVehicle)
        {
            ROV.Team = ROV.Driver.GetTeamNum();
            // `log ("[MutExtras Debug] Set "$ROV$" to team "$ROV.Driver.GetTeamNum());
        }
    }
}

function bool IsMutThere(string Mutator)
{
	local Mutator mut;

    mut = ROGameInfo(WorldInfo.Game).BaseMutator;

    for (mut = ROGameInfo(WorldInfo.Game).BaseMutator; mut != none; mut = mut.NextMutator)
    {
        // `log("[MutExtras] IsMutThere test "$string(mut.name));
        if(InStr(string(mut.name), Mutator,,true) != -1) 
        {
            return true;
        }
    }
    return false;
}

function bool IsWWThere()
{
    local string WWName;
    WWName = class'Engine'.static.GetCurrentWorldInfo().GetMapName(true);
    if (InStr(WWName, "WW",,true) != -1)
    {
        // `log ("[MutExtras Debug] Found WinterWar!");
        return true;
    }
    return false;
}

`include(MutExtrasTB\Classes\WeaponNames.uci)

DefaultProperties
{
    RORICSouth=(LevelContentClasses=("MutExtrasTB.ACPawnSouth"))
    RORICNorth=(LevelContentClasses=("MutExtrasTB.ACPawnNorth"))
}