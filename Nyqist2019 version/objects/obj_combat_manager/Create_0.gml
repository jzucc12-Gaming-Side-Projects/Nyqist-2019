#region //Set up background
sky = c_blue;
ground = make_color_rgb(102, 51, 0);
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, sky);
#endregion

#region //Placement variables
width = display_get_gui_width();
height = display_get_gui_height();
text_height = font_get_size(fnt_text);
dialog_y = height * 0.75;
split_x = width * 0.4;
border = sprite_get_width(spr_text_box) / 3;
#endregion

#region //Targeting
can_control = true;
#endregion

#region //Player variables
player_ready = array_create(4, false);
active = -1;
lose = false;
p1 = instance_create_depth(0,0,0,obj_player1);
p2 = instance_create_depth(0,0,0,obj_player2);

#endregion

#region //Monster variables
num_monster = 3;
monster_array = array_create(num_monster, 0);
mon_1 = instance_create_depth(0,0,0,obj_octorok);
mon_2 = instance_create_depth(0,0,0,obj_bokoblin);
mon_3 = instance_create_depth(0,0,0,obj_octorok);
monster_array = [mon_1, mon_2, mon_3];
alarm[0] = 1;
#endregion