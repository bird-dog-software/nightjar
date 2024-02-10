/// @description player code

// inputs
#region
var _x_key = obj_global.cross_key;
var _o_key = obj_global.circle_key;
var _t_key = obj_global.triangle_key;
var _s_key = obj_global.square_key;
var _horizontal = gamepad_axis_value(obj_global.controller_id, gp_axislh);
var _vertical   = gamepad_axis_value(obj_global.controller_id, gp_axislv);
#endregion

// movement
#region
move_direction = point_direction(0, 0, _horizontal, _vertical);

var _speed = 0;
var _input_level = point_distance(0, 0, _horizontal, _vertical);
_input_level = clamp(_input_level, 0, 1);
_speed = speeds[state] * _input_level;

// determine if we're moving
// if we are, save sprite pointer to be used
// and don't animate on crawl idle
var _is_moving = _input_level > obj_global.deadzone_value;
var _image_index_increment = obj_global.image_index_increment;
if _is_moving {
	memoized_sprite_pointer = sprite_pointer;
} else {
	if state == PLAYER_STATES.CRAWL {
		_image_index_increment = 0;
	}
}

sprite_pointer = round(move_direction / 45); // 8 way movement
if sprite_pointer == 8 { sprite_pointer = 0; }

var _x_speed = lengthdir_x(_speed, move_direction);
var _y_speed = lengthdir_y(_speed, move_direction);
#endregion

// states
#region
if state == PLAYER_STATES.STAND {
	if _x_key     { state = PLAYER_STATES.CROUCH; }
	if _is_moving { state = PLAYER_STATES.RUN; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.CROUCH {
	if _x_key     { state = PLAYER_STATES.STAND; }
	if _is_moving { state = PLAYER_STATES.CRAWL; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.RUN {
	if !_is_moving { state = PLAYER_STATES.STAND; }
	if _x_key      { state = PLAYER_STATES.CROUCH; }
	if _input_level < obj_global.deadzone_value * 2 { state = PLAYER_STATES.WALK; }
}
else if state == PLAYER_STATES.CRAWL {
	if _x_key { state = PLAYER_STATES.CROUCH; }
}
else if state == PLAYER_STATES.WALK {
	if !_is_moving { state = PLAYER_STATES.STAND; }
	if _x_key      { state = PLAYER_STATES.CROUCH; }
	if _input_level >= obj_global.deadzone_value * 2 { state = PLAYER_STATES.RUN; }
}
#endregion

// footsteps
#region
footstep_timer++;
if _is_moving && state == PLAYER_STATES.RUN {
	if place_meeting(x + _x_speed, y, obj_floor_noisy) &&
	   place_meeting(x, y + _y_speed, obj_floor_noisy) {
		if footstep_timer mod 20 == 0 {
			audio_play_sound(snd_effect_footstep_normal, 0, 0);
		}
	}
}
#endregion

// collisions
#region
// this works but the player "bounces" back off the wall
// work on sprites will need to be done to ensure this is correct
// additionally, need to figure out how to "hug" wall
if place_meeting(x + _x_speed, y, obj_wall) && place_meeting(x, y + _y_speed, obj_wall) {
	_x_speed *= -1;
	_y_speed *= -1;
}
#endregion

/*
debug_message(
	"obj_player#step:player_info", 
	$"s:   {obj_global.player_states_strings[state]}\n" + 
	$"h:   {_horizontal}\n" +
	$"v:   {_vertical}\n" +
	$"md:  {move_direction}\n" +
	$"sp:  {sprite_pointer}\n" +
	$"si:  {sprite_index}\n" +
	$"mv:  {_is_moving}\n" +
	$"msp: {memoized_sprite_pointer}"
);
*/

// more movement
x += _x_speed;
y += _y_speed;

// sprites
image_index += _image_index_increment;
sprite_index = sprites[state][memoized_sprite_pointer];
