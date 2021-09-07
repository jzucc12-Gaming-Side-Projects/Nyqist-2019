#region //Draw title with varying color
green_px = Wave(255,122,4,0);
var text_color = make_colour_rgb(0,green_px,200);
var load_text;
if(write)
	load_text = "Select File to Save";
else if(deleteMe)
	load_text = "Select File to Delete";
else
	load_text = "Select File to Load";
draw_set_color(text_color);
draw_set_font(fnt_text);
draw_set_halign(fa_center);
draw_text(gui_width/2,gui_height/5,load_text);
#endregion

#region //Current item color
if(deleteMe)
	color_active = c_red;
else
	color_active = c_teal;
#endregion

event_inherited();

#region //Show saving or deleting text
var fade_step = 0.04;
if(action_taken || fading != 0)
{
	if(fading < 1 && !decrement)
	{
		fading += fade_step;
	}
	else
	{
		decrement = true;
		fading -= fade_step;
	}
	
	draw_set_font(fnt_text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	draw_set_color(c_white);
	
	if (deleted)
		var text = "File Deleted";
	else if(write)
		var text = "Game Saved";

	draw_text_color(20, gui_height - 20, text, c_white, c_white, c_white, c_white, fading);
	action_taken = false;
	
	if(fading == 0)
	{
		decrement = false;
		deleted = false;
	}
}
#endregion