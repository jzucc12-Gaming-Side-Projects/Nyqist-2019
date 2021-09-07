var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var tech = ds_map_create();
var tech_info = ds_map_create();

if(!tech_selected)
{
	#region //Techs
	var border = sprite_get_width(spr_text_box)/3;
	var spacing = font_get_size(fnt_text);
	var buffer = 1.5;
	var X_box_start = gui_width*.8;
	var Y_box_start = gui_height*.3;
	var box_width = 275;
	var box_height = 400;
	var xx = X_box_start + border*buffer;
	var y_start = Y_box_start + border*buffer;
	var y_cur = y_start;
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	NineSlice(spr_text_box,X_box_start,Y_box_start, X_box_start + box_width, Y_box_start + box_height);
	for(var ii = 0; ii < show_length; ii++)
	{
		#region //Tech name
		var txt = " ";
		if(grid[# tier_array[ii]-1, ii] == 1)
		{
			tech = GetTech(class,tier_array[ii],ii);
			txt = tech[? "Name"];
			if(ii > 0)
				y_cur += spacing*buffer;
		}
		var col = c_white;
			
		if(tech_cursor == ii)
		{
			col = c_yellow;
			tech_info = tech;
		}
		draw_set_color(col);
		draw_text(xx,y_cur,txt);
		#endregion
	}
	#endregion
	
	#region //Tech Information
	#region //Set up
	var font = fnt_text_small;
	var info_spacing = font_get_size(font);
	draw_set_font(font);
	draw_set_halign(fa_left);
	NineSlice(spr_text_box,desc_box_x,desc_box_y,gui_width,gui_height);
	draw_set_color(c_white);
	var x_info = desc_box_x + 1.5*border;
	var y_info = desc_box_y + 1.5*border;
	#endregion
		
	#region //Cost
	var cost = "Cost: " + string(tech_info[? "Cost"]) +" TP";
	draw_text_ext(x_info,y_info,cost,info_spacing*1.5,gui_width-x_info-1.5*border);
	y_info += info_spacing*buffer;	
	#endregion

	#region //Tier
	var tier = "Tier: " + string(tech_info[? "Tier"]);
	draw_text_ext(x_info,y_info,tier,info_spacing*1.5,gui_width-x_info-1.5*border);
	y_info += info_spacing*buffer;		
	#endregion
	
	#region //Type
	var type = "Type:";
	var type_array = tech_info[? "Type"];
	for(var ii = 0; ii < global.MaxElement; ii++)
	{
		if(type_array[ii] == 1)
		{
			switch(ii)
			{
				case 0:
				{
					type += " Fire,";
					break;
				}
				case 1:
				{
					type += " Electric,";
					break;
				}
				case 2:
				{
					type += " Ice,";
					break;
				}
				case 3:
				{
					type += " Wind,";
					break;
				}
				case 4:
				{
					type += " Divine,";
					break;
				}
				case 5: 
				{
					type += " Unholy,";
					break;
				}
			}
		}
	}
	type = string_delete(type,string_length(type),1);
	draw_text_ext(x_info,y_info,type,info_spacing*1.5,gui_width-x_info-1.5*border);
	y_info += info_spacing*buffer;
	#endregion
	
	#region //Damage reduction
	var redu = "N/A";
	if(tech_info[? "Spread"])
		redu = "Reduction: " + string(round(100*(1-tech_info[? "Reduction"]))) +"%";
	draw_text_ext(x_info,y_info,redu,info_spacing*1.5,gui_width-x_info-1.5*border);
	y_info += info_spacing*buffer;
	#endregion
	#endregion
	
	#region //Title
	var y_top = y_start - 85;
	var y_bottom = y_start - 1.5*border;
	var x_left = X_box_start;
	var x_right = X_box_start + box_width;
	var x_text = (x_left + x_right)/2-5;
	var y_text = (y_top + y_bottom)/2;
	if(hack)
		var txt = "Hacks";
	else
		var txt = "Enhancements";
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	NineSlice(spr_text_box,x_left,y_top,x_right,y_bottom);
	draw_text(x_text,y_text,txt);
	#endregion
}

ds_map_destroy(tech);