event_inherited();

if(file_exists("P1_pos_save.txt"))
{
	with(instance_create_depth(0,0,0,obj_pause_menu))
		cursor = items - 3 + !other.write;
}
else
{
	with(instance_create_depth(0,0,0,obj_main_menu))
		cursor = 1;	
}