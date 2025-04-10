extends Panel

signal message_read()

@onready var message_text = $MessageText
@onready var confirm_button = $ConfirmButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

func _on_confirm_button_pressed() -> void:
	_message_read()

func _message_read():
	hide()
	message_read.emit()

func _on_main_scene_alien_message(text:Variant) -> void:
	show()
	TextTransitions.typewriter(message_text, text)
	await TextTransitions.finished_typing
