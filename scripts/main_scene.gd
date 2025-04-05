extends Node2D

signal cypher_changed(new_text)

@onready var answer_popup = $UI/AnswerPopup
@onready var cypher_text = $UI/CypherText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var text = caesar_cipher(State.current_level_data[0]) # Apply cipher before emitting
	cypher_changed.emit(text)
	# NOTE: preload is on compile time and load is at runtime
	# this should probably be preloaded but it doesn't work with an array
	var background_scene;

	match State.level_index:
		# FIXME: this is temp
		_:
			background_scene = load("res://scenes/backgrounds/level_1.tscn")

	var background_instance = background_scene.instantiate()
	add_child(background_instance)
	
	# Connect answer submission signal
	answer_popup.answer_submitted.connect(_on_answer_submitted)

func _on_answer_submitted(answer: String) -> void:
	# Check if answer matches the original unciphered text
	if answer.to_upper() == State.current_level_data[0].to_upper():
		print("Correct answer!")
		# TODO: Handle correct answer (next level, etc.)
	else:
		print("Wrong answer!")
		cypher_text.shake()

func caesar_cipher(text: String, shift: int = 5) -> String:
	var result = ""
	for i in range(text.length()):
		var c = text[i]
		# Check if character is a letter
		if (c >= 'A' and c <= 'Z') or (c >= 'a' and c <= 'z'):
			var ascii = text.unicode_at(i)
			var base = 65 if c.to_upper() == c else 97 # Handle upper/lowercase
			# Normalize to 0-25 range, shift forward, then convert back
			var normalized = ascii - base
			var shifted = (normalized + shift) % 26 # Forward shift
			result += String.chr(shifted + base)
		else:
			result += c
	return result
