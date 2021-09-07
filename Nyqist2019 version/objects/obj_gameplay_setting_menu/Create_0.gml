#region //Menu display
menu[0] = "Battle Cursor Setting";
menu[1] = "Battle Timer";
menu[2] = "Primary Character";
menu[3] = "Restore to Default";
menu[4] = "Return";
#endregion

event_inherited();

#region //Other parameters
items_y[items-1] = ypos + total_height - 1.75*spacing*itemheight;
remember = global.gameplay_setting[? "remember"];
primary = (global.player1_traits[? "down_sprite"] == spr_P1_down);
active = global.gameplay_setting[? "active"];
#endregion

#region //Buttons
var offset = 0.2;
var button_scale = 2;
var symbol_scale = 0.85;
remember_button = instance_create_depth(items_x[1]*(1-offset),(items_y[0]+items_y[1])/2,0,obj_button);
with(remember_button)
{
	x_scale = button_scale;
	y_scale = button_scale;
	symbol = "Remember";
	symbol_x_scale = symbol_scale;
	symbol_y_scale = symbol_scale;
	hold = true;
	pressed = other.remember;
	toggle = false;
}

revert_button = instance_create_depth(items_x[1]*(1+offset),(items_y[0]+items_y[1])/2,0,obj_button);
with(revert_button)
{
	x_scale = button_scale;
	y_scale = button_scale;
	symbol = "Revert";
	symbol_x_scale = symbol_scale;
	symbol_y_scale = symbol_scale;
	hold = true;
	pressed = !other.remember;
	toggle = false;
}

active_button = instance_create_depth(items_x[1]*(1-offset),(items_y[1]+items_y[2])/2,0,obj_button);
with(active_button)
{
	x_scale = button_scale;
	y_scale = button_scale;
	symbol = "Active";
	symbol_x_scale = symbol_scale;
	symbol_y_scale = symbol_scale;
	hold = true;
	pressed = other.active;
	toggle = false;
}

wait_button = instance_create_depth(items_x[1]*(1+offset),(items_y[1]+items_y[2])/2,0,obj_button);
with(wait_button)
{
	x_scale = button_scale;
	y_scale = button_scale;
	symbol = "Wait";
	symbol_x_scale = symbol_scale;
	symbol_y_scale = symbol_scale;
	hold = true;
	pressed = !other.active;
	toggle = false;
}

if(file_exists("P1_pos_save.txt"))
{
	symbol_scale = 1.2;
	orc_button = instance_create_depth(items_x[1]*(1-offset),(items_y[2]+items_y[3])/2,0,obj_button);
	with(orc_button)
	{
		x_scale = button_scale;
		y_scale = button_scale;
		symbol = spr_P1_down;
		symbol_x_scale = symbol_scale;
		symbol_y_scale = symbol_scale;
		hold = true;
		pressed = other.primary;
		toggle = false;
	}

	elf_button = instance_create_depth(items_x[1]*(1+offset),(items_y[2]+items_y[3])/2,0,obj_button);
	with(elf_button)
	{
		x_scale = button_scale;
		y_scale = button_scale;
		symbol = spr_P2_down;
		symbol_x_scale = symbol_scale;
		symbol_y_scale = symbol_scale;
		hold = true;
		pressed = !other.primary;
		toggle = false;
	}
}
#endregion