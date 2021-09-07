event_inherited();

//Starting variables
tech_selected = false;
show_length = 6;
cursor_delay = 0;
tier_delay = 0;
delay_max = 15;

if(hack)
{
	class = "Hack";
	maximum = global.MaxHack;
}
else
{
	class = "Enhancement";
	maximum = global.MaxEnh;
}

if(global.gameplay_setting[? "remember"])
{
	with(acting)
	{
		if(other.hack)
		{
			other.tech_cursor = hack_cursor_remember;
			other.tier_array = hack_tier_remember;
		}
		else
		{
			other.tech_cursor = enh_cursor_remember;
			other.tier_array = enh_tier_remember;			
		}
	}
}
else
{
	tech_cursor = 0;
	tier_array = array_create(maximum,1);
}

grid = ds_grid_create(3,maximum);
selected_tech = GetTech(class,1,0);
with(obj_player_turn)
{
	other.desc_box_x = xpos;
	other.desc_box_y = ypos;
}

#region //Establish known Techs
with(acting)
{
	if(other.hack)
		ds_grid_copy(other.grid,player_equip[? "Hack"]);
	else
		ds_grid_copy(other.grid,player_equip[? "Enhancement"]);
}
#endregion