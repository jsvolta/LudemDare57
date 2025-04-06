extends Node2D

signal cypher_changed(new_text)
signal alien_message(text)

@onready var answer_popup = $UI/AnswerPopup
@onready var cypher_text = $UI/CypherText
@onready var alien_cypher = $UI/AlienCyphers
@onready var cypher_book = $UI/CypherBook

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_level()
	# Connect answer submission signal
	answer_popup.answer_submitted.connect(_on_answer_submitted)
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _load_level():
	State.update_current_level_data()
	var text = caesar_cipher(State.current_level_data[0]) # Apply cipher before emitting
	cypher_changed.emit(text)
	# NOTE: preload is on compile time and load is at runtime
	# this should probably be preloaded but it doesn't work with an array
	var background;

	match State.level_index:
		# FIXME: this is temp
		1:
			background = State.background_1.instantiate()
		_:
			background = State.background_2.instantiate()

	add_child(background)
	
func _end_game():
	get_tree().change_scene_to_file("res://scenes/ui/end_screen.tscn") 

func _on_answer_submitted(answer: String) -> void:
	# Check if answer matches the original unciphered text
	if answer.to_upper() == State.current_level_data[0].to_upper():
		print("Correct answer!")
		State.level_index += 1
		# TODO: hide cypher and book
		alien_message.emit(State.current_level_data[1])

	else:
		print("Wrong answer!")
		cypher_text.shake()

func on_message_read():
	if (State.level_index > State.max_level):
		_end_game();
	else:
		_load_level()


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
