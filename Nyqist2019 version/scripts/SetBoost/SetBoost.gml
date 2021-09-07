/// @description SetBoost(boost numbers)
/// @param boost
function SetBoost() {

	// Creates an boost array

#region //Boost list order
	/*
	0 - Reconstruct (increase hp over time)
	1 - Strengthen (reduce damage from a source)
	2 - Overdrive (boost tech power/accuracy)
	3 - Accelerate (increase ATB speed)
	4 - Focus (increase all stats)
	5 - Echo (arm action taken twice with no extra cost)
	*/
#endregion

	var boost_array = array_create(global.MaxBugBoost,0);
	for(var ii = 0; ii < argument_count; ii++)
		boost_array[argument[ii]] = 1;
	return boost_array;


}
