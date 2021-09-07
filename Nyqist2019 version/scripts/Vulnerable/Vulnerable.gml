/// @description Vulnerable(attack, vuln)
/// @param attack
/// @param vuln
function Vulnerable(argument0, argument1) {
	// Determines net vulnerability

	// Example
	//		dmg *= Vulnerable(attack,vuln,res);

	var _attack = argument0;
	var _vuln = argument1;

	var net = 0;

	for(var ii = 0; ii < global.MaxElement; ii++)
		net += _attack[ii] * sign(_vuln[ii]);

	return power(2,sign(net));


}
