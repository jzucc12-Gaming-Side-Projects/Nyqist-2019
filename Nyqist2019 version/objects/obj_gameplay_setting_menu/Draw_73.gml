event_inherited();

if(!file_exists("P1_pos_save.txt"))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_color(c_red);
	draw_set_font(fnt_text);
	draw_text(gui_width/2, items_y[2] + 2.5 * itemheight, "Option available\nduring gameplay");
}