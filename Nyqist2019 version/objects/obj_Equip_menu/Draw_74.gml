//Overall variables
draw_set_font(fnt_text);
var itemheight_list = font_get_size(fnt_text);
var box_color = c_black;
var border_color = c_blue;
var start_y = 635;
var eqpt = ds_map_create();

#region //Equipment box
//variables
var x1_left = gui_width/4 - box_width/2;
var x1_right = gui_width/4 + box_width/2;
var y_top = ypos - 1.5*border_width;
var y_bottom = items_y[menu_height-1] + itemheight + 3*border_width;

//Draw box
draw_set_color(box_color);
draw_rectangle(x1_left, y_top, x1_right, y_bottom,0);
draw_set_color(border_color);
DrawRectWidth(x1_left, y_top, x1_right, y_bottom, border_width);
DrawRectWidth(gui_width/4, y_top, gui_width/4, y_bottom, border_width);
#endregion

#region //Modes
draw_set_valign(fa_top);
draw_set_halign(fa_center);
for(var ii = 0; ii < array_length_1d(modes); ii++)
{
	if(ii == mode_cursor && !mode_selected)
		draw_set_color(c_yellow);
	else if(ii == mode_cursor && mode_selected)
		draw_set_color(c_blue);
	else
		draw_set_color(c_white);
	var xx = x1_left + 125 + 200*ii;
	var yy = y_bottom + 10;
	draw_text(xx,yy,modes[ii]);
}
#endregion

#region //Equipment names
draw_set_font(fnt_text_small);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var equipment = ds_map_create();
for(var ii = 0; ii < menu_height; ii++)
{
	for(var jj = 0; jj < menu_width; jj++)
	{
		draw_set_color(color_inactive);
		if(equip[ii,jj] == -1)
			var txt = "None";
		else
		{
			var key = EquipKey(jj,ii);
			equipment = GetInv(key, equip[ii,jj]);
			var txt = equipment[? "Name"];
		}
		if(ii == cursor_y && jj = cursor_x && mode_selected)
			draw_set_color(c_teal);
		else
			draw_set_color(c_white);
		draw_text(items_x[jj], items_y[ii], txt);
	}
}
draw_set_font(fnt_text);
#endregion

#region //Draw item List
//variables

var inc = itemheight_list * 4;
var list_left = 80 + 850;
var list_right = list_left + 530;

//Draw Box
for(var ii = 0; ii < 5; ii++)
{
	var cur_y = start_y + ii*inc;
	draw_set_color(box_color);
	draw_rectangle(list_left, cur_y - inc/2, list_right, cur_y + inc/2,0);
	draw_set_color(border_color);
	DrawRectWidth(list_left, cur_y - inc/2, list_right,cur_y + inc/2, border_width);
	draw_line_width(list_right * 0.93,cur_y - inc/2,list_right * 0.93,cur_y + inc/2,border_width);
}

//Draw Items
draw_set_valign(fa_center);
draw_set_halign(fa_left);
if(count[active_pos] == 0)
{
	draw_set_color(c_white);
	draw_text(list_left + 2*border_width,start_y,"None");
}
else
{
	if(mode_selected && mode_cursor == 0)
	{
		for(var ii = 0; ii < ds_grid_height(show_list[| active_pos]); ii++)
		{	
			var cur_y = start_y + ii*inc;
			var eqpt_pos = ds_grid_get(show_list[| active_pos], 0, ii);
			eqpt = GetInv(scripts[active_pos],eqpt_pos);
			var special = eqpt[? "Special"];
			if(cursor_array[active_pos] == ii && equip_selected)
				draw_set_color(c_yellow);
			else
			{
				if(special[6])
					draw_set_color(c_gray);
				else
					draw_set_color(c_white);
			}
			draw_set_halign(fa_left);
			draw_text(list_left + 2*border_width, cur_y, eqpt[? "Name"]);
			draw_set_halign(fa_right);
			draw_text(list_right - 1*border_width, cur_y, ds_grid_get(show_list[| active_pos],1,ii));
		}
	}
}
#endregion

