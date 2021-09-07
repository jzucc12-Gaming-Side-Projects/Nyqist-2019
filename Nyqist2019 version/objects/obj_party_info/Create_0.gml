#region //Player 1
#region //Traits
global.player1_traits = ds_map_create();
global.player1_traits[? "Name"] = "Orzeg";	 	 //Player name
global.player1_traits[? "Nickname"] = "Oscar";		 //Player nickname
global.player1_traits[? "Up Sprite"] = spr_P1_up;	 //Walking up sprite
global.player1_traits[? "Down Sprite"] = spr_P1_down; //Walking down sprite
global.player1_traits[? "Side Sprite"] = spr_P1_side; //Walking side sprite
global.player1_traits[? "Face Sprite"] = spr_P1_face; //Dialog sprite
global.player1_traits[? "Battle Sprite"] = -1		 //Combat stance sprite
global.player1_traits[? "Injured Sprite"] = -1		 //Injured combat stance sprite
global.player1_traits[? "Downed Sprite"] = -1		 //Downed combat stance sprite
#endregion

#region //Base
global.player1_base_stats = ds_map_create();
global.player1_base_stats[? "Level"] = 1;		//Character Level
global.player1_base_stats[? "HP Max"] = 400;	//Maximum health
global.player1_base_stats[? "TP Max"] = 20;		//Maximum tech points
global.player1_base_stats[? "Phys Dmg"] = 30;	//Melee attack modifier
global.player1_base_stats[? "Tech Dmg"] = 10;	//Tech (magic) attack modifier
global.player1_base_stats[? "Phys Def"] = 30;	//Physical defense
global.player1_base_stats[? "Tech Def"] = 30;	//Tech defense
global.player1_base_stats[? "Crit Hit"] = 5;	//Critical hit chance
global.player1_base_stats[? "Crit Dmg"] = 1.5;	//Critical damage multiplier
global.player1_base_stats[? "Speed"] = 30;  	//Initiative (attack speed)
global.player1_base_stats[? "Evasion"] = 10;	//Agility (dodge attacks)
global.player1_base_stats[? "Accuracy"] = 10;	//Accuracy (hitting enemies)
#endregion

#region //Equipment
global.player1_equipment = ds_map_create();
global.player1_equipment[? "Weapon 1"] = 1; //First equipped weapon
global.player1_equipment[? "Weapon 2"] = 2; //Second equipped weapon
global.player1_equipment[? "Armor"] = -1;	  //Body armor equipped
global.player1_equipment[? "Headgear"] = -1; //Headgear equipped
global.player1_equipment[? "Aug 1"] = -1;   //First modification equipped
global.player1_equipment[? "Aug 2"] = -1;	  //Second modification equipped
global.player1_equipment[? "Hack"] = ds_grid_create(3,global.MaxHack);   // Known Hack list
global.player1_equipment[? "Enhancement"] = ds_grid_create(3,global.MaxEnh);   // Known Enh list
AddTech(1,"Hack",1,0);
AddTech(1,"Hack",1,2);
AddTech(1,"Hack",2,2);
AddTech(1,"Enhancement",1,0);
#endregion

#region //Stats
global.player1_stats = ds_map_create();
global.player1_stats = TotalMap(1);
global.player1_stats[? "Level"] = 1;
global.player1_stats[? "HP"] = global.player1_stats[? "HP Max"]; //Current health
global.player1_stats[? "TP"] = global.player1_stats[? "TP Max"]; //Current tech points
#endregion
#endregion

#region //Player 2
#region //Traits
global.player2_traits = ds_map_create();
global.player2_traits[? "Name"] = "Lunavelle";	 	 //Player name
global.player2_traits[? "Nickname"] = "Luna";		 //Player nickname
global.player2_traits[? "Up Sprite"] = spr_P2_up;	 //Walking up sprite
global.player2_traits[? "Down Sprite"] = spr_P2_down; //Walking down sprite
global.player2_traits[? "Side Sprite"] = spr_P2_side; //Walking side sprite
global.player2_traits[? "Face Sprite"] = spr_P2_face; //Dialog sprite
global.player2_traits[? "Battle Sprite"] = -1		 //Combat stance sprite
global.player2_traits[? "Injured Sprite"] = -1		 //Injured combat stance sprite
global.player2_traits[? "Downed Sprite"] = -1		 //Downed combat stance sprite
#endregion

