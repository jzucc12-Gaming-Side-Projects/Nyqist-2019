/// @description NewTech(Name,ID,Tier,Class,Cost,Spread,Reduction)
/// @param Name
/// @param Tier
/// @param ID
/// @param Class
/// @param Cost
/// @param Spread
/// @param Reduction
function NewTech(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// Adds tech to a database

	var _name = argument0;
	var _tier = argument1;
	var _ID = argument2;
	var _class = argument3;
	var _cost = argument4;
	var _sprd = argument5;
	var _redu = argument6;

	var tech = ds_map_create();
	tech[? "Name"] = _name;
	tech[? "Tier"] = _tier;
	tech[? "ID"] = _ID;
	tech[? "Class"] = _class;
	tech[? "Cost"] = _cost;
	tech[? "Spread"] = _sprd;
	tech[? "Reduction"] = _redu;

	ds_grid_set(ID_grid,_tier-1,_ID, ds_map_create());
	ds_map_copy(ID_grid[# _tier-1, _ID], tech);
	ds_map_destroy(tech);


}
