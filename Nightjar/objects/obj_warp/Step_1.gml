/// @description Insert description here
// You can write your code in this editor

if place_meeting(x, y, obj_player) {
	room_goto(next_room);
	obj_player.x = next_room_x;
	obj_player.y = next_room_y;
}
