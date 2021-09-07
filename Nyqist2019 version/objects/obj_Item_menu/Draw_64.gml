//Overall variables
draw_set_font(fnt_text);
var itemheight = font_get_size(fnt_text);
var item_width = display_get_gui_width()*0.3;
var box_color = c_black;
var border_color = c_blue;
var border_width = 10;
var item = ds_map_create();

#region //Draw item type headers
//Variables
var ypos = 2*border_width;
var box_width = display_get_gui_width()/ds_list_size(show_list);
var box_top = ypos - border_width;
var box_bottom = ypos + 2*border_width + itemheight;

//Draw
draw_set_valign(fa_top);
draw_set_halign(fa_center);
draw_set_color(c_white);
for(var ii = 0; ii < ds_list_size(show_list); ii++)
{
	//Box
	draw_set_color(box_color);
	draw_rectangle(ii*box_width,  box_top, (ii+1)*box_width, box_bottom,0);
	draw_set_color(border_color);
	DrawRectWidth(ii*box_width,  box_top, (ii+1)*box_width, box_bottom, border_width);	

	//Items
	if(ii == active_pos)
		draw_set_color(c_yellow);
	else
		draw_set_color(c_white);
	draw_text((2*ii+1)/2*box_width, ypos, title[ii]);
	
}
#endregion

#region //Draw item List
//variables
var start_y = 130;
var inc = itemheight*4;
var box_left = border_width/2;
var box_right = item_width - border_width/2;

//Draw Box
draw_set_valign(fa_center);
draw_set_halign(fa_center);
for(var ii = 0; ii < 10; ii++)
{
	var cur_y = start_y + ii*inc;
	draw_set_color(box_color);
	draw_rectangle(box_left, cur_y - inc/2, box_right, cur_y + inc/2,0);
	draw_set_color(border_color);
	DrawRectWidth(box_left, cur_y - inc/2, box_right,cur_y + inc/2, border_width);
	draw_line_width(item_width - 10*border_width,cur_y - inc/2,item_width-10*border_width,cur_y + inc/2,border_width);
}

//Draw Items
if(count[active_pos] == 0)
{
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(2*border_width,start_y,"None");
}
else
{
	for(var ii = 0; ii < ds_grid_height(show_list[| active_pos]); ii++)
	{	
		var cur_y = start_y + ii*inc;
		var item_pos = ds_grid_get(show_list[| active_pos], 0, ii);
		item = GetInv(title[active_pos], item_pos);
		var special = item[? "Special"];
		if(cursor_array[active_pos] == ii)
			draw_set_color(c_yellow);
		else
		{
			if(special[6])
				draw_set_color(c_gray);
			else
				draw_set_color(c_white);
		}
		draw_set_halign(fa_left);
		draw_text(2*border_width, cur_y, item[? "Name"]);
		draw_set_halign(fa_right);
		draw_text(item_width - 2*border_width, cur_y, ds_grid_get(show_list[| active_pos],1,ii));
	}
}
#endregion

#region //Draw item descriptions
//Variables
var buff = 30;
var box_left = item_width + buff;
var box_right = xpos - sprite_get_width(global.player1_traits[? "Face Sprite"]) - 2*border_width - buff;
var box_top = ypos1 - 3*buff;
var box_bottom = ypos2 + 3*buff;

//Draw Box
draw_set_color(box_color);
draw_rectangle(box_left, box_top, box_right, box_bottom, 0);
draw_set_color(border_color);
DrawRectWidth(box_left, box_top, box_right, box_bottom, border_width);

//Draw Description
var item_show = ds_map_create();
var spacing = 2 * font_get_size(fnt_text);
var xtext = box_left + buff/2;
var ytext = box_top + buff/2;
var text_width = box_right - box_left - buff;
if(!count[active_pos] == 0)
{
	var item_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);
	item_show = GetInv(title[active_pos], item_pos);
	draw_set_font(fnt_text);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_text(xtext, ytext, item_show[? "Name"]);
	ytext += spacing;
	draw_text_ext(xtext,ytext, item_show[? "Desc"], spacing*2/3, text_width);
	ytext += 3*spacing;
}
#endregion

#region //Character selection arrow
var ybuff = sprite_get_height(global.player1_traits[? "Face Sprite"])/2 + 50;
if(item_selected)
{
	if(select_all)
	{
		draw_sprite(spr_text_arrow,0,xpos,ypos1 - ybuff);
		draw_sprite(spr_text_arrow,0,xpos,ypos2 - ybuff);
	}
	else
	{
		var arrow_x = xpos;
		var arrow_y;
		if(arrow_pos == 1)
			arrow_y = ypos1;
		else if(arrow_pos == 2)
			arrow_y = ypos2;
		draw_sprite(spr_text_arrow,0,arrow_x,arrow_y - ybuff);
	}
}
#endregion

ds_map_destroy(item);
ds_map_destroy(item_show);