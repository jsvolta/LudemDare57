extends Control

@onready var quit_button: Button = $QuitButton
@onready var message_box: Label = $MessageBox

const final_message: String ="""
With the final modulation sent, a chorus of light erupted across the cosmos.\n
Not the cold, distant glimmer of stars, but a warm, embracing aurora that painted the sky with impossible colors.\n
A symphony of voices, not heard but felt, resonated within you, a welcoming embrace from entities far older and grander than you could have ever imagined. They had heard you, the little voice in the void, and they answered not with solutions or pronouncements, but with kinship. The loneliness that had driven you to the stars dissolved, replaced by the understanding that you were never truly alone, forever a part of the grand, intricate tapestry of the universe. Your journey has only just begun.
"""

func _ready() -> void:
	quit_button.hide()
	anchors_preset = Control.PRESET_FULL_RECT
	TextTransitions.typewriter(message_box, final_message, 60)
	await TextTransitions.finished_typing
	quit_button.show()

func _on_quit_button_button_down() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
