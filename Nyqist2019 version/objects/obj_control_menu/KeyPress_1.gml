var key = keyboard_lastkey;

if(change)
{
	#region //Changes key
	for(var ii = 0; ii < temp_length; ii++)
	{
		if(temp[ii] == key)
			temp[ii] = temp[choice];
	}
	temp[choice] = key;
	#endregion
	
	keyboard_clear(key);
	choice = -1;
	control = true;
	change = false;
}