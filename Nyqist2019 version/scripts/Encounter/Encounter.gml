/// @description Encounter()
function Encounter() {

	// Determines if a random encounter will occur

	// Example
	//		if(Encounter())
	//			instance_create_depth(0,0,0,obj_combat_manager);

	chance = random(100);
	return (chance >= 90);


}
