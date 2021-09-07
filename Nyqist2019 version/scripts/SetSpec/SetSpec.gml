/// @description SetSpec(special numbers)
/// @param special
function SetSpec() {

	// Creates an special array

	// Example
	//		potion = SetSpec(0);
	//		patch = SetSpec(0,2);

#region //Special list order
	/*
	0 - Heal (healing for items/techs)
	1 - Damage (techs/items only)
	2 - Spread (optional target all for techs/weapons)
	3 - Aim (special for some weapons)
	4 - All (mandatory target everyone)
	5 - Map (can't be used in combat)
	6 - Combat (can't be used outside of combat)
	7 - Flee (enables fleeing from combat/dungeons)
	8 - Revive (bring back from the dead)
	9 - Heal tp (bring back tp)
	*/
#endregion

	var special_array = array_create(global.MaxSpecial,0);
	for(var ii = 0; ii < argument_count; ii++)
		special_array[argument[ii]] = 1;
	return special_array;


}
