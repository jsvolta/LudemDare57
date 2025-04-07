extends CanvasLayer

@onready var volume_slider = $Container/OptionCluster/VolumeContainer/HSlider
@onready var master_bus_index = AudioServer.get_bus_index("Master")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	volume_slider.value = 0.5;
	hide()

func _on_volume_slider_value_changed(value:float) -> void:
	AudioServer.set_bus_volume_db(master_bus_index, linear_to_db(value))


func _on_quit_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn")
