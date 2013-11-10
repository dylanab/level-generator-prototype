var room_slots = argument0;
var area_width = argument1;
var area_height = argument2;
var start_side = argument3;

var tile_size = 32; // width/height of the room's tiles
var r_width = 10;   // width of rooms in tiles
var r_height = 10;  // height of rooms in tiles

var room_space = tile_size;  //gap between rooms

var can_expand_room = true;
var can_make_rooms = true;

//keep track of x, y position while building the level
current_x = 0;
current_y = 0;

//choose an entrance room
var start_room_x;
var start_room_y;
var start_dir //the direction in which to expand the first room.

switch(start_side) {
    case "left": 
        start_room_x = r_width - 1;
        start_room_y = irandom(r_height - 1);
        if(start_room_y != 0) { start_dir = choose("left", "up");}
        else if(start_room_y != r_height - 1) { start_dir = choose("left", "down");}
        break;
    case "right": 
        start_room_x = 0;
        start_room_y = irandom(r_height - 1);
        if(start_room_y != 0) { start_dir = choose("right", "up");}
        else if(start_room_y != r_height - 1) { start_dir = choose("right", "down");}
        break;
    case "top":
        start_room_x = irandom(r_width - 1);
        start_room_y = 0;
        if(start_room_x != 0) { start_dir = choose("left", "down");}
        else if(start_room_x != r_width - 1) { start_dir = choose("right", "down");}
        break;
    case "bottom":
        start_room_x = irandom(r_width - 1);
        start_room_y = r_height - 1;
        if(start_room_x != 0) { start_dir = choose("left", "up");}
        else if(start_room_x != r_width - 1) { start_dir = choose("right", "up");}
        break;
    default: 
        show_debug_message("Error determining area start side");
        break;
}

//NOTE: we might need to create the room_slot objects now, so that they can store which room they're part of. 
//yeah, we'll need to do this

//starting from the start room, walk around at random, choosing rooms until the process is terminated.
var current_slot_x = start_room_x;
var current_slot_y = start_room_y;
var current_slot = room_slots[current_slot_x, current_slot_y];
var current_dir = start_dir;
while(can_expand_room) {
    switch(current_dir) {
        case "up":
            //current_slot_x += 1;
            current_slot_y += 1;
            current_room = room_slots[current_slot_x, current_slot_y];
            break;
        case "down":
            //current_slot_x += 0;
            current_slot_y -= 1;
            current_room = room_slots[current_slot_x, current_slot_y];
            break;
        case "left":
            current_slot_x -= 1;
            //current_slot_y += 0;
            current_room = room_slots[current_slot_x, current_slot_y];
            break;
        case "right":
            current_slot_x += 1;
            //current_slot_y += 1;
            current_room = room_slots[current_slot_x, current_slot_y];
            break;  
    }
}

//while we can make rooms
//divide the room slots into rooms
while(can_make_rooms) {
    
    
    

}

/*
*   cycle through the room slots and build a room at each one. 
*/
for(var i = 0; i < area_height; i++) {
    for(var j = 0; j < area_width; j++) {
        show_debug_message("getting l_ar(" + string(i) + ", " + string(j) + ") : " 
                                           + string(room_slots[i , j]));
        //choose the floor type based on the value in the room slot
        switch(room_slots[i , j]) {
            case '0':
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_0);
                break;
            case '1': 
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_1);
                break;
            case '2': 
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_2);
                break;
            case '3':
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_3);
                break;
            default:
                break;
        }
        instance_create(current_x, current_y, obj_wall);
        current_x += room_space; 
    }
    current_x = 0;
    current_y += (r_height * tile_size) 
    instance_create(current_x, current_y, obj_wall);
    current_y += room_space;
}


