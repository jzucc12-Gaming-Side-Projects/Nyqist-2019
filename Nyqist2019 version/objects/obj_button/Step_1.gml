can_y = (mouse_y < y + height/2 * y_scale) && (mouse_y > y - height/2 * y_scale);
can_x = (mouse_x > x - width / 2 * x_scale) && (mouse_x < x + width / 2 * x_scale);

if(can_x && can_y && mouse_check_button_pressed(mb_left))
{
	if(!toggle)
		pressed = true;
	else
		pressed = !pressed;
}
