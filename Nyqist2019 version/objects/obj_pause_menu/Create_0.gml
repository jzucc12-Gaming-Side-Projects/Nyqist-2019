menu[0] = "Items";
menu[1] = "Equipment";
menu[2] = "Hacks";
menu[3] = "Enhan.";
menu[4] = "Player";
menu[5] = "Settings";
menu[6] = "Save";
menu[7] = "Load";
menu[8] = "Quit";

event_inherited();

for(var ii = 0; ii < items; ii++)
{
	xalign[ii] = fa_left;
}

yalign = fa_top;

var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, c_gray);

instance_create_depth(gui_width*0.35,gui_height*0.05,0,obj_char_block_1)
instance_create_depth(gui_width*0.35,gui_height*0.45,0,obj_char_block_2)