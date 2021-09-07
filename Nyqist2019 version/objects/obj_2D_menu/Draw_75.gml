#region //Draws the menu
draw_set_font(font);
draw_set_valign(yalign);
draw_set_halign(xalign);
			
var col;
for(var ii = 0; ii < menu_height; ii++)
{
	for(var jj = 0; jj < menu_width; jj++)
	{
		if(!block_draw[ii,jj])
		{
			var txt = menu[ii,jj];
			var xx = items_x[jj];
			var yy = items_y[ii];
			if(cursor_y == ii && cursor_x == jj)
				col = color_active;
			else if(clicking && can_click[ii,jj])
				col = color_mouse;
			else
				col = color_inactive;
			draw_set_color(col);
			draw_text(xx,yy,txt);
		}
	}
}
#endregion