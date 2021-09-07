traits = ds_map_create();
stats = ds_map_create();
ds_map_copy(traits,global.player2_traits);
ds_map_copy(stats,global.player2_stats);
event_inherited();

