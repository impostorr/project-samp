//CONECT DATA BASE

#define HOST "localhost"
#define USER "root"
#define DTBS "project"
#define PASS ""

 //--------------------

#define Dialog_Registro 	1
#define Dialog_Login    	2

//---------------------

new player_login = 0;

//--------------------

forward register_OnGameModeInit();
public register_OnGameModeInit()
{
	ConexaoSQL = mysql_connect(HOST,USER,PASS,DTBS);
	if(mysql_errno(ConexaoSQL) != 0) 
    { 
        print("[MySQL] Falha ao tentar estabelecer conexão com o banco de dados.");
    } 
    else 
    {
        print("[MySQL] Sucesso ao conectar com o banco de dados.");
    }

    textdraw_0 = TextDrawCreate(173.000000, -29.000000, "mdl-2001:LOGO");
	TextDrawFont(textdraw_0, 4);
	TextDrawLetterSize(textdraw_0, 0.600000, 2.000000);
	TextDrawTextSize(textdraw_0, 290.500000, 257.000000);
	TextDrawSetOutline(textdraw_0, 1);
	TextDrawSetShadow(textdraw_0, 0);
	TextDrawAlignment(textdraw_0, 1);
	TextDrawColor(textdraw_0, -1);
	TextDrawBackgroundColor(textdraw_0, 255);
	TextDrawBoxColor(textdraw_0, 50);
	TextDrawUseBox(textdraw_0, 1);
	TextDrawSetProportional(textdraw_0, 1);
	TextDrawSetSelectable(textdraw_0, 0);
    return 1;
}

forward register_OnPlayerConnect(playerid);
public register_OnPlayerConnect(playerid)
{
	new Query[200];
	TogglePlayerSpectating(playerid, 1);

	if(HaveUnder(GetPlayerNameEx(playerid)))
	{
        if (IsNumeric(GetPlayerNameEx(playerid)))
        { 
            SendClientMessage(playerid, -1, "ERRO: Utilize somente letras em seu nome.");
            SetTimerEx("KickPlayerinTime", 200, false, "i", playerid);
        }
        else
        {
            mysql_format(ConexaoSQL, Query, sizeof(Query), "SELECT `pSenha`, `pID` FROM `Jogadores` WHERE `pNome`='%e'", GetPlayerNameEx(playerid));
            mysql_tquery(ConexaoSQL, Query, "VerificarContaSQL", "i", playerid);
        }
        
	}
    else
	{
		SendClientMessage(playerid, -1, "ERRO: Utilize Nome_Sobrenome para conseguir acessar o servidor.");
		SetTimerEx("KickPlayerinTime", 200, false, "i", playerid);
	}
	return 1;
}

forward register_OnPlayerDisconnect(playerid, reason);
public register_OnPlayerDisconnect(playerid, reason)
{
	if(Player[playerid][pLogado] == true && reason >= 0) 
    {
        SalvarContasSQL(playerid);
        ZerarDadosSQL(playerid);
    }
	return 1;
}

forward VerificarContaSQL(playerid);
public VerificarContaSQL(playerid)
{
	if(cache_num_rows() > 0) 
    {
        cache_get_value_name(0, "pSenha", Player[playerid][pSenha], 24); 
        ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Login", "Digite sua senha para entrar em nosso servidor.", "Confirmar", "Sair");
    	TextDrawShowForPlayer(playerid, textdraw_0);
    }
    else
    { 
        TextDrawShowForPlayer(playerid, textdraw_0);
        ShowPlayerDialog(playerid, Dialog_Registro, DIALOG_STYLE_INPUT, "Registro", "Digite uma senha para se registrar em nosso servidor", "Registrar", "Sair");
    }
	return 1;
}

