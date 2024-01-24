/// @description Insert description here

if keyboard_check(ord("S")) {
	show_debug_message("Going to next message")
	message_pointer += 1;
	if message_pointer > array_length(messages[current_call_pointer].messages) {
		show_debug_message("")
		room_goto(returning_room);
	}
}

/*

profile_pictures = {
	"cuckoo": {
		channel: "123.45",
		profile_picture: spr_cuckoo_call,
		name: "Cuckoo"
	},
	"nightjar": {
		channel: "000.00",
		profile_picture: spr_nightjar_call,
		name: "Nightjar"
	},
	"para_keet": {
		channel: "678.90",
		profile_picture: spr_para_keet_call,
		name: "Para Keet"
	}
};

messages[0] =  {
	init: {
		left: "cuckoo",
		right: "nightjar"
	},
	messages: [
		{
			side: "left",
			from: "cuckoo",
			msg: "This is a test message, Nightjar. You are in a test level.",
		},
	// ...
*/

// do this off the init for the call

