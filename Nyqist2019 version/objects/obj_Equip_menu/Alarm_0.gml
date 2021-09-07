if(player == 1)
{
	player = 2
	stats1 = stats_active;
	stats_active = stats2;
	instance_destroy(obj_char_block_1);
	equip[0,0] = global.player2_equipment[? "Weapon 1"];
	equip[0,1] = global.player2_equipment[? "Weapon 2"];
	equip[1,0] = global.player2_equipment[? "Armor"];
	equip[1,1] = global.player2_equipment[? "Headgear"];
	equip[2,0] = global.player2_equipment[? "Aug 1"];
	equip[2,1] = global.player2_equipment[? "Aug 2"];
	with(instance_create_depth(xpos1,ypos1,0,obj_char_block_2))
		no_stat = true;
}
else if(player == 2)
{
	player = 1
	stats2 = stats_active;
	stats_active = stats1;
	instance_destroy(obj_char_block_2);
	equip[0,0] = global.player1_equipment[? "Weapon 1"];
	equip[0,1] = global.player1_equipment[? "Weapon 2"];
	equip[1,0] = global.player1_equipment[? "Armor"];
	equip[1,1] = global.player1_equipment[? "Headgear"];
	equip[2,0] = global.player1_equipment[? "Aug 1"];
	equip[2,1] = global.player1_equipment[? "Aug 2"];
	with(instance_create_depth(xpos1,ypos1,0,obj_char_block_1))
		no_stat = true;
}
for(var ii = 0; ii < show_list; ii++)
	cursor_array[ii] = 0;
mode_selected = false;
equip_selected = false;
cursor_x = 0;
cursor_y = 0;