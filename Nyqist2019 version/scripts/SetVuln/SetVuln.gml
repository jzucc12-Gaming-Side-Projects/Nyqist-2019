/// @description SetVuln(vuln, res)
/// @param vuln
/// @param res
function SetVuln(argument0, argument1) {
	// Creates an resistance array (vuln = 1, res = -1)

	// Example
	//		fire_armor = SetVuln(SetElement(2),SetElement(0));

	var _vuln = argument0;
	var _res = argument1;

	var diff = array_create(global.MaxElement,0);

	for(var ii = 0; ii < global.MaxElement; ii++)
		diff[ii] = _vuln[ii] - _res[ii];

	return diff;


}
