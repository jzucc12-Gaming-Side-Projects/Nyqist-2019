#region //Determines who is ready to act
players = [p1.w1, p1.w2, p2.w1, p2.w2];
for(var ii = 0; ii < 4; ii++)
{
	player_ready[ii] = players[ii].full;
	if(players[ii].full && active == -1)
			active = ii;
	players[ii].control = false;
	players[ii].show = false;
}
#endregion
	
#region //Logic for determining active player
if(active != -1 && can_control)
{	
	if(keyboard_check_pressed(vk_alt) || !player_ready[active])
	{
		for(var ii = 1; ii < 4; ii++)
		{
			var check = active + ii;
			check = Wrap(check,0,3);
			if(player_ready[check])
			{
				active = check;
				break;
			}
		}
	}
}
#endregion

#region //Managing active player shown on screen
if(active != -1)
{
	if(!player_ready[active])
		active = -1;
	else
	{
		players[active].show = true;
		if(can_control)
			players[active].control = true;
	}
}
#endregion

#region //Game over
if(!p1.alive 
&& !p2.alive)
{
	lose = true;
	instance_destroy();
}
#endregion

#region //Killing a foe
var num_alive= 0;
for(var ii = 0; ii < num_monster; ii++)
{
	if(monster_array[ii].alive)
		num_alive++;
}
if(num_alive = 0)
	instance_destroy();
#endregion