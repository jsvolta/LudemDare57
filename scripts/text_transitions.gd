extends Node

var _typing_speed: float = 40
var _typing_time: float

func typewriter(text_box: Control, text: String):
	text_box.text = text
	text_box.visible_characters = 0
	_typing_time = 0
	while text_box.visible_characters < text.length():
		_typing_time += get_process_delta_time()
		text_box.visible_characters = _typing_speed * _typing_time as int
		await get_tree().process_frame
