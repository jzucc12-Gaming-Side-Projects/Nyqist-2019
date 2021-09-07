//Draw background
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_blend(back_id, c_gray);

#region //Player
p_change = false;
var x_buff = sprite_get_width(global.player1_traits[? "Face Sprite"]);
xpos_block = gui_width/2 + x_buff/2 + 1.5*border_width;
ypos_block = 3*border_width; //3*border_width
with(instance_create_depth(xpos_block,ypos_block,0,obj_char_block_1))
	no_stat = true;
#endregion

#region //Stats
stat_list = ["Cost", "Tech Dmg", "Reduction", "Accuracy", "Crit Hit", "Crit Dmg"];
stat_length = array_length_1d(stat_list);
player = 1;

var width = ds_list_create();
for (var ii = 0; ii < stat_length; ii++)
	ds_list_add(width,string_width(stat_list[ii]));
ds_list_sort(width,false);
stat_width = ds_list_find_value(width,0);
ds_list_destroy(width);
#endregion

#region //Menu info
hack = true;
maximum = global.MaxHack;
grid = ds_grid_create(3,maximum);
ds_grid_copy(grid,global.player1_equipment[? "Hack"]);
for(var ii = 0; ii < ds_grid_height(grid); ii++)
{
	for(var jj = 0; jj < ds_grid_width(grid); jj++)
	{
		if(grid[# jj,ii] == 1)
		{
			var tech = GetTech("Hack",jj+1,ii);
			menu[ii,jj] = tech[? "Name"];
			ds_map_destroy(tech);
		}
		else
			menu[ii,jj] = "Unknown";
	}
}
#endregion

event_inherited();
