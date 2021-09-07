/// @description AddTech(player, class, tier, ID)
/// @param player
/// @param class
/// @param tier
/// @param ID
function AddTech(argument0, argument1, argument2, argument3) {
	// Adds a tech to a player's grid

	// Example
	//		AddTech(1,"Hack",1,0);

	var _player = argument0;
	var _class = argument1;
	var _tier = argument2;
	var _ID = argument3;

	if(_player == 1)
	{
		if(_class == "Hack")
			ds_grid_set(global.player1_equipment[? "Hack"],_tier-1,_ID,1);
		else if(_class == "Enhancement")
			ds_grid_set(global.player1_equipment[? "Enhancement"],_tier-1,_ID,1);	
	}
	else if(_player == 2)
	{
		if(_class == "Hack")
			ds_grid_set(global.player2_equipment[? "Hack"],_tier-1,_ID,1);
		else if(_class == "Enhancement")
			ds_grid_set(global.player2_equipment[? "Enhancement"],_tier-1,_ID,1);		
	}


}
