#region// Drawing
//Draw background
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, c_gray);

//Draw character boxes
var x_buff = sprite_get_width(global.player1_traits[? "Face Sprite"]);
var y_buff = sprite_get_height(global.player1_traits[? "Face Sprite"]);
xpos1 = gui_width/4 + x_buff/2 + 1.5*border_width;
ypos1 = 3*border_width; //3*border_width
with(instance_create_depth(xpos1,ypos1,0,obj_char_block_1))
	no_stat = true;
#endregion

#region //Display
//List
show_list = ds_list_create();
scripts = ["Weapon", "Armor", "Headgear", "Aug"];
ds_list_copy(show_list, global.Equipment);

//Stats
stats1 = ds_map_create();
stats2 = ds_map_create();
ds_map_copy(stats1,global.player1_stats);
ds_map_copy(stats2,global.player2_stats);
stats_active = stats1;
stat_list = ["HP Max", "TP Max", "Evasion", "Phys Def", "Tech Def", 
				"Phys Dmg", "Tech Dmg", "Speed", "Accuracy", "Crit Hit", "Crit Dmg"];
stat_length = array_length_1d(stat_list);
player = 1;

var width = ds_list_create();
for (var ii = 0; ii < stat_length; ii++)
	ds_list_add(width,string_width(stat_list[ii]));
ds_list_sort(width,false);
stat_width = ds_list_find_value(width,0);
ds_list_destroy(width);

//Mode
modes = ["Equip", "Unequip", "Unequip all"];
mode_cursor = 0;
mode_delay = 0;
mode_selected = false;
unequip = false;
#endregion

#region //Item stuff
//Items
active_pos = 0;
delay_max = 15;
cursor_delay = 0;
list_delay = 0;
cursor_array = array_create(ds_list_size(show_list));
count = array_create(ds_list_size(show_list));
for(var ii = 0; ii < array_length_1d(count); ii++)
	count[ii] = ds_grid_height(show_list[| ii]);
	
//Item usage
equip_selected = false;
change = false;
arrow_pos = 1;
control = false;
#endregion

#region //Menu
menu[0,0] = "Wpn 1:";
menu[0,1] = "Wpn 2:";
menu[1,0] = "Armor:";
menu[1,1] = "Head:";
menu[2,0] = "Aug 1:";
menu[2,1] = "Aug 2:";

box_width = 700;
spacing_x = box_width/2;
xpos = gui_width/4 - box_width/2;
ypos = ypos1 + y_buff;

use_mouse = false;
event_inherited();
#endregion

#region //Load in equipment names
equip[0,0] = global.player1_equipment[? "Weapon 1"];
equip[0,1] = global.player1_equipment[? "Weapon 2"];
equip[1,0] = global.player1_equipment[? "Armor"];
equip[1,1] = global.player1_equipment[? "Headgear"];
equip[2,0] = global.player1_equipment[? "Aug 1"];
equip[2,1] = global.player1_equipment[? "Aug 2"];
#endregion