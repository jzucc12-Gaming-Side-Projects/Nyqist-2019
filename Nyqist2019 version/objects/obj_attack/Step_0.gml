event_inherited();
if(keyboard_check_pressed(global.controls[? "cancel"]))
	instance_destroy();

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
		ds_map_copy(attack_tool,weapon);
		ds_map_copy(attack_stats,player_stat);
	}
	#endregion
	
	for(var ii = 0; ii < num_attack; ii++)
	{
		if(grouping)
			pos = ii;
		#region //Target information
		var foe_evasion;
		var foe_def;
		var foe_vuln;
		if(side == "l")
		{
			foe_evasion = targets[pos].agil;
			foe_def = targets[pos].phys_def;
			foe_vuln = targets[pos].vuln;
		}
		else if(side == "r")
		{
			with(targets[pos])
			{
				foe_evasion = stats[? "Evasion"];
				foe_def = stats[? "Phys Def"];
				foe_vuln = stats[? "Vuln"];
			}
		}
		#endregion
		
		#region //Hit roll
		var hit_roll = random(99)+1;
		var crit = (100 - attack_stats[? "Crit Hit"] - attack_tool[? "Crit Hit"]) < hit_roll;
		var hit = hit_roll + attack_stats[? "Accuracy"] + attack_tool[? "Accuracy"];
		#endregion
	
		#region //Damage
		if(hit < foe_evasion && !crit)
			show_debug_message("miss");
		else
		{
			show_debug_message("hit");
			var dmg = random(attack_tool[? "Phys Dmg"]);
			dmg += attack_stats[? "Phys Dmg"];
		
			if(crit)
			{
				dmg = dmg * attack_stats[? "Crit Dmg"] * attack_tool[? "Crit Dmg"];
				show_debug_message("crit");
			}
			var stat_type = attack_stats[? "Type"];
			var weapon_type = attack_tool[? "Type"];
			var attack_type = array_create(global.MaxElement,0);
			for(var ii = 0; ii < global.MaxElement; ii++)
				attack_type[ii] = sign(stat_type[ii] + weapon_type[ii]);
			if(num_attack > 1)
				dmg = dmg*2/3;	
			dmg = round(dmg);
			dmg = Approach(dmg, foe_def, 0);
			
			dmg *= Vulnerable(attack_stats[? "Type"],foe_vuln);
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
	ds_map_destroy(attack_tool);
	ds_map_destroy(attack_stats);
	instance_destroy();
}