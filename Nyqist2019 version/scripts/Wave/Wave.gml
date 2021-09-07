/// @description Wave(from, to, duration, offset)
/// @param from
/// @param to
/// @param duration
/// @param offset
function Wave(argument0, argument1, argument2, argument3) {

	// Moves a value between "from" and "to" over "duration" seconds with a time "offset
	// Returns current position

	// Example
	//		x = Wave(start, end, 1/(freq*2), offset)

	var _from = argument0;
	var _to = argument1;
	var _duration = argument2;
	var _offset = argument3;
	var _diff = (_to - _from) / 2;

	return _from + _diff + sin((((current_time / 1000) + _duration * _offset) / _duration) * 2 * pi) * _diff;




}
