/// @description Load(file_num, change)
function Load(argument0, argument1) {

	/// @param file_num
	/// @param change

	// Loads saved game from a specific file number

	var _file_num = argument0;
	var _change_room = argument1;
	var _file = "File_num_" + string(_file_num) + ".txt";

#region //Loads data from a buffer
	var buffer = buffer_load(_file);
	var data = buffer_read(buffer, buffer_string);
	var party = json_decode(data);
#endregion
	
#region //Loads player data to players 1 and 2'
	var player1 = ds_map_create();
	ds_map_copy(player1, party[? "Player1"]);
	ds_map_copy(global.player1_traits, player1[? "Traits"]);
	ds_map_copy(global.player1_stats, player1[? "Stats"]);
	ds_map_copy(global.player1_equipment, player1[? "Equipment"]);

	var player2 = ds_map_create();
	ds_map_copy(player2, party[? "Player2"]);
	ds_map_copy(global.player2_traits, player2[? "Traits"]);
	ds_map_copy(global.player2_stats, player2[? "Stats"]);
	ds_map_copy(global.player2_equipment, player2[? "Equipment"]);
#endregion
	
#region //Loads Current Position data
	var _room = party[? "room"];
	var _xpos = party[? "xpos"];
	var _ypos = party[? "ypos"];
	var pos_file = file_text_open_write(working_directory + "P1_pos_save.txt");
	file_text_write_real(pos_file,_room);
	file_text_writeln(pos_file);
	file_text_write_real(pos_file,_xpos);
	file_text_writeln(pos_file);
	file_text_write_real(pos_file,_ypos);
	file_text_close(pos_file);
#endregion
	
	ds_map_destroy(party);
	buffer_delete(buffer);
	audio_stop_all();
	if(_change_room)
		ChangeRoom(_room);


}
