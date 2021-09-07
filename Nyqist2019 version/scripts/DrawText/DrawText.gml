/// @description DrawText(color,font,halign,valign)
/// @param color
/// @param font
/// @param halign
/// @param valign
function DrawText(argument0, argument1, argument2, argument3) {

	// Simple way of setting text parameters

	// Example
	//	DrawText(c_white, fnt_P1, left + h_border, top + v_border);
	//	DrawText(c_red, fnt_enemy, left + h_border, top + v_border);

	draw_set_color(argument0);
	draw_set_font(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);


}
