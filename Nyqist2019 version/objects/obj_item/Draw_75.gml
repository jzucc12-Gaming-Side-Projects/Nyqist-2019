var item = ds_map_create();
var item_info = ds_map_create();
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

if(!item_selected)
{
	#region //Items
	draw_set_font(fnt_text_small);
	var border = sprite_get_width(spr_text_box)/3;
	var spacing = font_get_size(fnt_text_small);
	var buffer = 1.5;
	var X_box_start = gui_width*.8;
	var Y_box_start = gui_height*.3;
	var box_width = 275;
	var box_height = 400;
	var xx = X_box_start + border*buffer;
	var y_start = Y_box_start + border*buffer;
	var y_cur = y_start;
	
	NineSlice(spr_text_box,X_box_start,Y_box_start, X_box_start + box_width, Y_box_start + box_height);
	if(count[active_pos] == 0)
	{
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_text(xx,y_cur,"None");
	}
	else
	{
		var limit = min(show_length, count[active_pos]);
		for(var ii = 0; ii < limit; ii++)
		{
			#region //Item name
			draw_set_font(fnt_text_small);
			draw_set_halign(fa_left);
			draw_set_valign(fa_top);
			var item_pos = ds_grid_get(show_list[| active_pos], 0, ii);
			item = GetInv(title[active_pos], item_pos);
			var special = item[? "Special"];
			
			if(cursor_array[active_pos] == ii)
			{
				draw_set_color(c_yellow);
				item_info = item;
			}
			else if(special[5])
				draw_set_color(c_gray);
			else
				draw_set_color(c_white);
			draw_text(xx,y_cur,item[? "Name"]);
			#endregion
			
			#region //Item quantity
			var x2 = X_box_start + box_width - border*buffer;
			var qty = ds_grid_get(show_list[|active_pos],1,ii);
			draw_set_halign(fa_right);
			draw_text(x2,y_cur,qty);
			#endregion
			
			#region //Item Information
			draw_set_font(fnt_text);
			draw_set_halign(fa_left);
			NineSlice(spr_text_box,desc_box_x,desc_box_y,gui_width,gui_height);
			draw_set_color(c_white);
			var x_info = desc_box_x + 1.5*border;
			var y_info = desc_box_y + 1.5*border;
			var desc = item_info[? "Desc"];
			draw_text_ext(x_info,y_info,desc,font_get_size(fnt_text)*1.5,gui_width-x_info-1.5*border);
			#endregion
			
			y_cur += spacing*buffer;
		}
	}
	#endregion
		
	#region //Title
	var y_top = y_start - 85;
	var y_bottom = y_start - 1.5*border;
	var x_left = X_box_start;
	var x_right = X_box_start + box_width;
	var x_text = (x_left + x_right)/2-5;
	var y_text = (y_top + y_bottom)/2;
	var txt = title[active_pos];
	draw_set_font(fnt_text_small);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	NineSlice(spr_text_box,x_left,y_top,x_right,y_bottom);
	draw_text(x_text,y_text,txt);
	#endregion
}

ds_map_destroy(item);