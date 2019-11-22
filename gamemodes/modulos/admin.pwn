/* ADMIN LEVEIS 
  
  1 - MODERADOR
  2 - ADMIN
  3 - SCRIPTER/MAPPER

*/

new tempcar;

CMD:pegaradm(playerid)
{
	Player[playerid][pAdmin] = 3;
	SendClientMessage(playerid, -1, "pego adm seu corno");
	return 1;
}

CMD:cv(playerid, params[])
{
	new carmodel, color1, color2;
	new Float:x, Float:y, Float:z, Float:a;

	if(Player[playerid][pAdmin] != 0)
	{
		if(sscanf(params, "ddd", carmodel, color1, color2))
		{
			SendClientMessage(playerid, -1, "Use: /cv [modelo] [cor1] [cor2]");
		}
		else
		{
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);
			tempcar = AddStaticVehicle(carmodel, x, y, z, a, color1, color2);
			PutPlayerInVehicle(playerid, tempcar, 0);
		}
	}
	else return SendClientMessage(playerid, -1, "ERRO: Você não tem permissão para usar esse comando.");
	return 1;
}
