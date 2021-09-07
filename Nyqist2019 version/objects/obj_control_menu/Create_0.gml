change = false;

#region //Sets up temporary keys
temp[0] = global.controls[? "up"];
temp[1] = global.controls[? "down"];
temp[2] = global.controls[? "left"];
temp[3] = global.controls[? "right"];
temp[4] = global.controls[? "run"];
temp[5] = global.controls[? "select"];
temp[6] = global.controls[? "cancel"]
temp[7] = global.controls[? "pause"];
temp_length = array_length_1d(temp);
#endregion

#region //Menu display
for(var ii = 0; ii < temp_length; ii++)
{
	menu[ii] = KeyToString(temp[ii]);
}
menu[temp_length] = "Restore to Default";
menu[temp_length + 1] = "Save Changes";
menu[temp_length + 2] = "Return";
#endregion

#region //Creates control item headings
heading[0] = "Up";
heading[1] = "Down";
heading[2] = "Left";
heading[3] = "Right";
heading[4] = "Run";
heading[5] = "Select";
heading[6] = "Cancel";
heading[7] = "Pause";
heading_items = array_length_1d(heading);
#endregion

event_inherited();

#region //Item location on screen
for(var ii = 0; ii < items; ii++)
{
	if(ii < temp_length)
	{
		items_x[ii] = gui_height / 4;
		items_y[ii] = ypos + total_height * ii / items;
		xalign[ii] = fa_left;
		
	}
	else
	{
		items_x[ii] = xpos;
		items_y[ii] = gui_height*0.9 - itemheight * (1 + spacing/2) * (items - 1 - ii);
	}
}
#endregion