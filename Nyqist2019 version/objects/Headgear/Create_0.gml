ID_array = ds_list_create();
var ID = 0;

#region //Helmet
NewHeadgear("Helmet",ID);
AddStats(0,0,0,-5,0,0,0,5,0,0,0,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("Good old head protection",-1,ID);
ID++;
#endregion

#region //Goggles
NewHeadgear("Goggles",ID);
AddStats(0,0,0,0,5,0,0,2,2,0,0,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("Helps you hit your mark",-1,ID);
ID++;
#endregion
