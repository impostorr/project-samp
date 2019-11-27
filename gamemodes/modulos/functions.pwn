
stock IsLetter(letter[])
{
    for(new i, j = strlen(letter); i < j; i++)
    {
        if(!('A' <= letter[i] <= 'Z' || 'a' <= letter[i] <= 'z' || ' ' == letter[i]))
            return true; 
    }
    return false;
}

stock IsNumeric(number[])
{
	for (new c; c < strlen(number); c++)
    {
        if ('0' <= number[c] <= '9')
        	return true;
    }
	return false;
}

stock HaveUnder(input[])
{
	new len = strlen(input);
	for(new i = 0; i < len; i++)
	{
		if(input[i] == '_') 
			return true;
	}
	return false;
}

stock RemoveUnderScore(playerid)
{
    new name[MAX_PLAYER_NAME];
    GetPlayerName(playerid,name,sizeof(name));
    for(new i = 0; i < MAX_PLAYER_NAME; i++)
    {
        if(name[i] == '_') name[i] = ' ';
    }
    return name;
}

stock GetVehicleSpeed(vehicleid)
{
        new Float:xPos[3];
        GetVehicleVelocity(vehicleid, xPos[0], xPos[1], xPos[2]);
        return floatround(floatsqroot(xPos[0] * xPos[0] + xPos[1] * xPos[1] + xPos[2] * xPos[2]) * 180.00);
}

stock ShowPlayerVelocimetro(playerid)
{
	if(PlayerVelocimetro[playerid]) {
		return 0;
	}

	PlayerVelocimetro[playerid] = true;
	PlayerTextDrawShow(playerid, speed_0[playerid]);
    PlayerVelocimetroTimer[playerid] = SetTimerEx("UpdatePlayerVelocimetro", 50, true, "i", playerid);
	return 1;
}

stock HidePlayerVelocimetro(playerid)
{
	if(!PlayerVelocimetro[playerid]) {
		return 0;
	}

	PlayerVelocimetro[playerid] = false;
	PlayerTextDrawHide(playerid, speed_0[playerid]);
    KillTimer(PlayerVelocimetroTimer[playerid]);
	return 1;
}

