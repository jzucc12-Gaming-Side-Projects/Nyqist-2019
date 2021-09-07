/// @description EnemyAttack(hit, dmg, crit_chance, crit_mult, attacker, targets, physical?,type)
/// @param hit
/// @param crit_chance
/// @param crit_mult
/// @param dmg
/// @param attacker
/// @param targets
/// @param physical?
/// @param type
function EnemyAttack(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	// Goes through a basic enemy attack

	// Example
	//		EnemyAttack(30, 5, 10, 1.2, self, target_array, true,SetElement(4));

	var _hit = argument0;
	var _dmg = argument1;
	var _crit_chance = argument2;
	var _crit_mult = argument3;
	var _attacker = argument4;
	var _targets = argument5;
	var _physical = argument6;
	var _type = argument7;

	var attacks = array_length_1d(_targets);
	var pos = 0;

	for(var ii = 0; ii < attacks; ii++)
	{
		pos = ii;
	
	#region //Target information
		var foe_dodge;
		var foe_def;
		var foe_vuln;
		with(_targets[pos])
		{
			foe_dodge = stats[? "Evasion"];
			foe_def = stats[? "Phys Def"];
			foe_vuln = stats[? "Vuln"];
		}
	#endregion
	
	#region //Hit roll
		var hit_roll = random(99)+1;
		var crit = (100 - _crit_chance) < hit_roll;
		var hit = hit_roll + _attacker.accu + _hit;
	#endregion
	
	#region //Damage
		if(hit < foe_dodge && !crit)
			show_debug_message("enemy_miss");
		else
		{
			show_debug_message("enemy_hit");
			var dmg = random(_dmg);
	
			if(_physical)
				dmg += _attacker.phys_dmg;
			else
				dmg += _attacker.tech_dmg;

			if(crit)
			{
				dmg = dmg * _crit_mult;
				show_debug_message("enemy_crit");
			}
			
			dmg = round(dmg);
			dmg = Approach(dmg, foe_def, 0);
			dmg *= Vulnerable(_type,foe_vuln);	
		
			with(_targets[pos])
				stats[? "HP"] = Approach(stats[? "HP"], dmg, 0);
		}
	#endregion
	}


}
