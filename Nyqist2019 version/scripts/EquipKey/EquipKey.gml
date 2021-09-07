/// @description EquipKey(x,y)
/// @param x
/// @param y
function EquipKey(argument0, argument1) {
	// Determines map key for equipment menu

	var _x = argument0;
	var _y = argument1;
	var key;

	switch(_y)
	{
		case 0: 
		{
			key = "Weapon";
			break;
		}
		case 1:
		{
			if(_x % 2 == 0)
				key = "Armor";
			else
				key = "Headgear";
			break;
		}
		case 2:
		{
			key = "Aug";
			break;
		}
	}
	return key;



}
