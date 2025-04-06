extends Panel

signal answer_submitted(answer: String)

@onready var line_edit = $LineEdit
@onready var submit_button = $SubmitButton

func _ready() -> void:
	submit_button.pressed.connect(_on_submit_pressed)
	line_edit.text_submitted.connect(_on_text_submitted)

func _on_submit_pressed() -> void:
	_submit_answer()

func _on_text_submitted(text: String) -> void:
	_submit_answer()

func _submit_answer() -> void:
	var answer = line_edit.text.strip_edges()
	if answer.is_empty():
		return
	
	answer_submitted.emit(answer)
	line_edit.text = "" 
