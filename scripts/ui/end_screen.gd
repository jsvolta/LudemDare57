extends Control

func _ready() -> void:
	anchors_preset = Control.PRESET_FULL_RECT

func _on_quit_button_button_down() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
