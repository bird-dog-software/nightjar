/// @description Player loop

// states
state = PLAYER_STATES.STAND;

// timers
footstep_timer = 0;
hug_timer = 0;

// speeds ------ moving???
move_direction = 90;
speed = 0;
speeds = [
	0,    // stand
	0.5,  // walk
	1,    // run
	0,    // crouch
	0.25, // crawl
	0,    // hug
	0     // calling
];

// sprite control
image_speed = 0;
image_index = 0;
sprite_pointer = 0;
memoized_sprite_pointer = sprite_pointer;

// [state][index]
sprites = [
	[
		spr_player_idle_stand_right,
		spr_player_idle_stand_up_right,
		spr_player_idle_stand_up,
		spr_player_idle_stand_up_left,
		spr_player_idle_stand_left,
		spr_player_idle_stand_down_left,
		spr_player_idle_stand_down,
		spr_player_idle_stand_down_right,
	],
	[
		spr_player_run_right,
		spr_player_run_up_right,
		spr_player_run_up,
		spr_player_run_up_left,
		spr_player_run_left,
		spr_player_run_down_left,
		spr_player_run_down,
		spr_player_run_down_right
	],
	[
		spr_player_run_right,
		spr_player_run_up_right,
		spr_player_run_up,
		spr_player_run_up_left,
		spr_player_run_left,
		spr_player_run_down_left,
		spr_player_run_down,
		spr_player_run_down_right
	],
	[
		spr_player_idle_crouch_right,
		spr_player_idle_crouch_up_right,
		spr_player_idle_crouch_up,
		spr_player_idle_crouch_up_left,
		spr_player_idle_crouch_left,
		spr_player_idle_crouch_down_left,
		spr_player_idle_crouch_down,
		spr_player_idle_crouch_down_right
	],
	[
		spr_player_crawl_right,
		spr_player_crawl_up_right,
		spr_player_crawl_up,
		spr_player_crawl_up_left,
		spr_player_crawl_left,
		spr_player_crawl_down_left,
		spr_player_crawl_down,
		spr_player_crawl_down_right
	],
	[ // needs to be "hug"
		spr_player_idle_stand_right,
		spr_player_idle_stand_up_right,
		spr_player_idle_stand_up,
		spr_player_idle_stand_up_left,
		spr_player_idle_stand_left,
		spr_player_idle_stand_down_left,
		spr_player_idle_stand_down,
		spr_player_idle_stand_down_right,
	],
	[ // needs to be "calling"
		spr_player_idle_crouch_right,
		spr_player_idle_crouch_up_right,
		spr_player_idle_crouch_up,
		spr_player_idle_crouch_up_left,
		spr_player_idle_crouch_left,
		spr_player_idle_crouch_down_left,
		spr_player_idle_crouch_down,
		spr_player_idle_crouch_down_right
	],
];
