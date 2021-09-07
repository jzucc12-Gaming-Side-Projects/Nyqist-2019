#region //Create Camera and set properties
cam = camera_create();
var view = matrix_build_lookat(x,y,-1,x,y,0,0,1,0);
var proj = matrix_build_projection_ortho(lens_width,lens_height,1,z_depth);
camera_set_view_mat(cam,view);
camera_set_proj_mat(cam,proj);
view_camera[0] = cam;
#endregion