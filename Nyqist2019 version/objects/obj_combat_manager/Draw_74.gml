#region //Draw background dialog boxes
draw_set_color(ground);
draw_rectangle(0,1/4*height,width,height,0);
NineSlice(spr_text_box,0,dialog_y, split_x, height);
NineSlice(spr_text_box,split_x,dialog_y, width, height);
#endregion

#region //Monster position variables
var mon_name_x = split_x/2;
var mon_name_y_base = dialog_y + (height - dialog_y)/num_monster;
var mon_name_y_inc = height * 0.05;
#endregion

#region //Display combatant names
var col_m = c_white;
draw_set_color(col_m);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
for(var ii = 0; ii < num_monster; ii++)
{
	if(monster_array[ii].alive)
		draw_text(mon_name_x, mon_name_y_base + ii * mon_name_y_inc, monster_array[ii].name);
}
#endregion
