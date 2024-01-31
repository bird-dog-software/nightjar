// sprites
if moving == 0 {
	if alive {
		if move_direction == ENEMY_DIRECTION.RIGHT {
			sprite_index = spr_enemy_green_basic_idle_right;
		}
		else if move_direction == ENEMY_DIRECTION.UP {
			sprite_index = spr_enemy_green_basic_idle_up;
		}
		else if move_direction == ENEMY_DIRECTION.LEFT {
			sprite_index = spr_enemy_green_basic_idle_left;
		}
		else if move_direction == ENEMY_DIRECTION.DOWN {
			sprite_index = spr_enemy_green_basic_idle_down;
		}
	} else {
		// death animation / dead
	}
}

if moving == 1 {
	if state == ENEMY_STATE.WALK || state == ENEMY_STATE.STAND {
		state = ENEMY_STATE.WALK;
		sprite_index = walk_sprite[move_direction];
	}
	
	if state == ENEMY_STATE.RUN || state = ENEMY_STATE.STAND {
		state = ENEMY_STATE.RUN;
		sprite_index = run_sprite[move_direction];
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
	draw_text(x, y + 30, $"SPR_PTR: {sprite_pointer}");
	draw_text(x, y + 40, $"MV_DIR: {move_direction}");
	draw_text(x, y + 50, $"DR_STATE: {direction_state}");
	draw_text(x, y + 60, $"DR: {direction}");
	draw_text(x, y + 70, $"MV: {moving}");
}
