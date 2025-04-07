extends Control

@onready var confirm_button: Button = $ConfirmButton
@onready var message_box: Label = $MessageBox

const final_message: String = """
Your tenth birthday arrives, and you feel the familiar sting of loneliness, a constant companion in the crowded city. All you wished for was connection, someone to understand the quiet hum in your soul.\n
Instead, your eccentric grandmother presents you with a dusty shortwave radio and a worn, leather-bound book filled with strange symbols and codes. "The universe is a vast conversation, child," she whispers, her eyes twinkling. "All you need is the key to listen."\n
Little do you know, that radio isn't just a relic, and the cypher book isn't just a collection of riddles. They are the gateway to a galaxy of voices, each waiting to be heard, each speaking in secrets that only you can unlock. The deeper you go, the more you will discover.
"""

func _ready() -> void:
	show()
	anchors_preset = Control.PRESET_FULL_RECT
	TextTransitions.typewriter(message_box, final_message, 60)
	await TextTransitions.finished_typing

func _on_confirm_button_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	self.hide()
