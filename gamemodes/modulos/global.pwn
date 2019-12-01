enum PlayerInfos
{
    pID,
    pSenha[24],
    pDinheiro,
    pScore,
    pSkin,
    pAdmin,
    pIdade[3],
    pSexo,
    pOrigem[24],

    Float:pPosX,
    Float:pPosY,
    Float:pPosZ,
    Float:pPosA,

    pTentativasLogin,
    pTentativasRegistro,

    bool:pLogado
}

new MySQL:ConexaoSQL;

new Player[MAX_PLAYERS][PlayerInfos];

new Text:textdraw_0; // LOGO

// SELECIONAR PERSONAGEM

new PlayerText:perso_0[MAX_PLAYERS];
new PlayerText:perso_1[MAX_PLAYERS];
new PlayerText:perso_2[MAX_PLAYERS];
new PlayerText:perso_3[MAX_PLAYERS];
new PlayerText:perso_4[MAX_PLAYERS];
new PlayerText:perso_5[MAX_PLAYERS];
new PlayerText:perso_6[MAX_PLAYERS];
new PlayerText:perso_7[MAX_PLAYERS];

new next_skin = 1;

//-----------------------------------

//---------VELOCIMETRO---------------

new PlayerText:speed_0[MAX_PLAYERS];
new PlayerText:fuel_0[MAX_PLAYERS];
new PlayerVelocimetroTimer[MAX_PLAYERS];
new bool:PlayerVelocimetro[MAX_PLAYERS];

//-----------------------------------

//-----------FUEL--------------------

new bool:motor[MAX_VEHICLES];
new fuelTimer[MAX_VEHICLES];
new fuelCheck[MAX_PLAYERS];

//-----------------------------------

