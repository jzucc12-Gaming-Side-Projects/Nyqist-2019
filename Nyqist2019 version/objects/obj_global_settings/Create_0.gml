#region //Set up control keys
global.default_control = ds_map_create();
global.default_control[? "up"] = vk_up;
global.default_control[? "down"] = vk_down;
global.default_control[? "left"] = vk_left;
global.default_control[? "right"] = vk_right;
global.default_control[? "run"] = vk_shift;
global.default_control[? "select"] = vk_enter;
global.default_control[? "cancel"] = ord("B");
global.default_control[? "pause"] = ord("P");
global.controls = ds_map_create();
#endregion

#region //Loads existing controls
if(file_exists("Controls.txt"))
{
		var file = file_text_open_read("Controls.txt");
		var data = file_text_read_string(file);
		ds_map_read(global.controls, data);
		file_text_close(file);
}
else
{
	ds_map_copy(global.controls, global.default_control);
}
#endregion

#region //Audio/Display Default
global.default_aud_disp = ds_map_create();
global.default_aud_disp[? "music"] = 0.5;
global.default_aud_disp[? "sfx"] = 0.5;
global.default_aud_disp[? "zoom"] = 1;
global.default_aud_disp[? "brightness"] = 0.5;
global.default_aud_disp[? "mute_music"] = false;
global.default_aud_disp[? "mute_sfx"] = false;
global.aud_disp_setting = ds_map_create();
#endregion

#region //Loads existing audio/display settings
if(file_exists("Aud_Disp.txt"))
{
		var file = file_text_open_read("Aud_Disp.txt");
		var data = file_text_read_string(file);
		ds_map_read(global.aud_disp_setting, data);
		file_text_close(file);
}
else
{
	ds_map_copy(global.aud_disp_setting, global.default_aud_disp);
}
#endregion

#region //Set Music
global.music_emitter = audio_emitter_create();
var music_volume = global.aud_disp_setting[? "music"] * !global.aud_disp_setting[? "mute_music"];
audio_emitter_gain(global.music_emitter,music_volume);
global.sfx_emitter = audio_emitter_create();
var sfx_volume = global.aud_disp_setting[? "sfx"] * !global.aud_disp_setting[? "mute_sfx"];
audio_emitter_gain(global.sfx_emitter,sfx_volume);
#endregion

#region //Gameplay settings
global.default_game_set = ds_map_create();
global.default_game_set[? "remember"] = false;
global.default_game_set[? "active"] = true;
global.gameplay_setting = ds_map_create();
#endregion

#region //Load gameplay settings
if(file_exists("Game_Setting.txt"))
{
		var file = file_text_open_read("Game_Setting.txt");
		var data = file_text_read_string(file);
		ds_map_read(global.gameplay_setting, data);
		file_text_close(file);
}
else
{
	ds_map_copy(global.gameplay_setting, global.default_game_set);
}
#endregion

#region //Other info
global.MaxHack = 10;
global.MaxEnh = 10;
global.MaxElement = 6;
global.MaxSpecial = 10;
global.MaxBugBoost = 6;
#endregion