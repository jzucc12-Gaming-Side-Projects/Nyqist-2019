/// @description NewArmor(Name,ID);
/// @param Name
/// @param ID
function NewArmor(argument0, argument1) {
	// Adds armor to a database

	var _name = argument0;
	var _ID = argument1;

	var arm = ds_map_create();
	arm[? "Name"] = _name;
	arm[? "ID"] = _ID;
	ds_list_add(ID_array, ds_map_create());
	ds_map_copy(ID_array[| _ID],arm);
	ds_map_destroy(arm);


}
