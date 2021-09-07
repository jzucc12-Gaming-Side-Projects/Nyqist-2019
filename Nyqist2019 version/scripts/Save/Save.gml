/// @description Save(file_num)
function Save(argument0) {

	/// @param file_num

	// Saves over a specific file number

	var _file_num = argument0;
	var _file = "File_num_" + string(_file_num) + ".txt";
	var _location = file_text_open_read(working_directory + "P1_pos_save.txt");

#region //Saves player data to player maps

	var player1 = ClonePlayer(global.player1_traits,global.player1_stats,global.player1_equipment);
	var player2 = ClonePlayer(global.player2_traits,global.player2_stats,global.player2_equipment);

#endregion

#region //Saves player maps to overall map
	var party = ds_map_create();
	ds_map_add_map(party,"Player1",player1);
	ds_map_add_map(party,"Player2",player2);
	party[? "room"] = file_text_read_real(_location);
	file_text_readln(_location);
	party[? "xpos"] = file_text_read_real(_location);
	file_text_readln(_location);
	party[? "ypos"] = file_text_read_real(_location);
	file_text_close(_location);

#endregion

#region //Saves party data to a file through a buffer
	var data = json_encode(party);
	var buffer = buffer_create(string_byte_length(data)+1,buffer_fixed,1);
	buffer_write(buffer, buffer_string, data);
	buffer_save(buffer,_file);
#endregion

#region //Delete variables
	buffer_delete(buffer);
	ds_map_destroy(party);
#endregion


}
