/// @@description Global object

debug = true;

// states
enum GAME_STATES {
	MAIN_MENU = 0,
	GAME = 1,
	PAUSE_MENU = 2,
};

state = GAME_STATES.MAIN_MENU;

enum PLAYER_STATES {
	STAND = 0,
	WALK = 1,
	RUN = 2,
	CROUCH = 3,
	CRAWL = 4,
	HUG = 5,
	CALL = 6,
	PUNCH = 7,
};

player_states_strings = [
  "STAND",
  "WALK",
  "RUN",
  "CROUCH",
  "CRAWL",
  "HUG",
  "CALLING"
]

// buttons init
// pressed
d_pad_up_pressed     = 0;
d_pad_down_pressed   = 0;
d_pad_right_pressed  = 0;
d_pad_left_pressed   = 0;
cross_key_pressed    = 0;
circle_key_pressed   = 0;
triangle_key_pressed = 0;
square_key_pressed   = 0;

// released
d_pad_up_released     = 0;
d_pad_down_released   = 0;
d_pad_right_released  = 0;
d_pad_left_released   = 0;
cross_key_released    = 0;
circle_key_released   = 0;
triangle_key_released = 0;
square_key_released   = 0;

// find controller
controller_id = 0;
for (var _i = 0; _i < gamepad_get_device_count(); _i++) {
	if (gamepad_get_description(_i) != "") {
		controller_id = _i;
		break;
	}
}

// gamepad dead zone
deadzone_value = 0.25
gamepad_set_axis_deadzone(controller_id, deadzone_value);

// standard sprite increment
image_index_increment = 1/8;
