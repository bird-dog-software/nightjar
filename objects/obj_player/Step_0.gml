/// @description All the code for Nightjar

// INPUTS
var _x_key = obj_global.cross_key;
var _o_key = obj_global.circle_key;
var _t_key = obj_global.triangle_key;
var _s_key = obj_global.square_key;
var _horizontal  = gamepad_axis_value(obj_global.controller_id, gp_axislh);
var _vertical    = gamepad_axis_value(obj_global.controller_id, gp_axislv);

// MOVEMENT
move_direction = point_direction(0, 0, _horizontal, _vertical);

var _speed = 0;
var _input_level = point_distance(0, 0, _horizontal, _vertical);
_input_level = clamp(_input_level, 0, 1);
_speed = speeds[state] * _input_level;

var _x_speed = lengthdir_x(_speed, move_direction);
var _y_speed = lengthdir_y(_speed, move_direction);

x += _x_speed;
y += _y_speed;

sprite_pointer = round(move_direction / 45); // 8 way movement
if sprite_pointer == 8 { sprite_pointer = 0; }

// determine if we're moving
var _is_moving = _input_level > obj_global.deadzone_value;
var _image_index_increment = 1/8;

// MODIFY STATES
if state == PLAYER_STATES.STAND {
	if _x_key { state = PLAYER_STATES.CROUCH; }
	if _is_moving { state = PLAYER_STATES.RUN; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.CROUCH {
	if _x_key { state = PLAYER_STATES.STAND; }
	if _is_moving { state = PLAYER_STATES.CRAWL; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.RUN {
	if !_is_moving { state = PLAYER_STATES.STAND; }
	if _x_key  { state = PLAYER_STATES.CROUCH; }
}
else if state == PLAYER_STATES.CRAWL {
	if _x_key { state = PLAYER_STATES.CROUCH; }
}

image_index += _image_index_increment;

// footsteps
/*
if moving && state == obj_global.PLAYER_STATES.RUN {
	if place_meeting(x + x_speed, y, obj_floor_noisy) && place_meeting(x + x_speed, y, obj_floor_noisy) {
		footstep_timer += 1;
		if footstep_timer mod 20 == 0 {
			audio_play_sound(snd_effect_footstep_normal, 0, 0);
		}
	}
}
*/

// === SPRITES
debug_message(
	$"s: {state}\n" + 
	$"h: {_horizontal}\n" +
	$"v: {_vertical}\n" +
	$"md: {move_direction}\n" +
	$"sp: {sprite_pointer}\n" +
	$"si: {sprite_index}" 
);
sprite_index = sprites[state][sprite_pointer];
