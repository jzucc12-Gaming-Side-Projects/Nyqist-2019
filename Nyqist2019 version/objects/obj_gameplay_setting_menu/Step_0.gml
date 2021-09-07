var old_primary = primary;

event_inherited();

#region //Cursor button selection with mouse
if(remember)
{
	revert_button.symbol_color = c_white;
	remember_button.symbol_color = c_red;
}
else
{
	revert_button.symbol_color = c_red;
	remember_button.symbol_color = c_white;	
}
if(remember && revert_button.pressed)
{
	remember_button.pressed = false;
}
remember = remember_button.pressed;
global.gameplay_setting[? "remember"] = remember;
revert_button.pressed = !remember;
#endregion

#region //Cursor button edit with keys
if(cursor == 0)
{
	if(keyboard_check_pressed(global.controls[? "left"]))
		remember_button.pressed = true;
	else if(keyboard_check_pressed(global.controls[? "right"]))
		remember_button.pressed = false;
}
#endregion

#region //Cursor button selection with mouse
if(active)
{
	wait_button.symbol_color = c_white;
	active_button.symbol_color = c_red;
}
else
{
	wait_button.symbol_color = c_red;
	active_button.symbol_color = c_white;	
}
if(active && wait_button.pressed)
{
	active_button.pressed = false;
}
active = active_button.pressed;
global.gameplay_setting[? "active"] = active;
wait_button.pressed = !active;
#endregion

#region //Cursor button edit with keys
if(cursor == 1)
{
	if(keyboard_check_pressed(global.controls[? "left"]))
		active_button.pressed = true;
	else if(keyboard_check_pressed(global.controls[? "right"]))
		active_button.pressed = false;
}
#endregion

if(file_exists("P1_pos_save.txt"))
{
	#region //Primary button selection with mouse
	if(primary)
	{
		elf_button.button_color = c_white;
		orc_button.button_color = c_red;
	}
	else
	{
		elf_button.button_color = c_red;
		orc_button.button_color = c_white;	
	}
	if(primary && elf_button.pressed)
	{
		orc_button.pressed = false;
	}
	primary = orc_button.pressed;
	elf_button.pressed = !primary;
	#endregion

	#region //Primary button edit with keys
	if(cursor == 2)
	{
		if(keyboard_check_pressed(global.controls[? "left"]))
			orc_button.pressed = true;
		else if(keyboard_check_pressed(global.controls[? "right"]))
			orc_button.pressed = false;
	}
	#endregion
}

var return_option = items - 1;
var restore_default = items - 2;

if(keyboard_check_pressed(global.controls[? "cancel"]))
	choice = return_option;

#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		default: 
		{
			choice = -1;
			control = true;
			break;
		}
		
		case 0:
		{
			remember_button.pressed = !remember_button.pressed;
			choice = -1;
			control = true;
			break;
		}
		
		case 1:
		{
			active_button.pressed = !active_button.pressed;
			choice = -1;
			control = true;
			break;
		}
		
		case 2:
		{
			if(file_exists("P1_pos_save.txt"))
				orc_button.pressed = !orc_button.pressed;
			choice = -1;
			control = true;
			break;
		}
		
		#region //Restore to default
		case restore_default:
		{
			choice = -1;
			control = true;
			var temp = ds_map_write(global.default_game_set)
			ds_map_read(global.gameplay_setting,temp);
			active_button.pressed = false;
			remember_button.pressed = false;
			break;
		}
		#endregion
		
		#region //Returns to pervious screen
		case return_option: 
		{
			var file = file_text_open_write("Game_Setting.txt");
			var data = ds_map_write(global.gameplay_setting);
			file_text_write_string(file,data);
			file_text_close(file);
			instance_destroy();
			with(instance_create_depth(0,0,0,obj_settings_menu))
			{
				cursor = 1;
			}
			break;
		}
		#endregion
	}
}
#endregion

if(old_primary != primary)
	alarm_set(0,1);