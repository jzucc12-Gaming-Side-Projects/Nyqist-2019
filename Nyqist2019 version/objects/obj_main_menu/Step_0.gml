event_inherited();

#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		case 0: 
		{
			audio_stop_all();
			instance_destroy();
			room_goto(rm0); 
			break;
		}
		case 1: 
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_load_menu);
			break;
		}
		case 2: 
		{
			instance_destroy();
			instance_create_depth(0,0,0,obj_settings_menu);
			break;
		}
		case 3: 
		{
			game_end(); 
			break;
		}
	}
}
#endregion