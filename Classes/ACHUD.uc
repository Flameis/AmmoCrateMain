
class ACHUD extends ROHUD;

function Message(PlayerReplicationInfo PRI, coerce string MessageString, name MessageType, optional float LifeTime)
{
	local string GridLocationText;
	local array<string> SplitMessage;

	// "#G:" will precede the grid location at the end of MessageString if the player is alive
	SplitMessage = SplitString(MessageString, "#G:", true);

	if (SplitMessage.Length > 0)
	{
		MessageString = SplitMessage[0];
	}

	if (SplitMessage.Length > 1)
	{
		// Grid location will always be at the end of the message
		GridLocationText = SplitMessage[1];
		GridLocationText = "[" $GridLocationText $"]";
	}
	
	if ( MessageType == 'Alert' )
	{
		MessagesAlertsWidget.AddMessage(MessageString);
	}
	if ( MessageType == 'RedAlert' )
	{
		MessagesRedAlertsWidget.AddMessage(MessageString);
	}
	if ( MessageType == 'Pickup' )
	{
		MessagesPickupsWidget.AddMessage(MessageString);
	}
	if ( MessageType == 'Reload' )
	{
		MessagesReloadWidget.AddMessage(MessageString);
	}
	if ( MessageType == 'Warning' )
	{
		MessagesChatWidget.AddMessage(MessageString);
	}
	else
	{
		// If the received message was a Say command
		if ( MessageType == 'Say' )
		{
			// Add the Players Alias before printing it to the screen
			MessageString = PRI.PlayerName $":" @ MessageString;
		}

		// If the received message was a TeamSay command
		else if ( MessageType == 'TeamSay' )
		{
  			// Add the Players Alias and Team before printing it to the screen
			MessageString = TeamTag $ GridLocationText @ PRI.PlayerName $":" @ MessageString;
		}

		// If the received message was a SquadSay command
		else if ( MessageType == 'SquadSay' )
		{
			// Add the Players Alias and Team before printing it to the screen
			MessageString = SquadTag $ GridLocationText @ PRI.PlayerName $":" @ MessageString;
		}

		// if the received message was a SquadSay command to a pilot
		else if ( MessageType == 'ASquadSay' )
		{
			// Add the Players Alias and Team before printing it to the screen
			MessageString = Repl(SquadIDTag, "x", ROPlayerReplicationInfo(PRI).SquadIndex + 1 ) $ GridLocationText @ PRI.PlayerName $":" @ MessageString;
		}

		// Check if the message is too long and create a new line
		SeperateLine(MessageString);


		// Add the Message to the Chat Widget and Color it
		ColoredChat.ColorChatMessage(PRI, MessageString, MessageType, LifeTime);
	}
}

defaultproperties
{
	DefaultOverheadMapWidget=				class'ACHUDWidgetOverheadMap'
}
