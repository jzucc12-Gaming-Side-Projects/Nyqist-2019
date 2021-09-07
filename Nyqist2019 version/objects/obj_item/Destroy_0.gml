CleanUp();
if(global.gameplay_setting[? "remember"])
{
	with(acting)
	{
		item_cursor_remember = other.cursor_array;
		item_activepos_remember = other.active_pos;
	}
}
ds_list_copy(global.Items,show_list);
ds_list_destroy(show_list);
event_inherited();

