ID_array = ds_list_create();
var ID = 0;

#region //Cloth
NewArmor("Cloth",ID);
AddStats(50,0,0,0,0,0,0,5,0,0,0,-1,ID);
AddArrays(SetTy(),SetTy(0),SetTy(),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("Just some robes",-1,ID);
ID++;
#endregion

#region //Plate
NewArmor("Plate",ID);
AddStats(0,0,-5,0,-5,0,0,10,5,0,0,-1,ID);
AddArrays(SetTy(),SetTy(),SetTy(2),SetTy(),SetBug(),SetBug(),SetBug(),SetBug(),SetBoost(),SetSpec(),-1,ID);
AddDesc("Heavy metal protection",-1,ID);
ID++;
#endregion

