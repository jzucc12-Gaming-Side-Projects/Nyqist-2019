#region //Draw title with varying color
draw_set_halign(fa_center);
green_px = Wave(255,122,4,0);
var text_color = make_colour_rgb(0,green_px,200);
var title_text;
if(choice == -1)
	title_text = "Control Scheme";
else
	title_text = "Enter new key for '" + heading[choice] + "'";

draw_set_color(text_color);
draw_set_font(fnt_text);
draw_text(gui_width/2,gui_height*0.1,title_text);
#endregion

#region //Draw control heading
for(var ii = 0; ii < heading_items; ii++)
{
	var txt = heading[ii] + ": ";
	var xx = items_x[ii];
	var yy = items_y[ii];
	draw_set_halign(fa_right);
	draw_set_color(c_white);
	draw_set_font(fnt_text);
	draw_text(xx,yy,txt);	
}
#endregion

event_inherited();

#region //Sets active control color to red
if(choice != -1) && (choice != items - 1) && (choice != items - 2)
{
	var txt = menu[choice];
	var xx = items_x[choice];
	var yy = items_y[choice];
	draw_set_color(c_red);
	draw_set_halign(fa_left);
	draw_text(xx,yy,txt);
}
#endregion