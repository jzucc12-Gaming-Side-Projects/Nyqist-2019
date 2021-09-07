CleanUp();
ds_grid_destroy(grid);
event_inherited();
with(instance_create_depth(0,0,0,obj_pause_menu))
	cursor = 3 - other.hack;