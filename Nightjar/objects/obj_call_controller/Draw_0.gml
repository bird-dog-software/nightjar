/// @description Insert description here

// debug
draw_text(10, 10, "CALL ROOM");
draw_text(10, 20, $"CALL_PTR: {current_call_pointer}");
draw_text(10, 30, $"MSG_PTR: {message_pointer}");

//
var _current_message = messages[current_call_pointer].messages[message_pointer].msg;
draw_text_ext(40, 64, _current_message, 10, 96);
