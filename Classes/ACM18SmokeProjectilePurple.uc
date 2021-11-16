//=============================================================================
// M18SmokeProjectilePurple
//=============================================================================
// M18 Purple Coloured Signal Smoke Grenade Projectile
// This smoke grenade marks artillery targets if used by the appropriate class
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACM18SmokeProjectilePurple extends M18SmokeProjectilePurple;

simulated function MarkArtyTarget()
{
	local ROPlayerReplicationInfo ROPRI;
	local ROPlayerController ROPC;
	local ROAIController ROAIC;

	if( InstigatorController == none )
	{
		return;
	}

	ROPC = ROPlayerController(InstigatorController);
	ROPRI = ROPlayerReplicationInfo(ROPC.PlayerReplicationInfo);

	if( ROPC != none && ROPRI != none)
	{
		// Commander marks arty directly
		if ( ROPRI.RoleInfo.bIsTeamLeader )
		{
			ROPC.AttemptServerSaveArtilleryRequestPosition(Location, 128 + `MAX_SQUADS);

			// CLBIT-5980
			ROPC.ClientSetArtyMarkStatusBits(0);
		}

		// SL sends a request
		if ( ROPRI.bIsSquadLeader || ROPC.bIsBotCommander )
		{
			ROPC.AttemptServerSaveArtilleryRequestPosition(Location, 128 + ROPRI.SquadIndex);

			// CLBIT-5980
			ROPC.ClientSetArtyMarkStatusBits(0);
		}
	}
	else if (Role == ROLE_Authority)
	{
		ROAIC = ROAIController(InstigatorController);
		ROPRI = ROPlayerReplicationInfo(ROAIC.PlayerReplicationInfo);
		if (ROAIC != none && ROPRI != none)
		{
			ROAIC.AISaveSaveArtilleryRequestPosition(Location, ROPRI.SquadIndex);
		}
	}
}

defaultproperties
{
	Begin Object name=SmokePSC
		Template=ParticleSystem'FX_VN_Smoke.FX_VN_SignalSmoke_Purple_new'
	End Object
}

