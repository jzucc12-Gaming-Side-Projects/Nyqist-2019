CleanUp();
ds_map_copy(global.player1_stats,TotalMap(1));
ds_map_copy(global.player2_stats,TotalMap(2));
ds_list_copy(global.Equipment,show_list);
ds_list_destroy(show_list);
ds_map_destroy(stats1);
ds_map_destroy(stats2);
event_inherited();
with(instance_create_depth(0,0,0,obj_pause_menu))
	cursor = 1;		