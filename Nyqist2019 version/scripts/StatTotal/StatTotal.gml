/// @description StatToal(player, key)
/// @param player
/// @param key
function StatTotal(argument0, argument1) {
	// Determine player stat adding bonuses from equipment

	// Example
	//		phys_def_total = (1, "Phys Def");

#region //Variables
	//Arguments
	var _player = argument0;
	var _key = argument1;

	//Relevant maps
	var stats = ds_map_create();
	var equip = ds_map_create();
	var wpn1 = ds_map_create();
	var wpn2 = ds_map_create();
	var arm = ds_map_create();
	var hdgr = ds_map_create();
	var array = false;

	//Stat chunks
	if(_key == "Vuln" || _key == "Type" || _key == "Immune")
	{
		array = true;
		var weapon1 = array_create(global.MaxElement,0);
		var weapon2 = array_create(global.MaxElement,0);
		var armor = array_create(global.MaxElement,0);
		var headgear = array_create(global.MaxElement,0);
		var total = array_create(global.MaxElement,0);
	}
	else if(_key == "Bug" || _key == "Bug Vuln" || _key == "Bug Immune" || _key == "Boost")
	{
		array = true;
		var weapon1 = array_create(global.MaxBugBoost,0);
		var weapon2 = array_create(global.MaxBugBoost,0);
		var armor = array_create(global.MaxBugBoost,0);
		var headgear = array_create(global.MaxBugBoost,0);
		var total = array_create(global.MaxBugBoost,0);	
	}
	else
	{
		var base = 0;
		var weapon1 = 0;
		var weapon2 = 0;
		var armor = 0;
		var headgear = 0;
		var total = 0;
	}
#endregion

#region //Determine player
	if(_player == 1)
	{
		ds_map_copy(stats, global.player1_base_stats);
		ds_map_copy(equip, global.player1_equipment);
	}
	else if(_player == 2)
	{
		ds_map_copy(stats, global.player2_base_stats);
		ds_map_copy(equip, global.player2_equipment);
	}
#endregion

#region //Determine total (all but vulnerable or resistance)

	base = stats[? _key];

	if(_key != "Speed" && _key != "Accuracy" && _key != "Phys Dmg" && _key != "Tech Dmg" && _key != "Crit Hit" && _key != "Crig Dmg")
	{
		wpn1 = GetInv("Weapon", equip[? "Weapon 1"]);
		wpn2 = GetInv("Weapon", equip[? "Weapon 2"]);
		weapon1 = wpn1[? _key];
		weapon2 = wpn2[? _key];
	}

	if(equip[? "Armor"] != -1)
	{
		arm = GetInv("Armor", equip[? "Armor"]);
		armor = arm[? _key];
	}
	
	if(equip[? "Headgear"] != -1)
	{
		hdgr = GetInv("Headgear", equip[? "Headgear"]);
		headgear = hdgr[? _key];
	}

	if(array)
	{
			for(var ii = 0; ii < array_length_1d(total); ii++)
				total[ii] = armor[ii] + weapon1[ii] + weapon2[ii] + headgear[ii];
	}
	else
		total = base + weapon1 + weapon2 + armor + headgear;
#endregion

	ds_map_destroy(stats);
	ds_map_destroy(wpn1);
	ds_map_destroy(wpn2);
	ds_map_destroy(equip);
	ds_map_destroy(arm);
	ds_map_destroy(hdgr);

	return total;


}
