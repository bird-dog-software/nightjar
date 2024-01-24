/// @description Player loop

// debug / temporary variables that need to be refactored
debug = true;

// state variables
frame = 0;
counter = 0;
moving = false;
crawling_through = false;
call_in_progress = false;

// movement variables
move_direction = 0;
move_speed = 1;
x_speed = 0;
y_speed = 0;
facing_direction = 0;
footstep_timer = 0;
colliding = false;
hug_timer = 0;
direction_of_collision = 0;

// states
depth = 0;

enum PLAYER_STATE {
	STAND = 0,
	RUN = 1,
	CROUCH = 2,
	CRAWL = 3,
	HUG = 4,
	CALLING = 5,
};

enum DIRECTION {
	RIGHT = 0,
	UP_RIGHT = 1,
	UP = 2,
	UP_LEFT = 3,
	LEFT = 4,
	DOWN_LEFT = 5,
	DOWN = 6,
	DOWN_RIGHT = 7,
}

state = 0;
direction_state = 0;

// sprite control
image_speed = 0.1;
sprite_pointer = 0;

// running sprites
run_sprite[0] = spr_player_run_right;
run_sprite[1] = spr_player_run_up_right;
run_sprite[2] = spr_player_run_up;
run_sprite[3] = spr_player_run_up_left;
run_sprite[4] = spr_player_run_left;
run_sprite[5] = spr_player_run_down_left;
run_sprite[6] = spr_player_run_down;
run_sprite[7] = spr_player_run_down_right;

// idle stand sprites
idle_stand_sprite[0] = spr_player_idle_stand_right;
idle_stand_sprite[1] = spr_player_idle_stand_up_right;
idle_stand_sprite[2] = spr_player_idle_stand_up;
idle_stand_sprite[3] = spr_player_idle_stand_up_left;
idle_stand_sprite[4] = spr_player_idle_stand_left;
idle_stand_sprite[5] = spr_player_idle_stand_down_left;
idle_stand_sprite[6] = spr_player_idle_stand_down;
idle_stand_sprite[7] = spr_player_idle_stand_down_right;

// idle crouch sprites
idle_crouch_sprite[0] = spr_player_idle_crouch_right;
idle_crouch_sprite[1] = spr_player_idle_crouch_up_right;
idle_crouch_sprite[2] = spr_player_idle_crouch_up;
idle_crouch_sprite[3] = spr_player_idle_crouch_up_left;
idle_crouch_sprite[4] = spr_player_idle_crouch_left;
idle_crouch_sprite[5] = spr_player_idle_crouch_down_left;
idle_crouch_sprite[6] = spr_player_idle_crouch_down;
idle_crouch_sprite[7] = spr_player_idle_crouch_down_right;

// crawl sprites
crawl_sprite[0] = spr_player_crawl_right;
crawl_sprite[1] = spr_player_crawl_up_right;
crawl_sprite[2] = spr_player_crawl_up;
crawl_sprite[3] = spr_player_crawl_up_left;
crawl_sprite[4] = spr_player_crawl_left;
crawl_sprite[5] = spr_player_crawl_down_left;
crawl_sprite[6] = spr_player_crawl_down;
crawl_sprite[7] = spr_player_crawl_down_right;
