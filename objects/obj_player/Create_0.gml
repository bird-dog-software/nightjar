/// @description Player loop

// states
state = PLAYER_STATES.STAND;

// speeds ------ moving???
move_direction = 90;
speed = 0;
speeds = [
	0, // stand
	1, // run
	0, // crouch
	0.25, // crawl
	0, // calling
	0.5, // walking
];

// sprite control
image_speed = 0;
image_index = 0;
sprite_pointer = 0;

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
	]
];
