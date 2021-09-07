#region //Targeting
#region //Controls
var key = 0;
var side_key = "n";
if(keyboard_check_pressed(global.controls[? "left"]))
	side_key = "l";
else if(keyboard_check_pressed(global.controls[? "right"]))
	side_key = "r";
if(keyboard_check_pressed(global.controls[? "down"]))
	key = 1;
else if(keyboard_check_pressed(global.controls[? "up"]))
	key = -1;
#endregion

#region //Changing sides and group targeting
var num_alive = 0;
for(var ii = 0; ii < num_target; ii++)
{
	if(targets[ii].alive)
		num_alive++;
}

if(always_all)
{
	grouping = true;
	for(var ii = 0; ii < num_target; ii++)
		targets[ii].targeted = true;	
}

if(side_key != "n")
{
	//Switching Sides
	if(side != side_key && (!grouping || always_all))
	{
		side = side_key;
		pos = 0;
		for(var ii = 0; ii < num_target; ii++)
		{
			targets[ii].targeted = false;
		}
		if(side_key == "l")
			targets = foes;
		else if(side_key == "r")
			targets = team;
		num_target = array_length_1d(targets);
	}
	//Deselecting an entire side
	else if(side != side_key && grouping)
	{
		grouping = false;
		for(var ii = 0; ii < num_target; ii++)
		{
			targets[ii].targeted = false;
		}
	}
	//Selecing an entire side
	else if(side == side_key && target_all && num_alive > 1)
	{
		grouping = true;
		for(var ii = 0; ii < num_target; ii++)
			targets[ii].targeted = true;
	}
}
#endregion

#region //Change single target
if(!grouping)
{
	do
	{
		pos += key;
		pos = Wrap(pos,0,num_target - 1);
		if(key == 0)
			key = 1;
	}
	until(targets[pos].alive)	
	
	for(var ii = 0; ii < num_target; ii++)
	{
		if(pos == ii)
			targets[ii].targeted = true;
		else
			targets[ii].targeted = false;
	}
}
#endregion

#region //Selecting the target
if(keyboard_check_pressed(global.controls[? "select"]))
	perform_action = true;
#endregion
#endregion

// Insert action in child objects