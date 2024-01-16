/// @description Insert description here
// You can write your code in this editor

var _up_key     = keyboard_check_released(ord("W"));
var _down_key   = keyboard_check_released(ord("S"));
var _z_key      = keyboard_check_released(ord("Z"));

if _up_key {
	menu_pointer -= 1;
	if menu_pointer < 0 {
		menu_pointer = array_length(menu_items) - 1;
	}
	audio_play_sound(snd_menu_select,0,false);
}

if _down_key {
	menu_pointer += 1;
	if menu_pointer > array_length(menu_items) - 1 {
		menu_pointer = 0;
	}
	audio_play_sound(snd_menu_select,0,false);
}

if _z_key {
	audio_play_sound(snd_main_menu_confirm, 0, false);
	switch(menu_pointer) {
		case 0:
			room_goto(rm_test_0);
			break;
		case 1:
			room_goto(rm_briefing);
			break;
		case 2:
			room_goto(rm_credits);
			break;
		case 3:
			game_end(0);
			break;
	}
}
