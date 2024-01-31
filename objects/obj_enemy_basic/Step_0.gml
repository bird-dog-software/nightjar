if last_x != x || last_y != y {
	moving = true;
} else {
	moving = false;
}

alive = life_hp > 0;
move_direction = round(direction / 45);
frame += 1;
