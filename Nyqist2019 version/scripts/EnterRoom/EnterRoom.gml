/// @description EnterRoom(x_start_arr,y_start_arr,entrances,dir)
/// @param x_start_arr
/// @param y_start_arr
/// @param entrances
function EnterRoom(argument0, argument1, argument2, argument3) {

	// Determines the player's starting position depending on their "entrance"

	// Example
	//		EnterRoom([150, 400], [300, 600], ["rm0", "rm01"]);

	var _x_start_arr = argument0;
	var _y_start_arr = argument1;
	var _entrances = argument2;
	var _start = [500,500];
	var _dir = argument3;
	var xx = -1;

#region //Determines starting position
	if(file_exists("P1_pos_save.txt")) 
	{
	#region //Loads position data	
		var file;
		file = file_text_open_read("P1_pos_save.txt");
		var enter_room = file_text_read_real(file);
		file_text_readln(file);
		_start[0] = file_text_read_real(file);
		file_text_readln(file);
		_start[1] = file_text_read_real(file);
		file_text_readln(file);
	#endregion
	
	
		//Determines which entrance the player came from and sets according position
		for(var ii = 0; ii < array_length_1d(_entrances); ii++)
		{
			if(room_get_name(enter_room) == _entrances[ii])
			{
				xx = ii;
				_start[0] = _x_start_arr[ii];
				_start[1] = _y_start_arr[ii];
			}
		}
	}
#endregion

	instance_create_layer(_start[0],_start[1],"P1_" + room_get_name(room),obj_P1);
	instance_create_layer(_start[0],_start[1],"P1_" + room_get_name(room),obj_camera);
	instance_create_layer(_start[0],_start[1],"P2_" + room_get_name(room),obj_P2);

#region //Determines starting facing direction
	if(xx != -1)
	{
		switch(_dir[xx])
		{
			case "l":
			{
				obj_P1.sprite_index = ds_map_find_value(global.player1_traits,"Side Sprite");
				obj_P1.image_xscale = 1;
				obj_P2.sprite_index = ds_map_find_value(global.player2_traits,"Side Sprite");
				obj_P2.image_xscale = 1;
				break;
			}
			case "r":
			{
				obj_P1.sprite_index = ds_map_find_value(global.player1_traits,"Side Sprite");
				obj_P1.image_xscale = -1;
				obj_P2.sprite_index = ds_map_find_value(global.player2_traits,"Side Sprite");
				obj_P2.image_xscale = -1;
				break;
			}
			case "u":
			{
				obj_P1.sprite_index = ds_map_find_value(global.player1_traits,"Up Sprite");
				obj_P2.sprite_index = ds_map_find_value(global.player2_traits,"Up Sprite");
				break;
			}
			case "d":
			{
				obj_P1.sprite_index = ds_map_find_value(global.player1_traits,"Down Sprite");
				obj_P2.sprite_index = ds_map_find_value(global.player2_traits,"Down Sprite");
				break;
			}
		}
	}
#endregion


}
