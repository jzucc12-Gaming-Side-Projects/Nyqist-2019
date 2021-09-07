var item_pos = ds_grid_get(show_list[| active_pos], 0, cursor_array[active_pos]);

if(select_all)
	var targets = [1,2];
else if(arrow_pos == 1)
	var targets = [1];
else if(arrow_pos == 2)
	var targets = [2];
	
var used = ItemEffect(title[active_pos], item_pos, targets, false);

#region //Use item
if(used)
{
	// Deleting an item
	if(count[active_pos])
	{
		if(UseInv(title[active_pos],cursor_array[active_pos],1))
		{
			count[active_pos]--;
			item_selected = false;			
		}
	}
}
#endregion