#region //Menu Items
//Menu items should be handled in children objects. Example below.
//Place before the inherit event

/*menu[0] = "xx";
menu[1] = "xx";
menu[2] = "xx";
*/
#endregion

#region //Menu Size
items = array_length_1d(menu);
draw_set_font(font);
var width = ds_list_create();
items_x = array_create(items,0);
items_y = array_create(items,0);
xalign = array_create(items,fa_center);
block_draw = array_create(items,false);

for (var ii = 0; ii < items - 1; ii++)
	ds_list_add(width,string_width(menu[ii]));
	
ds_list_sort(width,false);
itemheight = font_get_size(font);
max_width = ds_list_find_value(width,0);
total_height = ((itemheight * spacing) * items);
#endregion

for(var ii = 0; ii < items; ii++)
{
	items_x[ii] = xpos;
	items_y[ii] = ypos + total_height * ii / items;
}

can_click = array_create(items,false);
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