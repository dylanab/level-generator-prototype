/**
Script to move the player object
Author: Cory
**/

//Set variable to hold passed in movement speed
move_speed = argument0;

//Set x and y speed to 0
xSpeed = 0;
ySpeed = 0;

//Get player's X and Y
new_x = global.player.x;
new_y = global.player.y;

//Check which directional keys are pressed and change x/y speed accordingly
if keyboard_check(ord('A')){
    xSpeed -= move_speed;
}
if keyboard_check(ord('S')){
    ySpeed += move_speed;
}
if keyboard_check(ord('D')){
    xSpeed += move_speed;
}
if keyboard_check(ord('W')){
    ySpeed -= move_speed;
}

//Check for collisions along proposed X path    
for (i = abs(xSpeed); i >= 0; i--){
    xx = i*sign(xSpeed);
    if !place_meeting(x + xx, y, pnt_boundary){
        new_x += xx;
        i = -1;
    }
}
//Check for collisions along proposed Y path
for (j = abs(ySpeed); j >= 0; j--){
    yy = j*sign(ySpeed);
    if !place_meeting(x, y + yy, pnt_boundary){
        new_y += j*sign(ySpeed);
        j = -1;
    }
}

//Assign new values to player object
global.player.x = new_x;
global.player.y = new_y;