#region //Base Stats
global.player2_base_stats = ds_map_create();
global.player2_base_stats[? "Level"] = 1;		//Character Level
global.player2_base_stats[? "HP Max"] = 200;	//Maximum health
global.player2_base_stats[? "HP"] = 200;		//Current health
global.player2_base_stats[? "TP Max"] = 50;		//Maximum tech points
global.player2_base_stats[? "TP"] = 50;			//Current tech points
global.player2_base_stats[? "Phys Dmg"] = 20;	//Melee attack modifier
global.player2_base_stats[? "Tech Dmg"] = 20;	//Tech (magic) attack modifier
global.player2_base_stats[? "Phys Def"] = 10;	//Physical defense
global.player2_base_stats[? "Tech Def"] = 10;	//Tech defense
global.player2_base_stats[? "Crit Hit"] = 5;	//Critical hit chance
global.player2_base_stats[? "Crit Dmg"] = 1.2;	//Critical damage multiplier
global.player2_base_stats[? "Speed"] = 25;		//Initiative (attack speed)
global.player2_base_stats[? "Evasion"] = 10;	//Agility (dodge attacks)
global.player2_base_stats[? "Accuracy"] = 10;	//Accuracy (hitting enemies)
#endregion

#region //Equipment
global.player2_equipment = ds_map_create();
global.player2_equipment[? "Weapon 1"] = 0; //First equipped weapon
global.player2_equipment[? "Weapon 2"] = 0; //Second equipped weapon
global.player2_equipment[? "Armor"] = -1;    //Body armor equipped
global.player2_equipment[? "Headgear"] = -1; //Headgear equipped
global.player2_equipment[? "Aug 1"] = -1;	  //First modification equipped
global.player2_equipment[? "Aug 2"] = -1;	  //Second modification equipped
global.player2_equipment[? "Hack"] = ds_grid_create(3,global.MaxHack);   // Known Hack list
global.player2_equipment[? "Enhancement"] = ds_grid_create(3,global.MaxEnh);   // Known Enhancement list
AddTech(2,"Hack",1,0);
AddTech(2,"Hack",2,0);
AddTech(2,"Hack",1,1);
AddTech(2,"Hack",2,1);
AddTech(2,"Hack",3,1);
AddTech(2,"Hack",1,2);
AddTech(2,"Enhancement",1,0);
AddTech(2,"Enhancement",2,0);
AddTech(2,"Enhancement",3,0);
#endregion

#region //Stats
global.player2_stats = ds_map_create();
global.player2_stats = TotalMap(2);
global.player2_stats[? "Level"] = 1;
global.player2_stats[? "HP"] = global.player2_stats[? "HP Max"]; //Current health
global.player2_stats[? "TP"] = global.player2_stats[? "TP Max"]; //Current tech points
#endregion
#endregion

#region //Items
global.Items = ds_list_create();
global.Equipment = ds_list_create();
global.Recovery = ds_grid_create(2,0);
ds_list_add(global.Items,global.Recovery);
global.Offense = ds_grid_create(2,0);
ds_list_add(global.Items,global.Offense);
global.Utility = ds_grid_create(2,0);
ds_list_add(global.Items,global.Utility);
global.Key = ds_grid_create(2,0);
ds_list_add(global.Items,global.Key);
global.Weapons = ds_grid_create(2,0);
ds_list_add(global.Equipment,global.Weapons);
global.Armor = ds_grid_create(2,0);
ds_list_add(global.Equipment,global.Armor);
global.Headgear = ds_grid_create(2,0);
ds_list_add(global.Equipment,global.Headgear);
global.Augment = ds_grid_create(2,0);
ds_list_add(global.Equipment,global.Augment);

AddInv("Recovery", 0, 3);
AddInv("Recovery", 1, 2);
AddInv("Offense", 0, 1);
AddInv("Offense", 1, 4);
AddInv("Utility", 0, 2);
AddInv("Utility", 1, 3);
AddInv("Weapon", 1, 1);
AddInv("Weapon", 2, 4);
AddInv("Armor", 0,2);
AddInv("Armor",1,2);
AddInv("Headgear", 0,2);
AddInv("Headgear",1,2);
#endregion