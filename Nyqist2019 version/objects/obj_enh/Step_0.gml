event_inherited();

#region //Using the tech
if(perform_action)
{
	#region //Number of targets
	if(grouping)
		num_attack = array_length_1d(targets);
	else
		num_attack = 1;
	#endregion
	
	#region //Attacker information
	var attack_stats = ds_map_create();
	var attack_tool = ds_map_create();
	with(acting)
	{
		ds_map_copy(attack_stats,player_stat);
		ds_map_copy(attack_tool,weapon);
	}
	#endregion
	
	for(var ii = 0; ii < num_attack; ii++)
	{
		if(grouping)
			pos = ii;
		
		if(special[0])
		{
			#region //Healing check
			var heal = random(selected_tech[? "Tech Dmg"]);
			heal += attack_stats[? "Tech Dmg"];
			
			if(num_attack > 1)
				heal = heal*selected_tech[? "Reduction"];	
			heal = round(heal);
			if(side == "l")
				targets[pos].hp = Approach(targets[pos].hp, heal, targets[pos].hp_max);
	
			else if(side == "r")
			{
				with(targets[pos])
					stats[? "HP"] = Approach(stats[? "HP"], heal, stats[? "HP Max"]);
			}
			#endregion
		}
	}
	ds_map_destroy(selected_tech);
	ds_map_destroy(attack_stats);
	ds_map_destroy(attack_tool);
	instance_destroy();
}
#endregion