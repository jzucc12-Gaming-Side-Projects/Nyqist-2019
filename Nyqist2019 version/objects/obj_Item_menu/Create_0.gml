show_list = ds_list_create();
title = ["Recovery", "Offense", "Utility", "Key"];
ds_list_copy(show_list, global.Items);

//Draw background
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, c_gray);

//Items
active_pos = 0;
delay_max = 15;
cursor_delay = 0;
list_delay = 0;
cursor_array = array_create(ds_list_size(show_list));
count = array_create(ds_list_size(show_list));
for(var ii = 0; ii < array_length_1d(count) ; ii++)
	count[ii] = ds_grid_height(show_list[| ii]);
	
//Item usage
item_selected = false;
arrow_pos = 1;
select_all = false;
can_group = false;

//Draw character boxes
var x_buff = sprite_get_width(global.player1_traits[? "Face Sprite"]); 
x_buff -= 20; //20 = 2*border_width
var y_buff = sprite_get_height(global.player1_traits[? "Face Sprite"])/2;
xpos = display_get_gui_width()*2/3 + x_buff;
ypos1 = display_get_gui_height()*1/3;
ypos2 = display_get_gui_height()*3/4;
instance_create_depth(xpos,ypos1 - y_buff,0,obj_char_block_1);
instance_create_depth(xpos,ypos2 - y_buff,0,obj_char_block_2);