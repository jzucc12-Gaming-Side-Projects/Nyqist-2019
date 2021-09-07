deleteMe = false; //If true, will delete or else it will load
write = false;
action_taken = false;
fading = 0;
decrement = false;
deleted = false;

menu[0] = "File 1";
menu[1] = "File 2";
menu[2] = "File 3";
menu[3] = "File 4";
menu[4] = "File 5";
if(!deleteMe)
	menu[5] = "Delete";
else
	menu[5] = "Cancel";
menu[6] = "Return";

event_inherited();

for(var ii = 0; ii < items; ii++)
{
	xalign[ii] = fa_left;
}