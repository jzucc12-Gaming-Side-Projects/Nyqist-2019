var spr_block = sprite_get_width(spr_slider_bar)/3;
ThreeSlice(spr_slider_bar,pos_min-spr_block,pos_max+spr_block,y);
draw_sprite(spr_slider_knob,0,x,y);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_text);

/*if (string_length(string(percent)) == 1) 
{
    draw_text(x,y-spr_block/3,string(percent)+".00")
}
else
	draw_text(x,y-spr_block/3,percent);*/