/// @description ItemEffect(class, pos, target_array, test)
/// @param class
/// @param pos
/// @param target_array
/// @param test
function ItemEffect(argument0, argument1, argument2, argument3) {
	// Runs through an effect of an item. Returns true if item is used
	// Use numbers for players, otherwise include enemy objects

	// Example
	//		var used = ItemEffect(title[active_pos], item_pos, target_array);

#region //Set variables
	var _class = argument0;
	var _pos = argument1;
	var _target_array = argument2;
	var _test = argument3;

	var item = ds_map_create();
	item = GetInv(_class,_pos);
	var special = item[? "Special"];
	var target = ds_map_create();
	var used = false;
	var player = 0;
#endregion

	for(var ii = 0; ii < array_length_1d(_target_array); ii++)
	{
	#region //Target determination
		if(_target_array[ii] == 1)
		{
			player = 1;
			if(instance_exists(obj_char_block_1))
			{
				with(obj_char_block_1)
					ds_map_copy(target,stats);
			}
			else
			{
				with(obj_player1)
					ds_map_copy(target,stats);
			}
		}
		else if(_target_array[ii] == 2)
		{
			player = 2;
			if(instance_exists(obj_char_block_2))
			{
				with(obj_char_block_2)
					ds_map_copy(target,stats);
			}
			else
			{
				with(obj_player2)
					ds_map_copy(target,stats);
			}
		}
	#endregion
	
	#region //Specials
		if(special[0])
		{
			if(target[? "HP"] != target[? "HP Max"])
			{
				used = true;
				target[? "HP"] = Approach(target[? "HP"], item[? "Dmg"], target[? "HP Max"]);
			}
		}
		if(special[8])
		{
			//Use_boolean = Revive function(...)
		}
	#endregion

	#region //Copy stats back
		if(!_test)
		{
			if(_target_array[ii] == 1)
			{
				if(instance_exists(obj_char_block_1))
				{
					with(obj_char_block_1)
						ds_map_copy(stats,target);
				}
				else
				{
					with(obj_player1)
						ds_map_copy(stats,target);
				}
			
			}
			else if(_target_array[ii] == 2)
			{
				if(instance_exists(obj_char_block_2))
				{
					with(obj_char_block_2)
						ds_map_copy(stats,target);
				}
				else
				{
					with(obj_player2)
						ds_map_copy(stats,target);
				}
			}
		}
	#endregion
	}

	ds_map_destroy(item);
	ds_map_destroy(target);

	return used;


}
