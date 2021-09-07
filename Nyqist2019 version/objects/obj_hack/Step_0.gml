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
		ds_map_copy(attack_stats, player_stat);
		ds_map_copy(attack_tool, weapon);
	}
	#endregion
	
	for(var ii = 0; ii < num_attack; ii++)
	{
		if(grouping)
			pos = ii;
		
		if(special[1])
		{
			#region //Target information
			var foe_evasion;
			var foe_def;
			var foe_vuln;
			if(side == "l")
			{
				foe_evasion = targets[pos].agil;
				foe_def = targets[pos].tech_def;
				foe_vuln = targets[pos].vuln;
			}
			else if(side == "r")
			{
				with(targets[pos])
				{
					foe_evasion = stats[? "Evasion"];
					foe_def = stats[? "Tech Def"];
					foe_vuln = stats[? "Vuln"];
				}
			}
			#endregion
		
			#region //Hit roll
			var hit_roll = random(99)+1;
			var crit = (100 - attack_stats[? "Crit Hit"] - selected_tech[? "Crit Hit"]) < hit_roll;
			var hit = hit_roll + attack_stats[? "Accuracy"] + selected_tech[? "Accuracy"];
			#endregion
			
			#region //Damage
			if(hit < foe_evasion && !crit)
				show_debug_message("miss");
			else
			{
				show_debug_message("hit");
				var dmg = random(selected_tech[? "Tech Dmg"]);
				dmg += attack_stats[? "Tech Dmg"];
		
				if(crit)
				{
					dmg = dmg * attack_stats[? "Crit Dmg"] * selected_tech[? "Crit Dmg"];
					show_debug_message("crit");
				}
			
				if(num_attack > 1)
					dmg = dmg*selected_tech[? "Reduction"];	
				dmg = round(dmg);
				dmg = Approach(dmg, foe_def, 0);
				dmg *= Vulnerable(selected_tech[? "Type"],foe_vuln);
				if(side == "l")
					targets[pos].hp = Approach(targets[pos].hp, dmg, 0);
	
				else if(side == "r")
				{
					with(targets[pos])
						stats[? "HP"] = Approach(stats[? "HP"], dmg, 0);
				}
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