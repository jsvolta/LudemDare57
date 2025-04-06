extends Control

func _ready() -> void:
	anchors_preset = Control.PRESET_FULL_RECT
	
func _on_start_button_pressed() -> void:
	# switches to main game scene
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn") 
