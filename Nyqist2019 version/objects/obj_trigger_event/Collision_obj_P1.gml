#region //Logic for a room transition
if(transition) && (obj_P1.has_control)
{
	ChangeRoom(target_room);
}
#endregion

#region//Logic for tripping events event
var tripped = false;
if(trip_event) && (talk_event) && (keyboard_check_pressed(vk_enter))
{
	tripped = true;
}
if(trip_event) && (!talk_event)
{
	tripped = true;
}
if(tripped)
{
	for(ii = 0; ii < ds_list_size(global.events); ii++)
	{
		if(string(ds_list_find_value(global.event_names,ii)) == event_tripped)
		{
			ds_list_replace(global.events,ii,true);
		}
	}
}
#endregion