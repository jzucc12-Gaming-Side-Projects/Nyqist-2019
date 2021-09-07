//Choosing
var select = keyboard_check_pressed(global.controls[? "select"]);
var cancel = keyboard_check_pressed(global.controls[? "cancel"]);
var action_change = false;
var flee = false;

#region //Menu movement
if(!item_selected)
{
	#region //Controls
	var cursor_mod = 0;
	if(keyboard_check(global.controls[? "up"])) && (cursor_delay <= 0)
	{
		cursor_mod--;
		cursor_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "down"])) && (cursor_delay <= 0)
	{
		cursor_mod++;
		cursor_delay = delay_max;
	}

	//List changing
	var list_mod = 0;
	if(keyboard_check(global.controls[? "left"])) && (list_delay <= 0)
	{
		list_mod--;
		list_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "right"])) && (list_delay <= 0)
	{
		list_mod++;
		list_delay = delay_max;
	}
	cursor_delay = Approach(cursor_delay,1,0);
	list_delay = Approach(list_delay,1,0);
	#endregion

	#region	//Moving through a list
	active_pos = Wrap(active_pos + list_mod, 0, ds_list_size(show_list)-2);

	if(count[active_pos] > 0)
		cursor_array[active_pos] = Wrap(cursor_array[active_pos] + cursor_mod,0,count[active_pos]-1);
	#endregion
	
	#region //Exiting the menu
	if(cancel)
		instance_destroy();
	#endregion
		
	#region//Selecting an Item
	if(select && !(count[active_pos] == 0))
	{
		var item = ds_map_create();
		var item_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
		item = GetInv(title[active_pos], item_pos);
		var special = item[? "Special"];
		flee = special[7];
		if(!special[5] && !flee)
		{
			action_change = true;
			item_selected = true;
			always_all = special[4];
			target_all = special[2];
			if(active_pos = 1)
			{
				side = "l";
				targets = foes;
				num_target = array_length_1d(targets);
			}
		}
		ds_map_destroy(item);
		#endregion
	}
}
#endregion

if(action_change)
	keyboard_clear(global.controls[? "select"]);

#region //Targeting
if(item_selected && !perform_action)
{
	event_inherited();
	#region //Exiting back to tech select
	if(cancel)
	{
		side = "r";
		pos = 0;
		item_selected = false;
		for(var ii = 0; ii < num_target; ii++)
		{
			targets[ii].targeted = false;
		}
		targets = team;
		grouping = false;
		num_target = array_length_1d(targets);
	}
	#endregion
}
#endregion
#region //Item Usage
if(perform_action)
{
	var item_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
	
	if(side == "r" && grouping)
		var target_array = [1,2];
	else if(side == "r" && !grouping)
		var target_array = [pos+1];
	else if(side == "l" && grouping)
		var target_array = targets;
	else if(side == "l" && !grouping)
		var target_array = [targets[pos]];
	if(ItemEffect(title[active_pos],item_pos,target_array,true))
	{
		ItemEffect(title[active_pos],item_pos,target_array,false)
		if(count[active_pos])
		{
			if(UseInv(title[active_pos],cursor_array[active_pos],1))
			{
				count[active_pos]--;
				item_selected = false;			
			}
		}
		instance_destroy();
	}
	else
		perform_action = false;
}
#endregion