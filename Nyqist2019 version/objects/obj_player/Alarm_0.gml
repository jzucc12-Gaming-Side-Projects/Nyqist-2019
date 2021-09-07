#region //Set up weapon and ATB positioning
with(w1)
{
	ds_map_copy(player_trait,other.traits);
	ds_map_copy(player_stat,other.stats);
	ds_map_copy(player_equip,other.equipment);
	weapon = GetInv("Weapon", player_equip[? "Weapon 1"]);
	y = other.player_info_y + 1.75*itemheight;
	menu[0] = "Attack with '" + weapon[? "Name"] + "'";
}

with(w2)
{
	ds_map_copy(player_trait,other.traits);
	ds_map_copy(player_stat,other.stats);
	ds_map_copy(player_equip,other.equipment);
	weapon = GetInv("Weapon", player_equip[? "Weapon 2"]);
	y = other.player_info_y + 2.75*itemheight;
	menu[0] = "Attack with '" + weapon[? "Name"] + "'";
}
#endregion*/