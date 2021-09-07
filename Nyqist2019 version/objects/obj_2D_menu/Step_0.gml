if(control)
{
	#region //Keyboard controls
	if(keyboard_check(global.controls[? "up"])) && (cursor_delay_y <= 0)
	{
		cursor_y--;
		cursor_delay_y = delay_max;
	}
	else if(keyboard_check(global.controls[? "down"])) && (cursor_delay_y <= 0)
	{
		cursor_y++;
		cursor_delay_y = delay_max;
	}
	
	if(keyboard_check(global.controls[? "left"])) && (cursor_delay_x <= 0)
	{
		cursor_x--;
		cursor_delay_x = delay_max;
	}
	else if(keyboard_check(global.controls[? "right"])) && (cursor_delay_x <= 0)
	{
		cursor_x++;
		cursor_delay_x = delay_max;
	}
	cursor_y = Wrap(cursor_y,0,menu_height - 1);
	cursor_x = Wrap(cursor_x,0,menu_width - 1);

	if(keyboard_check_pressed(global.controls[? "select"]))
	{
		choice_y = cursor_y;
		choice_x = cursor_x;
		control = false;
	}
	cursor_delay_y = Approach(cursor_delay_y,1,0);
	cursor_delay_x = Approach(cursor_delay_x,1,0);
	#endregion
		
	#region //Mouse Control
	if(use_mouse)
	{
		var _mouse_x = device_mouse_x(0);
		var _mouse_y = device_mouse_y(0);
		var in_mouse_x;
		var in_mouse_y;
	
		#region //Cursor collision detection
		for(var ii = 0; ii < menu_height; ii++)
		{
			for(var jj = 0; jj < menu_width; jj++)
			{
				switch(xalign)
				{
					case fa_left:
						in_mouse_x = (_mouse_x > items_x[jj]) && (_mouse_x < items_x[jj] + max_width[ii]); break;
					case fa_right:
						in_mouse_x = (_mouse_x > items_x[jj] - max_width[ii]) && (_mouse_x < items_x[jj]); break;
					case fa_center:
						in_mouse_x = (_mouse_x > items_x[jj] - max_width[ii]/2) && (_mouse_x < items_x[jj]  + max_width[ii]/2); break;
				}
		
				in_mouse_y = (_mouse_y > items_y[ii]) && (_mouse_y < items_y[ii] + itemheight);
		
				if(in_mouse_x && in_mouse_y)
					can_click[ii,jj] = true;
				else
					can_click[ii,jj] = false;
		
				if(clicking && can_click[ii,jj] && mouse_check_button_pressed(mb_left) && cursor_y == ii && cursor_x == jj)
				{
					choice_y = ii;
					choice_x = jj;
					control = false;
				}
				else if(clicking && can_click[ii,jj] && mouse_check_button_pressed(mb_left) && cursor_y != ii && cursor_x != jj)
				{
					cursor_y = ii;
					cursor_x = jj;
				}
			}
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