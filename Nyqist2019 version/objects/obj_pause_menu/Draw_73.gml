#region //Boxes around menu items
var border_width = 10;
var box_left = 5;
var box_right = 200;
var box_top = itemheight * (spacing - 1)/2;
var box_bottom = itemheight * (spacing + 1)/2;
var box_color = c_black;
var border_color = c_blue;

for(var ii = 0; ii < items; ii++)
{
	draw_set_color(box_color);
	draw_rectangle(box_left, items_y[ii] - box_top, box_right,items_y[ii] + box_bottom,0);
	draw_set_color(border_color);
	DrawRectWidth(box_left, items_y[ii] - box_top, box_right,items_y[ii] + box_bottom, border_width);
}
#endregion

event_inherited();