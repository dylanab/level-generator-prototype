var width = argument0;
var height = argument1;
var start_x = argument2;
var start_y = argument3;
var floor_type = argument4;


current_x = start_x;
current_y = start_y;

//choose a room template (haven't gotten to this yet)
//scr_choose_rtemplate();

for(var i = 0; i < width; i++) {
    for (var j = 0; j < height; j++) {
        instance_create(current_x, current_y, floor_type);
        current_x += 32;
    } 
    current_x = start_x;
    current_y += 32;
}

d_width = 10 * 32;
d_height = 10 * 32;
instance_create(start_x, start_y , obj_debug_display);





