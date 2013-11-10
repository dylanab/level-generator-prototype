globalvar rooms;
var area_width = argument0;
var area_height = argument1;
var start_side = argument2;

var tile_size = 32; // width/height of the room's tiles
var r_width = 10;   // width of rooms in tiles
var r_height = 10;  // height of rooms in tiles

var room_space = tile_size;  //gap between rooms

var can_expand_room = true;
var can_make_rooms = true;
var rooms_to_make = 6;

//keep track of x, y position while building the level
current_x = 0;
current_y = 0;


var start_room_x;
var start_room_y;
var start_dir //the direction in which to expand the first room.


randomize();
    
//choose an entrance room on a predetermined side
switch(start_side) {
    case "left": 
        start_room_x = area_width - 1;
        start_room_y = irandom(area_height - 1);
        if(start_room_y != 0) { start_dir = choose("left", "up");}
        else if(start_room_y != area_height - 1) { start_dir = choose("left", "down");}
        break;
    case "right": 
        start_room_x = 0;
        start_room_y = irandom(area_height - 1);
        if(start_room_y != 0) { start_dir = choose("right", "up");}
        else if(start_room_y != area_height - 1) { start_dir = choose("right", "down");}
        break;
    case "top":
        start_room_x = irandom(area_width - 1);
        start_room_y = 0;
        if(start_room_x != 0) { start_dir = choose("left", "down");}
        else if(start_room_x != area_width - 1) { start_dir = choose("right", "down");}
        break;
    case "bottom":
        start_room_x = irandom(area_width - 1);
        start_room_y = area_height - 1;
        if(start_room_x != 0) { start_dir = choose("left", "up");}
        else if(start_room_x != area_width - 1) { start_dir = choose("right", "up");}
        break;
    default: 
        show_debug_message("Error determining area start side");
        break;
}

//divide the area's room slots into rooms
scr_divide_area(start_room_x, start_room_y, area_width, area_height, rooms_to_make); 

/*
*   cycle through the room slots and draw each one. 
*/
for(var i = 0; i < area_width; i++) {
    for(var j = 0; j < area_height; j++) {
        //choose the floor type based on the room slot's room tag
        switch(ds_grid_get(global.room_slots, i, j).room_tag) {
            case 0:
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_0);
                break;
            case 1: 
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_1);
                break;
            case 2: 
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_2);
                break;
            case 3:
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_3);
                break;
            case 4:
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_4);
                break;
            case 5:
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_5);
                break;
            case 6:
                scr_build_room(r_width, r_height, current_x, current_y, obj_floor_6);
                break;
            default:
                break;
        }
        //instance_create(current_x, current_y, obj_wall);
        //current_x += room_space; 
    }
    //current_x = 0;
    current_y = 0;
    current_x += (r_width * tile_size) 
    //current_y += (r_height * tile_size) 
    //instance_create(current_x, current_y, obj_wall);
    //current_y += room_space;
}




