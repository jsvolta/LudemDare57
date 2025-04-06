extends Control

@onready var audio_player = $StartSoundPlayer

func _ready() -> void:
	anchors_preset = Control.PRESET_FULL_RECT
	
func _on_start_button_pressed() -> void:
	audio_player.play()
	await get_tree().create_timer(0.8).timeout
	# switches to main game scene
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn") 
