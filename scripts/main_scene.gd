extends Node2D

signal cypher_changed(new_text)

# TODO: make this typesafe
var keys = Array()
const scenes = ["res://scenes/levels/tutorial_level_1.tscn"]
var scene_index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_keys()
	keys.shuffle()
	var text: String = keys.pop_back()
	text = caesar_cipher(text)  # Apply cipher before emitting
	cypher_changed.emit(text)
	# NOTE: preload is on compile time and load is at runtime
	# this should probably be preloaded but it doesn't work with an array
	var scene = load(scenes[scene_index])
	var instance = scene.instantiate()
	add_child(instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_keys() -> void:
	var file = FileAccess.open("res://data/keys.txt", FileAccess.READ)	
	var content = file.get_as_text()

	for key in content.split("\n"):
		# strip the \r
		key = key.strip_escapes()
		if key.length() > 0:
			keys.append(key.strip_escapes())

func caesar_cipher(text: String, shift: int = 5) -> String:
	var result = ""
	for i in range(text.length()):
		var c = text[i]
		# Check if character is a letter
		if (c >= 'A' and c <= 'Z') or (c >= 'a' and c <= 'z'):
			var ascii = text.unicode_at(i)
			var base = 65 if c.to_upper() == c else 97  # Handle upper/lowercase
			# Normalize to 0-25 range, shift forward, then convert back
			var normalized = ascii - base
			var shifted = (normalized + shift) % 26  # Forward shift
			result += String.chr(shifted + base)
		else:
			result += c
	return result
