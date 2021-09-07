#region //Player location transition
var file;
file = file_text_open_write(working_directory + "P1_pos_save.txt");
file_text_write_real(file,room);
file_text_writeln(file);
file_text_write_real(file,x);
file_text_writeln(file);
file_text_write_real(file,y);
file_text_writeln(file);
file_text_close(file);
#endregion