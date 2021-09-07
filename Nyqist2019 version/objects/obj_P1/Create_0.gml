//Initiate list of player position (for player 2 following)
x_hstry = ds_list_create();
y_hstry = ds_list_create();
for(var ii = 0; ii <= move_delay; ii++)
{
	ds_list_add(x_hstry,x);
	ds_list_add(y_hstry,y);
}
sprite_index = ds_map_find_value(global.player1_traits,"Down Sprite")