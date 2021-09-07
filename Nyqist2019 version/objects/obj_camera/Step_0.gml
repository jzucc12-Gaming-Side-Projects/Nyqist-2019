#region //Calculates Camera Movement

//Moves camera with a delay
x += (new_x - x) / delay;
y += (new_y - y) / delay;

//Finds new camera position
if(follow != noone)
{
	new_x = follow.x;
	new_y = follow.y;
}

#endregion

#region //Keeps Camera in Bounds
if(x - lens_width/2 < wall_buffer)
	x = lens_width/2 + wall_buffer;
if(x + lens_width/2 > room_width - wall_buffer)
	x = room_width - lens_width/2 - wall_buffer;
if(y - lens_height/2 < wall_buffer)
	y = lens_height/2 + wall_buffer;
if(y + lens_height/2 > room_height - wall_buffer)
	y = room_height - lens_height/2 - wall_buffer;
#endregion

#region //Moves Camera
var view = matrix_build_lookat(x,y,-1,x,y,0,0,1,0);
camera_set_view_mat(cam,view);
#endregion