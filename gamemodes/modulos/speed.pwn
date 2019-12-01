
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


	fuel_0[playerid] = CreatePlayerTextDraw(playerid, 126.000000, 367.000000, "mdl-2002:fuelg");
	PlayerTextDrawFont(playerid,fuel_0[playerid], 4);
	PlayerTextDrawLetterSize(playerid,fuel_0[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid,fuel_0[playerid], 22.000000, 21.000000);
	PlayerTextDrawSetOutline(playerid,fuel_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid,fuel_0[playerid], 0);
	PlayerTextDrawAlignment(playerid,fuel_0[playerid], 1);
	PlayerTextDrawColor(playerid,fuel_0[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid,fuel_0[playerid], 255);
	PlayerTextDrawBoxColor(playerid,fuel_0[playerid], 50);
	PlayerTextDrawUseBox(playerid,fuel_0[playerid], 1);
	PlayerTextDrawSetProportional(playerid,fuel_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid,fuel_0[playerid], 0);
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

forward gasolinaTimer(carID);
public gasolinaTimer(carID)
{
	new fuelMax = GetVehicleFuel(carID);
	SetVehicleFuel(carID, fuelMax-1);

	if(fuelMax == 0)
	{
		KillTimer(fuelTimer[carID]);

		SwitchVehicleEngine(carID, false);
		motor[carID] = false;
	}
	
	return 1;
}

forward speed_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
public speed_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	fuelCheck[playerid] = SetTimerEx("gasolinaCheck", 3000, true, "i", playerid);
	return 1;
}

forward speed_OnPlayerExitVehicle(playerid, vehicleid);
public speed_OnPlayerExitVehicle(playerid, vehicleid)
{
	KillTimer(fuelCheck[playerid]);
}

forward gasolinaCheck(playerid);
public gasolinaCheck(playerid)
{
	new carID = GetPlayerVehicleID(playerid);
	new fuelMax = GetVehicleFuel(carID);

	if(fuelMax > 50) //VERDE - COMBUSTIVEL ALTO
	{
		PlayerTextDrawSetString(playerid, fuel_0[playerid], "mdl-2002:fuelg");
	}

	if(fuelMax <= 51) //AMARELO - COMBUSTIVEL MEDIO
	{
		PlayerTextDrawSetString(playerid, fuel_0[playerid], "mdl-2002:fuely");
	}

	if(fuelMax <= 11) //VERMELHO - COMBUSTIVEL BAIXO
	{
		PlayerTextDrawSetString(playerid, fuel_0[playerid], "mdl-2002:fuelr");
	}

	if(fuelMax == 0)
	{
		KillTimer(fuelCheck[playerid]);

		SwitchVehicleEngine(carID, false);
		motor[carID] = false;

		SendClientMessage(playerid, -1, "SERVER: Sua gasolina acabou, entre em contato com um mecanico.");
	} 
	return 1;
}

CMD:motor(playerid)
{
	new carID;
	new str[100];

	carID = GetPlayerVehicleID(playerid);

	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, -1, "ERRO: Você não está em nenhum veiculo.");
	if(GetPlayerVehicleSeat(playerid) != 0) return SendClientMessage(playerid, -1, "ERRO: Você não é o motorista do veiculo");

	if(GetVehicleFuel(carID) <= 1)
	{
		format(str, sizeof(str), "%s tentou ligar seu veiculo porem sem sucesso.", RemoveUnderScore(playerid));
		ProxDetector(30, playerid, str, COLOR_PURPLE);
		SwitchVehicleEngine(carID, false);
	}
	else
	{

		if(motor[carID] == false)
		{
			SwitchVehicleEngine(carID, true);
			motor[carID] = true;
			fuelTimer[carID] = SetTimerEx("gasolinaTimer", 3000, true, "d", carID); //TEMPO EM QUE A GASOLINA DIMINUI
			fuelCheck[playerid] = SetTimerEx("gasolinaCheck", 3000, true, "i", playerid);
		}
		else
		{
			SwitchVehicleEngine(carID, false);
			motor[carID] = false;
			KillTimer(fuelTimer[carID]);
			KillTimer(fuelCheck[playerid]);
		}
	}

	return 1;
}

