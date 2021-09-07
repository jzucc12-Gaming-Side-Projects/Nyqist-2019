var increment = player_stat[? "Speed"] / 100;
if(!global.gameplay_setting[? "active"])
{
	if(!instance_exists(obj_action))
		ATB = Approach(ATB, increment*10, 100);
}
else
	ATB = Approach(ATB, increment, 100);

full = (ATB == 100);

if(full && blocking)
{
	blocking = false;
	player_stat[? "Evasion"] -= weapon[? "Evasion"];
}
event_inherited();

#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		case 0:
		{
			instance_create_depth(0,0,0,obj_attack);
			choice = -1;
			break;
		}
		
		case 1:
		{
			instance_create_depth(0,0,0,obj_hack);
			choice = -1;
			break;
		}
		
		case 2:
		{
			instance_create_depth(0,0,0,obj_enh);
			choice = -1;
			break;
		}
		
		case 3:
		{
			choice = -1;
			ATB = 0;
			blocking = true;
			player_stat[? "Evasion"] += weapon[? "Evasion"]
			break;
		}
		
		case 4:
		{
			instance_create_depth(0,0,0,obj_item);
			choice = -1;
			break;
		}
		
		case 5:
		{
			instance_destroy(obj_combat_manager);
			break;
		}
	}
}
#endregion

if((old_full != full || !show) && !global.gameplay_setting[? "remember"])
	cursor = 0;