#region //Stats and modification from new equipment
#region //Set up
#region //Variables
var box_left = x1_left;
var box_right = x1_right;
var box_top = start_y - inc/2;
var box_bottom = start_y + 4*inc + inc/2;
var stat_top = box_top + 2*border_width;
var stat_spacing = 2*font_get_size(fnt_text_small);
var stat_current = stat_top;

var left_side = box_left + 2*border_width;
var stat_name = (box_left + box_right)/2 - stat_width;
var stat_left = stat_name + stat_width;
var stat_arrow = stat_left + 83;
var stat_new = stat_arrow + 15;
var right_wall = stat_new + 73;
var left_wall = stat_name - 20;

var type_mid = (box_left + left_wall)/2;
var bug_mid = (right_wall + box_right)/2;
var type_top = box_top + 10;
var type_bottom = type_top + 100;
var type_inc_x = (left_wall - box_left)*.25;
var type_inc_y = 30;
var type_cur_y = type_top + 45;
var type_cur_x = box_left + 4.5*border_width;
var bug_cur_x = right_wall + 4.5*border_width;
var bug_cur_y = type_top + 45;
var type_array = stats_active[? "Type"];
var type_res = stats_active[? "Vuln"];
var type_immune = stats_active[? "Immune"];
var bug_array = stats_active[? "Bug"];
var bug_res = stats_active[? "Bug Vuln"];
var bug_immune = stats_active[? "Bug Immune"];
var type_color = [c_red, c_yellow, c_blue, c_green, c_white, c_purple];
var bug_color = [c_green, c_purple, c_blue, c_gray, c_yellow, c_red];
var boost_color = [c_white, c_red, c_orange, c_blue, c_gray, c_green];
#endregion

var wpn = ds_map_create();
var equip_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
var new_equip = ds_map_create();
new_equip = GetInv(scripts[active_pos],equip_pos);
var shared = 5;

draw_set_font(fnt_text_small);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

//Draw box
draw_set_color(box_color);
draw_rectangle(box_left, box_top, box_right, box_bottom,0);
draw_set_color(border_color);
DrawRectWidth(box_left, box_top, box_right, box_bottom, border_width);
#endregion

#region //Type and Status
draw_set_color(c_white);
draw_text(type_mid,type_top,"Type");
draw_text(bug_mid,type_top,"Bug");
draw_text(type_mid,type_bottom,"Type Res.");
draw_text(bug_mid,type_bottom,"Bug Res.");
for(var jj = 0; jj < 2; jj++)
{
	#region //Player attack
	if(jj == 0)
	{
		for(var ii = 0; ii < global.MaxElement; ii++)
		{
			draw_set_color(type_color[ii]);
			if(sign(type_array[ii]))
				draw_set_alpha(1);
			else
				draw_set_alpha(0.3);
			draw_circle(type_cur_x,type_cur_y,10,false);
	
			type_cur_x += type_inc_x;
			if(ii == 2)
			{
				type_cur_y += type_inc_y;
				type_cur_x = box_left + 4.5*border_width;
			}
		}
	
		for(var ii = 0; ii < global.MaxBugBoost; ii++)
		{
			draw_set_color(bug_color[ii]);
			if(sign(bug_array[ii]))
				draw_set_alpha(1);
			else
				draw_set_alpha(0.3);
			draw_circle(bug_cur_x,bug_cur_y,10,false);
		
			bug_cur_x += type_inc_x;
			if(ii == 2)
			{
				bug_cur_y += type_inc_y;
				bug_cur_x = right_wall + 4.5*border_width;
			}
		}
	}
	#endregion
	
	#region //Resistances
	if(jj == 1)
	{
		type_cur_x = box_left + 4.5*border_width;
		bug_cur_x = right_wall + 4.5*border_width;
		type_cur_y = type_bottom + 45;
		bug_cur_y = type_bottom + 45;
		
		for(var ii = 0; ii < global.MaxElement; ii++)
		{
			draw_set_color(type_color[ii]);
			if(sign(type_res[ii]) == -1)
				draw_set_alpha(1);
			else if(sign(type_res[ii]))
				draw_set_alpha(1);
			else if(sign(type_immune[ii]))
				draw_set_alpha(1);
			else
				draw_set_alpha(0.3);
			draw_circle(type_cur_x,type_cur_y,10,false);
			shader_reset();

			type_cur_x += type_inc_x;
			if(ii == 2)
			{
				type_cur_y += type_inc_y;
				type_cur_x = box_left + 4.5*border_width;
			}
		}
	
		for(var ii = 0; ii < global.MaxBugBoost; ii++)
		{
			draw_set_color(bug_color[ii]);
			if(sign(bug_res[ii]) == -1)
				draw_set_alpha(1);
			else if(sign(bug_res[ii]))
				draw_set_alpha(1);
			else if(sign(bug_immune[ii]))
				draw_set_alpha(1);
			else
				draw_set_alpha(0.3);
			draw_circle(bug_cur_x,bug_cur_y,10,false);
		
			bug_cur_x += type_inc_x;
			if(ii == 2)
			{
				bug_cur_y += type_inc_y;
				bug_cur_x = right_wall + 4.5*border_width;
			}
		}
	}
	#endregion
}
draw_set_alpha(1);

