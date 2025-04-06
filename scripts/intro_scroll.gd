extends Node3D

const SCROLL_SPEED = 2.0
const TILT_ANGLE = -50.0
const MAX_DISTANCE = 60.0  

func _ready():
	var env = WorldEnvironment.new()
	var environment = Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color(0, 0, 0, 1)  
	env.environment = environment
	add_child(env)

	# Create text node
	var text = Label3D.new()
	text.text = """
A CALL FROM THE VOID

Your tenth birthday arrives, and you feel the familiar 
sting of loneliness, a constant companion in the crowded city.
All you wished for was connection, someone to 
understand the quiet hum in your soul. Instead, your eccentric 
grandmother presents you with a dusty shortwave radio and a worn, 
leather-bound book filled with strange symbols and codes. 


"The universe is a vast conversation, child," she whispers, 
her eyes twinkling. "All you need is the key to listen." 
Little do you know, that radio isn't just a relic, 
and the cypher book isn't just a collection of riddles. 
They are the gateway to a galaxy of voices, each waiting to be heard, 
each speaking in secrets that only you can unlock. 
The deeper you go, the more you will discover.




"""
	
	text.font_size = 600
	text.modulate = Color(1, 0.8, 0, 1) 
	text.position = Vector3(0, -30, 2)  
	text.rotation_degrees.x = TILT_ANGLE
	add_child(text)
	
	var camera = Camera3D.new()
	camera.position = Vector3(0, 2, 8)  
	camera.rotation_degrees.x = -15  
	camera.current = true
	add_child(camera)

func _process(delta):
	var should_transition = true
	
	for child in get_children():
		if child is Label3D:
			child.position.z -= SCROLL_SPEED * delta
			child.position.y += SCROLL_SPEED * 0.3 * delta  # Slight upward movement
			
			if child.position.z > -MAX_DISTANCE:
				should_transition = false
	
	if should_transition:
		_go_to_start_screen()

func _input(event):
	# intro skip
	if event is InputEventMouseButton:
		if event.pressed:
			_go_to_start_screen()
	elif event is InputEventKey:
		if event.pressed:
			_go_to_start_screen()

func _go_to_start_screen():
	get_tree().change_scene_to_file("res://scenes/ui/start_screen.tscn") 
