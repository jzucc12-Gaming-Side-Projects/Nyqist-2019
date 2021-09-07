/// @description GetTech(class, tier, ID)
/// @param class
/// @param tier
/// @param ID
function GetTech(argument0, argument1, argument2) {
	// Determines tech based off of class, tier, and ID number

	// Example
	//		GetInv("Recovery", 1);

	var _class = argument0;
	var _tier = argument1;
	var _ID = argument2;
	var tech = ds_map_create();
	
	switch(_class)
	{
		case "Hack":
		{
			if(!instance_exists(Tech_Hack))
				instance_create_depth(0,0,0,Tech_Hack);
			ds_map_copy(tech,Tech_Hack.ID_grid[# _tier-1, _ID]);
			break;
		}
		case "Enhancement":
		{
			if(!instance_exists(Tech_Enh))
				instance_create_depth(0,0,0,Tech_Enh);
			ds_map_copy(tech,Tech_Enh.ID_grid[# _tier-1, _ID]);
			break;
		}
	}

	return tech;


}
