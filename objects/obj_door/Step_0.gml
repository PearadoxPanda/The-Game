var dist = point_distance(x, y, obj_player.x, obj_player.y);

if (dist <= 50) {
    // Player nearby → play forward
    image_speed = 1;
    if (image_index >= 4) {
        image_speed = 0;
        image_index = 4;
    }
} 
else {
    // Player away → play backward
    image_speed = -0.5;
    if (image_index <= 0) {
        image_speed = 0;
        image_index = 0;
    }
}