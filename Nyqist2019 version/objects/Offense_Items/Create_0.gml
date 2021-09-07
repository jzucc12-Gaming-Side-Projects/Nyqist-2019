#region //Stat meaning
/*
"Name" ------- Self explanitory
"ID" --------- ID for offense list
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

#region //Grenade
NewItem("Grenade",0,"Offense",50,70,SetTy(),SetSpec(1,6));
AddDesc("Deals 50 damage to a single target.",-1,0);
#endregion

#region //Incindiary Grenade
NewItem("Incin. Grenade",1,"Offense",50,70,SetTy(0),SetSpec(1,6));
AddDesc("Deals Fire 50 HP to a single target.",-1,1);
#endregion