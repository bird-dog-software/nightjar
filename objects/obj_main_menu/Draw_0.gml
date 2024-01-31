// title
draw_set_halign(fa_center);
draw_set_font(fnt_main_title);
draw_set_color(c_white);

draw_text(room_width/2, 50, "NIGHTJAR");

// menu
for (var _i = 0; _i < array_length(menu_items); _i += 1) {
	draw_set_halign(fa_center);
	draw_set_font(fnt_test);
	if _i == menu_pointer {
		draw_set_color(c_green);
	} else {
		draw_set_color(c_white);
	}

	draw_text(room_width/2, draw_start_y + (_i * y_increment), menu_items[_i]);
}

// fade out on new game
/*
if fading {
	draw_set_color(c_black);
	fade += fade_increment;
	draw_set_alpha(fade);
	draw_rectangle(0, 0, room_width, room_height, false);
	
	// reset alpha
	draw_set_alpha(1);
}
*/
