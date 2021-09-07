event_inherited();
if(keyboard_check_pressed(global.controls[? "cancel"]))
	choice = 5;
	
y = items_y[cursor];

#region //Clamp menu
if(y >= items_y[items-1] - obj_disp_manager.ideal_height/2 + 2*itemheight)
	y = items_y[items-1] - obj_disp_manager.ideal_height/2 + 2*itemheight;

if(y <= obj_disp_manager.ideal_height/2)
	y = obj_disp_manager.ideal_height/2;

var view = matrix_build_lookat(x,y,-1,x,y,0,0,1,0);
camera_set_view_mat(view_camera[0],view);
#endregion

#region //Cursor hovering for slider usage
music_slider.control = (cursor == 0);
sfx_slider.control = (cursor == 1);
bright_slider.control = (cursor == 3);
#endregion

#region //Adjust slider global parameters
global.aud_disp_setting[? "music"] = Interpolate(music_slider.par_min,music_slider.par_max,music_slider.parameter,0,1);
var music_volume = global.aud_disp_setting[? "music"] * !global.aud_disp_setting[? "mute_music"];
if(music_slider.in_use || choice == 4)
	mute_music_button.pressed = false;
audio_emitter_gain(global.music_emitter,music_volume);

global.aud_disp_setting[? "sfx"] = Interpolate(sfx_slider.par_min,sfx_slider.par_max,sfx_slider.parameter,0,1);
var sfx_volume = global.aud_disp_setting[? "sfx"] * !global.aud_disp_setting[? "mute_sfx"];
audio_emitter_gain(global.sfx_emitter,sfx_volume);

#region //Mutes music to hear sound effect
if(sfx_slider.in_use)
{
	test = true;
	mute_sfx_button.pressed = false;
}
if(test && !sfx_slider.in_use)
{
	test = false;
	audio_play_sound_on(global.sfx_emitter,snd_zelda,false,99999);
	audio_pause_sound(snd_vampire_killer);
}
else if(!audio_is_playing(snd_zelda))
	audio_resume_sound(snd_vampire_killer);
#endregion

global.aud_disp_setting[? "brightness"] = Interpolate(bright_slider.par_min,bright_slider.par_max,bright_slider.parameter,0,1);
#endregion

#region //Adjust screen size with mouse
if(zoom_out_button.pressed)
{
	with(obj_disp_manager)
	{
		global.aud_disp_setting[? "zoom"] = Approach(global.aud_disp_setting[? "zoom"],0.25,zoom_min);
		alarm_set(1,1);
	}
}
if(zoom_in_button.pressed)
{
	with(obj_disp_manager)
	{
		global.aud_disp_setting[? "zoom"] = Approach(global.aud_disp_setting[? "zoom"],0.25,zoom_max);
		alarm_set(1,1);
	}
}
#endregion

#region //Adjust screen size with keys
if(cursor == 2)
{
	if(keyboard_check_pressed(global.controls[? "left"]))
	{
		with(obj_disp_manager)
		{
			global.aud_disp_setting[? "zoom"] = Approach(global.aud_disp_setting[? "zoom"],0.25,zoom_min);
			alarm_set(1,1);
		}
	}
	if(keyboard_check_pressed(global.controls[? "right"]))
	{
		with(obj_disp_manager)
		{
			global.aud_disp_setting[? "zoom"] = Approach(global.aud_disp_setting[? "zoom"],0.25,zoom_max);
			alarm_set(1,1);
		}
	}
}
#endregion

#region //Mute with the mouse
with(mute_music_button)
{
	global.aud_disp_setting[? "mute_music"] = pressed;
	draw_symbol = pressed;
}		

with(mute_sfx_button)
{
	global.aud_disp_setting[? "mute_sfx"] = pressed;
	draw_symbol = pressed;
}
#endregion

#region //Choice Selection
if(choice != -1)
{
	switch(choice)
	{
		default: 
		{
			choice = -1;
			control = true;
			break;
		}
		
		#region //Mutes music
		case 0:
		{
			choice = -1;
			control = true;
			global.aud_disp_setting[? "mute_music"] = !global.aud_disp_setting[? "mute_music"];
			mute_music_button.pressed = !mute_music_button.pressed;
			break;
		}
		#endregion
		
		#region //Mutes sfx
		case 1:
		{
			choice = -1;
			control = true;
			global.aud_disp_setting[? "mute_sfx"] = !global.aud_disp_setting[? "mute_sfx"];
			mute_sfx_button.pressed = !mute_sfx_button.pressed;
			break;
		}
		#endregion
		
		#region //Restore to default
		case 4:
		{
			choice = -1;
			control = true;
			var temp = ds_map_write(global.default_aud_disp)
			ds_map_read(global.aud_disp_setting,temp);
			music_slider.parameter = Interpolate(0,1,global.aud_disp_setting[? "music"],music_slider.par_min,music_slider.par_max);
			sfx_slider.parameter = Interpolate(0,1,global.aud_disp_setting[? "sfx"],sfx_slider.par_min,sfx_slider.par_max);
			bright_slider.parameter = Interpolate(0,1,global.aud_disp_setting[? "brightness"],bright_slider.par_min,bright_slider.par_max);
			audio_emitter_gain(global.music_emitter,global.aud_disp_setting[? "music"]);
			with(obj_disp_manager)
			{
				alarm_set(1,1);
			}
			break;
		}
		#endregion
		
		#region //Returns to pervious screen
		case 5: 
		{
			var file = file_text_open_write("Aud_Disp.txt");
			var data = ds_map_write(global.aud_disp_setting);
			file_text_write_string(file,data);
			file_text_close(file);
			instance_destroy();
			instance_create_depth(0,0,0,obj_settings_menu);
			break;
		}
		#endregion
	}
}
#endregion