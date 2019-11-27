
forward speed_OnPlayerConnect(playerid);
public speed_OnPlayerConnect(playerid)
{
	PlayerVelocimetro[playerid] = false;

	speed_0[playerid] = CreatePlayerTextDraw(playerid, 129.000000, 351.000000, "0 km/h");
	PlayerTextDrawFont(playerid, speed_0[playerid], 3);
	PlayerTextDrawLetterSize(playerid, speed_0[playerid], 0.349999, 1.500000);
	PlayerTextDrawTextSize(playerid, speed_0[playerid], 390.000000, -156.000000);
	PlayerTextDrawSetOutline(playerid, speed_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid, speed_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, speed_0[playerid], 1);
	PlayerTextDrawColor(playerid, speed_0[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, speed_0[playerid], 255);
	PlayerTextDrawBoxColor(playerid, speed_0[playerid], 50);
	PlayerTextDrawUseBox(playerid, speed_0[playerid], 0);
	PlayerTextDrawSetProportional(playerid, speed_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, speed_0[playerid], 0);
	return 1;
}

forward speed_OnPlayerDisconnect(playerid);
public speed_OnPlayerDisconnect(playerid)
{
	if(PlayerVelocimetro[playerid])
	{
		KillTimer(PlayerVelocimetroTimer[playerid]);
	}
}

forward speed_OnPlayerStateChange(playerid, newstate, oldstate);
public speed_OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER) 
    {
    	ShowPlayerVelocimetro(playerid);
    } 
    else 
    {
    	HidePlayerVelocimetro(playerid);
    }
    return 1;
} 

forward UpdatePlayerVelocimetro(playerid);
public UpdatePlayerVelocimetro(playerid)
{
	new playervehicle;
 
    if((playervehicle = GetPlayerVehicleID(playerid)) != INVALID_VEHICLE_ID) 
    {
        new string_velo[30];
 
        format(string_velo, sizeof (string_velo), "%02d km/h", GetVehicleSpeed(playervehicle));
        PlayerTextDrawSetString(playerid, speed_0[playerid], string_velo);
    }
    return 1;
} 