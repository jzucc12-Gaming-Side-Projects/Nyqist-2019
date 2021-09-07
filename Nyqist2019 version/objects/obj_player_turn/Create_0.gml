#region //Menu parameters
ATB = 0;
player_trait = ds_map_create();
player_stat = ds_map_create();
player_equip = ds_map_create();
weapon = ds_map_create();
blocking = false;
full = false;
old_full = full;
control = false;
show = false;
#endregion

#region //Remembering positions
enh_cursor_remember = 0;
enh_tier_remember = array_create(global.MaxEnh,1);
hack_cursor_remember = 0;
hack_tier_remember = array_create(global.MaxHack,1);;
item_cursor_remember = array_create(ds_list_size(global.Items));
item_activepos_remember = 0;
#endregion

#region //Menu items
menu[0] = "Attack";
menu[1] = "Hacks";
menu[2] = "Enhancements";
menu[3] = "Block";
menu[4] = "Item";
menu[5] = "Flee";
#endregion

event_inherited();

#region //ATB positioning
x = display_get_gui_width() * 0.55;
#endregion

for(var ii = 0; ii < items; ii++)
{
	xalign[ii] = fa_left;
}