/// @description Insert description here
// You can write your code in this editor

var _up_key      = obj_global.d_pad_up_released;
var _down_key    = obj_global.d_pad_down_released;
var _confirm_key = obj_global.circle_key_released;

if _up_key {
	menu_pointer -= 1;
	if menu_pointer < 0 {
		menu_pointer = array_length(menu_items) - 1;
	}
	audio_play_sound(snd_menu_select, 0, false);
}

if _down_key {
	menu_pointer += 1;
	if menu_pointer > array_length(menu_items) - 1 {
		menu_pointer = 0;
	}
	audio_play_sound(snd_menu_select, 0, false);
}

if _confirm_key {
	switch(menu_pointer) {
		case 0:
			obj_global.state = GAME_STATES.GAME;
			room_goto(rm_test_0);
			break;
		case 1:
			room_goto(rm_briefing);
			break;
		case 2:
			room_goto(rm_controls);
			break;
		case 3:
			room_goto(rm_credits);
			break;
		case 4:
			game_end(0);
			break;
	}
}
