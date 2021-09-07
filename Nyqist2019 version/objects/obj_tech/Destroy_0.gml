CleanUp();
if(global.gameplay_setting[? "remember"])
{
	with(acting)
	{
		if(other.hack)
		{
			hack_cursor_remember = other.tech_cursor;
			hack_tier_remember = other.tier_array;
		}
		else
		{
			enh_cursor_remember = other.tech_cursor;
			enh_tier_remember = other.tier_array;			
		}
	}
}
ds_grid_destroy(grid);
event_inherited();