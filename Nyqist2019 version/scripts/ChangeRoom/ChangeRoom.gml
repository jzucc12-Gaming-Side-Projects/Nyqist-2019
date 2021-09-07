/// @description ChangeRoom(destination)
/// @param destination
function ChangeRoom(argument0) {

	// Sends the player to the designated "destination". Accepts NEXT and PREVIOUS

	// Example
	//		ChangeRoom(rm_temple_floor_2);
	//		ChangeRoom(rm_pause_menu);

	var _destination = argument0;

	with(obj_transition)
	{
		exit_room = true;
		target_room = _destination;
	}


}
