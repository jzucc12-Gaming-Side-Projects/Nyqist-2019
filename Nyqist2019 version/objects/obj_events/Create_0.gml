//Event list
global.events = ds_list_create();
global.event_names = ds_list_create();

//List of global events
global.event1 = false
global.event_Sage = false

//Adding events to the event list
ds_list_add(global.events,global.event1); //default event
ds_list_add(global.events,global.event_Sage); //Trips if the secret sage has been spoken to

//Adding events to the event name list
ds_list_add(global.event_names,"event1");
ds_list_add(global.event_names,"Sage");