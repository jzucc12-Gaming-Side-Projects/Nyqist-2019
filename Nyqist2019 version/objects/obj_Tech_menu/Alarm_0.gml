var key;
if(hack)
{
	key = "Hack";
	maximum = global.MaxHack;
}
else
{
	key = "Enhancement";
	maximum = global.MaxEnh;
}
ds_grid_resize(grid,3,maximum);

if(p_change)
{
	if(instance_exists(obj_char_block_1))
	{
		instance_destroy(obj_char_block_1);
		ds_grid_copy(grid,global.player2_equipment[? key]);
		with(instance_create_depth(xpos_block,ypos_block,0,obj_char_block_2))
			no_stat = true;
	}
	else if(instance_exists(obj_char_block_2))
	{
		instance_destroy(obj_char_block_2);
		ds_grid_copy(grid,global.player1_equipment[? key]);
		with(instance_create_depth(xpos_block,ypos_block,0,obj_char_block_1))
			no_stat = true;
	}
}
else
{
	if(instance_exists(obj_char_block_1))
		ds_grid_copy(grid,global.player1_equipment[? key]);
	else if(instance_exists(obj_char_block_2))
		ds_grid_copy(grid,global.player2_equipment[? key]);
}

for(var ii = 0; ii < ds_grid_height(grid); ii++)
{
	for(var jj = 0; jj < ds_grid_width(grid); jj++)
	{
		if(grid[# jj,ii] == 1)
		{
			var tech = GetTech(key,jj+1,ii);
			menu[ii,jj] = tech[? "Name"];
			ds_map_destroy(tech);
		}
		else
			menu[ii,jj] = "???";
	}
}
p_change = false;