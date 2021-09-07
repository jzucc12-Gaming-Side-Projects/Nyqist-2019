if(draw)
{
	box_border = 10;
	
	#region //Update menu items
	menu[0] = string(traits[? "Name"]) 
	menu[1] = "'" + string(traits[? "Nickname"]) + "'";
	menu[2] = "Level: " + string(stats[? "Level"]);
	menu[3] = "HP: " + string(stats[? "HP"]) + "/" + string(stats[? "HP Max"]);
	menu[4] = "TP: " + string(stats[? "TP"]) + "/" + string(stats[? "TP Max"]);
	#endregion

	#region //Set Parameters
	var rectangle_width = display_get_gui_width()/6;
	var face_width = sprite_get_width(traits[? "Face Sprite"]);
	var face_height = sprite_get_height(traits[? "Face Sprite"]);
	var stat_box_left = x - text_buffer - box_border/2;
	var stat_box_top = y - text_buffer - box_border/2;
	var stat_box_right = stat_box_left + rectangle_width;
	var stat_box_bottom = stat_box_top + face_height;
	var face_left = stat_box_left - face_width;
	var face_top = stat_box_top;
	#endregion

	#region //Draw picture
	draw_sprite(traits[? "Face Sprite"], 0, face_left, face_top);
	draw_set_color(c_blue);
	DrawRectWidth(face_left,face_top,face_left+face_width,face_top+face_height,box_border);
	if(!no_stat)
	{
		DrawRectWidth(stat_box_left,stat_box_top,stat_box_right,stat_box_bottom,box_border);
		draw_set_color(c_black);
		draw_rectangle(stat_box_left,stat_box_top,stat_box_right,stat_box_bottom,false);
		#endregion

		event_inherited();

		#region //Modification to regular menu}
		var col = color_inactive;
		draw_set_font(fnt_text_bold);
		for(var ii = 0; ii < 2; ii++)
		{
			draw_set_halign(xalign[ii]);
			var txt = menu[ii];
			var xx = items_x[ii];
			var yy = items_y[ii];
			draw_set_color(col);
			draw_text_transformed(xx,yy,txt,1.1,1.1,0);
		}
		draw_set_font(fnt_text);
	}
	#endregion
}