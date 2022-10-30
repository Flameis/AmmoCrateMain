class ACHolster extends ROItem_BinocularsUS_Content;

simulated function PreBeginPlay()
{
	SkeletalMeshComponent(Mesh).SetHidden(true);
	ROPawn(Instigator).ArmsMesh.AnimSets[4] = AnimSet'MutExtrasTBPkg.Anims.Salute1st';
    //SetTimer( 10, true );

	super.PreBeginPlay();
}

/* simulated function timer()
{
	local ROPawn ROP;
	ROP = ROPawn(Instigator);

	if (!ROP.bIsWalking && !ROP.bIsCrouched && !ROP.bIsSprinting && !ROP.bIsProning && ROP.Weapon.IsInState('Active'))
	{
    	PlayIdleAnim();
	}
}

simulated function PlayIdleAnim()
{
	ROPawn(Instigator).PlayUpperBodyAnimation('AttentionIdleAnimV2');
	//ROPawn(Instigator).PlayFullBodyAnimation('AttentionIdleAnimV2');
} */

// Play First and Third Person Animations When Fired
simulated function BeginFire(Byte FireModeNum)
{
	ROPawn(Instigator).ArmsMesh.SetHidden(false);
	ROPawn(Instigator).PlayUpperBodyAnimation('SaluteAnimV2');

	Play1stAnim();
}

reliable client function Play1stAnim()
{
	PlayerController(Instigator.Controller).Say("*Salute*");
	PlayAnimation('29thArms1st', SkeletalMeshComponent(Mesh).GetAnimLength('29thArms1st'),,FireTweenTime );
}

simulated function WeaponEquipped()
{
	//ROPawn(Instigator).CurrentWeaponAttachment.PlayIdleAnimation(False);
	//PlayFullBodyAnimation('AttendtionIdleAnimV2');
	super.WeaponEquipped();
}

// Overridden so nothing happens
simulated function IronSights()
{
	PerformZoom(false);
}

// Delete Holster from inventory
simulated function DeleteHolster()	
{
	local Inventory Inv;
	Inv = Pawn(Owner).FindInventoryType(class'ACHolster');
	if(Inv != None)
	Inv.Destroy();
}

/* simulated state WeaponEquipping
{
	simulated function BeginState(Name PreviousStateName)
	{
		super.BeginState(PreviousStateName);
		
		//DeleteHolster();
	}
} */

defaultproperties
{
    Begin Object Name=FirstPersonMesh
		DepthPriorityGroup=SDPG_Foreground
		//SkeletalMesh=SkeletalMesh'CHR_VN_1stP_Hands_Master.Mesh.VN_1stP_US_Long_Mesh'
		//SkeletalMesh=SkeletalMesh'WP_VN_USA_Binoculars.Mesh.US_Binocs'
		SkeletalMesh=none
		AnimSets(0)=AnimSet'WP_VN_USA_Binoculars.Anim.WP_US_BinocsHands'
		AnimSets(1)=AnimSet'MutExtrasTBPkg.Anims.Salute1st'
		PhysicsAsset=None
		AnimTreeTemplate=AnimTree'MutExtrasTBPkg.Anims.SaluteTree1st'
		//AnimTreeTemplate=AnimSet'MutExtrasTBPkg.Anims.SaluteTree'
		Scale=1.0
		FOV=70
	End Object

	WeaponClassType=ROWCT_HandGun
	Category=ROIC_Secondary

	WeaponIdleAnims(0)=none

    MaxNumPrimaryMags=30
    InitialNumPrimaryMags=30
    //WeaponFireAnim(0)=29thArms1st
	//WeaponFireLastAnim=29thArms1st
    bCanThrow=false
    bUsesFreeAim=false
    SwayScale=0
    InventoryGroup=29
    //PlayerViewOffset=(X=0,Y=0,Z=10)
    AttachmentClass=Class'ACHolsterAttachment'
}