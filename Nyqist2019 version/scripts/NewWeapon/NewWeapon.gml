/// @description NewWeapon(Name,ID,Class,Sprite,Dual,Melee)
/// @param Name
/// @param ID
/// @param Class
/// @param Sprite
/// @param Dual
/// @param Melee
function NewWeapon(argument0, argument1, argument2, argument3, argument4, argument5) {
	// Adds weapon to a database

	var _name = argument0;
	var _ID = argument1;
	var _class = argument2;
	var _sprite = argument3;
	var _dual = argument4;
	var _melee = argument5;

	var wpn = ds_map_create();
	wpn[? "Name"] = _name;
	wpn[? "ID"] = _ID;
	wpn[? "Class"] = _class;
	wpn[? "Sprite"] = _sprite;
	wpn[? "Dual"] = _dual;
	wpn[? "Melee"] = _melee;
	ds_list_add(ID_array, ds_map_create());
	ds_map_copy(ID_array[| _ID],wpn);
	ds_map_destroy(wpn);


}
