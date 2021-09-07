#region //Monster stat meaning
/*
"name" ------- Self explanitory
"sprite" ----- See above
"hp_max"------ max health
"hp" --------- current health
"tp_max"------ max tech points
"tp" --------- current tech points
"phys_dmg" --- physical damage modifier
"tech_dmg" --- tech damage modifier
"phys_res" --- physical resistance modifier
"tech_res" --- tech resistance modifier
"init" ------- attack speed modifier
"agil" ------- dodge attack modifier
"accu" ------- hit chance modifier
*/
#endregion

vuln = SetVuln(SetTy(),SetTy());

#region //Combat parameters
sprite_index = sprite;
image_speed = 0;
ATB = 0;
full = false;
//action_num = array_length_1d(action_array);
perform = -1;
action = 0;
targeted = false;
#endregion