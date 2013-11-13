/*

var level_width  = argument0;
var level_height = argument1;

var i;
var j;

//choose a value for each room slot
for(i = 0; i < level_height; i++) {
    for(j = 0; j < level_width; j++) {
        randomize();
        room_slots[i , j] = choose('0', '1', '2', '3');
    }
}

return room_slots;
