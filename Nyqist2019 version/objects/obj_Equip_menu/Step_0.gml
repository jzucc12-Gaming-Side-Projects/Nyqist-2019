//Choosing
var select = keyboard_check_pressed(global.controls[? "select"]);
var cancel = keyboard_check_pressed(global.controls[? "cancel"]);
var p_switch = keyboard_check_pressed(global.controls[? "run"]);
var unequip_all = false;

if(p_switch)
	alarm[0] = 1;
	
event_inherited();

#region //Mode selection
if(!mode_selected)
{
	#region //Controls
	var mode_mod = 0;
	if(keyboard_check(global.controls[? "left"])) && (mode_delay <= 0)
	{
		mode_mod--;
		mode_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "right"])) && (mode_delay <= 0)
	{
		mode_mod++;
		mode_delay = delay_max;
	}
	mode_delay = Approach(mode_delay,1,0);	
	#endregion
	
	#region //Movement
	mode_cursor = Wrap(mode_cursor + mode_mod, 0, array_length_1d(modes)-1);
	#endregion
	
	if(cancel)
		instance_destroy();
		
	#region //Selection
	if(select)
	{
		switch(mode_cursor)
		{
			case 0:
			{
				select = false;
				mode_selected = true;
				unequip = false;
				control = true;
				break;
			}
			case 1:
			{
				select = false;
				mode_selected = true;
				unequip = true;
				control = true;
				break;
			}
			case 2:
			{
				unequip_all = true;
				break;
			}
		}
	}
	#endregion
}
#endregion

#region //Selecting equipment submenu
if(!equip_selected && mode_selected)
{
	var key = EquipKey(cursor_x,cursor_y);
	for(var ii = 0; ii < array_length_1d(scripts);ii++)
	{
		if(scripts[ii] == key)
			active_pos = ii;
	}
	
	if(cancel)
	{
		control = false;
		mode_selected = false;
		cursor_x = 0;
		cursor_y = 0;
	}
	
	#region //Unequip
	if(select && unequip)
	{
		var equipped = equip[cursor_y,cursor_x];
		if(!((equipped == -1) || (key == "Weapon" && equipped == 0)))
			AddInv(key,equipped,1);
		if(key == "Weapon")
			equip[cursor_y,cursor_x] = 0;
		else
			equip[cursor_y,cursor_x] = -1;
		
		if(cursor_x mod 2 == 0 && key == "Weapon")
			key = "Weapon 1";
		else if(cursor_x mod 2 != 0 && key == "Weapon")
			key = "Weapon 2";
			
		if(player == 1)
			global.player1_equipment[? key] = equip[cursor_y,cursor_x];
		else
			global.player2_equipment[? key] = equip[cursor_y,cursor_x];
		control = true;
		stats_active = TotalMap(player);
		
	}
	#endregion
	else if(select)
	{
		if(count[active_pos] != 0)
		{
			select = false;
			equip_selected = true;
		}
		else
			control = true;
	}
}
#endregion

#region //Changing equipment
else if(equip_selected && mode_selected)
{
	#region //Controls
	var cursor_mod = 0;
	if(keyboard_check(global.controls[? "up"])) && (cursor_delay <= 0)
	{
		cursor_mod--;
		cursor_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "down"])) && (cursor_delay <= 0)
	{
		cursor_mod++;
		cursor_delay = delay_max;
	}
	cursor_delay = Approach(cursor_delay,1,0);
	
	//List changing
	var list_mod = 0;
	/*
	if(keyboard_check(global.controls[? "left"])) && (list_delay <= 0)
	{
		list_mod--;
		list_delay = delay_max;
	}
	if(keyboard_check(global.controls[? "right"])) && (list_delay <= 0)
	{
		list_mod++;
		list_delay = delay_max;
	}
	list_delay = Approach(list_delay,1,0);
	*/
	#endregion
	
	#region //Movement
	active_pos = Wrap(active_pos + list_mod, 0, ds_list_size(show_list)-1);

	//Moving through a list
	if(count[active_pos] > 0)
		cursor_array[active_pos] = Wrap(cursor_array[active_pos] + cursor_mod,0,count[active_pos]-1);
	#endregion
	
	#region //Swapping equipment
	if(select)
	{
		var equipped = equip[cursor_y,cursor_x];
		var equipping = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
		if(equipped != equipping)
		{
			cancel = true;
			var key = EquipKey(cursor_x,cursor_y);			
			equip[cursor_y,cursor_x] = equipping;
			UseInv(key,cursor_array[active_pos],1);
			
			if(!((equipped == -1) || (key == "Weapon" && equipped == 0)))
				AddInv(key,equipped,1);
			
			for(var ii = 0; ii < array_length_1d(count); ii++)
				count[ii] = ds_grid_height(show_list[| ii]);
				
			if(cursor_x mod 2 == 0 && key == "Weapon")
				key = "Weapon 1";
			else if(cursor_x mod 2 != 0 && key == "Weapon")
				key = "Weapon 2";
			if(player == 1)
				global.player1_equipment[? key] = equip[cursor_y,cursor_x];
			else
				global.player2_equipment[? key] = equip[cursor_y,cursor_x];
			stats_active = TotalMap(player);
		}
	}
	#endregion
	
	#region //Return to equipment selection
	if(cancel)
	{
		equip_selected = false;
		control = true
		for(var ii = 0; ii < show_list; ii++)
			cursor_array[ii] = 0;
	}
	#endregion
}
#endregion

#region //Unequip all
if(unequip_all)
{
	for(var ii = 0; ii < array_height_2d(equip); ii++)
	{
		for(var jj = 0; jj <= 1; jj++)
		{
			var key = EquipKey(jj,ii);
			var equipped = equip[ii,jj];
			if(!((equipped == -1) || (key == "Weapon" && equipped == 0)))
				AddInv(key,equipped,1);
			if(key == "Weapon")
			{
				equip[ii,jj] = 0;
				if(jj mod 2 == 0)
					key = "Weapon 1";
				else
					key = "Weapon 2";
			}
			else
				equip[ii,jj] = -1;
			if(player == 1)
				global.player1_equipment[? key] = equip[ii,jj];
			else if(player == 2)
				global.player2_equipment[? key] = equip[ii,jj];
		}
	}
	stats_active = TotalMap(player);
}
#endregion
