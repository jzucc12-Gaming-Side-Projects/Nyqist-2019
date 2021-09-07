/// @description DrawRectWidth(x1, y1, x2, y2, w)
function DrawRectWidth(argument0, argument1, argument2, argument3, argument4) {

	/// @param x1
	/// @param y1
	/// @param x2
	/// @param y2
	/// @param w

	// Draws a rectangle with a specified outline widh

	// Examples:
	//		box = DrawRectWidth(0,0,gui_width,gui_height,20);

	var x1 = argument0;
	var y1 = argument1;
	var x2 = argument2;
	var y2 = argument3;
	var w = argument4;
	draw_line_width(x1 - w/2, y1, x2 + w/2, y1, w);
	draw_line_width(x2, y1, x2, y2, w);
	draw_line_width(x1 - w/2, y2, x2 + w/2, y2, w);
	draw_line_width(x1, y1, x1, y2, w);


}
