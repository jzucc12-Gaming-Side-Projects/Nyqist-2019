var candrag = mouse_x < pos_max && mouse_x > pos_min;
	
if(candrag)
{
	if(mouse_old - mouse_x > 0)
		x = Approach(x,x - mouse_x, pos_min);
	else
		x = Approach(x,mouse_x - x, pos_max);
}
else if(mouse_x < pos_min)
	x = pos_min;
else if(mouse_x > pos_max)
	x = pos_max;

parameter = Interpolate(pos_min,pos_max,x,par_min,par_max);
mouse_old = mouse_x;