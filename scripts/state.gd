extends Node2D

const background_1 = preload("res://scenes/backgrounds/level_1.tscn")
const background_2 = preload("res://scenes/backgrounds/level_2.tscn")

# Sub array layout
# 0 -> key
# 1 -> end message
# 2 -> level index
var level_data: Array
var current_level_data: Array

# TODO: clamp level_index
var level_index: int = 1
var max_level: int = 5

func _ready() -> void:
	self.level_data = _load_keys()
	update_current_level_data()

func update_current_level_data() -> void:
	self.current_level_data = level_data[level_data.find_custom(_is_current_level.bind())]

func _load_keys():
	var result = Array()
	var file = FileAccess.open("res://data/messages.csv", FileAccess.READ)
	var content = file.get_as_text()
	for level in content.split("\n"):
		var data = level.strip_escapes().split("|")
		if level.length() > 0:
			# TODO: determine if you need to cast data[2] to int
			result.append(data)
	return result

func _is_current_level(data: Array) -> bool:
	if (data[2] == str(State.level_index)):
		return true;
	return false;
