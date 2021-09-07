/// @description Approach(variable, modifier, limit)
/// @param variable
/// @param modifier
/// @param limit
function Approach(argument0, argument1, argument2) {

	// Moves "variable" by "modifier" toward "limit"
	// Returns the result

	// Examples:
	//		hp = approach(hp, dmg, 0);
	//		hp = approach(hp, heal, hp_max);

	var _variable = argument0;
	var _modifier = argument1;
	var _limit = argument2;

	if(_variable < _limit)
	{
		_variable += _modifier;
		if(_variable > _limit)
			return _limit;
	}
	else
	{
		_variable -= _modifier;
		if(_variable < _limit)
			return _limit;
	}
	return _variable;


}
