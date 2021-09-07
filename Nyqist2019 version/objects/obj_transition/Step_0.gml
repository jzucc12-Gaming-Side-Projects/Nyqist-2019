var player_exists = instance_exists(obj_P1);
#region //Transition logic
#region //Exiting a room
if(exit_room)
{
	if(player_exists)
		obj_P1.has_control = false;
	if(fading < 1)
		fading += fade_increment;
	else
	{
		enter_room = true;
		exit_room = false;
		if(target_room == "next")
			room_goto_next();
		else if(target_room == "previous")
			room_goto_previous();
		else
			room_goto(target_room);
	}
}
#endregion

#region //Entering a room
if(enter_room)
{
	if(player_exists)
		obj_P1.has_control = false;
	if(fading > 0)
		fading -= fade_increment;
	else
	{
		enter_room = false;
		if(player_exists)
			obj_P1.has_control = true;
	}
}
#endregion
#endregion