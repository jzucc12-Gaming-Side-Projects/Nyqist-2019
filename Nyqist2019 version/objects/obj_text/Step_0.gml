var faster = keyboard_check_pressed(global.controls[? "select"]);
if(faster)
	spd *= 20;

letters = min(length, letters + spd);
displayed = string_copy(text,1,floor(letters));
font = fnt_text;
color = c_yellow;
draw_set_font(font);
if(height == 0) 
	height = string_height(text);

// Destroy when done
if(letters >= length) && (keyboard_check_pressed(vk_anykey))
	instance_destroy();