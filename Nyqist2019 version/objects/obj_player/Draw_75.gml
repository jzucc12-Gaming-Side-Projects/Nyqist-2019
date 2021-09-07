draw_sprite_ext(sprite_index,0,x,y,x_scale,y_scale,0,c_white,1);

#region //Player information
var name = traits[? "Nickname"];
var hp = "HP: " + string(stats[? "HP"]) + "/" + string(stats[? "HP Max"]);
var tp = "TP: " + string(stats[? "TP"]) + "/" + string(stats[? "TP Max"]);
#endregion

#region //Display player information
var col;
var hp_frac = stats[? "HP"] / stats[? "HP Max"];
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fnt_text);

if(hp_frac > 0.5)
	col = c_white;
else if(hp_frac < 0.25)
	col = c_red;
else
	col = c_yellow;	

draw_set_color(col);
draw_text(player_info_x, player_info_y, name);
draw_text(player_info_x, player_info_y + spacing, hp);
draw_text(player_info_x, player_info_y + 2 * spacing, tp);
#endregion

if(targeted)
	draw_sprite(spr_text_arrow,0,x + arrow_x,y + arrow_y);