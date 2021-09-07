/// @description ClonePlayer(trait, stat, equip)
function ClonePlayer(argument0, argument1, argument2) {

	/// @param trait
	/// @param stat
	/// @param equip

	// Creates a cloned map of a player

	// Examples:
	//		var temp = ClonePlayer(trait, stat, equip);

	var _trait = argument0;
	var _stat = argument1;
	var _equip = argument2;

	var _player = ds_map_create();
	ds_map_add_map(_player, "Traits", ds_map_create());
	ds_map_add_map(_player, "Stats", ds_map_create());
	ds_map_add_map(_player, "Equipment", ds_map_create());
	ds_map_copy(_player[? "Traits"], _trait);
	ds_map_copy(_player[? "Stats"], _stat);
	ds_map_copy(_player[? "Equipment"], _equip);
	return _player;


}
