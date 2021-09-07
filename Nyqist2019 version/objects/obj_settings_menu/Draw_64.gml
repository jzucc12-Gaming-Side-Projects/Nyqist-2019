#region //Draw title with varying color
green_px = Wave(255,122,4,0);
var text_color = make_colour_rgb(0,green_px,200);
var load_text = "Settings";
draw_set_color(text_color);
draw_set_font(fnt_text);
draw_text(gui_width/2,gui_height/3,load_text);
#endregion

event_inherited();
