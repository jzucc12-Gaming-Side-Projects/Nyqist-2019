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
*/
#endregion

ID_grid = ds_grid_create(3,global.MaxHack);
var ID = 0;
var tier = 1;

#region //Fire Tier
#region //Heat
NewTech("Heat",tier,ID,"Hack",3,true,0.5);
AddStats(0,0,0,0,99.5,0,50,0,0,2,1.5,tier,ID);
AddArrays(SetTy(0),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Weak Fire Tech",tier,ID);
tier++;
#endregion

#region //Overheat
NewTech("Overheat",tier,ID,"Hack",6,true,0.7);
AddStats(0,0,0,0,99.5,0,100,0,0,4,2,tier,ID);
AddArrays(SetTy(0),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Medium Fire Tech",tier,ID);
tier++;
#endregion

#region //Meltdown
NewTech("Meltdown",tier,ID,"Hack",10,true,0.8);
AddStats(0,0,0,0,99.5,0,200,0,0,5,2,tier,ID);
AddArrays(SetTy(0),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Strong Fire Tech",tier,ID);
#endregion
tier = 1;
ID++;
#endregion

#region //Elecrtic Tier
#region //Zap
NewTech("Zap",tier,ID,"Hack",3,true,0.5);
AddStats(0,0,0,0,99.5,0,50,0,0,2,1.5,tier,ID);
AddArrays(SetTy(1),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Weak Electric Tech",tier,ID);
tier++;
#endregion

#region //Shock
NewTech("Shock",tier,ID,"Hack",6,true,0.7);
AddStats(0,0,0,0,99.5,0,100,0,0,4,2,tier,ID);
AddArrays(SetTy(1),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Moderate Electric Tech",tier,ID);
tier++;
#endregion

#region //Electrocute
NewTech("Electrocute",tier,ID,"Hack",10,true,0.8);
AddStats(0,0,0,0,99.5,0,200,0,0,5,2,tier,ID);
AddArrays(SetTy(1),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Strong Electric Tech",tier,ID);
#endregion
tier = 1;
ID++;
#endregion

#region //Ice Tier
#region //Chill
NewTech("Chill",tier,ID,"Hack",3,true,0.5);
AddStats(0,0,0,0,99.5,0,50,0,0,2,1.5,tier,ID);
AddArrays(SetTy(2),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Weak Ice Tech",tier,ID);
tier++;
#endregion

#region //Freeze
NewTech("Freeze",tier,ID,"Hack",6,true,0.7);
AddStats(0,0,0,0,99.5,0,200,0,0,5,2,tier,ID);
AddArrays(SetTy(2),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Moderate Ice Tech",tier,ID);
tier++;
#endregion

#region //Frostbite
NewTech("Frostbite",tier,ID,"Hack",10,true,0.8);
AddStats(0,0,0,0,99.5,0,200,0,0,5,2,tier,ID);
AddArrays(SetTy(2),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(1,2),tier,ID);
AddDesc("Strong Ice Tech",tier,ID);
#endregion
tier = 1;
ID++;
#endregion
