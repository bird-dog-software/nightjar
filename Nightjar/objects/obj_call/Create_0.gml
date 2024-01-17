/// @description Manages calls
profile_pictures = {
	"cuckoo": {
		channel: "123.45",
		profile_picture: spr_broken_fence,
		name: "Cuckoo"
	},
	"nightjar": {
		channel: "000.00",
		profile_picture: spr_broken_fence,
		name: "Nightjar"
	},
	"para_keet": {
		channel: "678.90",
		profile_picture: spr_broken_fence,
		name: "Para Keet"
	}
};

message_pointer = 0;

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
