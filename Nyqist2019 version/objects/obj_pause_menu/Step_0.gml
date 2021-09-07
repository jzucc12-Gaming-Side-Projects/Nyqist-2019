event_inherited();

var settings_choice = items - 4;
var save_choice = items - 3;
var load_choice = items - 2;
var exit_choice = items - 1;

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
		
		#region //Goes to inventory
		case 0:
		{
			instance_destroy();
			instance_create_depth(0,0,0, obj_Item_menu);
			break;
		}
		#endregion
		
		#region //Goes to equipment
		case 1:
		{
			instance_destroy();
			instance_create_depth(0,0,0, obj_Equip_menu);
			break;	
		}
		#endregion
		
		case 2:
		case 3:
		{
			instance_destroy();
			with(instance_create_depth(0,0,0, obj_Tech_menu))
			{
				if(other.choice == 3)
					hack = false;
					alarm[0] = 1;
			}
			break;
		}
		
		#region //Goes to settings
		case settings_choice:
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_settings_menu);
			break;
		}
		#endregion
		
		#region //Go to the load menu with write turned on
		case save_choice:
		{
			instance_destroy();
			with(instance_create_depth(0,0,0,obj_load_menu))
			{
				write = true;
			}
			break;
		}
		#endregion
		
		#region //Go to the load menu with write turned on
		case load_choice:
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_load_menu);
			break;
		}
		#endregion
		
		#region //Exit to the main menu
		case exit_choice:
		{
			with(instance_create_depth(0,0,0,obj_yes_no_menu))
			{
				ypos -= itemheight*spacing;
				color_active = c_black;
				choice_text = "Quit to Main Menu?\nAll unsaved progress will be lost.";
			}
			var yes_no_outcome = obj_yes_no_menu.outcome;
			if(yes_no_outcome)
			{
				if(file_exists("P1_pos_save.txt"))
					file_delete("P1_pos_save.txt");
				instance_destroy();
				instance_create_depth(0,0,0,obj_main_menu);
			}
			else if(yes_no_outcome == 0)
			{
				choice = -1;
				control = true;
				instance_destroy(obj_yes_no_menu);
			}			
			break;
		}
		#endregion
	}
}
#endregion

#region //Return to game
var return_file;
var unpause = keyboard_check_pressed(global.controls[? "pause"]);
unpause = unpause || keyboard_check_pressed(global.controls[? "cancel"]);
if(unpause)
{
	return_file = file_text_open_read("P1_pos_save.txt");
	return_room = file_text_read_real(return_file);
	ChangeRoom(return_room);
	file_text_close(return_file);
	instance_destroy();
}

#endregion
