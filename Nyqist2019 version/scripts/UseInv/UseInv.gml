/// @description UseInv(class, pos, qty)
/// @param class
/// @param pos
/// @param qty
function UseInv(argument0, argument1, argument2) {
	// Expends item from inventory

	// Example
	//		UseInv("Recovery", 1, 2);

#region //Determines grid
	var _class = argument0;
	var _pos = argument1;
	var _qty = argument2;
	var grid = ds_grid_create(2,1);
	var used_up = false;
	switch(_class)
	{
		case "Recovery":
		{
			ds_grid_copy(grid,global.Recovery);
			break;
		}
		case "Offense":
		{
			ds_grid_copy(grid,global.Offense);
			break;
		}	
		case "Utility":
		{
			ds_grid_copy(grid,global.Utility);
			break;
		}
		case "Key":
		{
			ds_grid_copy(grid,global.Key);
			break;
		}
		case "Weapon":
		{
			ds_grid_copy(grid,global.Weapons);
			break;
		}
		case "Armor":
		{
			ds_grid_copy(grid,global.Armor);
			break;
		}
		case "Headgear":
		{
			ds_grid_copy(grid,global.Headgear);
			break;
		}
		case "Aug":
		{
			ds_grid_copy(grid,global.Augment);
			break;
		}
	}
#endregion

#region //Subtracts item
	var new_val = Approach(grid[# 1,_pos], _qty,0);
	if(new_val > 0)
		grid[# 1,_pos] = new_val;

	else if(ds_grid_height(grid) > 0)
	{
		var grid_width = ds_grid_width(grid);
		var grid_height = ds_grid_height(grid);
		ds_grid_set_grid_region(grid, grid, 0, _pos+1, grid_width-1, grid_height-1, 0,_pos);
		ds_grid_resize(grid,grid_width,grid_height-1);
		used_up = true;
	}
#endregion

#region //Copies grid back
	switch(_class)
	{
		case "Recovery":
		{
			ds_grid_copy(global.Recovery,grid);
			break;
		}
		case "Offense":
		{
			ds_grid_copy(global.Offense,grid);
			break;
		}	
		case "Utility":
		{
			ds_grid_copy(global.Utility,grid);
			break;
		}
		case "Key":
		{
			ds_grid_copy(global.Key,grid);
			break;
		}
		case "Weapon":
		{
			ds_grid_copy(global.Weapons,grid);
			break;
		}
		case "Armor":
		{
			ds_grid_copy(global.Armor,grid);
			break;
		}
		case "Headgear":
		{
			ds_grid_copy(global.Headgear,grid);
			break;
		}
		case "Aug":
		{
			ds_grid_copy(global.Augment,grid);
			break;
		}
	}
#endregion

	ds_grid_destroy(grid);
	return used_up;


}
