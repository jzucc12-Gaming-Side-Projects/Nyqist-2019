#region //Keep menu items in here for simplicity of updating
for(var ii = 0; ii < temp_length; ii++)
{
	menu[ii] = KeyToString(temp[ii]);
}
#endregion

var return_option = items - 1;
var save_option = items - 2;
var default_option = items - 3;

//Handles own control due to temporary key usage
if(control)
{
	#region //Keyboard controls
	if(keyboard_check(temp[0])) && (cursor_delay <= 0)
	{
		cursor--;
		cursor_delay = delay_max;
	}
	else if(keyboard_check(temp[1])) && (cursor_delay <= 0)
	{
		cursor++;
		cursor_delay = delay_max;
	}
	cursor = Wrap(cursor,0,items - 1);
	if(keyboard_check_pressed(temp[5]))
	{
		choice = cursor;
		control = false;
	}
	cursor_delay = Approach(cursor_delay,1,0);
	#endregion

	#region //Mouse Control
	var mouse_x_gui = device_mouse_x_to_gui(0);
	var mouse_y_gui = device_mouse_y_to_gui(0);
	var in_mouse_x;
	var in_mouse_y;
	
	#region //Cursor collision detection
	for(var ii = 0; ii < items; ii++)
	{
		switch(xalign[ii])
		{
			case fa_left:
				in_mouse_x = (mouse_x_gui > items_x[ii]) && (mouse_x_gui < items_x[ii] + max_width); break;
			case fa_right:
				in_mouse_x = (mouse_x_gui > items_x[ii] - max_width) && (mouse_x_gui < items_x[ii]); break;
			case fa_center:
				in_mouse_x = (mouse_x_gui > items_x[ii] - max_width/2) && (mouse_x_gui < items_x[ii] + max_width/2); break;
		}
		
		in_mouse_y = (mouse_y_gui > items_y[ii]) && (mouse_y_gui < items_y[ii] + itemheight);
		
		if(in_mouse_x && in_mouse_y)
			can_click[ii] = true;
		else
			can_click[ii] = false;
		
		if(can_click[ii] && mouse_check_button_pressed(mb_left) && cursor == ii)
			{
				choice = ii;
				control = false;
			}
		else if(can_click[ii] && mouse_check_button_pressed(mb_left) && cursor != ii)
			cursor = ii;
	}
	#endregion
	
	#endregion
	
	if(keyboard_check_pressed(global.controls[? "cancel"]))
		choice = return_option;
}

#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		#region //Changing keys
		default: 
		{
			change = true;
			break;
		}
		
		//Restore keys to default
		case default_option:
		{
			temp[0] = global.default_control[? "up"];
			temp[1] = global.default_control[? "down"];
			temp[2] = global.default_control[? "left"];
			temp[3] = global.default_control[? "right"];
			temp[4] = global.default_control[? "run"];
			temp[5] = global.default_control[? "select"];
			temp[6] = global.default_control[? "cancel"];
			temp[7] = global.default_control[? "pause"];
			control = true;
			choice = -1;
			break;
		}
		#endregion
		
		#region //Other options
		//Saves changes to controls
		case save_option:
		{
			with(obj_global_settings)
			{
				global.controls[? "up"] = other.temp[0];
				global.controls[? "down"] = other.temp[1];
				global.controls[? "left"] = other.temp[2];
				global.controls[? "right"] = other.temp[3];
				global.controls[? "run"] = other.temp[4];
				global.controls[? "select"] = other.temp[5];
				global.controls[? "cancel"] = other.temp[6];
				global.controls[? "pause"] = other.temp[7];
			}
			var file = file_text_open_write("Controls.txt");
			var data = ds_map_write(global.controls);
			file_text_write_string(file,data);
			file_text_close(file);
			control = true;
			choice = -1;
			break;
		}
		//Returns to start menu
		case return_option: 
		{
			instance_destroy();
			with(instance_create_depth(0,0,0,obj_settings_menu))
			{
				cursor = 2;
			}
			break;
		}
		#endregion
	}
}
#endregion