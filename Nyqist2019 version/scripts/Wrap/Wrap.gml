/// @description Wrap(variable, min, max)
/// @param variable
/// @param min
/// @param max
function Wrap(argument0, argument1, argument2) {

	// Wraps "variable" so that it remains between a "min" and "max" value
	// Returns the current value

	// Example
	//		menu_item = Wrap(menu_item, 0, ds_list_size(menu) - 1);
	//		xpos = Wrap(xpos, 0, map_width);

	var _variable = argument0;
	var _minimum = argument1;
	var _maximum = argument2;

	if(_variable % 1 == 0)
	{
		while(_variable > _maximum || _variable < _minimum)
		{
			if(_variable > _maximum)
				_variable = _minimum + _variable - _maximum - 1;
			
			else if(_variable < _minimum)
				_variable = _maximum + _variable - _minimum + 1;
			
			else _variable = _variable;
		}
		return(_variable);
	}
	else
	{
		var _old = _variable + 1;
		while(_variable != _old)
		{
			_old = _variable;
			if(_variable < _minimum)
				_variable = _maximum - (_minimum - _variable);
		
			else if(_variable > _maximum)
				_variable = _minimum + (_variable - _maximum);
		
			else
				_variable = _variable;
		}
		return _variable;
	}


}
