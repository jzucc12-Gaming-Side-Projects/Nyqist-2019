var monster_base_x = width * 0.8;
var monster_y_base = height * 0.30;
var monster_y_inc = height * 0.15;

for(var ii = 0; ii < num_monster; ii++)
{
	monster_array[ii].x = width - monster_base_x * (1 - 0.2 * (ii % 2));
	monster_array[ii].y = monster_y_base + monster_y_inc * ii;
}