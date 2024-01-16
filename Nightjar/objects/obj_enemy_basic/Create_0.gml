/// @description Player loop
start_x = x;
start_y = y;

// debug / temporary variables that need to be refactored
debug = true
frame = 0;
counter = 0;
moving = 0;

// variables
life_hp = 3;
grab_hp = 3;

// movement variables
move_direction = 0;
move_speed = 0.5;
x_speed = 0;
y_speed = 0;
facing_direction = 0;
alive = true;

// nonsense
last_x = x;
last_y = y;

// states
enum ENEMY_STATE {
	STAND = 0,
	WALK = 1,
	RUN = 2,
	KNOCKED_OUT = 3,
};

enum ENEMY_DIRECTION {
	RIGHT = 0,
	UP_RIGHT = 1,
	UP = 2,
	UP_LEFT = 3,
	LEFT = 4,
	DOWN_LEFT = 5,
	DOWN = 6,
	DOWN_RIGHT = 7,
}

state = ENEMY_STATE.STAND;

// sprite control
image_speed = 0.1;
sprite_pointer = 0;
direction_state = 0;

// running sprites
walk_sprite[0] = spr_enemy_green_basic_walk_right;
walk_sprite[1] = spr_enemy_green_basic_walk_up_right;
walk_sprite[2] = spr_enemy_green_basic_walk_up;
walk_sprite[3] = spr_enemy_green_basic_walk_up_left;
walk_sprite[4] = spr_enemy_green_basic_walk_left;
walk_sprite[5] = spr_enemy_green_basic_walk_down_left;
walk_sprite[6] = spr_enemy_green_basic_walk_down;
walk_sprite[7] = spr_enemy_green_basic_walk_down_right;

// idle sprites
idle_stand_sprite[0] = spr_enemy_green_basic_idle_right;
idle_stand_sprite[1] = spr_enemy_green_basic_idle_up;
idle_stand_sprite[2] = spr_enemy_green_basic_idle_up;
idle_stand_sprite[3] = spr_enemy_green_basic_idle_up;
idle_stand_sprite[4] = spr_enemy_green_basic_idle_left;
idle_stand_sprite[5] = spr_enemy_green_basic_idle_down;
idle_stand_sprite[6] = spr_enemy_green_basic_idle_down;
idle_stand_sprite[7] = spr_enemy_green_basic_idle_down;

// pathing (temp testing)
// path_start(pth_enemy_test_patrol, 0.5, path_action_continue, false);
