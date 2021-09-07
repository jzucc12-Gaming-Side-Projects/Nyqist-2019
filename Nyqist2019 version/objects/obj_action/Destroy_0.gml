with(obj_combat_manager)
	can_control = true;

for(var ii = 0; ii < num_target; ii++)
	targets[ii].targeted = false;

if(perform_action)
{
	with(obj_combat_manager)
		players[active].ATB = 0;
}

event_inherited();
