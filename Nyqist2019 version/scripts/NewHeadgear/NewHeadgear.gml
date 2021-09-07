/// @description NewHeadgear(Name,ID);
/// @param Name
/// @param ID
function NewHeadgear(argument0, argument1) {
	// Adds headgear to a database

	var _name = argument0;
	var _ID = argument1;

	var hdgr = ds_map_create();
	hdgr[? "Name"] = _name;
	hdgr[? "ID"] = _ID;
	ds_list_add(ID_array, ds_map_create());
	ds_map_copy(ID_array[| _ID],hdgr);
	ds_map_destroy(hdgr);


}
