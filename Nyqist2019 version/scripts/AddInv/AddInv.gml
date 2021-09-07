/// @description AddInv(class, item, qty)
/// @param class
/// @param item
/// @param qty
function AddInv(argument0, argument1, argument2) {
	// Adds item to inventory

	// Example
	//		AddInv("Recovery", 1);

#region //Determine grid
	var _class = argument0;
	var _item = argument1;
	var _qty = argument2;
	var grid = ds_grid_create(2,1);
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

#region //Adds item
	var width = ds_grid_width(grid);
	var height = ds_grid_height(grid);
	var exist = false;
	for(var ii = 0; ii < height; ii++)
	{
		if(grid[# 0, ii] == _item)
		{
			grid[# 1, ii] = Approach(grid[# 1, ii], _qty, 99);
			exist = true;
			break
		}
	
	}
	if(!exist)
	{
		ds_grid_resize(grid,width,height+1);
		ds_grid_set(grid,0,height,_item);
		ds_grid_set(grid,1,height,_qty);
		ds_grid_sort(grid,0,true);
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


}
