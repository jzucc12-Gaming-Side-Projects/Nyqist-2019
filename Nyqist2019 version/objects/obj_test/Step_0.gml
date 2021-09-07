if(keyboard_check_pressed(vk_space))
	instance_create_depth(300,300,0,ds_queue_dequeue(xx));

if(keyboard_check_pressed(vk_up))
	instance_create_depth(300,300,0,array[2]);
	
if(keyboard_check_pressed(vk_down))
	show_debug_message(array[0]+1);

if(keyboard_check_pressed(vk_left))
	show_debug_message(array[1]+"s");