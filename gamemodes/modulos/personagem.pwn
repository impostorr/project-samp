
#define Dialog_Idade	3
#define Dialog_Sexo     4
#define Dialog_Origem	5

forward perso_OnPlayerConnect(playerid);
public perso_OnPlayerConnect(playerid)
{
	perso_0[playerid] = CreatePlayerTextDraw(playerid, 310.000000, 134.000000, "_");
	PlayerTextDrawFont(playerid, perso_0[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_0[playerid], 0.600000, 28.800003);
	PlayerTextDrawTextSize(playerid, perso_0[playerid], 328.500000, 175.000000);
	PlayerTextDrawSetOutline(playerid, perso_0[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_0[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_0[playerid], 2);
	PlayerTextDrawColor(playerid, perso_0[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_0[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_0[playerid], 1296911871);
	PlayerTextDrawUseBox(playerid, perso_0[playerid], 1);
	PlayerTextDrawSetProportional(playerid, perso_0[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_0[playerid], 0);

	perso_1[playerid] = CreatePlayerTextDraw(playerid, 310.000000, 141.000000, "_");
	PlayerTextDrawFont(playerid, perso_1[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_1[playerid], 0.600000, 27.099990);
	PlayerTextDrawTextSize(playerid, perso_1[playerid], 298.500000, 165.000000);
	PlayerTextDrawSetOutline(playerid, perso_1[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_1[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_1[playerid], 2);
	PlayerTextDrawColor(playerid, perso_1[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_1[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_1[playerid], -1);
	PlayerTextDrawUseBox(playerid, perso_1[playerid], 1);
	PlayerTextDrawSetProportional(playerid, perso_1[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_1[playerid], 0);

	perso_2[playerid] = CreatePlayerTextDraw(playerid, 252.000000, 169.000000, "Preview_Model");
	PlayerTextDrawFont(playerid, perso_2[playerid], 5);
	PlayerTextDrawLetterSize(playerid, perso_2[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, perso_2[playerid], 112.500000, 150.000000);
	PlayerTextDrawSetOutline(playerid, perso_2[playerid], 0);
	PlayerTextDrawSetShadow(playerid, perso_2[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_2[playerid], 1);
	PlayerTextDrawColor(playerid, perso_2[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_2[playerid], 0);
	PlayerTextDrawBoxColor(playerid, perso_2[playerid], 255);
	PlayerTextDrawUseBox(playerid, perso_2[playerid], 0);
	PlayerTextDrawSetProportional(playerid, perso_2[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_2[playerid], 0);
	PlayerTextDrawSetPreviewModel(playerid, perso_2[playerid], 1);
	PlayerTextDrawSetPreviewRot(playerid, perso_2[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
	PlayerTextDrawSetPreviewVehCol(playerid, perso_2[playerid], 1, 1);

	perso_3[playerid] = CreatePlayerTextDraw(playerid, 355.000000, 241.000000, ">");
	PlayerTextDrawFont(playerid, perso_3[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_3[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, perso_3[playerid], 400.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, perso_3[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_3[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_3[playerid], 1);
	PlayerTextDrawColor(playerid, perso_3[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_3[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_3[playerid], 50);
	PlayerTextDrawUseBox(playerid, perso_3[playerid], 0);
	PlayerTextDrawSetProportional(playerid, perso_3[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_3[playerid], 1);

	perso_4[playerid] = CreatePlayerTextDraw(playerid, 250.000000, 240.000000, "<");
	PlayerTextDrawFont(playerid, perso_4[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_4[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, perso_4[playerid], 300.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, perso_4[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_4[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_4[playerid], 1);
	PlayerTextDrawColor(playerid, perso_4[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_4[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_4[playerid], 50);
	PlayerTextDrawUseBox(playerid, perso_4[playerid], 0);
	PlayerTextDrawSetProportional(playerid, perso_4[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_4[playerid], 1);

	perso_5[playerid] = CreatePlayerTextDraw(playerid, 256.000000, 149.000000, "Selecione seu personagem");
	PlayerTextDrawFont(playerid, perso_5[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_5[playerid], 0.241666, 1.800000);
	PlayerTextDrawTextSize(playerid, perso_5[playerid], 599.500000, 2.500000);
	PlayerTextDrawSetOutline(playerid, perso_5[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_5[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_5[playerid], 1);
	PlayerTextDrawColor(playerid, perso_5[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_5[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_5[playerid], 50);
	PlayerTextDrawUseBox(playerid, perso_5[playerid], 0);
	PlayerTextDrawSetProportional(playerid, perso_5[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_5[playerid], 0);

	perso_6[playerid] = CreatePlayerTextDraw(playerid, 201.000000, 20.000000, "mdl-2001:LOGO");
	PlayerTextDrawFont(playerid, perso_6[playerid], 4);
	PlayerTextDrawLetterSize(playerid, perso_6[playerid], 0.600000, 2.000000);
	PlayerTextDrawTextSize(playerid, perso_6[playerid], 222.000000, 222.000000);
	PlayerTextDrawSetOutline(playerid, perso_6[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_6[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_6[playerid], 1);
	PlayerTextDrawColor(playerid, perso_6[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_6[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_6[playerid], 50);
	PlayerTextDrawUseBox(playerid, perso_6[playerid], 1);
	PlayerTextDrawSetProportional(playerid, perso_6[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_6[playerid], 0);

	perso_7[playerid] = CreatePlayerTextDraw(playerid, 270.000000, 357.000000, "CONFIRMAR");
	PlayerTextDrawFont(playerid, perso_7[playerid], 1);
	PlayerTextDrawLetterSize(playerid, perso_7[playerid], 0.391666, 2.000000);
	PlayerTextDrawTextSize(playerid, perso_7[playerid], 385.000000, 10.500000);
	PlayerTextDrawSetOutline(playerid, perso_7[playerid], 1);
	PlayerTextDrawSetShadow(playerid, perso_7[playerid], 0);
	PlayerTextDrawAlignment(playerid, perso_7[playerid], 1);
	PlayerTextDrawColor(playerid, perso_7[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, perso_7[playerid], 255);
	PlayerTextDrawBoxColor(playerid, perso_7[playerid], 50);
	PlayerTextDrawUseBox(playerid, perso_7[playerid], 0);
	PlayerTextDrawSetProportional(playerid, perso_7[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, perso_7[playerid], 1);
	return 1;
}


forward perso_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
public perso_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case Dialog_Idade:
		{
			if(!response)
				return Kick(playerid);

			if(strlen(inputtext) < 2 || strlen(inputtext) > 2 )
			{
				SendClientMessage(playerid, -1, "ERRO: Digite uma idade entre 18 e 80 anos.");
                TogglePlayerSpectating(playerid, 1);
                ShowPlayerDialog(playerid, Dialog_Idade, DIALOG_STYLE_INPUT, "Documentação", "Digite a idade de seu personagem:", "Confirmar", "Cancelar");
			}
			else
			{
				if(strval(inputtext) < 18 || strval(inputtext) > 80)
				{
					SendClientMessage(playerid, -1, "ERRO: Digite uma idade entre 18 e 80 anos.");
                	TogglePlayerSpectating(playerid, 1);
                	ShowPlayerDialog(playerid, Dialog_Idade, DIALOG_STYLE_INPUT, "Documentação", "Digite a idade de seu pernsoagem:", "Confirmar", "Cancelar");
				}
				else
				{
					TogglePlayerSpectating(playerid, 1);
					Player[playerid][pIdade] = strval(inputtext);
					ShowPlayerDialog(playerid, Dialog_Sexo, DIALOG_STYLE_LIST, "Defina o sexo do seu personagem:", "Masculino\nFeminino", "Confirmar", "Cancelar");
				}
			}
		}

		case Dialog_Sexo:
		{
			if(!response)
				return Kick(playerid);

			switch(listitem)
			{
				case 0: Player[playerid][pSexo] = 1; //HOMEM
				case 1: Player[playerid][pSexo] = 2; //MULHER
			}

			ShowPlayerDialog(playerid, Dialog_Origem, DIALOG_STYLE_INPUT, "Documentação", "Digite a cidade de origem seu pernsoagem:", "Confirmar", "Cancelar");
			TogglePlayerSpectating(playerid, 1);
		} 

		case Dialog_Origem:
		{
			new Query[125];

			if(IsLetter(inputtext))
			{
				SendClientMessage(playerid, -1, "ERRO: Utilize somente letras para definir sua origem.");
				ShowPlayerDialog(playerid, Dialog_Origem, DIALOG_STYLE_INPUT, "Documentação", "Digite a origem de seu pernsoagem:", "Confirmar", "Cancelar");
				TogglePlayerSpectating(playerid, 1);
			}
			else
			{
				if(strlen(inputtext) < 4 || strlen(inputtext) > 24)
				{
					SendClientMessage(playerid, -1, "ERRO: Utilize no minimo 4 e no maximo 24 caracteres para definir sua origem.");
					ShowPlayerDialog(playerid, Dialog_Origem, DIALOG_STYLE_INPUT, "Documentação", "Digite a origem de seu pernsoagem:", "Confirmar", "Cancelar");
					TogglePlayerSpectating(playerid, 1);
				}
				else
				{
					mysql_format(ConexaoSQL, Query, sizeof(Query), "UPDATE `jogadores` SET pOrigem = '%s' WHERE `pNome`='%s'", inputtext, GetPlayerNameEx(playerid));
	   				mysql_query(ConexaoSQL,Query); 

					TogglePlayerSpectating(playerid, 1);
					
					TextDrawHideForPlayer(playerid, textdraw_0);
					PlayerTextDrawShow(playerid, perso_0[playerid]);
					PlayerTextDrawShow(playerid, perso_1[playerid]);
					PlayerTextDrawShow(playerid, perso_2[playerid]);
					PlayerTextDrawShow(playerid, perso_3[playerid]);
					PlayerTextDrawShow(playerid, perso_4[playerid]);
					PlayerTextDrawShow(playerid, perso_5[playerid]);
					PlayerTextDrawShow(playerid, perso_6[playerid]);
					PlayerTextDrawShow(playerid, perso_7[playerid]);
					SelectTextDraw(playerid, 0xFF0000FF);

					SalvarContasSQL(playerid);
					mysql_format(ConexaoSQL, Query, sizeof(Query), "SELECT * FROM jogadores WHERE pNome='%e'", GetPlayerNameEx(playerid)); 
                	mysql_tquery(ConexaoSQL, Query, "CarregarContaSQL", "i", playerid); 
				}
			}
		}
	}
	return 1;
}

forward perso_OnPlayerClickTxt(playerid, PlayerText:playertextid);
public perso_OnPlayerClickTxt(playerid, PlayerText:playertextid)
{
	if(playertextid == perso_7[playerid]) //CONFIRMAR
	{
		TogglePlayerSpectating(playerid, 0);
		SpawnPlayer(playerid);
		PlayerTextDrawDestroy(playerid, perso_0[playerid]);
		PlayerTextDrawDestroy(playerid, perso_1[playerid]);
		PlayerTextDrawDestroy(playerid, perso_2[playerid]);
		PlayerTextDrawDestroy(playerid, perso_3[playerid]);
		PlayerTextDrawDestroy(playerid, perso_4[playerid]);
		PlayerTextDrawDestroy(playerid, perso_5[playerid]);
		PlayerTextDrawDestroy(playerid, perso_6[playerid]);
		PlayerTextDrawDestroy(playerid, perso_7[playerid]);
		CancelSelectTextDraw(playerid);
		SetPlayerSkin(playerid, next_skin);
	}

	if(playertextid == perso_3[playerid]) //NEXT SKIN
	{
		if(next_skin+1 <= 273)
		{
			next_skin++;
			PlayerTextDrawSetPreviewModel(playerid, perso_2[playerid], next_skin);
			PlayerTextDrawShow(playerid, perso_2[playerid]);
		}
	}

	if(playertextid == perso_4[playerid]) //PREVIOUS SKIN
	{
		if(next_skin-1 >= 1)
		{
			next_skin--;
			PlayerTextDrawSetPreviewModel(playerid, perso_2[playerid], next_skin);
			PlayerTextDrawShow(playerid, perso_2[playerid]);
		}
	}
	return 1;
}

CMD:test(playerid)
{
	new str[24];
	format(str, sizeof(str), "%s", Player[playerid][pOrigem]);
	SendClientMessage(playerid, -1, str);
	return 1;
}
