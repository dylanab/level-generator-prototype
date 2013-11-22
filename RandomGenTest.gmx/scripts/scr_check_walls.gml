width = argument0;
height = argument1;
room_slots = argument2;

var i;
var j;
for(i = 0; i < width; i++) {
    for(j = 0; j < height; j++){
        
        var curr_slot = ds_grid_get(global.room_slots, i, j);
    
        if(i + 1 < width) {
            //check right    
            var right_slot = ds_grid_get(global.room_slots, i + 1, j);
            if(right_slot.room_tag == curr_slot.room_tag) {
                curr_slot.wall_right = false;
            }
        } 
        if(i - 1 >= 0) {
            //check left
            var left_slot = ds_grid_get(global.room_slots, i - 1, j);
            if(left_slot.room_tag == curr_slot.room_tag) {
                curr_slot.wall_left = false;
            }
        }
        
        if(j + 1 < height) {
            //check bottom
            var bottom_slot = ds_grid_get(global.room_slots, i, j + 1);
            if(bottom_slot.room_tag == curr_slot.room_tag) {
                curr_slot.wall_bottom = false;
            }
        } 
        
        if(j - 1 >= 0) {
            //check top
            var top_slot = ds_grid_get(global.room_slots, i, j - 1);
            if(top_slot.room_tag == curr_slot.room_tag) {
                curr_slot.wall_top = false;
            }
        }
        
        if(curr_slot.room_tag == 0) {
            curr_slot.wall_right = false;
            curr_slot.wall_left = false;
            curr_slot.wall_top = false;
            curr_slot.wall_bottom = false;
        } 
    }
}

//check for cases where we'll need an extra wall tile
for(i = 0; i < width; i++) {
    for(j = 0; j < height; j++){
        //check if we need an extra tile on the bottom row
        var curr_slot = ds_grid_get(global.room_slots, i, j);
        if(curr_slot.room_tag != 0 && curr_slot.wall_bottom) {
            if(i + 1 != width) {
                var right_slot = ds_grid_get(global.room_slots, i + 1, j);
                if(!right_slot.wall_bottom || right_slot.room_tag == 0) {
                    curr_slot.extra_bottom = true;
                }
            } else { curr_slot.extra_bottom = true;}
        }
        //check if we need an extra tile on the top row
        if(curr_slot.room_tag != 0 && curr_slot.wall_top) {
            if(i + 1 != width) {
                var right_slot = ds_grid_get(global.room_slots, i + 1, j);
                if(!right_slot.wall_top || right_slot.room_tag == 0) {
                    curr_slot.extra_top = true;
                }
            } else { curr_slot.extra_top = true;}
        }
    }
}
