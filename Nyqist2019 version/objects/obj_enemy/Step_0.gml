alive = (hp > 0);

var increment = init / 100;
if(!global.gameplay_setting[? "active"])
{
	if(!instance_exists(obj_action))
		ATB = Approach(ATB, increment, 100);
}
else
	ATB = Approach(ATB, increment, 100);
	
full = (ATB == 100);

#region //Determine action
if(full && alive)
{
	action = random(1);
	
	var lower = 0;
	var upper = 0;
	var ii = 0;
	while(perform == -1)
	{	
		if(ii != 0)
			lower += action_array[ii-1];
		upper = lower + action_array[ii];
		if(action >= lower && action <= upper)
			perform = ii;
		else
			ii++;
	}
	ATB = 0;
	full = false;
}
#endregion