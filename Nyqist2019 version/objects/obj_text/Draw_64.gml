//Box variables
var scr_width = display_get_gui_width();
var scr_height = display_get_gui_height();
var pic_box_width = scr_width * pic_split;
var text_box_width = scr_width * (1 - pic_split);
var box_top = scr_height * box_h_split;
var box_height = scr_height * (1 - box_h_split);

//Face variables
var spr_width = sprite_get_width(face);
var spr_height = sprite_get_height(face);
var x_scale = -(pic_box_width - 2 * border) / (spr_width);
var y_scale = (box_height - 2 * border) / (spr_height);

//Draw box
NineSlice(spr_text_box, 0, box_top, pic_box_width, scr_height);
NineSlice(spr_text_box,pic_box_width,box_top,scr_width, scr_height);

//Write text
draw_sprite_ext(face,0,border+1,box_top+border+1,x_scale,y_scale,0,color,1);
DrawText(color, font, fa_left, fa_top);
draw_text_ext(pic_box_width + border,box_top+border,displayed,border + height,text_box_width-32);

//Draw arrow once text is finished
if(letters >= length)
{
	arrow_toggle = Approach(arrow_toggle,1,0);
}
else
{
	arrow_toggle = arrow_toggle_cap;
}

if(arrow_toggle == 0)
{
	arrow_toggle = arrow_toggle_cap;
	show_arrow = !show_arrow;
}

if(show_arrow)
	draw_sprite(spr_text_arrow,0,scr_width - border, scr_height - border);