forward register_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[]);
public register_OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	new Query[125];

    switch(dialogid)
    {
        case Dialog_Registro: 
        {
            if(!response) 
                return Kick(playerid);

            if(strlen(inputtext) < 4 || strlen(inputtext) > 24) 
            {
                SendClientMessage(playerid, 0xFF0000AA, "[SERVER] Escolha uma senha entre 4 a 24 caracteres.");
                TogglePlayerSpectating(playerid, 1);

                ShowPlayerDialog(playerid, Dialog_Registro, DIALOG_STYLE_INPUT, "Registro", "Digite uma senha para se registrar em nosso servidor", "Registrar", "Sair"); // Mostra o dialog para ele tentar de novo.
                Player[playerid][pTentativasRegistro]++; 

            } 
            else 
            { 
                TogglePlayerSpectating(playerid, 1); 
                ShowPlayerDialog(playerid, Dialog_Idade, DIALOG_STYLE_INPUT, "Documentação", "Digite sua idade:", "Confirmar", "Cancelar");
                mysql_format(ConexaoSQL, Query, sizeof(Query), "INSERT INTO `jogadores`(`pNome`,`pSenha`) VALUES ('%e', '%e')", GetPlayerNameEx(playerid), inputtext);
                mysql_tquery(ConexaoSQL, Query, "InserirDadosSQL", "i", playerid);
            }
            if(Player[playerid][pTentativasRegistro] == 3) 
            {
                    SendClientMessage(playerid, 0xFF0000AA, "[SERVER] Limite de tentativas de registro excedida.");
                    Player[playerid][pTentativasRegistro] = 0; 
                    SetTimerEx("KickPlayerinTime", 200, false, "i", playerid); 

            }
        }
        case Dialog_Login:
        {
            if(!response) 
                return Kick(playerid);

            if(!strcmp(Player[playerid][pSenha], inputtext, true, 24)) 
            { 
                TogglePlayerSpectating(playerid, 0); 
                mysql_format(ConexaoSQL, Query, sizeof(Query), "SELECT * FROM jogadores WHERE pNome='%e'", GetPlayerNameEx(playerid)); 
                mysql_tquery(ConexaoSQL, Query, "CarregarContaSQL", "i", playerid); 

                SendClientMessage(playerid, 0x80FF00AA, "[Server] Logado com sucesso.");
                TextDrawHideForPlayer(playerid, textdraw_0);
                player_login = 1; 
            } 
            else 
            { 
                TogglePlayerSpectating(playerid, 1);
                SendClientMessage(playerid, 0xFF0000AA, "[SERVER] Senha errada, tente novamente."); 
                Player[playerid][pTentativasLogin]++; 
                ShowPlayerDialog(playerid, Dialog_Login, DIALOG_STYLE_PASSWORD, "Login", "Digite sua senha para entrar em nosso servidor.", "Confirmar", "Sair"); // Mostra a dialog pra ele tentar dnvo
            }
            if(Player[playerid][pTentativasLogin] == 3) 
            {
                SendClientMessage(playerid, 0xFF0000AA, "[SERVER] Limite de tentativas de login excedida."); 
                Player[playerid][pTentativasLogin] = 0; 
                SetTimerEx("KickPlayerinTime", 200, false, "i", playerid); 
            }
        }
    }
	return 1;
}

forward InserirDadosSQL(playerid);
public InserirDadosSQL(playerid)
{
	new Query[90];

    Player[playerid][pID] = cache_insert_id(); 
    printf("[MYSQL] Jogador %s registrado como ID %d", GetPlayerNameEx(playerid), Player[playerid][pID]); 

    mysql_format(ConexaoSQL, Query, sizeof(Query), "SELECT * FROM jogadores WHERE pID='%i'", Player[playerid][pID]);
    mysql_query(ConexaoSQL,Query); 

    //CarregarContaSQL(playerid); 
	return 1;
}

