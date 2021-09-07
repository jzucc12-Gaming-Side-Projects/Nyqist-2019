#region //Calculating movement speed
if(obj_P1.move_x || obj_P1.move_y)
{
	//For when player 1 is moving
	hstry_array = max(0,hstry_array - 1); //Delay to start moving
	hsp = ds_list_find_value(obj_P1.x_hstry,hstry_array) - x;
	vsp = ds_list_find_value(obj_P1.y_hstry,hstry_array) - y;
}
else
{
	//For when player 1 is still
	hstry_array = min(personal_space,hstry_array + 1); //Delay to stop moving
	hsp = ds_list_find_value(obj_P1.x_hstry,hstry_array) - x;
	vsp = ds_list_find_value(obj_P1.y_hstry,hstry_array) - y;
}

#endregion

#region //Moving the Player
x += hsp;
y += vsp;
#endregion

#region //Animation
//Changes sprite depending on the direction being moved in
if(abs(hsp) >= abs(vsp) && hsp != 0)
{
	sprite_index = ds_map_find_value(global.player2_traits,"Side Sprite");
	image_xscale = -sign(hsp);
}
else if(sign(vsp) < 0) sprite_index = ds_map_find_value(global.player2_traits,"Up Sprite");
else if(sign(vsp) > 0) sprite_index = ds_map_find_value(global.player2_traits,"Down Sprite");

//Sets animation speed for the sprite
if (hsp !=0 || vsp != 0) 
{
	image_speed = room_speed/120;
	if(obj_P1.running) image_speed = image_speed * obj_P1.run_bonus;
}
else 
{
	image_speed = 0;
	image_index = 0;
}
#endregion

depth = 5000/y;