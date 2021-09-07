/// @description ThreeSlice(sprite, x1,x2, y)
/// @param sprite
/// @param x1
/// @param x2
/// @param y
function ThreeSlice(argument0, argument1, argument2, argument3) {

	// Creates a three slice bar from a given "sprite" to the given coordinates

	// Example
	//		ThreeSlice(spr_spr_slider_bar, left, right, y_pos);

	var _sprite = argument0;
	var _size = sprite_get_width(argument0)/3;
	var _x1 = argument1;
	var _x2 = argument2;
	var _y  = argument3;
	var _width = _x2 - _x1;

#region//Middle
	draw_sprite_part_ext(_sprite,0,_size,0,1,_size,_x1 + _size,_y,_width - 2*_size,1,c_white,1);
#endregion

#region//Sides
	//Left
	draw_sprite_part_ext(_sprite,0,0,0,_size,_size,_x1,_y,1,1,c_white,1);
	
	//Right
	draw_sprite_part_ext(_sprite,0,2*_size,0,_size,_size,_x1 + _width - _size, _y,1,1,c_white,1);
#endregion


}
