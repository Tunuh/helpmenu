#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "Tuna"
#define PLUGIN_VERSION "0.01"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

#pragma newdecls required

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "helpMenu",
	author = PLUGIN_AUTHOR,
	description = "Displays a help menu on command sm_help",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");	
	}
	
	//On command call, opens help menu
	RegConsoleCmd("sm_help", helpMenu)
}

//main help menu
public int MainMenuHandler(Menu mainmenu, MenuAction action, int param1, int param2)
{

	switch(action)
	{

		case MenuAction_Start:
		{
			
		}
		
		case MenuAction_Display:
		{
			
			char buffer[255];
			Format(buffer, sizeof(buffer), "%T", "Help Menu", param1);
			
			Panel mainpanel = view_as<Panel>(param2);
			mainpanel.SetTitle(buffer);
			
		}
		
		case MenuAction_Select:
		{
	
			char info[32];
			if(StrEqual(info, menu_rules))
			{
				
			}

		}

	}
	
	return 0;

}

public Action helpMenu(int client, int args)
{

	Menu helpMenu = new Menu(MainMenuHandler, MENU_ACTIONS_ALL);
	helpMenu.SetTitle("%T", "Help Menu", LANG_SERVER);
	helpMenu.AddItem(menu_rules, "Server Rules");
	helpMenu.AddItem(menu_needadmin, "Call Admin");
	helpMenu.ExitButton = true
	helpMenu.Display(helpMenu, client, MENU_TIME_FOREVER);
	//helpMenu.AddItem(menu_, ""); //template
	
	Menu rulesMenu = new Menu(RulesMenuHandler, MENU_ACTIONS_ALL);
	rulesMenu.SetTitle(("%T", "Server Rules", LANG_SERVER);
	rulesMenu.AddItem(rule1, "No foul, degrading or racist remarks.");
	rulesMenu.AddItem(rule2, "No inappropriate or disrespectful names.");
	rulesMenu.AddItem(rule3, "No hacks of any kind.");
	rulesMenu.AddItem(rule4, "No griefing.");
	rulesMenu.AddItem(rule5, "No Spamming");
	rulesMenu.AddItem(rule6, "No advertising in servers.");
	rulesMenu.AddItem(rule7, "No impersonating admins.");
	rulesMenu.AddItem(rule8, "No arguing with admins. Admins have final say.");
	rulesMenu.AddItem(rule9, "Do not disrupt the server in any way.");
	rulesMenu.AddItem(rule10, "Do not pester admins.");
	//rulesMenu.AddItem(rule1, ""); template
	
	
	

}