#endregion

//Draw Stat Names
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for(var jj = 0; jj < 2; jj++)
{
	#region //Switch to weapon 2 location
	if(jj == 1)
	{
		stat_name = center + 1.5*border_width;
		stat_current = stat_top + shared*stat_spacing + 1.5*border_width;
		stat_left = stat_name + stat_width;
		stat_arrow = stat_left + 90;
		stat_new = stat_arrow + 15;
	}
	#endregion
	wpn = GetInv("Weapon",equip[0,jj]);
	
	#region //Draw
	for(var ii = 0; ii < stat_length; ii++)
	{
		#region // Switch to weapon dependant stats
		if(ii == shared && jj == 0)
		{
			draw_set_halign(fa_left);
			stat_name = left_side;
			stat_left = stat_name + stat_width;
			stat_arrow = stat_left + 90;
			stat_new = stat_arrow + 15;
			draw_set_color(border_color);
			DrawRectWidth(box_left, stat_current, box_right, stat_current, border_width);
			var center = (box_left + box_right)/2;
			DrawRectWidth(center,stat_current,center,box_bottom,border_width);
			DrawRectWidth(left_wall, box_top, left_wall, stat_current, border_width);
			DrawRectWidth(right_wall, box_top, right_wall, stat_current, border_width);
			stat_current += 1.5*border_width;
		}
		#endregion
		
		#region //Draw Stats and names
		if(jj == 0 || (jj == 1 && ii > shared-1))
		{
			#region //Name through arrow
			//Name
			draw_set_color(c_white);
			var name_txt = stat_list[ii];
			draw_text(stat_name,stat_current,name_txt +":");
			
			//Old stat
			var old_txt = real(stats_active[? name_txt]);
			if(ii > shared-1)
				old_txt += real(wpn[? name_txt]);
			old_txt = string(old_txt);
			draw_text(stat_left,stat_current,old_txt);
			
			//Arow
			draw_sprite_ext(spr_text_arrow,0,stat_arrow,stat_current,0.8,0.8,90,c_white,1);
			#endregion
			
			#region //Show stat changes for unequipping all
			if(mode_cursor == 2)
			{
				if(player == 1)
					var new_txt = global.player1_base_stats[? name_txt];
				else
					var new_txt = global.player2_base_stats[? name_txt];
				var fist = GetInv("Weapon", 0)
				if(ii < shared)
					new_txt += 2*fist[? name_txt];
				else
					new_txt += fist[? name_txt];
				if(new_txt > old_txt)
					draw_set_color(c_green);
				else if(new_txt < old_txt)
					draw_set_color(c_red);
				draw_text(stat_new,stat_current,new_txt);
			}
			#endregion
			
			#region //Show stat changes for unequipping
			else if(unequip && mode_selected)
			{
				if(ii < shared || jj == cursor_x || key != "Weapon")
				{
					var key = EquipKey(cursor_x,cursor_y);
					if(equip[cursor_y,cursor_x] != -1)
					{
						var equipped = GetInv(key, equip[cursor_y,cursor_x]);
						var old_stat = equipped[? name_txt];
					}
					else
						var old_stat = 0;
					var new_txt = old_txt - old_stat;
					if(key == "Weapon")
					{
						var fist = GetInv("Weapon", 0)
						new_txt += fist[? name_txt];
					}
					if(new_txt > old_txt)
						draw_set_color(c_green);
					else if(new_txt < old_txt)
						draw_set_color(c_red);
					draw_text(stat_new,stat_current,new_txt);
				}
			}
			#endregion
			
			#region //Show stat changes for equipping new
			else if(equip_selected && mode_selected)
			{
				if(ii < shared || jj == cursor_x || key != "Weapon")
				{
					var key = EquipKey(cursor_x,cursor_y);
					if(equip[cursor_y,cursor_x] != -1)
					{
						var equipped = GetInv(key, equip[cursor_y,cursor_x]);
						var old_stat = equipped[? name_txt];
					}
					else
						var old_stat = 0;
					var new_txt = old_txt - old_stat + new_equip[? name_txt];
					if(new_txt > old_txt)
						draw_set_color(c_green);
					else if(new_txt < old_txt)
						draw_set_color(c_red);
					draw_text(stat_new,stat_current,new_txt);
				}
			}
			
			#endregion
			
			stat_current += stat_spacing;
		}
		#endregion
	}
	#endregion
}
#endregion

