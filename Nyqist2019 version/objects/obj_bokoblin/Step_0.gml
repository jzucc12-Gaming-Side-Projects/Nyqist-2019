#region //Changes action percentage based off of set parameters
if(((hp / hp_max) < 0.5) && !alarm0_trip)
{
	alarm[0] = 1;
}
#endregion

event_inherited();

var block_val = 20;

#region //Actions
if(perform != -1)
{
	
	if(blocking)
	{
		blocking = false;
		agil -= block_val;
	}
	
	switch(perform)
	{
		case 0:
		{
			show_debug_message("kick");		
			var target_roll = round(random(1) + 1);
			var target_choice = array_create(1, obj_player);
			with(obj_combat_manager)
			{
				if(target_roll == 1)
					target_choice[0] = p1;
				else if(target_roll == 2)
					target_choice[0] = p2;
			}
			EnemyAttack(15, 10, 10, 1.3, self, target_choice, true, SetElement());
			break;
		}
	
		case 1:
		{
			show_debug_message("swing");
			break;
		}
	
		case 2:
		{
			show_debug_message("block");
			blocking = true;
			agil += block_val;
			break;
		}
	}
	perform = -1;
}
#endregion