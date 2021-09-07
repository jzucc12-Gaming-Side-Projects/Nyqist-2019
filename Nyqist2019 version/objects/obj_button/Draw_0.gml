draw_sprite_ext(sprite_index,0,x,y,x_scale,y_scale,0,button_color,1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(symbol_color);
draw_set_font(fnt_text);
if(draw_symbol)
{
	if(typeof(symbol) == "string")
		draw_text_transformed(x,y,symbol,symbol_x_scale,symbol_y_scale,0);
	else
		draw_sprite_ext(symbol,0,x,y,symbol_x_scale,symbol_y_scale,0,c_white,1);
}