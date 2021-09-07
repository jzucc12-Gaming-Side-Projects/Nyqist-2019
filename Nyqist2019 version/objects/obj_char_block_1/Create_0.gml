traits = ds_map_create();
stats = ds_map_create();
ds_map_copy(traits,global.player1_traits);
ds_map_copy(stats,global.player1_stats);
event_inherited();

