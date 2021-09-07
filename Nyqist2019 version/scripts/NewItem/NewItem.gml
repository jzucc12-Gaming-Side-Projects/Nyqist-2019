/// @description NewItem(Name,ID,Class,Dmg,Accuracy,Type,Special)
/// @param Name
/// @param ID
/// @param Class
/// @param Dmg
/// @param Accuracy
/// @param Type
/// @param Special
function NewItem(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	// Adds item to a database

	var _name = argument0;
	var _ID = argument1;
	var _class = argument2;
	var _dmg = argument3;
	var _accu = argument4;
	var _type = argument5;
	var _spec = argument6;

	var item = ds_map_create();
	item[? "Name"] = _name;
	item[? "ID"] = _ID;
	item[? "Class"] = _class;
	item[? "Dmg"] = _dmg;
	item[? "Accuracy"] = _accu;
	item[? "Type"] = _type;
	item[? "Special"] = _spec;

	ds_list_add(ID_array,ds_map_create());
	ds_map_copy(ID_array[| _ID],item);
	ds_map_destroy(item);


}