forward CarregarContaSQL(playerid);
public CarregarContaSQL(playerid)
{
	Player[playerid][pLogado] = true; 

    cache_get_value_int(0, "pID", Player[playerid][pID]); 
    cache_get_value_int(0, "pDinheiro", Player[playerid][pDinheiro]); 
    cache_get_value_int(0, "pScore", Player[playerid][pScore]); 
    cache_get_value_int(0, "pSkin", Player[playerid][pSkin]);
    cache_get_value_int(0, "pAdmin", Player[playerid][pAdmin]);
    cache_get_value_int(0, "pIdade", Player[playerid][pIdade]);
    cache_get_value_int(0, "pSexo", Player[playerid][pSexo]);
    cache_get_value_name(0, "pOrigem", Player[playerid][pOrigem], 24);
    cache_get_value_float(0, "pPosX", Player[playerid][pPosX]);
    cache_get_value_float(0, "pPosY", Player[playerid][pPosY]);
    cache_get_value_float(0, "pPosZ", Player[playerid][pPosZ]);
    cache_get_value_float(0, "pPosA", Player[playerid][pPosA]);

    SetPlayerScore(playerid, Player[playerid][pScore]);  
    GivePlayerMoney(playerid, Player[playerid][pDinheiro]); 

    SetSpawnInfo(playerid, 0, Player[playerid][pSkin], Player[playerid][pPosX], Player[playerid][pPosY], Player[playerid][pPosZ], Player[playerid][pPosA], 0, 0, 0, 0 ,0, 0);
    if(player_login == 1)
    	SpawnPlayer(playerid); 

    SetPlayerSkin(playerid, Player[playerid][pSkin]);

	return 1;
}

forward SalvarContasSQL(playerid);
public SalvarContasSQL(playerid)
{
	if(Player[playerid][pLogado] == false) 
        return 0;

    new Query[250];

    Player[playerid][pDinheiro] = GetPlayerMoney(playerid); 
    Player[playerid][pScore] = GetPlayerScore(playerid);
    Player[playerid][pSkin] = GetPlayerSkin(playerid);
    GetPlayerPos(playerid, Player[playerid][pPosX], Player[playerid][pPosY], Player[playerid][pPosZ]);
    GetPlayerFacingAngle(playerid, Player[playerid][pPosA]);

    mysql_format(ConexaoSQL, Query, sizeof(Query), "UPDATE `jogadores` SET \
    `pDinheiro`='%i', \
    `pScore`='%i', \
    `pSkin`='%i', \
    `pAdmin`='%i', \
    `pIdade`='%i', \
    `pSexo`='%i', \
    `pPosX`='%f', \
    `pPosY`='%f', \
    `pPosZ`='%f', \
    `pPosA`='%f' WHERE `pID`='%i'", Player[playerid][pDinheiro],
                                    Player[playerid][pScore],
                                    Player[playerid][pSkin],
                                    Player[playerid][pAdmin],
                                    Player[playerid][pIdade],
                                    Player[playerid][pSexo],
                                    Player[playerid][pPosX],
                                    Player[playerid][pPosY],
                                    Player[playerid][pPosZ],
                                    Player[playerid][pPosA],
                                    Player[playerid][pID]);
    mysql_query(ConexaoSQL, Query); 

    printf("[MYSQL] Dados do Jogador %s ID %d salvo com sucesso", GetPlayerNameEx(playerid), Player[playerid][pID]); 
	return 1;
}

forward KickPlayerinTime(playerid);
public KickPlayerinTime(playerid)
{
    return Kick(playerid);
}

stock GetPlayerNameEx(playerid)
{
    static pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    return pname;
} 

stock ZerarDadosSQL(playerid)
{
    Player[playerid][pID] = 0;
    Player[playerid][pSenha] = 0;
    Player[playerid][pDinheiro] = 0;
    Player[playerid][pScore] = 0;
    Player[playerid][pSkin] = 0;
    Player[playerid][pAdmin] = 0;
    Player[playerid][pIdade] = 0;
    Player[playerid][pSexo] = 0;
    Player[playerid][pLogado] = false;
    Player[playerid][pTentativasLogin] = 0;
    Player[playerid][pTentativasRegistro] = 0;
    Player[playerid][pPosX] = 0;
    Player[playerid][pPosA] = 0;
    Player[playerid][pPosY] = 0;
    Player[playerid][pPosA] = 0;
}