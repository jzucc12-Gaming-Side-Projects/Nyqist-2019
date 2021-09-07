room_width = 1620;
room_height = 1080;

if(file_exists("P1_pos_save.txt"))
{
	instance_create_depth(0,0,0,obj_pause_menu);
}
else
{
	audio_play_sound_on(global.music_emitter,snd_vampire_killer,true,1);
	instance_create_depth(0,0,0,obj_main_menu);
}
