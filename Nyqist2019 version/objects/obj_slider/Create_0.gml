#region //Slider parameters
control = false;
//selected = false;
mouse_old = mouse_x;
//can_key = true;
old_param = parameter;
in_use = false;
#endregion

#region //Button parameters
clear = false;
message = "";
cursor = "";
delay = room_speed/2;
alarm_set(0,delay);
spr_block = sprite_get_width(spr_slider_bar)/3;

button = instance_create_depth(x,y-2.5*spr_block/3,0,obj_button);
with(button)
{
	hold = true;
	toggle = false;
	symbol = string(other.parameter);
}
#endregion
