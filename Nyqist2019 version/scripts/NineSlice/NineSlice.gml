function NineSlice(argument0, argument1, argument2, argument3, argument4) {
#region //STRETCH VERSION

	/// @description NineSliceStretch(sprite, x1, y1, x2, y2)
	/// @param sprite
	/// @param x1
	/// @param y1
	/// @param x2
	/// @param y2

	// Creates a nine slice box from a given "sprite" to the given coordinates without
	// the use of for loops

	// Example
	//		NineSlice(spr_text_box, left, top, right, bottom);
	//		NineSlice(spr_menu_box, left, top,right, bottom);

	var _sprite = argument0;
	var _size = sprite_get_width(argument0)/3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _width = _x2 - _x1;
	var _height = _y2 - _y1;

#region//Middle
	draw_sprite_part_ext(_sprite,0,_size,_size,1,1,_x1 + _size,_y1 + _size,_width - 2*_size,_height - 2*_size,c_white,1);
#endregion

#region//Corners
	//Top Left
	draw_sprite_part(_sprite,0,0,0,_size,_size,_x1,_y1);

	//Top right
	draw_sprite_part(_sprite,0,2*_size,0,_size,_size,_x1+_width-_size,_y1);

	//Bottom Left
	draw_sprite_part(_sprite,0,0,2*_size,_size,_size,_x1,_y1+_height-_size);

	//Bottom Right
	draw_sprite_part(_sprite,0,2*_size,2*_size,_size,_size,_x1+_width-_size,_y1+_height-_size);
#endregion

#region//Edges
	//Left
	draw_sprite_part_ext(_sprite,0,0,_size,_size,1,_x1,_y1 + _size,1,_height - 2*_size,c_white,1);
	
	//Right
	draw_sprite_part_ext(_sprite,0,2*_size,_size,_size,1,_x1 + _width - _size, _y1 + _size,1,_height - 2*_size,c_white,1);

	//Top
	draw_sprite_part_ext(_sprite,0,_size,0,1,_size,_x1 + _size,_y1,_width - 2*_size,1,c_white,1);
	
	//Bottom
	draw_sprite_part_ext(_sprite,0,_size,2*_size,1,_size,_x1 + _size, _y1 + _height - _size,_width - 2*_size,1,c_white,1);
#endregion
#endregion

	/*
#region //Non-stretch
	/// @description NineSlice(sprite, x1, y1, x2, y2)
	/// @param sprite
	/// @param x1
	/// @param y1
	/// @param x2
	/// @param y2

	// Creates a nine slice box from a given "sprite" to the given coordinates

	// Example
	//		NineSlice(spr_text_box, left, top, right, bottom);
	//		NineSlice(spr_menu_box, left, top,right, bottom);

	var _sprite = argument0;
	var _size = sprite_get_width(argument0)/3;
	var _x1 = argument1;
	var _y1 = argument2;
	var _x2 = argument3;
	var _y2 = argument4;
	var _width = _x2 - _x1;
	var _height = _y2 - _y1;
	var _rows = _height div _size;
	var _columns = _width div _size;

#region//Middle
	for(var ii = 1; ii < _columns; ii++)
	{
		for(var jj = 1; jj < _rows; jj++)
		{
			draw_sprite_part(_sprite,0,_size,_size,_size,_size,_x1 + (ii * _size),_y1 + (jj * _size));
		}
	}
#endregion

#region//Corners
	//Top Left
	draw_sprite_part(_sprite,0,0,0,_size,_size,_x1,_y1);

	//Top right
	draw_sprite_part(_sprite,0,2*_size,0,_size,_size,_x1+(_columns*_size),_y1);

	//Bottom Left
	draw_sprite_part(_sprite,0,0,2*_size,_size,_size,_x1,_y1+(_rows*_size));

	//Bottom Right
	draw_sprite_part(_sprite,0,2*_size,2*_size,_size,_size,_x1+(_columns*_size),_y1+(_rows*_size));

#endregion

#region//Edges
	for(var ii = 1; ii < _rows; ii++)
	{
		//Left
		draw_sprite_part(_sprite,0,0,_size,_size,_size,_x1,_y1 + ii * _size);
	
		//Right
		draw_sprite_part(_sprite,0,2*_size,_size,_size,_size,_x1 + (_columns*_size), _y1 + ii * _size);
	}
	for(var ii = 1; ii < _columns; ii++)
	{
		//Top
		draw_sprite_part(_sprite,0,_size,0,_size,_size,_x1 + (ii * _size),_y1);
	
		//Bottom
		draw_sprite_part(_sprite,0,_size,2*_size,_size,_size,_x1 + (ii * _size), _y1 + (_rows * _size));
	}
#endregion
#endregion
	*/


}
