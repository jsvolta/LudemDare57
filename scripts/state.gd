extends Node2D

const background_1 = preload("res://scenes/backgrounds/level_1.tscn")
const background_2 = preload("res://scenes/backgrounds/level_2.tscn")

# Sub array layout
# 0 -> key
# 1 -> end message
# 2 -> level index
# 3 -> morse code
var level_data = [
["Bubble Wrap SOS","Bubble wrap SOS! We require immediate popping assistance. Your mission is loud and clear.",1,
"_ . . . . . _ . _ . . _ . . . _ . . . . . _ . . . . _ . _ . . . _ . _ _ . . _ _ _ . . ."],
["More Cats Please","Greetings, Earthling. Your planet hums with wonder. Especially the part about cats. More, please.",1,
"_ . _ . . _ . . . _ . _ . _ . _ . . _ . . . _ . . _ _ . . _ . _ . . . _ . . . . _ . . . . "],
["Emoji Language","Languages are only spoken with thoughts, emojis may be more efficient!",2,
". _ . _ _ . . _ _ _ . . . _ . _ . . _ . . _ . . . _ . . _ . _ . _ . _ . . . _ . _ . _ ."],
["Colourful pictures","Your drawings were analyzed. Our scientists are baffled. Please continue. You may be the key.",3,
"_ . _ . _ . . . _ _ . . _ . . . . . _ . . . _ . _ . . _ . _ . _ . _ . . _ . _ . . . _ . . _ . ."],
["A missing voice",	"You were never alone. You just forgot how to listen. The universe missed your voice.",4,
". _ _ _ . . . _ . . . _ _ . . . _ . _ . _ . . ."],
["Questions and voices","You are the conversation. You are the question and the key. We hear you. And now… you hear us too.",5,
"_ . _ . _ . . _ . . _ _ . . . _ . _ _ . . _ . _ . . _ . _ . . . _ . . . _ . . ."]
]
var current_level_data: Array

# TODO: clamp level_index
var level_index: int = 1
var max_level: int = 5

func _ready() -> void:
	self.level_data.shuffle();
	update_current_level_data()

func update_current_level_data() -> void:
	self.current_level_data = level_data[level_data.find_custom(_is_current_level.bind())]

func _is_current_level(data: Array) -> bool:
	if (data[2] == State.level_index):
		return true;
	return false;
