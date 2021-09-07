/// @description AddStats(hpm, tpm, evasion, spd, accu, pdm, tdm, pdf, tdf,
function AddStats(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
								//chit, cdm, tier, ID)

	/// @param hp_max
	/// @param tp_max
	/// @param Evasion
	/// @param Speed
	/// @param Accu
	/// @param P_Dmg
	/// @param T_Dmg
	/// @param P_Def
	/// @param T_Def
	/// @param C_Hit
	/// @param C_Dmg
	/// @param Tier
	/// @param ID

	// Adds stats to equipment/tech

	var _hpmax = argument0;
	var _tpmax = argument1;
	var _evasion = argument2;
	var _spd = argument3;
	var _accu = argument4;
	var _phdm = argument5;
	var _tcdm = argument6;
	var _phdf = argument7;
	var _tcdf = argument8;
	var _crht = argument9;
	var _crdm = argument10;
	var _tier = argument11;
	var _ID = argument12;

	var map = ds_map_create();

	if(_tier == -1)
		ds_map_copy(map,ID_array[| _ID]);
	else
		ds_map_copy(map,ID_grid[# _tier-1, _ID]);

	map[? "HP Max"] = _hpmax;
	map[? "TP Max"] = _tpmax;
	map[? "Evasion"] = _evasion;
	map[? "Speed"] = _spd;
	map[? "Accuracy"] = _accu;
	map[? "Phys Dmg"] = _phdm;
	map[? "Tech Dmg"] = _tcdm;
	map[? "Phys Def"] = _phdf;
	map[? "Tech Def"] = _tcdf;
	map[? "Crit Hit"] = _crht;
	map[? "Crit Dmg"] = _crdm;

	if(_tier == -1)
		ds_map_copy(ID_array[| _ID],map);
	else
		ds_map_copy(ID_grid[# _tier-1, _ID],map);

	ds_map_destroy(map);


}
