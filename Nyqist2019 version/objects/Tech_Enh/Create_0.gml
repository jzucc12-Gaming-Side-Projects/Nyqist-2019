#region //Tech stat meaning
/*
"Name" ------- Self explanitory
"ID" --------- ID for hack list
"Class" ------ Hack or Enhancement
"Type" ------- "Elemental" type (fire, ice, healing, etc.)
"Tier" ------- Tech tier level (1. Heat - 2. Overheat - 3. Meltdown)
"Cost" ------- Tech points needed to use Tech
"Spread" ----- True if multiple targets can be acquired
"Reduction" -- Damage reduction for grouping
"Accuracy" --- Modifier to hit target
"Dmg" -------- Modifier to physical damage
"Crit Hit" --- Modifier to critical hit chance
"Crit Dmg" --- Modifier to critical hit damage
"Special" ---- True if the weapon has  special ability
*/
#endregion

ID_grid = ds_grid_create(3,global.MaxEnh);
var ID = 0;
var tier = 1;

#region //Heal Tier
#region //Patch
NewTech("Patch",tier,ID,"Enhancement",3,true,0.5);
AddStats(0,0,0,0,100,0,50,0,0,0,0,tier,ID);
AddArrays(SetTy(4),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(0,2),tier,ID);
AddDesc("Weak Healing Tech",tier,ID);
tier++;
#endregion

#region //Repair
NewTech("Repair",tier,ID,"Enhancement",6,true,0.5);
AddStats(0,0,0,0,100,0,100,0,0,0,0,tier,ID);
AddArrays(SetTy(4),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(0,2),tier,ID);
AddDesc("Moderate Healing Tech",tier,ID);
tier++;
#endregion

#region //Rehabilitate
NewTech("Rehabilitate",tier,ID,"Enhancement",10,true,0.5);
AddStats(0,0,0,0,100,0,200,0,0,0,0,tier,ID);
AddArrays(SetTy(4),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(0,2),tier,ID);
AddDesc("Strong Healing Tech",tier,ID);
#endregion
tier = 1;
ID++;
#endregion
