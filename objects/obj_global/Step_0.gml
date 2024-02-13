/// @description Insert description here

// pressed buttons
d_pad_up_pressed     = gamepad_button_check_pressed(controller_id, gp_padu);
d_pad_down_pressed   = gamepad_button_check_pressed(controller_id, gp_padd);
d_pad_right_pressed  = gamepad_button_check_pressed(controller_id, gp_padr);
d_pad_left_pressed   = gamepad_button_check_pressed(controller_id, gp_padl);
cross_key_pressed    = gamepad_button_check_pressed(controller_id, gp_face1);
circle_key_pressed   = gamepad_button_check_pressed(controller_id, gp_face2);
square_key_pressed   = gamepad_button_check_pressed(controller_id, gp_face3);
triangle_key_pressed = gamepad_button_check_pressed(controller_id, gp_face4);

// released buttons
d_pad_up_released     = gamepad_button_check_released(controller_id, gp_padu);
d_pad_down_released   = gamepad_button_check_released(controller_id, gp_padd);
d_pad_right_released  = gamepad_button_check_released(controller_id, gp_padr);
d_pad_left_released   = gamepad_button_check_released(controller_id, gp_padl);
cross_key_released    = gamepad_button_check_released(controller_id, gp_face1);
circle_key_released   = gamepad_button_check_released(controller_id, gp_face2);
square_key_released   = gamepad_button_check_released(controller_id, gp_face3);
triangle_key_released = gamepad_button_check_released(controller_id, gp_face4);