player = 1;

event_inherited();

ds_map_copy(traits, global.player1_traits);
ds_map_copy(stats, global.player1_stats);
ds_map_copy(equipment, global.player1_equipment);
sprite_index = traits[? "Side Sprite"];