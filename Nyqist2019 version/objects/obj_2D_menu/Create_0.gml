#region //Menu Items
//Menu items should be handled in children objects. 
//Initialize spacing_x as well. 
//Example below.
//Place before the inherit event

/*
menu[0,0] = "xx";
menu[1,0] = "xx";
menu[0,1] = "xx";
menu[1,1] = "xx";
menu[0,2] = "xx";
menu[1,2] = "xx";
*/
#endregion

#region //Menu Size
menu_height = array_height_2d(menu);
menu_width = array_length_2d(menu,0);
max_width = array_create(menu_width);
var width = ds_list_create();
items_x = array_create(menu_width,0);
items_y = array_create(menu_height,0);
for(var ii = 0; ii < menu_height; ii++)
{
	for(var jj = 0; jj < menu_width; jj++)
		block_draw[ii,jj] = false;
}

for (var jj = 0; jj < menu_width; jj++)
{
	for(var ii = 0; ii < menu_height; ii++)
		ds_list_add(width,string_width(menu[ii,jj]));
		
	ds_list_sort(width,false);
	max_width[jj] = ds_list_find_value(width,0);
	ds_list_clear(width);
}
itemheight = font_get_size(font);
total_height = ((itemheight * spacing_y) * menu_height);
#endregion

for(var ii = 0; ii < menu_width; ii++)
	items_x[ii] = xpos + max_width[ii] + spacing_x * ii;
for(var ii = 0; ii < menu_height; ii++)
	items_y[ii] = ypos + total_height * ii / menu_height;

for(var ii = 0; ii < menu_height; ii++)
{
	for(var jj = 0; jj < menu_width; jj++)
		can_click[ii,jj] = false;
}
ds_list_destroy(width);

#region //Set camera position for void menus
x = obj_disp_manager.ideal_width/2;
y = obj_disp_manager.ideal_height/2;
cam = camera_create();
var view = matrix_build_lookat(x,y,-1,x,y,0,0,1,0);
var proj = matrix_build_projection_ortho(obj_disp_manager.ideal_width,obj_disp_manager.ideal_height,1,999);
camera_set_view_mat(cam,view);
camera_set_proj_mat(cam,proj);
view_camera[0] = cam;
#endregion