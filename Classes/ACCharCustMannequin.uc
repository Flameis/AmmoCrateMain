class ACCharCustMannequin extends ROCharCustMannequin
	notplaceable;

event PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	PawnHandlerClass = class'ACPawnHandler';
}