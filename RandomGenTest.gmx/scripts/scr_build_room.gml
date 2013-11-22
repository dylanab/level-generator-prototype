var r_width = argument0;
var r_height = argument1;
var start_x = argument2;
var start_y = argument3;
var room_slot = argument4;

var floor_type = noone;
var tile_width = 32;//obj_floor_1.sprite_width; 
var f_tile_height = 32;//obj_floor_1.sprite_height;
var wt_tile_height = 63;//obj_wall_top.sprite_height;
var ws_tile_height = 29;//obj_wall.sprite_height;
var wt_face_height = wt_tile_height - ws_tile_height;

//choose the floor type to draw

switch(room_slot.room_tag) {
    case 0:
        floor_type = obj_floor_0;
        break;
    case 1: 
        floor_type = obj_floor_1;
        break;
    case 2: 
        floor_type = obj_floor_1;
        break;
    case 3:
        floor_type = obj_floor_1;
        break;
    case 4:
        floor_type = obj_floor_1;
        break;
    case 5:
        floor_type = obj_floor_1;
        break;
    case 6:
        floor_type = obj_floor_1;
        break;
    default:
        show_debug_message("Error determining floor type in scr_build_room.");
        break;
}

current_x = start_x;
current_y = start_y;

//choose a room template (haven't gotten to this yet)
//scr_choose_rtemplate();

for(var i = 0; i < r_width; i++) {
    for (var j = 0; j < r_height; j++) {
        instance_create(current_x, current_y, floor_type);
        current_x += tile_width;
    } 
    current_x = start_x;
    current_y += 32;
}

end_x = current_x;
end_y = current_y;

//draw the walls, yay

if(room_slot.wall_top) {
    current_x = start_x; //- (tile_width/2);
    current_y = start_y - (wt_tile_height/2);
    for(var i = 0; i < r_width; i++) {
        instance_create(current_x, current_y, obj_wall_top);
        current_x += tile_width;
    }
    if(room_slot.extra_top) {
        show_debug_message("adding an extra tile at " + string(current_x) + ", " + string(current_y));
        //current_x += tile_width;
        instance_create(current_x, current_y, obj_wall_top);
    }
}


if(room_slot.wall_bottom) {
    current_x = start_x; //- (tile_width/2);
    current_y = start_y + (r_height * tile_width) - (wt_tile_height/2);
    for(var i = 0; i < r_width; i++) {
        instance_create(current_x, current_y, obj_wall_top);
        current_x += tile_width;
    }
    if(room_slot.extra_bottom) {
        show_debug_message("adding an extra tile at " + string(current_x) + ", " + string(current_y));
        //current_x += tile_width;
        instance_create(current_x, current_y, obj_wall_top);
    }
}

if(room_slot.wall_right) {
    current_x = start_x + (r_width * 32);
    current_y = start_y - wt_face_height;
    for(var i = 0; i <= r_height; i++) {
        instance_create(current_x, current_y, obj_wall);
        current_y += ws_tile_height;
    }
}

if(room_slot.wall_left) {
    current_x = start_x;
    current_y = start_y - wt_face_height;
    for(var i = 0; i <= r_height; i++) {
        instance_create(current_x, current_y, obj_wall);
        current_y += ws_tile_height;
    }
}

//make sure that current_x and current_y are back to where they were when the floor finished being drawn.
//drawing the walls can make it weird. 
current_x = end_x;
current_y = end_y;

d_width = 10 * 32;
d_height = 10 * 32;

instance_create(start_x, start_y , obj_debug_display);





