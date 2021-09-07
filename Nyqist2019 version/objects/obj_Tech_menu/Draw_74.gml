//Overall variables
var box_color = c_black;
var border_color = c_blue;
var tech = ds_map_create();

#region //Tech Box
//variables
var buff = 2*border_width;
var box_left = items_x[0] - spacing_x/2;
var box_right = items_x[2] + spacing_x/2;
var box_top = ypos - buff;
var box_bottom = items_y[maximum - 1] + itemheight + buff;

//Draw box
draw_set_color(box_color);
draw_rectangle(box_left,box_top,box_right,box_bottom,0);
draw_set_color(border_color);
for(var ii = 0; ii < 3+1; ii++)
{
	if(ii == 0)
		var xp = box_left;
	else if(ii == 3)
		xp = box_right
	else
		xp = items_x[ii] - spacing_x/2;
	
	var y1 = box_top;
	var y2 = box_bottom;
	DrawRectWidth(xp,y1,xp,y2,border_width/2);
}
for(var ii = 0; ii < maximum+1; ii++)
{
	var x1 = box_left;
	var x2 = box_right;
	if(ii == 0)
		var yp = box_top;
	else if(ii = maximum)
		yp = box_bottom;
	else
		yp = box_top + ii*itemheight*spacing_y + sign(ii)*border_width/2;
	DrawRectWidth(x1,yp,x2,yp,border_width/2);
}
#endregion

#region //Stats
#region //Set Up
//Variables
var stat_box_left = gui_width * .6;
var stat_box_right = stat_box_left + 500;
var stat_box_bottom = box_bottom;
var stat_box_top = box_top + (stat_box_bottom-box_top)*.53;
	
var stat_top = stat_box_top + 2*border_width;
var stat_spacing = 2*font_get_size(fnt_text_small);
var stat_current = stat_top;
var left_side = stat_box_left + 2*border_width;
var stat_left = left_side + stat_width;
	
var stat_box_mid = stat_box_left + (stat_box_right - stat_box_left)*.5;
var type_mid = stat_box_mid + (stat_box_right - stat_box_mid)*.5;
var type_left = stat_box_mid + 6*border_width;
var type_inc_x = (stat_box_right - stat_box_mid)*.25;
var type_inc_y = 30;
var type_cur_y = stat_top + 55;
var type_cur_x = type_left;
var bug_top = stat_top + 125;
	
if(hack)
	var class = "Hack";
else
	var class = "Enhancement";
tech = GetTech(class, cursor_x+1, cursor_y);
		
//Draw box
draw_set_color(box_color);
draw_rectangle(stat_box_left, stat_box_top, stat_box_right, stat_box_bottom,0);
draw_set_color(border_color);
DrawRectWidth(stat_box_left, stat_box_top, stat_box_right, stat_box_bottom, border_width);
#endregion

#region //Draw
draw_set_font(fnt_text_small);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for(var ii = 0; ii < stat_length; ii++)
{
	//Name
	draw_set_color(c_white);
	var name_txt = stat_list[ii] +":";
	if(name_txt = "Tech Dmg")
		name_txt = "Power";
	draw_text(left_side,stat_current,name_txt);
		
	if(grid[# cursor_x,cursor_y] == 1)
	{
		//Stat
		if((stat_list[ii] == "Reduction" && tech[? "Spread"]) || stat_list[ii] != "Reduction")
		{
			if(stat_list[ii] == "Reduction")
				var stat_txt = string(round((1-tech[? stat_list[ii]]) * 100)) + "%";
			else
				var stat_txt = tech[? stat_list[ii]];
			draw_text(stat_left,stat_current,stat_txt);
		}
		else
			draw_text(stat_left,stat_current,"N/A");
	}
	stat_current += stat_spacing;
}
#endregion
	
#region //Elemental Type and status bugs
draw_set_color(c_blue);
DrawRectWidth(stat_box_mid,stat_box_top,stat_box_mid,stat_box_bottom,border_width);

#region //Type
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(type_mid,stat_top,"Type");

if(grid[# cursor_x,cursor_y] == 1)
	var elem_type = tech[? "Type"];
else
	var elem_type = array_create(global.MaxElement,0);
var type_color = [c_red, c_yellow, c_blue, c_green, c_white, c_purple];
for(var ii = 0; ii < global.MaxElement; ii++)
{
	draw_set_color(type_color[ii]);
	if(elem_type[ii])
		draw_set_alpha(1);
	else
		draw_set_alpha(0.3);
	draw_circle(type_cur_x,type_cur_y,10,false);
	type_cur_x += type_inc_x;
	if(ii == 2)
	{
		type_cur_y += type_inc_y;
		type_cur_x = type_left;
	}
}
draw_set_alpha(1);
#endregion

#region /Boost/Bug
type_cur_y = bug_top + 55;
type_cur_x = type_left;
draw_set_color(c_white);

if(grid[# cursor_x,cursor_y] == 1)
{
	if(hack)
		var status_type = tech[? "Bug"];
	else
		var status_type = tech[? "Boost"];
}
else
	var status_type = array_create(global.MaxBugBoost,0);

if(hack)
{
	var status_color = [c_green, c_purple, c_blue, c_gray, c_yellow, c_red];
	draw_text(type_mid,bug_top,"Bug");

}
else
{
	var status_color = [c_white, c_red, c_orange, c_blue, c_gray, c_green];
	draw_text(type_mid,bug_top,"Boost");
}
	
for(var ii = 0; ii < global.MaxBugBoost; ii++)
{
	draw_set_color(status_color[ii]);
	if(status_type[ii])
		draw_set_alpha(1);
	else
		draw_set_alpha(0.3);
	draw_circle(type_cur_x,type_cur_y,10,false);
	
	type_cur_x += type_inc_x;
	if(ii == 2)
	{
		type_cur_y += type_inc_y;
		type_cur_x = type_left;
	}
}
draw_set_alpha(1);		
#endregion
#endregion
#endregion

#region //Description box
//Variables
var buff = 30;
var desc_left = stat_box_left - 2*buff;
var desc_right = stat_box_right + 2*buff;
var desc_bottom = stat_box_top - 2*buff;
var desc_top = desc_bottom - 250;

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
	
if(grid[# cursor_x, cursor_y] == 1)
{
	draw_set_font(fnt_text);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(xtext, ytext, tech[? "Name"]);
	ytext += spacing;
	draw_text_ext(xtext,ytext, tech[? "Desc"], spacing*2/3, text_width);
	ytext += 3*spacing;
}
#endregion

ds_map_destroy(tech);
