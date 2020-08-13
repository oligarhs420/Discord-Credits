#pragma semicolon 1
#pragma newdecls required

#include <store>
#include <multicolors>

forward void DU_OnLinkedAccount(int client, char[] userid, char[] username, char[] discriminator);
ConVar g_cvCredits;

#define PLUGIN_VERSION	"1.0"

public Plugin myinfo = 
{
	name = "[Discord] Store credits",
	author = "TheBO$$",
	description = "Give the player credits for verify account",
	version = PLUGIN_VERSION,
	url = "http://www.sourcemod.net/"
};

public void OnPluginStart()
{
	g_cvCredits = CreateConVar("sm_du_store_credits", "50000", "store credits");
	AutoExecConfig(true, "du_store_credits");
}

public void DU_OnLinkedAccount(int client, char[] userid, char[] username, char[] discriminator)
{
	int amount = GetConVarInt(g_cvCredits);
	int credits = Store_GetClientCredits(client);
	Store_SetClientCredits(client, credits + amount);
	CPrintToChatAll("[{darkblue}Discord{default}] Player {green}%N {default}gain {darkred}%i {default}credits for verify account", client, amount);
}

