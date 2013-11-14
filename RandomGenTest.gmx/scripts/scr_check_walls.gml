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

