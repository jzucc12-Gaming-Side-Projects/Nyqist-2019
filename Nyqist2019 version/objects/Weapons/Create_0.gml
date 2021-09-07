#region //Weapon stat meaning
/*
"Name" ------- Self explanitory
"ID" --------- ID in weapon list
"Sprite" ----- See above
"Dual" ------- True if a two handed weapon
"Melee" ------ True if a melee weapon
*/
#endregion

#region //Weapon classes
/*
"Hand"
"Blade"
"Blunt"
"Gun"
"Shield"
*/
#endregion

ID_array = ds_list_create();
var ID = 0;

#region //Fist
NewWeapon("Fist",ID,"Hand",-1,false,true);
AddStats(0,0,15,20,10,10,0,0,0,10,1.3,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("The good old fashioned way",-1,ID);
ID++;
#endregion

#region //Sword
NewWeapon("Sword",ID,"Blade",-1,false,true);
AddStats(0,0,10,15,20,25,0,5,0,5,1.5,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("A nothing special sword",-1,ID);
ID++;
#endregion

#region //Shield
NewWeapon("Shield",ID,"Shield",-1,false,true);
AddStats(0,0,30,10,10,10,0,20,0,2,1.2,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("The most classic protection instrument",-1,ID);
ID++;
#endregion

