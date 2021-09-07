#region //Stat meaning
/*
"Name" ------- Self explanitory
"ID" --------- ID for utility list
"Class" ------ Recovery, Offense, or Utility
"Desc" ------- Item description
"Dmg" -------- Damage (or healing)
"Accuracy" --- Chance for item to hit
"Type" ------- Element
"Special" ---- True if the weapon has  special ability
*/
#endregion

#region //Type list order
/*
0 - Fire
1 - Electric
2 - Ice
3 - Earth (maybe)
4 - Wind (maybe)
5 - Corruption (similar to poison?)
6 - Divine
7 - Dark (find better name)
*/
#endregion

ID_array = ds_list_create();

#region //Stun Grenade
NewItem("Stun Grenade",0,"Utility",0,100,SetTy(),SetSpec(6,7));
AddDesc("Automatically flee from combat.",-1,0);
#endregion

#region //GPS
NewItem("GPS",1,"Utility",0,100,SetTy(),SetSpec(5,7));
AddDesc("Automatically flee Area.",-1,1);
#endregion