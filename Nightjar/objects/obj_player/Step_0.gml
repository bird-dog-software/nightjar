/// @description Insert description here
// You can write your code in this editor

// === INPUTS
var _right_key		  = keyboard_check(ord("D"));
var _left_key		  = keyboard_check(ord("A"));
var _up_key			  = keyboard_check(ord("W"));
var _down_key		  = keyboard_check(ord("S"));
var _x_key			  = keyboard_check_released(ord("X"));

// === COMPUTED
moving = _right_key || _left_key || _up_key || _down_key;

// facing direction
if _right_key && _up_key {
	direction_state = DIRECTION.UP_RIGHT;
} else if _right_key && _down_key {
	direction_state = DIRECTION.DOWN_RIGHT;
} else if _left_key && _up_key {
	direction_state = DIRECTION.UP_LEFT;
} else if _left_key && _down_key {
	direction_state = DIRECTION.DOWN_LEFT;
} else if _down_key {
	direction_state = DIRECTION.DOWN;
} else if _up_key {
	direction_state = DIRECTION.UP;
} else if _right_key {
	direction_state = DIRECTION.RIGHT;
} else if _left_key {
	direction_state = DIRECTION.LEFT;
}

// === MOVEMENT ( via: https://www.youtube.com/watch?v=qTqDY4JtFfo )
//  get the direction
var _horizontal_key = _right_key - _left_key;
var _vertical_key = _down_key - _up_key;
move_direction = point_direction(0, 0, _horizontal_key, _vertical_key);

//  get the x and y speeds
var _speed = 0;
var _input_level = point_distance(0, 0, _horizontal_key, _vertical_key);
_input_level = clamp(_input_level, 0, 1);
_speed = move_speed * _input_level;

x_speed = lengthdir_x(_speed, move_direction);
y_speed = lengthdir_y(_speed, move_direction);

// === STATES
if state == PLAYER_STATE.STAND {
	if _x_key { state = PLAYER_STATE.CROUCH; }
	if moving { state = PLAYER_STATE.RUN; }
}
else if state == PLAYER_STATE.CROUCH {
	if _x_key { state = PLAYER_STATE.STAND; }
	if moving { state = PLAYER_STATE.CRAWL; }
}
else if state == PLAYER_STATE.RUN {
	if !moving { state = PLAYER_STATE.STAND; }
	if _x_key  { state = PLAYER_STATE.CROUCH; }
}
else if state == PLAYER_STATE.CRAWL {
	if !crawling_through {
		if _x_key { state = PLAYER_STATE.CROUCH; }
	}
}

// === COLLISIONS
// walls
if place_meeting(x + x_speed, y, obj_wall) {
	colliding = true;
	x_speed = 0;
}
else if place_meeting(x, y + y_speed, obj_wall) {
	colliding = true;
	y_speed = 0;
}

// crawl throughs
else if place_meeting(x + x_speed, y, obj_wall_crawl_through) && state != PLAYER_STATE.CRAWL {
	colliding = true;
	x_speed = 0;
}
else if place_meeting(x, y + y_speed, obj_wall_crawl_through) && state != PLAYER_STATE.CRAWL {
	colliding = true;
	y_speed = 0;
}
else {
	colliding = false;
}

crawling_through = (
	place_meeting(x + x_speed, y, obj_wall_crawl_through) ||
	place_meeting(x, y + y_speed, obj_wall_crawl_through)
) && state == PLAYER_STATE.CRAWL;



// hugs
if colliding && state == PLAYER_STATE.RUN {
	hug_timer += 1 / game_get_speed(gamespeed_fps);
	show_debug_message(hug_timer)
	if frame mod hug_timer == 1 {
		state = PLAYER_STATE.HUG;
		direction_of_collision = point_direction(x, y, x + x_speed, y + y_speed)
	} else {
		// BUSTED!!!!!!
		state = PLAYER_STATE.RUN;
	}
}

// warps
if place_meeting(x + x_speed, y, obj_warp) || place_meeting(x, y + y_speed, obj_warp) {
	room_goto(obj_warp.rm_goto);
	x = obj_warp.rm_goto_x;
	y = obj_warp.rm_goto_y;
}

// calls
if place_meeting(x + x_speed, y, obj_call) || place_meeting(x, y + y_speed, obj_call) {
	// don't let player move
	x = 0;
	y = 0;
	
	// 
	audio_play_sound()
	
	
}

// footsteps
if moving && state == PLAYER_STATE.RUN {
	if place_meeting(x + x_speed, y, obj_floor_noisy) && place_meeting(x + x_speed, y, obj_floor_noisy) {
		footstep_timer += 1;
		if footstep_timer mod 20 == 0 {
			audio_play_sound(snd_effect_footstep_normal, 0, 0);
		}
	}
}

// === SPRITES
sprite_pointer = round(move_direction / 45);

if sprite_pointer >= 8 {
	sprite_pointer = 0;
}

// === MOVE THE PLAYER
if state == colliding {
	// need to figure out how to move away from collide
	// due to weird bug
	x -= x_speed;
	y -= y_speed;
}
else if state == PLAYER_STATE.CRAWL {
	x += x_speed/2;
	y += y_speed/2;
} else {
	x += x_speed;
	y += y_speed;
}

// increment frame for animation stuff
// we don't animate on idle crawls
if moving == 0 && state == PLAYER_STATE.CRAWL {
	frame += 0
} else {
	frame += 1;
}

