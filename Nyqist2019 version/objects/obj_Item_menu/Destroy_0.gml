CleanUp();
with(obj_char_block_1)
{
	global.player1_stats[? "HP"] = stats[? "HP"];
	global.player1_stats[? "TP"] = stats[? "TP"];
}
with(obj_char_block_2)
{
	global.player2_stats[? "HP"] = stats[? "HP"];
	global.player2_stats[? "TP"] = stats[? "TP"];

}
ds_list_copy(global.Items,show_list);
instance_destroy(obj_char_block_1);
instance_destroy(obj_char_block_2);
ds_list_destroy(show_list);