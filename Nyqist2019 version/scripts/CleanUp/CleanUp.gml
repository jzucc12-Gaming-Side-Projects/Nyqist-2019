/// @description CleanUp()
/// @param class
function CleanUp() {
	// Cleans up databases

	if(instance_exists(Recovery_Items))
		instance_destroy(Recovery_Items);

	if(instance_exists(Offense_Items))
		instance_destroy(Offense_Items);

	if(instance_exists(Utility_Items))
		instance_destroy(Utility_Items);

	if(instance_exists(Key_Items))
		instance_destroy(Key_Items);
			
	if(instance_exists(Weapons))
		instance_destroy(Weapons);
	
	if(instance_exists(Armor))
		instance_destroy(Armor);	

	if(instance_exists(Headgear))
		instance_destroy(Headgear);

	if(instance_exists(Tech_Hack))
		instance_destroy(Tech_Hack);
	
	if(instance_exists(Tech_Enh))
		instance_destroy(Tech_Enh);	


}
