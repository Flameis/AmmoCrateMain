//=============================================================================
// ROHeli_OH6_Content
//=============================================================================
// Content for the OH-6 Cayuse "Loach" Light Observation Helicopter
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2014 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACHeli_OH6_Content extends ROHeli_OH6_Content
	placeable;

function bool DriverEnter(Pawn P)
{
	local ROPlayerReplicationInfo ROPRI;
	local ROTeamInfo ROTI;

	ROPRI = ROPlayerReplicationInfo(P.Controller.PlayerReplicationInfo);

	if( (bTransportHelicopter && !ROPRI.RoleInfo.bIsTransportPilot) || (!bTransportHelicopter && ROPRI.RoleInfo.bIsTransportPilot) )
		return false;

	if(Super(ROVehicle).DriverEnter(P) )
	{
		if( !bEngineOn )
			StartUpEngine();

		if( IsTimerActive('ShutDownEngine') )
			ClearTimer('ShutDownEngine');

		if( ROPRI != none )
		{
			ROPRI.TeamHelicopterArrayIndex = HelicopterArrayIndex;
			ROPRI.TeamHelicopterSeatIndex = 0;

			ROTI = ROTeamInfo( ROGameReplicationInfo(WorldInfo.GRI).Teams[Team] );

			if( ROTI != none )
			{
				ROTI.TeamHelicopterPilotNames[HelicopterArrayIndex] = ROPRI.PlayerName;
			}
		}

		return true;
	}

	return false;
}

function bool PassengerEnter(Pawn P, int SeatIndex)
{
	local bool TempBool;

	if( SeatIndex < 0 || SeatIndex > Seats.length )
		return false;

	// Cache this because we need to run our backseat driver check AFTER the super has run
	TempBool = Super(ROVehicle).PassengerEnter(P, SeatIndex);

	if( !bDriving && bBackSeatDriving )
	{
		if( !bEngineOn )
			StartUpEngine();

		//if( IsTimerActive('ShutDownEngine') )
		//	ClearTimer('ShutDownEngine');
	}

	return TempBool;
}

function bool TryToDriveSeat(Pawn P, optional byte SeatIdx = 255)
{
	local vector X,Y,Z;
	local bool bEnteredVehicle;

	// Does the vehicle need to be uprighted?
	if ( bIsInverted && bMustBeUpright && VSize(Velocity) <= 5.0f )
	{
		if ( bCanFlip )
		{
			bIsUprighting = true;
			UprightStartTime = WorldInfo.TimeSeconds;
			GetAxes(Rotation,X,Y,Z);
			bFlipRight = ((P.Location - Location) dot Y) > 0;
		}
		return false;
	}

	if ( !CanEnterVehicle(P) || (Vehicle(P) != None) )
	{
		return false;
	}

	// Check vehicle Locking....
	// Must be a non-disabled same team (or no team game) vehicle
	if (!bIsDisabled && (!bTeamLocked || !WorldInfo.Game.bTeamGame || WorldInfo.GRI.OnSameTeam(self,P)))
	{
		if( !AnySeatAvailable() )
		{
			return false;
		}

		if(SeatIdx == 0) 	// attempting to enter driver seat
		{
			// if the pilot is dead and the copilot seat is the one alive, try to enter that seat instead
			if( bCopilotActive && SeatAvailable(SeatIndexCopilot) )
				bEnteredVehicle = (!bBackSeatDriving) ? PassengerEnter(P, SeatIndexCopilot) : false;
			else if( SeatAvailable(0) )
				bEnteredVehicle = (Driver == none) ? DriverEnter(P) : false;
		}
		else if(SeatIdx == 255)		// don't care which seat we get
		{
			if( bCopilotActive && SeatAvailable(SeatIndexCopilot) )
				bEnteredVehicle = bBackSeatDriving ? PassengerEnter(P, GetFirstAvailableSeat()) : PassengerEnter(P, SeatIndexCopilot);
			else
				bEnteredVehicle = (SeatAvailable(0)) ? DriverEnter(P) : PassengerEnter(P, GetFirstAvailableSeat());
		}
		else 	// attempt to enter a specific seat
		{
			if( SeatAvailable(SeatIdx) )
				bEnteredVehicle = PassengerEnter(P, SeatIdx);
		}

		if( bEnteredVehicle )
		{
			SetTexturesToBeResident( true );
		}

		return bEnteredVehicle;
	}

	VehicleLocked( P );
	return false;
}

function bool ChangeSeat(Controller ControllerToMove, int RequestedSeat)
{
	local int OldSeatIndex;

	// Don't allow non-pilots into seats that are limited to pilots only

	// Don't allow pilots to change seats while airborne
	if( !bVehicleOnGround && !bWasChassisTouchingGroundLastTick )
	{
		OldSeatIndex = GetSeatIndexForController(ControllerToMove);

		if( OldSeatIndex == 0 || OldSeatIndex == SeatIndexCopilot )
		{
			ROPlayerController(ControllerToMove).ReceiveLocalizedMessage(class'ROLocalMessageVehicleTwo', ROMSGVEH_Airborne);
			return false;
		}
	}

	return Super(ROVehicle).ChangeSeat(ControllerToMove, RequestedSeat);
}

function UpdateEnemiesSpotted()
{
	local ROPlayerController ROPC;
	local bool bUsePilot;

	if( (bDriving || bBackSeatDriving) && ROMI != none )
	{
/*		ROPC = ROPlayerController(ROMI.SouthernTeamLeader.Owner);

		// Use the Team Leader to update the spotted enemies to avoid conflicting PRI arrays. If there's no TL, use the pilot instead
		// TODO: May need to handle multiple Loaches with no TL. Both pilots may cause conflicting spotted enemy arrays
		if( ROPC != none )
			ROPC.UpdateLoachRecon(Location);
		else
		{*/
			bUsePilot = false;

			if( bDriving )
				ROPC = ROPlayerController(GetControllerForSeatIndex(0));
			else if( bBackSeatDriving )
				ROPC = ROPlayerController(GetControllerForSeatIndex(BackSeatDriverIndex));
	//	}

		if( ACPlayerController(ROPC) != none )
		{
			ACPlayerController(ROPC).UpdateLoachRecon(Location, bUsePilot);
		}
		else
		{
			ROPC.UpdateLoachRecon(Location, true);
		}
	}
}

DefaultProperties
{
	bCopilotMustBePilot = false
}
