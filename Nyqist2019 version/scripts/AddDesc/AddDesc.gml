/// @description AddDesc(Desc, tier, ID)
/// @param Desc
/// @param Tier (-1 if not in grid)
/// @param ID
function AddDesc(argument0, argument1, argument2) {
	// Adds a description to an item, weapon, etc


	var _desc = argument0;
	var _tier = argument1;
	var _ID = argument2;

	var map = ds_map_create();

	if(_tier == -1)
	{
		ds_map_copy(map,ID_array[| _ID]);
		map[? "Desc"] = _desc;
		ds_map_copy(ID_array[| _ID],map);
	}
	else
	{
		ds_map_copy(map,ID_grid[# _tier-1, _ID]);
		map[? "Desc"] = _desc;
		ds_map_copy(ID_grid[# _tier-1, _ID],map);
	}
	ds_map_destroy(map);


}
