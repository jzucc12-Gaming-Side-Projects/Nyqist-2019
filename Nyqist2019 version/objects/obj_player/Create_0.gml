#region //Player and weapon determination
alive = true;
x_scale = 3.5;
y_scale = 3.5;
traits = ds_map_create();
stats = ds_map_create();
equipment = ds_map_create();
w1 = instance_create_depth(0,0,0,obj_player_turn);
w2 = instance_create_depth(0,0,0,obj_player_turn);
image_speed = 0;
#endregion

#region //Positioning
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
y_percent = 0.3;
x = gui_width * 0.75;

player_info_x = 0;
player_info_y = 0;
spacing = 0;

y = gui_height * player * y_percent;
with(obj_combat_manager)
{
	other.player_info_x = split_x + border;
	other.player_info_y = (dialog_y + border) / other.player + height/2 * (other.player - 1);
	other.spacing = 1.5 * text_height;
}
#endregion

#region //Targeting
targeted = false;
arrow_x = 0;
arrow_y = -100;
#endregion

alarm[0] = 1;