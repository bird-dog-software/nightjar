// sprites
if moving == 0 {
	if state == PLAYER_STATE.CROUCH {
		sprite_index = idle_crouch_sprite[direction_state];
	}
	else if state == PLAYER_STATE.STAND || state == PLAYER_STATE.RUN {
		sprite_index = idle_stand_sprite[direction_state];
	}
	else if state == PLAYER_STATE.CRAWL {
		sprite_index = crawl_sprite[direction_state];
	}
}

if moving == 1 {
	if state == PLAYER_STATE.RUN {
		sprite_index = run_sprite[sprite_pointer];
	}
	else if state == PLAYER_STATE.CRAWL {
		sprite_index = crawl_sprite[sprite_pointer];
	}
}

draw_sprite(sprite_index, frame/5, x, y);

// === debug
// issues:
if debug {
	draw_set_halign(fa_left);
	draw_set_color(c_white);
	draw_set_font(fnt_debug);
	draw_text(x, y + 20, $"STATE: {state}");
	// draw_text(x, y + 30, $"MV: {moving}");
	// draw_text(x, y + 40, $"SPR_PTR: {sprite_pointer}");
	// draw_text(x, y + 50, $"MV_DIR: {move_direction}");
	// draw_text(x, y + 60, $"DR_STATE: {direction_state}");
	// draw_text(x, y + 70, $"CRL_THRU: {crawling_through}");
	// draw_text(x, y + 30, $"COLLIDE: {colliding}");
	draw_text(x, y + 30, $"DOC: {direction_of_collision}")
}
