extends Control

var current_level = State.level_index

func _ready() -> void:
	$Panel/RichTextLabel.text = "THIS IS LEVEL 1"
