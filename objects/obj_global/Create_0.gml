/// @@description Global object

debug = true;

// states
enum GAME_STATES {
	IN_MENU = 0,
	IN_GAME = 1,
};

enum PLAYER_STATES {
	STAND = 0,
	RUN = 1,
	CROUCH = 2,
	CRAWL = 3,
	HUG = 4,
	CALLING = 5,
};

// buttons init
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
