#region //Draw title with varying color
green_px = Wave(255,122,4,0);
var title_color = make_colour_rgb(0,green_px,200);
draw_sprite_ext(spr_Title,0,gui_width/2,gui_height/3,1,1,0,title_color,1);
#endregion

event_inherited();