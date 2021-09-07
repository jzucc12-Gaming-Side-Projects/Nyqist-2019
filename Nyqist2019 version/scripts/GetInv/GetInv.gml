/// @description GetInv(class, item)
/// @param class
/// @param item
function GetInv(argument0, argument1) {
	// Determines item based off of class and ID number

	// Example
	//		GetInv("Recovery", 1);

	var _class = argument0;
	var _itemNo = argument1;
	var item = ds_map_create();
	if(_itemNo < 0)
		return ds_map_create();
	
	switch(_class)
	{
		case "Recovery":
		{
			if(!instance_exists(Recovery_Items))
				instance_create_depth(0,0,0,Recovery_Items);
			ds_map_copy(item,Recovery_Items.ID_array[| _itemNo]);
			break;
		}
		case "Offense":
		{
			if(!instance_exists(Offense_Items))
				instance_create_depth(0,0,0,Offense_Items);
			ds_map_copy(item,Offense_Items.ID_array[| _itemNo]);
			break;
		}	
		case "Utility":
		{
			if(!instance_exists(Utility_Items))
				instance_create_depth(0,0,0,Utility_Items);
			ds_map_copy(item,Utility_Items.ID_array[| _itemNo]);
			break;
		}
		case "Key":
		{
			if(!instance_exists(Key_Items))
				instance_create_depth(0,0,0,Key_Items);
			ds_map_copy(item,Key_Items.ID_array[| _itemNo]);
			break;
		}
		case "Weapon":
		{
			if(!instance_exists(Weapons))
				instance_create_depth(0,0,0,Weapons);
			ds_map_copy(item,Weapons.ID_array[| _itemNo]);
			break;
		}
		case "Armor":
		{
			if(!instance_exists(Armor))
				instance_create_depth(0,0,0,Armor);
			ds_map_copy(item,Armor.ID_array[| _itemNo]);
			break;
		}
		case "Headgear":
		{
			if(!instance_exists(Headgear))
				instance_create_depth(0,0,0,Headgear);
			ds_map_copy(item,Headgear.ID_array[| _itemNo]);
			break;
		}
		case "Aug":
		{
			break;
		}
	}

	return item;


}
