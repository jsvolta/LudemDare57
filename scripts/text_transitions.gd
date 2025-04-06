extends Node

signal finished_typing()

var _typing_time: float

func typewriter(text_box: Control, text: String, speed: float = 40):
	text_box.text = text
	text_box.visible_characters = 0
	_typing_time = 0
	while text_box.visible_characters < text.length():
		_typing_time += get_process_delta_time()
		text_box.visible_characters = speed * _typing_time as int
		await get_tree().process_frame
	finished_typing.emit()
