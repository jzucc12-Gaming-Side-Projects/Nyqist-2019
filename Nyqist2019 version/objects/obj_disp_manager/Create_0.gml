ideal_width = 0;
ideal_height = 1080;
zoom_max = 2;
zoom_min = 0.25;

var AR = display_get_width() / display_get_height();

//ideal_height = round(ideal_width/aspect_ratio);
ideal_width = round(ideal_height*AR);

//Check for odd numbers
if(ideal_width & 1)
{
	ideal_width++;
}
display_set_gui_size(ideal_width,ideal_height);
alarm_set(1,1);