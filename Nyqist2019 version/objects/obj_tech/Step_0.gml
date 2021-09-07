var cursor_old = tech_cursor;
var cursor_move = 0;
var tier_move = 0;
var action_change = false;

#region //Tech selection
if(!tech_selected)
{
	#region //Moving through list
	if(keyboard_check(global.controls[? "down"]) && cursor_delay <= 0)
	{
		cursor_move = 1;
		cursor_delay = delay_max;
	}
	else if(keyboard_check(global.controls[? "up"]) && cursor_delay <= 0)
	{
		cursor_move = -1;
		cursor_delay = delay_max;
	}
	do
	{
		tech_cursor += cursor_move;
		tech_cursor = Wrap(tech_cursor,0,maximum-1);
	}
	until(grid[# tier_array[tech_cursor]-1, tech_cursor] == 1 || cursor_old == tech_cursor)
	cursor_delay = Approach(cursor_delay,1,0);
	#endregion
	
	#region //Changing tiers
	if(keyboard_check(global.controls[? "right"]) && tier_delay <= 0)
	{
		tier_move++;
		tier_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "left"]) && tier_delay <= 0)
	{
		tier_move--;
		tier_delay = delay_max;
	}
	if(tier_move != 0 && grid[# tier_array[tech_cursor]-1 + tier_move, tech_cursor] == 1)
	{
		if(tier_move > 0)
			var lim = 3;
		else
			var lim = 1;
		tier_array[tech_cursor] = Approach(tier_array[tech_cursor],1,lim);
	}
	tier_delay = Approach(tier_delay,1,0);
	#endregion
	
	#region //Exiting tech select
	if(keyboard_check_pressed(global.controls[? "select"]))
	{
		selected_tech = GetTech(class,tier_array[tech_cursor],tech_cursor);
		var tp_left;
		with(acting)
			tp_left = player_stat[? "TP"] - other.selected_tech[? "Cost"];
			
		if(tp_left >= 0)
		{
			special = selected_tech[? "Special"];
			tech_selected = true;
			target_all = special[2];
			action_change = true;
		}
	}
	if(keyboard_check_pressed(global.controls[? "cancel"]))
		instance_destroy();
	#endregion
}
#endregion

if(action_change)
	keyboard_clear(global.controls[? "select"]);

#region //Targeting
if(tech_selected && !perform_action)
{
	event_inherited();
	#region //Exiting back to tech select
	if(keyboard_check_pressed(global.controls[? "cancel"]))
	{
		side = "l";
		pos = 0;
		tech_selected = false;
		for(var ii = 0; ii < num_target; ii++)
			targets[ii].targeted = false;
		targets = foes;
		grouping = false;
		num_target = array_length_1d(targets);
	}
	#endregion
}
#endregion

if(perform_action)
{
	var tech_cost = selected_tech[? "Cost"];
	with(obj_combat_manager)
	{
		if(active < 2)
		{
			with(p1)
				stats[? "TP"] = Approach(stats[? "TP"],tech_cost,0);
		}
		else
		{
			with(p2)
				stats[? "TP"] = Approach(stats[? "TP"],tech_cost,0);		
		}
	}
}
	