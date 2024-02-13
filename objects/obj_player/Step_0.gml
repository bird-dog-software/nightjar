/// @description player code

// inputs
#region
var _x_key_released = obj_global.cross_key_released;
var _o_key_released = obj_global.circle_key_released;
var _t_key_released = obj_global.triangle_key_released;
var _s_key_released = obj_global.square_key_released;
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
	if _x_key_released     { state = PLAYER_STATES.CROUCH; }
	if _is_moving { state = PLAYER_STATES.RUN; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.CROUCH {
	if _x_key_released     { state = PLAYER_STATES.STAND; }
	if _is_moving { state = PLAYER_STATES.CRAWL; }
	else { _image_index_increment = 0; }
}
else if state == PLAYER_STATES.RUN {
	if !_is_moving { state = PLAYER_STATES.STAND; }
	if _x_key_released      { state = PLAYER_STATES.CROUCH; }
	if _input_level < obj_global.deadzone_value * 2 { state = PLAYER_STATES.WALK; }
}
else if state == PLAYER_STATES.CRAWL {
	if _x_key_released { state = PLAYER_STATES.CROUCH; }
}
else if state == PLAYER_STATES.WALK {
	if !_is_moving { state = PLAYER_STATES.STAND; }
	if _x_key_released      { state = PLAYER_STATES.CROUCH; }
	if _input_level >= obj_global.deadzone_value * 2 { state = PLAYER_STATES.RUN; } // assign to constant
}
#endregion

// sprites
image_index += _image_index_increment;
sprite_index = sprites[state][memoized_sprite_pointer];

// punching
// move to script
if state == PLAYER_STATES.STAND || state == PLAYER_STATES.RUN || state == PLAYER_STATES.WALK {
	if _o_key_released {
		state = PLAYER_STATES.PUNCH;
		// wait for anim to finish
		debug_message("obj_player#step:79", $"ii:in -> {image_index}:{image_number}")
		debug_message("obj_player#step:80", $"sgn: {sprite_get_number(sprite_index)}")
		if image_index > image_number - 1 {
			state = PLAYER_STATES.STAND;
		}
	}
}

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
	// debug_message("obj_player#step:91", "collding with obj_wall")
	// bounce back vs 0's
	_x_speed = 0;
	_y_speed = 0;
	
	
	/*
	_is_moving = false;
	hug_timer++;
	if hug_timer > 15 {
		state = PLAYER_STATES.HUG;
		if _input_level < obj_global.deadzone_value {
			state = PLAYER_STATES.STAND;
		}
	}
	*/
} else {
	hug_timer = 0;
	_is_moving = true;
	// debug_message("obj_player#step:91", "not collding with obj_wall")
}

if place_meeting(x + _x_speed, y, obj_wall_crawl_through) &&
   place_meeting(x, y + _y_speed, obj_wall_crawl_through) &&
   state != PLAYER_STATES.CRAWL {
	_x_speed = 0;
	_y_speed = 0;
}
#endregion

/*
debug_message(
	"obj_player#step:player_info", 
	$"sta: {obj_global.player_states_strings[state]}\n" + 
	$"hor: {_horizontal}\n" +
	$"ver: {_vertical}\n" +
	$"mvd: {move_direction}\n" +
	$"spp: {sprite_pointer}\n" +
	$"spi: {sprite_index}\n" +
	$"imv: {_is_moving}\n" +
	$"msp: {memoized_sprite_pointer}"
);
*/

// more movement
x += _x_speed;
y += _y_speed;

