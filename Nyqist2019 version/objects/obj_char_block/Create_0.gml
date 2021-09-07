//Set specific menu items
menu[0] = string(traits[? "Name"]) 
menu[1] = "'" + string(traits[? "Nickname"]) + "'";
menu[2] = "Level: " + string(stats[? "Level"]);
menu[3] = "HP: " + string(stats[? "HP"]) + "/" + string(stats[? "HP Max"]);
menu[4] = "TP: " + string(stats[? "TP"]) + "/" + string(stats[? "TP Max"]);
cursor = -1;
draw = true;
no_stat = false;

//"Event Inherited" messes with x and y. This is to preserve the values.
var over_x = x;
var over_y = y;
event_inherited();
x = over_x;
y = over_y;

#region //Menu modifications
for(var ii = 0; ii < items; ii++)
	xalign[ii] = fa_left;
yalign = fa_top;
block_draw[0] = true;
block_draw[1] = true;

for(var ii = 0; ii < items; ii++)
{
	if(ii == 2)
		items_y[ii] += total_height * ii / 2 / items;
	else if(ii > 2)
		items_y[ii] = items_y[ii-1] + itemheight * spacing;
}
#endregion