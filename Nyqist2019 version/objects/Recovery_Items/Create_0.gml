#region //Stat meaning
/*
"Name" ------- Self explanitory
"ID" --------- ID for Recovery list
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

#region //M-Shot
NewItem("M-Shot",0,"Recovery",50,100,SetTy(),SetSpec(0));
AddDesc("Recovers 50 HP to a single target.",-1,0);
#endregion

#region //M-Pak
NewItem("M-Pak",1,"Recovery",100,100,SetTy(),SetSpec(0,4));
AddDesc("Recovers 100 HP to a single target.",-1,1);
#endregion