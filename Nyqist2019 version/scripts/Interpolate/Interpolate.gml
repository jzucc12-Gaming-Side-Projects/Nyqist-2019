/// @description Interpolate(min_x, max_x, current_x, min_y, max_y)
/// @param min_x
/// @param max_x
/// @param current_x
/// @param min_y
/// @param max_y
function Interpolate(argument0, argument1, argument2, argument3, argument4) {


	// Linearly interpolates to find the value of current_y

	// Examples:
	//		red_pixel = Interpolate(0, 100, 50, 0, 255)

	var _min_x = argument0;
	var _max_x = argument1;
	var _current_x = argument2;
	var _min_y = argument3;
	var _max_y = argument4;

	var _slope = (_max_y - _min_y) / (_max_x - _min_x);
	var _current_y = _slope * (_current_x - _min_x) + _min_y;

	return _current_y;


}
