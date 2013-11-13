start_room_x = argument0;
start_room_y = argument1;
area_width = argument2;
area_height = argument3 
rooms_to_make = argument4; //we'll make at most this many rooms. If space is not available, less will be made. 

show_debug_message("start room x: " + string(start_room_x));
show_debug_message("start room y: " + string(start_room_y));

var room_x = start_room_x;
var room_y = start_room_y;

var can_make_rooms = true;
var can_expand_room;
var rooms_addeds
var dir_is_good = false;
var bad_dir_count = 0;
var next_dir;
var starting = true;


for(var ii = 0; ii < rooms_to_make && can_make_rooms; ii++) { 
    show_debug_message("building room " + string(ii));
    //create a new room object
    global.rooms[ii] = instance_create(x, y, obj_room);
    can_expand_room = true;
    rooms_added = 0;
    //add room slots to the room
    for(var jj = 0; can_expand_room ; jj++) {
        
        if(starting) {
            show_debug_message("STARTING adding room slot at " + string(room_x) + ", " + string(room_y) + " to room " + string(ii + 1));
            global.rooms[ii].room_path[jj] = ds_grid_get(global.room_slots, room_x, room_y);
            global.rooms[ii].room_path[jj].room_tag = (ii + 1); 
            //let the room_slot know what its room_x and room_y are
            global.rooms[ii].room_path[jj].room_x = room_x;
            global.rooms[ii].room_path[jj].room_y = room_y;
            starting = false;
            jj++;
        }    
    
        var tried_up = false;
        var tried_down = false;
        var tried_left = false;
        var tried_right = false;  
        
        var dir_is_good = false;
        
        //pick a direction to expand the room
        while(!dir_is_good) {
            if(tried_up && tried_down && tried_left && tried_right) {
                show_debug_message("terminating room expansion. case 2");
                can_expand_room = false; //if we've unsuccessfully tried every direction, we can't expand room.
                can_make_rooms = false; //if we've unsucessfully tried every direction, then we're stuck in a corner. 
                break; 
            } 
            randomize();
            next_dir = choose("up" , "down", "left", "right");
            curr_room_tag = ds_grid_get(global.room_slots, room_x, room_y).room_tag;
            switch(next_dir) {
                case "up":
                    show_debug_message("trying up");
                    if(room_y - 1 >= 0 && !tried_up) {
                        if(ds_grid_get(global.room_slots, room_x, room_y - 1).room_tag == 0) {
                            show_debug_message("up is good");
                            dir_is_good = true;
                            room_y--;
                        } else { tried_up = true;}
                    } else { tried_up = true; }
                    break;
                case "down":
                    show_debug_message("trying down");
                    if(room_y + 1 <= area_height - 1 && !tried_down) {
                        if(ds_grid_get(global.room_slots, room_x, room_y + 1).room_tag == 0) {
                            show_debug_message("down is good");
                            dir_is_good = true;
                            room_y++;
                        } else { tried_down = true;}
                    } else { tried_down = true; }
                    break;
                case "left":
                    show_debug_message("trying left");
                    if(room_x - 1 >= 0 && !tried_left) {
                        if(ds_grid_get(global.room_slots, room_x - 1, room_y).room_tag == 0) {
                            show_debug_message("left is good");
                            dir_is_good = true;
                            room_x--;
                        } else { tried_left = true;}
                    } else { tried_left = true; }
                    break;
                case "right":
                    show_debug_message("trying right");
                    if(room_x + 1 <= area_width - 1 && !tried_right) {
                        if(ds_grid_get(global.room_slots, room_x + 1, room_y).room_tag == 0) {
                            show_debug_message("right is good");
                            dir_is_good = true;
                            room_x++;
                        } else { tried_right = true;}
                    } else { tried_right = true; }
                    break; 
                default:
                    show_debug_message("Error when expanding room");
                    break;   
                            
            } //switch(next_dir)
        } //while(!dir_is_good)
        
        show_debug_message("adding room slot at " + string(room_x) + ", " + string(room_y) + " to room " + string(ii + 1));
        global.rooms[ii].room_path[jj] = ds_grid_get(global.room_slots, room_x, room_y);
        global.rooms[ii].room_path[jj].room_tag = (ii + 1); 
        //let the room_slot know what its room_x and room_y are
        global.rooms[ii].room_path[jj].room_x = room_x;
        global.rooms[ii].room_path[jj].room_y = room_y;
        rooms_added++;
        
        //chance to stop expanding room
        //gets greater as loop iterates 
        randomize();
        if(irandom(5 - rooms_added) <= 1) {
            show_debug_message("terminating room expansion. case 1");
            can_expand_room = false;
            if(jj > 0) {
                randomize();
                k = abs(irandom(jj));
                expansion_point = global.rooms[ii].room_path[k];
                room_x = expansion_point.room_x;
                room_y = expansion_point.room_y;
                show_debug_message("expanding from room " + string(room_x) + ", " + string(room_y));
            } else {expansion_point = global.rooms[ii].room_path[jj];} 
            break;
        }
    } //for(can_expand_room)
    
} //for(rooms_to_make)


