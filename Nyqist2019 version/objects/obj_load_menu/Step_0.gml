event_inherited();
var yes_no_outcome = -1;
if(keyboard_check_pressed(global.controls[? "cancel"]))
	choice = 6;
#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		//Loading or deleting 
		case 0: 
		case 1:
		case 2:
		case 3:
		case 4:
		{
			#region //Loading case
			if(!deleteMe && !write)
			{
				if(file_exists("File_num_" + string(choice + 1) + ".txt"))
				{
					with(instance_create_depth(0,0,0,obj_yes_no_menu))
					{
						choice_text = "Load File " + string(other.choice + 1) + "?";
						for(var ii = 0; ii < items; ii++)
						{
							items_x[ii] /= 2;
							xalign[ii] = fa_left;
						}
					}
					yes_no_outcome = obj_yes_no_menu.outcome
					if(yes_no_outcome == 1)
					{
						Load(choice + 1, true);
						choice = -1;
						control = true;
						instance_destroy(obj_yes_no_menu);
					}
					else if(yes_no_outcome == 0)
					{
						choice = -1;
						control = true;
						instance_destroy(obj_yes_no_menu);
					}
				}
			}
			#endregion
			
			#region //Deleting case
			else if(deleteMe)
			{
				if(file_exists("File_num_" + string(choice + 1) + ".txt"))
				{
					with(instance_create_depth(0,0,0,obj_yes_no_menu))
					{
						choice_text = "Delete File " + string(other.choice + 1) + "?";
						for(var ii = 0; ii < items; ii++)
						{
							items_x[ii] /= 2;
							xalign[ii] = fa_left;
						}
					}
					yes_no_outcome = obj_yes_no_menu.outcome
					if(yes_no_outcome == 1)
					{
						file_delete("File_num_" + string(choice + 1) + ".txt");
						choice = -1;
						control = true;
						action_taken = true;
						deleteMe = false;
						deleted = true;
						cursor = 0;
						instance_destroy(obj_yes_no_menu);
					}
					else if(yes_no_outcome == 0)
					{
						choice = -1;
						control = true;
						instance_destroy(obj_yes_no_menu);
					}
				}
				else
				{
					choice = -1;
					control = true;
				}
			}
			#endregion
			
			#region //Saving case
			else if(write)
			{
				with(instance_create_depth(0,0,0,obj_yes_no_menu))
				{
					choice_text = "Save to File " + string(other.choice + 1) + "?";
					for(var ii = 0; ii < items; ii++)
					{
						items_x[ii] /= 2;
						xalign[ii] = fa_left;
					}
				}
				yes_no_outcome = obj_yes_no_menu.outcome;
				if(yes_no_outcome == 1)
				{
					Save(choice + 1);
					action_taken = true;
					choice = -1;
					control = true;
					instance_destroy(obj_yes_no_menu);
				}
				else if(yes_no_outcome == 0)
				{
					choice = -1;
					control = true;
					instance_destroy(obj_yes_no_menu);
				}
			}
			#endregion
			break;
		}
		
		#region //Brings player in and out of deletion
		case 5:
		{
			choice = -1;
			control = true;
			cursor = 0;
			deleteMe = !deleteMe;
			break;
		}
		#endregion
		
		#region //Returns to previous menu
		case 6: 
		{
			cursor = -1;
			if(file_exists("P1_pos_save.txt"))
			{
				var file;
				file = file_text_open_read("P1_pos_save.txt");
				return_room = file_text_read_real(file);
				file_text_close(file);
				instance_destroy();
			}
			else
				instance_destroy();
			break;
			#endregion
		}
	}
}
#endregion

#region //Changes item name if deleting
if(!deleteMe)
	menu[5] = "Delete";
else
	menu[5] = "Cancel";
#endregion