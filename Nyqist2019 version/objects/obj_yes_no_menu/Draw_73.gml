#region //Draw title with varying color
green_px = Wave(255,122,4,0);
var text_color = make_colour_rgb(0,green_px,200);
draw_set_color(text_color);
draw_set_font(fnt_text);
draw_set_halign(xalign[0]);
draw_set_valign(yalign);
draw_text(items_x[0],ypos - itemheight*spacing,choice_text);
#endregion

event_inherited();



