#region //Movement Calculation
if(!still) && (action_delay <= 0) && (moved_times <= 0)
{
	#region //Determine move direction
	var move_dir = irandom_range(0,room_speed);
	switch(move_dir)
	{
		case 0:
		{
			hsp = -walkspd;
			vsp = 0;
			break;
		}
		case 1:
		{
			hsp = walkspd;
			vsp = 0;
			break;
		}
		case 2:
		{
			hsp = 0;
			vsp = -walkspd;
			break;
		}
		case 3:
		{
			hsp = 0;
			vsp = walkspd;
			break;
		}
		default:
		{
			hsp = 0;
			vsp = 0;
			break;
		}
	}
	#endregion
	
	#region //Determine maximum moving parameters
	if(hsp != 0) || (vsp != 0)
	{
		if(hsp != 0)
		{
			max_moved = floor((sprite_width)/walkspd) * sign(hsp);
		}
		else
			max_moved = floor((sprite_height)/walkspd);
	}
	#endregion
}
else
{
	//Action delay timer decrement
	action_delay--;
}
#endregion

#region //Talking
#region//Determines if the player is capable of speaking to the NPC
var can_talk = false;
//var player_dist = distance_to_object(obj_P1);
if(point_in_circle(obj_P1.x,obj_P1.y,x,y,interaction_radius)) && (talkable)
{
	sprite_index = spr_NPC_talk;
	can_talk = true;
}
else
	sprite_index = spr_NPC;
#endregion

#region//Speaking to the NPC
if(can_talk) && (keyboard_check_pressed(global.controls[? "select"])) && (!instance_exists(obj_text))
{
	show_debug_message("hi");
	speaking = true;
	with(instance_create_depth(0,0,0,obj_text))
	{
		text = other.dialog;
		length = string_length(text);
		font = fnt_text;
		color = c_yellow;
		face = spr_NPC_face;
	}
}
if(instance_exists(obj_text))
{
	hsp = 0;
	vsp = 0;
	obj_P1.has_control = false;
}
else
{
	obj_P1.has_control = true;
}
#endregion
#endregion

#region //Movement
var moving = (hsp != 0 || vsp != 0); 

//Moves NPC if it has not exceeded its maximum movement
if(!still) && (moved_times < max_moved) && moving
{
	x += hsp;
	y += vsp;
	moved_times++;
}
else
{
	moved_times = 0;
	hsp = 0;
	vsp = 0;
}

//Starts action delay timer if NPCh as finished moving
if(moved_times == max_moved)
	action_delay = max_delay;
#endregion

#region //Collisions
//Sets up collided array (pos[0] = x, pos[1] = y)
var collide_array;
collide_array[0] = false;
collide_array[1] = false;

//Determines if there is a collision in either direction
collide_array = CollisionWall(self, hsp, vsp, obj_wall,collide_array);
collide_array = CollisionWall(self, hsp, vsp, obj_P1,collide_array);

//Stops animation if there is a collision
moving = moving && !collide_array[0];
moving = moving && !collide_array[1];
#endregion

#region //Animation
//Determines animation speed for the sprite
if moving
{
	if(hsp != 0)
		image_xscale = -sign(hsp);
		
	image_speed = room_speed/70;
}
else 
{
	image_speed = 0;
	image_index = 0;
}
#endregion

depth = 5000/y;