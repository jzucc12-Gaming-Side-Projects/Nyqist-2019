player = 2;

event_inherited();

ds_map_copy(traits, global.player2_traits);
ds_map_copy(stats, global.player2_stats);
ds_map_copy(equipment, global.player2_equipment);
sprite_index = traits[? "Side Sprite"];