draw_set_alpha(alpha);
draw_set_color(c_red);
draw_set_halign(fa_center);
draw_set_valign(fa_center);

var txt = "Game Over";
var width = display_get_gui_width();
var height = display_get_gui_height();

draw_text_transformed(width/2,height/2,txt,3,3,0);