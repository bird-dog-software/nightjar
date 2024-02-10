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
	CALLING = 6
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
d_pad_up     = 0;
d_pad_down   = 0;
d_pad_right  = 0;
d_pad_left   = 0;
cross_key    = 0;
circle_key   = 0;
triangle_key = 0;
square_key   = 0;

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
