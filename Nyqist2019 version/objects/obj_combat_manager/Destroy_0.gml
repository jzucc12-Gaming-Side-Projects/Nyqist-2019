CleanUp();
instance_destroy(p1);
instance_destroy(p2);
for(var ii = 0; ii < array_length_1d(monster_array); ii++)
	instance_destroy(monster_array[ii]);

if(lose)
{
	ChangeRoom(rm_gameOver);
}
else
{
	var return_file = file_text_open_read("P1_pos_save.txt");
	var return_room = file_text_read_real(return_file);
	ChangeRoom(return_room);
	file_text_close(return_file);
}
