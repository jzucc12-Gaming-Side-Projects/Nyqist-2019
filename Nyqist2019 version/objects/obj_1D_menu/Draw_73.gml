#region //Draws the menu
draw_set_valign(yalign);

var col;
for(var ii = 0; ii < items; ii++)
{
	if(!block_draw[ii])
	{
		draw_set_halign(xalign[ii]);
		var txt = menu[ii];
		var xx = items_x[ii];
		var yy = items_y[ii];
		if(cursor == ii)
			col = color_active;
		else if(can_click[ii])
			col = color_mouse;
		else
			col = color_inactive;
		draw_set_color(col);
		draw_text(xx,yy,txt);
	}
}
#endregion