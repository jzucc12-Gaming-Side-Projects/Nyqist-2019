#region //Turn box location
var turn_x = xpos;
var turn_y = ypos;
var border = sprite_get_width(spr_text_box)/3;
draw_set_font(fnt_text);
#endregion

#region //Draw ATB
var ATB_width = 5;
var col;
if(show)
	col = c_red;
else if(full)
	col = c_blue;
else
	col = c_yellow;

draw_set_color(col);
draw_sprite(sprite_index,0,x,y);
draw_line_width(x, y, x + ATB, y, ATB_width);
#endregion

if(show)
{
	NineSlice(spr_text_box, turn_x, turn_y, gui_width, gui_height);

	#region //Draw menu here to align with combat screen
	draw_set_valign(yalign);
	var col;
	for(var ii = 0; ii < items; ii++)
	{
		if(!block_draw[ii])
		{
			draw_set_halign(xalign[ii]);
			var txt = menu[ii];
			var xx = items_x[ii]+border*1.5;
			var yy = items_y[ii] + border*1.5;
			if(cursor == ii)
				col = color_active;
			else
				col = color_inactive;
			draw_set_color(col);
			draw_text(xx,yy,txt);
		}
	}
	#endregion
}