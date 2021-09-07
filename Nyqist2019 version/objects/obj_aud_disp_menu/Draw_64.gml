#region //Draw title with varying color
green_px = Wave(255,122,4,0);
var text_color = make_colour_rgb(0,green_px,200);
var title_text = "Audio/Display Settings";
draw_set_color(c_black);
draw_rectangle(0,0,gui_width,gui_height/4,false);
draw_set_color(text_color);
draw_set_font(fnt_text);
draw_text(gui_width/2,gui_height/5,title_text);
#endregion