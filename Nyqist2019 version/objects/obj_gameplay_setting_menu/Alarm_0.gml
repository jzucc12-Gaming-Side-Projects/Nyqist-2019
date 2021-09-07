//Swaps Player sprites
var temp_trait = global.player1_traits;
var temp_stat = global.player1_stats;
var temp_equip = global.player1_equipment;

global.player1_traits = global.player2_traits;
global.player1_stats = global.player2_stats;
global.player1_equipment = global.player2_equipment;

global.player2_traits = temp_trait;
global.player2_stats = temp_stat;
global.player2_equipment = temp_equip;