#region //Description box
//Variables
var buff = 30;
var desc_left = list_left - 2*buff;
var desc_right = list_right + 2*buff;
var desc_bottom = box_top - 2*buff;
var desc_top = 40;

//Draw Box
draw_set_color(box_color);
draw_rectangle(desc_left, desc_top, desc_right, desc_bottom, 0);
draw_set_color(border_color);
DrawRectWidth(desc_left, desc_top, desc_right, desc_bottom, border_width);

//Draw Description
var spacing = 1.8 * font_get_size(fnt_text);
var xtext = desc_left + buff/2;
var ytext = desc_top + buff/2;
var text_width = desc_right - desc_left - buff;
var x_buff = 170;
var y_buff = 18;

if((mode_selected && mode_cursor = 0 && equip[cursor_y,cursor_x] != -1)  || equip_selected)
{
	if(!equip_selected && equip[cursor_y,cursor_x] != -1)
		new_equip = GetInv(scripts[active_pos],equip[cursor_y,cursor_x]);
	
	draw_set_font(fnt_text);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(xtext, ytext, new_equip[? "Name"]);
	draw_set_halign(fa_right);
	xtext += x_buff;
	ytext += spacing;
	
	#region //Weapon Class
	if(scripts[active_pos] == "Weapon")
	{
		draw_text(xtext, ytext, "Class: ");
		draw_set_halign(fa_left);
		draw_text(xtext, ytext, new_equip[? "Class"]);
		draw_set_halign(fa_right);
		ytext += spacing;
	}
	#endregion
	
	#region //Type
	var type_disp = false;
	var buff = 10;
	var equip_type = new_equip[? "Type"];
	for(var ii = 0; ii < global.MaxElement; ii++)
	{
		if(equip_type[ii] && !type_disp)
		{
			draw_text(xtext, ytext, "Type: ");
			draw_set_halign(fa_left);
			type_disp = true;
		}
		if(equip_type[ii])
		{
			draw_set_color(type_color[ii]);
			draw_circle(xtext+buff,ytext+y_buff,10,false);
			buff += type_inc_x*.75;
		}
	}
	if(type_disp)
	{
		ytext += spacing;
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	}
	#endregion
		
	#region //Type Res
	var type_res_disp = false;
	var buff = 10;
	var equip_type_res = new_equip[? "Vuln"];
	var equip_type_immune = new_equip[? "Immune"];
	for(var ii = 0; ii < global.MaxElement; ii++)
	{
		if((equip_type_res[ii] != 0  || equip_type_immune[ii]) && !type_res_disp)
		{
			draw_text(xtext, ytext, "Type Res: ");
			draw_set_halign(fa_center);
			type_res_disp = true;
		}
		if(equip_type_res[ii] != 0 || equip_type_immune[ii])
		{
			draw_set_color(type_color[ii]);
			draw_circle(xtext+buff,ytext+y_buff,10,false);
			buff += type_inc_x*.75;
		}
	}
	if(type_res_disp)
	{
		ytext += spacing;
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	}
	#endregion
	
	#region //Bug
	var bug_disp = false;
	var buff = 10;
	var equip_bug = new_equip[? "Bug"];
	for(var ii = 0; ii < global.MaxBugBoost; ii++)
	{
		if(equip_bug[ii] && !bug_disp)
		{
			draw_text(xtext, ytext, "Bug: ");
			draw_set_halign(fa_left);
			bug_disp = true;
		}
		if(equip_bug[ii])
		{
			draw_set_color(bug_color[ii]);
			draw_circle(xtext+buff,ytext+y_buff,10,false);
			buff += type_inc_x*.75;
		}
	}
	if(bug_disp)
	{
		ytext += spacing;
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	}
	#endregion
	
	#region //Bug Res
	var bug_res_disp = false;
	var buff = 10;
	var equip_bug_res = new_equip[? "Bug Vuln"];
	var equip_bug_immune = new_equip[? "Bug Immune"];
	for(var ii = 0; ii < global.MaxBugBoost; ii++)
	{
		if((equip_bug_res[ii] != 0  || equip_bug_immune[ii]) && !bug_res_disp)
		{
			draw_text(xtext, ytext, "Bug Res: ");
			draw_set_halign(fa_center);
			bug_res_disp = true;
		}
		if(equip_bug_res[ii] != 0 || equip_bug_immune[ii])
		{
			draw_set_color(bug_color[ii]);
			draw_circle(xtext+buff,ytext+y_buff,10,false);
			buff += type_inc_x*.75;
		}
	}
	if(bug_res_disp)
	{
		ytext += spacing;
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	}
	#endregion
	
	#region //Boost
	var boost_disp = false;
	var buff = 10;
	var equip_boost = new_equip[? "Boost"];
	for(var ii = 0; ii < global.MaxBugBoost; ii++)
	{
		if(equip_boost[ii] && !boost_disp)
		{
			draw_text(xtext, ytext, "Boost: ");
			draw_set_halign(fa_left);
			boost_disp = true;
		}
		if(equip_boost[ii])
		{
			draw_set_color(boost_color[ii]);
			draw_circle(xtext+buff,ytext+y_buff,10,false);
			buff += type_inc_x*.75;
		}
	}
	if(boost_disp)
	{
		ytext += spacing;
		draw_set_halign(fa_right);
		draw_set_color(c_white);
	}
	#endregion
	
	ytext += spacing;
	xtext -= x_buff;
	draw_set_halign(fa_left);
	var description = new_equip[? "Desc"];
	draw_text_ext(xtext,ytext, description, spacing*2/3, text_width);
}

#endregion

ds_map_destroy(eqpt);
ds_map_destroy(new_equip);
ds_map_destroy(equipment);
ds_map_destroy(wpn);