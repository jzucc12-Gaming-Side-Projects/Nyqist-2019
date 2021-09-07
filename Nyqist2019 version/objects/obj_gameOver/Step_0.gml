alpha = Approach(alpha,0.005,limit);

if(alpha == limit)
{
	instance_destroy();
	ChangeRoom(rm_menu);
}