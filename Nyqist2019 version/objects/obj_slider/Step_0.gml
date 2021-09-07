#region //Key alteration
if(control)
{
	if(keyboard_check(global.controls[? "left"]))
		parameter = Approach(parameter,step, par_min);
		
	else if(keyboard_check(global.controls[? "right"]))
		parameter = Approach(parameter,step, par_max);
}
#endregion
	
#region //Edit with button
if(button.pressed)
{
	if(!clear)
	{
		keyboard_string = "";
		clear = true;
	}
	
	#region //Filters out non-numeric or other special entries
	var key = keyboard_lastkey;
	var num = (key > 47 && key < 58) || key == 8 || key == 0;
	num = num || key == global.default_control[? "select"] || key == 190;
	
	if (string_width(keyboard_string)<button.sprite_width-32) && num
		message = keyboard_string;
	else
		keyboard_string = message;
	#endregion
	
	#region //Changes display for entered value
	button.symbol = string(message) + cursor;
	if(keyboard_check_pressed(vk_enter)) || (mouse_check_button_pressed(mb_left) && (!button.can_x || !button.can_y))
	{
		parameter = real(keyboard_string);
		if(parameter > par_max)
			parameter = par_max;
		else if(parameter < par_min)
			parameter = par_min;
			
		button.pressed = false;
		clear = false;
	}
	#endregion
}
else
{
	#region //Not in button mode case
	if(round_par)
		parameter = round(parameter);
	percent = (parameter - par_min) / (par_max - par_min) * 100;
	x = percent * (pos_max - pos_min) / 100 + pos_min;
	if (string_length(string(parameter)) == 1 && pad) 
	{
	    button.symbol = string(parameter) + ".00";
	}
	else
		button.symbol = string(parameter);
	#endregion
}

button.x = x;
button.y = y-2.5*spr_block/3;
#endregion

if(old_param != parameter)
{
	in_use = true;
}
else
	in_use = false;	