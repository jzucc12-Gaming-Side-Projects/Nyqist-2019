if(control)
{
	#region //Keyboard controls
	if(keyboard_check(global.controls[? "up"])) && (cursor_delay <= 0)
	{
		cursor--;
		cursor_delay = delay_max;
	}
	else if(keyboard_check(global.controls[? "down"])) && (cursor_delay <= 0)
	{
		cursor++;
		cursor_delay = delay_max;
	}
	cursor = Wrap(cursor,0,items - 1);
	if(keyboard_check_pressed(global.controls[? "select"]))
	{
		choice = cursor;
		control = false;
	}
	cursor_delay = Approach(cursor_delay,1,0);
	#endregion
	
	#region //Scrolling
	if(mouse_wheel_down())
	{
		cursor += 1;
	}
	else if(mouse_wheel_up())
	{
		cursor -= 1;
	}

	if(cursor < 0)
		cursor = 0;
	if(cursor > items - 1)
		cursor = items - 1;
	#endregion

	#region //Mouse Control
	if(use_mouse)
	{
		var _mouse_x = device_mouse_x(0);
		var _mouse_y = device_mouse_y(0);
		var in_mouse_x;
		var in_mouse_y;
	
		#region //Cursor collision detection
		for(var ii = 0; ii < items; ii++)
		{
			switch(xalign[ii])
			{
				case fa_left:
					in_mouse_x = (_mouse_x > items_x[ii]) && (_mouse_x < items_x[ii] + max_width); break;
				case fa_right:
					in_mouse_x = (_mouse_x > items_x[ii] - max_width) && (_mouse_x < items_x[ii]); break;
				case fa_center:
					in_mouse_x = (_mouse_x > items_x[ii] - max_width/2) && (_mouse_x < items_x[ii] + max_width/2); break;
			}
		
			in_mouse_y = (_mouse_y > items_y[ii]) && (_mouse_y < items_y[ii] + itemheight);
		
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
	}
	#endregion
	
	#endregion
}

#region //Choice Selection
//Choice selection should be handled in the children object. Example below.
//Place after inherit event.

/*if(choice != -1)
{
	switch(choice)
	{
		case 0: 
		{
			room_goto_next(); 
			break;
		}
		case 1: break;
		case 2: game_end(); break;
	}
}*/
#endregion