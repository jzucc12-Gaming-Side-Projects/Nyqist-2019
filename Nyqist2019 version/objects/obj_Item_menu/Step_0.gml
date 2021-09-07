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

//Choosing
var select = keyboard_check_pressed(global.controls[? "select"]);
var cancel = keyboard_check_pressed(global.controls[? "cancel"]);
var group = keyboard_check_pressed(global.controls[? "run"]);
#endregion

var flee = false;

#region //Menu movement
if(!item_selected)
{
	active_pos = Wrap(active_pos + list_mod, 0, ds_list_size(show_list)-1);

	//Moving through a list
	if(count[active_pos] > 0)
		cursor_array[active_pos] = Wrap(cursor_array[active_pos] + cursor_mod,0,count[active_pos]-1);
	
	//Exiting the menu
	if(cancel)
	{
		instance_destroy();
		with(instance_create_depth(0,0,0,obj_pause_menu))
			cursor = 0;	
	}
		
	//Selecting an Item
	if(select && !(count[active_pos] == 0))
	{
		var item = ds_map_create();
		var item_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
		item = GetInv(title[active_pos], item_pos);
		var special = item[? "Special"];
		flee = special[7];
		if(!special[6] && !flee)
		{
			item_selected = true;
			select_all = special[4];
			can_group = special[2];
		}
		ds_map_destroy(item);
	}
}
#endregion

#region //Using an item
else
{
	//Changing selected character
	if(can_group && group)
		select_all = !select_all;
	if(!select_all && arrow_pos == 1 && cursor_mod != 0)
		arrow_pos = 2;
	else if(!select_all && arrow_pos == 2 && cursor_mod != 0)
		arrow_pos = 1;
	
	//Using the item
	if(select)
		alarm[0] = 1;
	
	//Return to item selection
	if(cancel)
		item_selected = false;
}
#endregion

// Flee item
if(flee)
{
	//Double check and GTFO
}