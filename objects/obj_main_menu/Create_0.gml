/// @description Insert description here
// You can write your code in this editor

menu_pointer = 0;
menu_items[0] = "NEW GAME";
menu_items[1] = "BRIEFING";
menu_items[2] = "CREDITS";
menu_items[3] = "EXIT GAME";

draw_start_y = 150;
y_increment = 15;

// main menu theme
audio_play_sound(snd_music_main_theme, 0, true);

// fade out FIXME
// fading = false;
// fade = 0;
// fade_increment = 0.1;
