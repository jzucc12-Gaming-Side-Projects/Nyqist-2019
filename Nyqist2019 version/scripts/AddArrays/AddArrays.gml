/// @description AddArrays(type, vuln, res, immune, bug, bug_vuln, bug_res, bug_immune, boost,
							///special, tier, ID)
function AddArrays(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {

	/// @param Type
	/// @param Vuln
	/// @param Res
	/// @param Immune
	/// @param Bug
	/// @param Bug_Vuln
	/// @param Bug_Res
	/// @param Bug_Immune
	/// @param Boost
	/// @param Special
	/// @param Tier
	/// @param ID

	// Adds stats to equipment/tech

	var _type = argument0;
	var _vuln = argument1;
	var _res = argument2;
	var _imm = argument3;
	var _bug = argument4;
	var _bvul = argument5;
	var _bres = argument6;
	var _bimm = argument7;
	var _boos = argument8;
	var _spec = argument9;
	var _tier = argument10;
	var _ID = argument11;

	var map = ds_map_create();

	if(_tier == -1)
		ds_map_copy(map,ID_array[| _ID]);
	else
		ds_map_copy(map,ID_grid[# _tier-1, _ID]);

	map[? "Type"] = _type;
	map[? "Vuln"] = SetVuln(_vuln,_res);
	map[? "Immune"] = _imm;
	map[? "Bug"] = _bug;
	map[? "Bug Vuln"] = SetVuln(_bvul,_bres);
	map[? "Bug Immune"] = _bimm;
	map[? "Boost"] = _boos;
	map[? "Special"] = _spec;

	if(_tier == -1)
		ds_map_copy(ID_array[| _ID],map);
	else
		ds_map_copy(ID_grid[# _tier-1, _ID],map);

	ds_map_destroy(map);


}
