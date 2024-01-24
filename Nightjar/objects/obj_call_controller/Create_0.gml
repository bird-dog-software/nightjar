/// @description Manages calls

// profile pictures
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

// call scripts
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
		{
			side: "right",
			from: "nightjar",
			msg: "Understood.",
		},
		{
			side: "left",
			from: "para_keet",
			msg: "This concludes this test call."
		}
	]
}

messages[1] = {
	init: {
		left: "para_keet",
		right: "nightjar"
	},
	messages: [
		{
			side: "left",
			from: "para_keet",
			msg: "This is the second call!",
		},
		{
			side: "right",
			from: "nightjar",
			msg: "Spiffy!",
		},
		{
			side: "left",
			from: "para_keet",
			msg: "This concludes this second test call."
		}
	]	
}

// init
var _pfp = messages[current_call_pointer].init.left;
var _left_sprite = struct_get(profile_pictures, _pfp);
if (instance_exists(obj_caller_left)) {
	obj_caller_left.sprite_index = _left_sprite.profile_picture;
}

var _pfp = messages[current_call_pointer].init.right;
var _right_sprite = struct_get(profile_pictures, _pfp);
if (instance_exists(obj_caller_right)) {
	obj_caller_right.sprite_index = _right_sprite.profile_picture;
}
