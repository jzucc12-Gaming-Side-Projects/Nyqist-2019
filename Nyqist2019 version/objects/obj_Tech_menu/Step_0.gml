var p_switch = keyboard_check_pressed(global.controls[? "run"]);
var cancel = keyboard_check_pressed(global.controls[? "cancel"]);

event_inherited();

if(p_switch)
{
	p_change = true;
	alarm[0] = 1;
}

if(cancel)
	instance_destroy();
