/// @description TotalMap(player)
/// @param player
function TotalMap(argument0) {
	// Makes Stat Map for total parameters

	// Example
	//		Total = TotalMap(player);

	var _player = argument0;
	var map = ds_map_create();
	if(_player == 1)
		ds_map_copy(map,global.player1_stats);
	else
		ds_map_copy(map,global.player2_stats);
	map[? "HP Max"] = StatTotal(_player, "HP Max");
	map[? "TP Max"] = StatTotal(_player, "TP Max");
	map[? "Evasion"] = StatTotal(_player, "Evasion");
	map[? "Speed"] = StatTotal(_player, "Speed");
	map[? "Accuracy"] = StatTotal(_player, "Accuracy");
	map[? "Phys Dmg"] = StatTotal(_player, "Phys Dmg");
	map[? "Tech Dmg"] = StatTotal(_player, "Tech Dmg");
	map[? "Phys Def"] = StatTotal(_player, "Phys Def");
	map[? "Tech Def"] = StatTotal(_player, "Tech Def");
	map[? "Crit Hit"] = StatTotal(_player, "Crit Hit");
	map[? "Crit Dmg"] = StatTotal(_player, "Crit Dmg");
	map[? "Type"] = StatTotal(_player, "Type");
	map[? "Vuln"] = StatTotal(_player, "Vuln");
	map[? "Immune"] = StatTotal(_player, "Immune");
	map[? "Bug"] = StatTotal(_player, "Bug");
	map[? "Bug Vuln"] = StatTotal(_player, "Bug Vuln");
	map[? "Bug Immune"] = StatTotal(_player, "Bug Immune");
	map[? "Boost"] = StatTotal(_player, "Boost");

	if(map[? "HP"] > map[? "HP Max"])
		map[? "HP"] = map[? "HP Max"];

	if(map[? "TP"] > map[? "TP Max"])
		map[? "TP"] = map[? "TP Max"];

	return map;


}
