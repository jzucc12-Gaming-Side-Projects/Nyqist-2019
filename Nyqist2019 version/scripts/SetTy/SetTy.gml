/// @description SetTy(input Type number here)
/// @param fire
/// @param electric
/// @param ice
/// @param wind
/// @param divine
/// @param unholy
function SetTy() {
	// Creates an Elemental Type array

	// Example
	//		fire = SetTy(0);
	//		ice = SetTy(2);
	//		holy = SetTy(6);
	//		fire_ice = SetTy(0,2);
	//		holy_fire_ice = SetTy(0,2,6);

#region //Type list order
	/*
	0 - Fire
	1 - Electric
	2 - Ice
	3 - Wind (Maybe)
	4 - Divine
	5 - Unholy (find better name)
	*/
#endregion

	var element_array = array_create(global.MaxElement,0);
	for(var ii = 0; ii < argument_count; ii++)
		element_array[argument[ii]] = 1;

	return element_array;


}
