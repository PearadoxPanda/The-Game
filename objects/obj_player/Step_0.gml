var old_x = x;
var old_y = y;

var h = keyboard_check(vk_right) - keyboard_check(vk_left);
var v = keyboard_check(vk_down) - keyboard_check(vk_up);

if (h != 0) {
    if (!place_meeting(x + h * move_spd, y, obj_wall_hitbox)) {
        x += h * move_spd;
    }
}

if (v != 0) {
    if (!place_meeting(x, y + v * move_spd, obj_wall_hitbox)) {
        y += v * move_spd;
    }
}

if (h != 0 || v != 0) {
    if (abs(h) > abs(v)) {
        if (h > 0) facing = 2;
        else facing = 1;
    } else {
        if (v > 0) facing = 0;
        else facing = 3;
    }
}

var moving = (x != old_x) || (y != old_y);

if (moving) {
    bob_timer += 0.2;
    bob_offset = sin(bob_timer) * 2;
    image_speed = 1;
} else {
    bob_timer = 0;
    bob_offset = 0;
    image_speed = 0;
}

switch (facing) {
    case 0: sprite_index = spr_player_down; break;
    case 1: sprite_index = spr_player_left; break;
    case 2: sprite_index = spr_player_right; break;
    case 3: sprite_index = spr_player_up; break;
}

camera_set_view_pos(view_camera[0], x - 160, y - 90);