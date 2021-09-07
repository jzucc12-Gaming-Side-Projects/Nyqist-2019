event_inherited();
if(keyboard_check_pressed(global.controls[? "cancel"]))
	choice = 3;
#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		#region //Go to Audio/Display menu
		case 0:
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_aud_disp_menu);
			break;
		}
		#endregion
		
		#region //Go to Gameplay sdtting menu
		case 1:
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_gameplay_setting_menu);
			break;
		}
		#endregion
		
		#region //Go to control menu
		case 2:
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_control_menu);
			break;
		}
		#endregion
		
		#region //Returns to pervious screen
		case 3: 
		{
			if(file_exists("P1_pos_save.txt"))
			{
				instance_destroy();
				with(instance_create_depth(0,0,0,obj_pause_menu))
				{
					cursor = items - 4;
				}
			}
			else
			{
				instance_destroy();
				with(instance_create_depth(0,0,0,obj_main_menu))
				{
					cursor = 2;
				}
			}
			break;
		}
		#endregion
	}
}
#endregion