#region //Player Input
#region //Input for keyboard control
if(!controller)
{
	move_left = keyboard_check(global.controls[? "left"]);
	move_right = keyboard_check(global.controls[? "right"]);
	move_up = keyboard_check(global.controls[? "up"]);
	move_down = keyboard_check(global.controls[? "down"]);
	running = keyboard_check(global.controls[? "run"]);
	pause = keyboard_check(global.controls[? "pause"]);
}
#endregion

#region //Input for controller control
//COMING EVENUTALLY... MAYBE
#endregion

if(!has_control)
{
	move_left = false;
	move_right = false;
	move_up = false;
	move_down = false;
	pause = false;
}
#endregion

#region //Movement Calculation
#region //Calculation for keyboard control
if(!controller)
{
	hsp = (move_right - move_left) * walkspd;
	vsp = (move_down - move_up) * walkspd;
}
#endregion

#region //Calculation for controller control
//COMING EVENTUALLY.... MAYBE
#endregion

if running
{
	hsp *= run_bonus;
	vsp *= run_bonus;
}
#endregion

#region //Moving the player
//Determines if the player is moving in a direction
move_x = hsp != 0;
move_y = vsp != 0;

//Moves player to the new location
if(!controller)
{
	x+=hsp;
	y+=vsp;
}
#endregion

#region //Collisions
//Creates collide array (pos[0] = x, pos[1] = y)
var collide_array;
collide_array[0] = false;
collide_array[1] = false;

//Determines if there is a collision in a direction
collide_array = CollisionWall(self, hsp, vsp, obj_wall,collide_array);
collide_array = CollisionWall(self, hsp, vsp, obj_NPC,collide_array);

//Stops player from moving if there is a collision
move_x = move_x && !collide_array[0];
move_y = move_y && !collide_array[1];
#endregion

#region //Animation
//Changes sprite depending on the direction being moved in
if(move_left || move_right) && !(move_left && move_right)
{
	sprite_index = ds_map_find_value(global.player1_traits,"Side Sprite");
	image_xscale = -sign(hsp); //Flips sprite if moving to the right
}
else if(move_up) sprite_index = ds_map_find_value(global.player1_traits,"Up Sprite");
else if(move_down) sprite_index = ds_map_find_value(global.player1_traits,"Down Sprite");

//Sets animation speed for the sprite
if (hsp != 0) || (vsp != 0)
{
	image_speed = room_speed/70;
	if(running) image_speed = image_speed * run_bonus;
}
else
{
	image_speed = 0;
	image_index = 0;
}
#endregion

#region //Random Encounters
if(move_x || move_y)
{
	if(combat_delay == 0)
	{
		if(Encounter())
			ChangeRoom(rm_combat);
		combat_delay = room_speed;
	}
	else
		combat_delay--;
}
#endregion

#region //Storing positions
//Stores positions for player 2's movement
if (move_x) || (move_y)
{
	//Prevents array from exceeding max size (sets player distance while moving)
	if(ds_list_size(x_hstry) > move_delay)
		ds_list_delete(x_hstry,0);
	if(ds_list_size(y_hstry) > move_delay)
		ds_list_delete(y_hstry,0);	
	ds_list_add(x_hstry,x);
	ds_list_add(y_hstry,y);
}
else
{
	/* ATTEMPT TO STOP THE JUMP IN P2 FROM RUNNING
	ds_list_clear(x_hstry);
	ds_list_clear(y_hstry);
	ds_list_add(x_hstry,obj_P2.x);
	ds_list_add(y_hstry,obj_P2.y);
	var player_dir = point_direction(x,y,obj_P2.x,obj_P2.y);
	var player_dist = distance_to_point(obj_P2.x,obj_P2.y);
	for(var ii = 0; ii < player_dist/walkspd; ii++)
	{
		var x_place = ds_list_find_value(x_hstry,ii) - lengthdir_x(walkspd,player_dir);
		var x_max = ds_list_find_value(x_hstry,0) - lengthdir_x(player_dist,player_dir)
		var y_place = ds_list_find_value(y_hstry,ii) - lengthdir_y(walkspd,player_dir);
		var y_max = ds_list_find_value(y_hstry,0) - lengthdir_y(player_dist,player_dir);
		ds_list_add(x_hstry,min(x_max,x_place));
		ds_list_add(y_hstry,min(y_max,y_place));

	}
	*/
}
#endregion

#region //Pausing
if(pause)
{
	pause = false;
	ChangeRoom(rm_menu);
}
#endregion

depth = 5000/y;