extends Node2D

signal cypher_changed(image_path: String)
signal alien_message(text)

@onready var answer_popup = $UI/AnswerPopup
@onready var ui: Control = $UI
@onready var options_menu: CanvasLayer = $OptionsMenu
var is_options_menu_open: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_level()
	# Connect answer submission signal
	answer_popup.answer_submitted.connect(_on_answer_submitted)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"): 
		if !is_options_menu_open:
			ui.hide()
			options_menu.show()	
			is_options_menu_open = true
		else:
			options_menu.hide()
			ui.show()
			is_options_menu_open = false

func _load_level():
	State.update_current_level_data()

	cypher_changed.emit(State.current_level_data[3])

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
		answer_popup.shake()

func on_message_read():
	if (State.level_index > State.max_level):
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		_end_game();
	else:
		TransitionScreen.transition()
		await TransitionScreen.on_transition_finished
		_load_level()
