#region //Menu display
menu[0] = "Music Volume";
menu[1] = "Sound Effects Volume";
menu[2] = "Screen Zoom";
menu[3] = "Screen Brightness";
menu[4] = "Restore to Default";
menu[5] = "Return";
#endregion

event_inherited();

#region //Other parameters
items_y[items-1] = ypos + total_height - 1.75*spacing*itemheight;
#endregion

#region //Sliders
music_slider = instance_create_depth(items_x[0],(items_y[0]+items_y[1])/2,0,obj_slider);
with(music_slider)
{
	par_max = 200;
	parameter = Interpolate(0,1,global.aud_disp_setting[? "music"],par_min,par_max);
}

sfx_slider = instance_create_depth(items_x[1],(items_y[1]+items_y[2])/2,0,obj_slider);
with(sfx_slider)
{
	par_max = 200;
	parameter = Interpolate(0,1,global.aud_disp_setting[? "sfx"],par_min,par_max);
}
test = false;

bright_slider = instance_create_depth(items_x[3],(items_y[3]+items_y[4])/2,0,obj_slider);
with(bright_slider)
{
	par_max = 200;
	parameter = Interpolate(0,1,global.aud_disp_setting[? "brightness"],par_min,par_max);
}
#endregion

#region //Buttons
var x_off = 0.2;
zoom_out_button = instance_create_depth(items_x[2]*(1 - x_off), (items_y[2]+items_y[3])/2,0,obj_button);
with(zoom_out_button)
{
	x_scale = 2;
	symbol_x_scale = 2;
	y_scale = 2;
	symbol_y_scale = 2;
	symbol = "-";
}

zoom_in_button = instance_create_depth(items_x[2]*(1+x_off), (items_y[2]+items_y[3])/2,0,obj_button);
with(zoom_in_button)
{
	x_scale = 2;
	symbol_x_scale = 2;
	y_scale = 2;
	symbol_y_scale = 2;
	symbol = "+";
}

mute_music_button = instance_create_depth(items_x[1]*1.35, (items_y[0] + items_y[1])/2 + sprite_get_height(spr_slider_bar)/2,0,obj_button);
with(mute_music_button)
{
	x_scale = sprite_get_height(sprite_index) / sprite_get_width(sprite_index);
	symbol_color = c_red;
	symbol_x_scale = 1;
	symbol = "x";
	hold = true;
	pressed = global.aud_disp_setting[? "mute_music"];
}
mute_sfx_button = instance_create_depth(items_x[1]*1.35, (items_y[1] + items_y[2])/2 + sprite_get_height(spr_slider_bar)/2,0,obj_button);
with(mute_sfx_button)
{
	x_scale = sprite_get_height(sprite_index) / sprite_get_width(sprite_index);
	symbol_color = c_red;
	symbol_x_scale = 1;
	symbol = "x";
	hold = true;
	pressed = global.aud_disp_setting[? "mute_sfx"];
}
#endregion