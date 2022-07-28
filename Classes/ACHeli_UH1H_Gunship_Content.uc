//=============================================================================
// ROHeli_UH1H_Gunship_Content
//=============================================================================
// Content for the Australian UH-1H Iroquois "Huey Bushranger" Gunship Helicopter
//=============================================================================
// Rising Storm 2: Vietnam Source
// Copyright (C) 2017 Tripwire Interactive LLC
// - Sturt "Psycho Ch!cken" Jeffery @ Antimatter Games
//=============================================================================
class ACHeli_UH1H_Gunship_Content extends ROHeli_UH1H_Gunship_Content
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

DefaultProperties
{
	bCopilotMustBePilot = false
}
