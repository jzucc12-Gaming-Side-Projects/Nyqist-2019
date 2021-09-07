/// @description CollisionWall(player, hsp, vsp, wall, collide_array)
/// @param player
/// @param hsp
/// @param vsp
/// @param wall
function CollisionWall(argument0, argument1, argument2, argument3, argument4) {

	// Checks and prevents collision of a "player" with a "wall" object
	// Returns the if the collsion true

	// Example
	//		collide_array = CollisionWallX(obj_P1, hsp, obj_wall);
	//		collide_array = CollsionWallX(obj_NPC, hsp, obj_P1);

	var _player = argument0;
	var _hsp = argument1;
	var _vsp = argument2;
	var _wall = argument3;
	var _collide_array = argument4;

	if(!_collide_array[0])
	{
		while(place_meeting(_player.x,_player.y-_vsp,_wall))
		{
			_collide_array[0] = true;
			x-=sign(_hsp);
		}
	}

	if(!_collide_array[1])
	{
		while(place_meeting(_player.x-_hsp,_player.y,_wall))
		{
			_collide_array[1] = true;
			y-=sign(_vsp);
		}
	}
	return _collide_array;


}
