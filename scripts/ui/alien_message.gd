extends Panel

signal message_read()

@onready var message_text = $MessageText

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
	message_text.text = text
