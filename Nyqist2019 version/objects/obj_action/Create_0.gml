with(obj_combat_manager)
{
	other.acting = players[active];
	other.foes = monster_array;
	other.team[0] = p1;
	other.team[1] = p2;
	can_control = false;
}
menu[0] = " ";

pos = 0;
side = "l";
targets = foes;
num_target = array_length_1d(targets);
grouping = false;
perform_action = false;
always_all = false;

//Include "target_all" conditions