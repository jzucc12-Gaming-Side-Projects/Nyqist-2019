event_inherited();

show_list = ds_list_create();
title = ["Recovery", "Offense", "Utility"];
ds_list_copy(show_list, global.Items);

//Item variables
delay_max = 15;
cursor_delay = 0;
list_delay = 0;
if(global.gameplay_setting[? "remember"])
{
	with(acting)
	{
		other.cursor_array = item_cursor_remember;
		other.active_pos = item_activepos_remember;
	}
}
else
{
	cursor_array = array_create(ds_list_size(show_list));	
	active_pos = 0;
}
count = array_create(ds_list_size(show_list));
for(var ii = 0; ii < array_length_1d(count) ; ii++)
	count[ii] = ds_grid_height(show_list[| ii]);
	
//Item usage
item_selected = false;
arrow_pos = 1;
select_all = false;

//Other variables
side = "r";
targets = team;
num_target = array_length_1d(targets);
show_length = 6;
desc_box_x = 0;
desc_box_y = 0;
with(obj_player_turn)
{
	other.desc_box_x = xpos;
	other.desc_box_y = ypos;
}