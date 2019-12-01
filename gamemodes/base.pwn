//INCLUDES

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <a_mysql>
#include <streamer>
#include <EVF>
#include <foreach>

//MODULOS

#include "modulos/global.pwn"
#include "modulos/functions.pwn"
#include "modulos/personagem.pwn"
#include "modulos/register.pwn"
#include "modulos/admin.pwn"
#include "modulos/speed.pwn"

main()
{
	print("\n-------gamemode by: impostorr--------\n");
}

public OnGameModeInit()
{
	register_OnGameModeInit();
	DisableInteriorEnterExits();
	ShowPlayerMarkers(false);
	EnableStuntBonusForAll(false);
	LimitGlobalChatRadius(15.0);
	SetNameTagDrawDistance(0);
	ManualVehicleEngineAndLights();
	return 1;
}

public OnPlayerConnect(playerid)
{
	register_OnPlayerConnect(playerid);
	perso_OnPlayerConnect(playerid);
	speed_OnPlayerConnect(playerid);
	SetPlayerColor(playerid, -1);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	register_OnPlayerDisconnect(playerid, reason);
	speed_OnPlayerDisconnect(playerid);
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	register_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	perso_OnDialogResponse(playerid, dialogid, response, listitem, inputtext);
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	//DestroyVehicle(tempcar);
	speed_OnPlayerExitVehicle(playerid, vehicleid);
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	perso_OnPlayerClickTxt(playerid, PlayerText:playertextid);
	return 1;
}

public OnPlayerText(playerid, text[])
{
    new
        hours, 
        minutes, 
        seconds, 
        string[128] 
    ;
    gettime(hours, minutes, seconds); 
    format(string,sizeof(string),"[%02d:%02d:%02d] %s: %s",hours,minutes,seconds,RemoveUnderScore(playerid),text);
    SendClientMessageToAll( -1, string); 
    return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	speed_OnPlayerStateChange(playerid, newstate, oldstate);
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	speed_OnPlayerEnterVehicle(playerid, vehicleid, ispassenger);
	return 1;
}

public OnVehicleCreated(vehicleid)
{
	motor[vehicleid] = false;
	SetVehicleFuel(vehicleid, 100); //MUDAR NO FUTURO
	return 1;
}