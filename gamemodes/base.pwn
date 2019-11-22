//INCLUDES

#include <a_samp>
#include <zcmd>
#include <sscanf2>
#include <a_mysql>
#include <streamer>

//MODULOS

#include "modulos/functions.pwn"
#include "modulos/player.pwn"
#include "modulos/personagem.pwn"
#include "modulos/register.pwn"
#include "modulos/admin.pwn"

main()
{
	print("\n-------gamemode by: impostorr--------\n");
}

public OnGameModeInit()
{
	register_OnGameModeInit();
	DisableInteriorEnterExits();
	ShowPlayerMarkers(false);
	return 1;
}

public OnPlayerConnect(playerid)
{
	register_OnPlayerConnect(playerid);
	perso_OnPlayerConnect(playerid);
	return 1;
}
public OnPlayerDisconnect(playerid, reason)
{
	register_OnPlayerDisconnect(playerid, reason);
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
	DestroyVehicle(tempcar);
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	perso_OnPlayerClickTxt(playerid, PlayerText:playertextid);
	return 1;
}