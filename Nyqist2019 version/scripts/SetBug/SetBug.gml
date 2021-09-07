/// @description SetBug(bug numbers)
/// @param bug
function SetBug() {

	// Creates an bug array

#region //Special list order
	/*
	0 - Corrupt (reduce hp over time)
	1 - Weaken (take more damage from a source)
	2 - EMP (can't use techs)
	3 - Slow (reduces ATB speed)
	4 - Scramble (Random actions on your turn)
	5 - Constrain (lose use of an arm)
	*/
#endregion

	var bug_array = array_create(global.MaxBugBoost,0);
	for(var ii = 0; ii < argument_count; ii++)
		bug_array[argument[ii]] = 1;
	return bug_array;


}
