var width = argument0;
var height = argument1;
var start_x = argument2;
var start_y = argument3;
var room_slot = argument4;

var floor_type = noone;

//choose the floor type to draw

switch(room_slot.room_tag) {
    case 0:
        floor_type = obj_floor_0;
        break;
    case 1: 
        floor_type = obj_floor_1;
        break;
    case 2: 
        floor_type = obj_floor_2;
        break;
    case 3:
        floor_type = obj_floor_3;
        break;
    case 4:
        floor_type = obj_floor_4;
        break;
    case 5:
        floor_type = obj_floor_5;
        break;
    case 6:
        floor_type = obj_floor_6;
        break;
    default:
        show_debug_message("Error determining floor type in scr_build_room.");
        break;
}

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

end_x = current_x;
end_y = current_y;

//draw the walls, yay

if(room_slot.wall_top) {
    current_x = start_x;
    current_y = start_y;
    for(var i = 0; i < width; i++) {
        instance_create(current_x, current_y, obj_wall_top);
        current_x += 32;
    }
}

current_x = start_x;
current_y = start_y + (height * 32);

if(room_slot.wall_bottom) {
    for(var i = 0; i < width; i++) {
        instance_create(current_x, current_y, obj_wall_top);
        current_x += 32;
    }
}



if(room_slot.wall_right) {
    current_x = start_x + (width * 32);
    current_y = start_y;
    for(var i = 0; i < height; i++) {
        instance_create(current_x, current_y, obj_wall);
        current_y += 32;
    }
}


if(room_slot.wall_left) {
    current_x = start_x;
    current_y = start_y
    for(var i = 0; i < height; i++) {
        instance_create(current_x, current_y, obj_wall);
        current_y += 32;
    }
}

//make sure that current_x and current_y are back to where they were when the floor finished being drawn.
//drawing the walls can make it weird. 
current_x = end_x;
current_y = end_y;

d_width = 10 * 32;
d_height = 10 * 32;

instance_create(start_x, start_y , obj_debug_display);





