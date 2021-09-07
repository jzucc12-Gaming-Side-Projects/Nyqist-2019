if(alive && sprite != -1)
{
	draw_sprite_ext(sprite_index,0,x,y,scale,scale,0,c_white,1);
	if(targeted)
	{
		draw_sprite(spr_text_arrow,0,x + arrow_x,y + arrow_y);
	}
}