extends Node3D

const SCROLL_SPEED = 2.0
const TILT_ANGLE = -50.0
const MAX_DISTANCE = 40.0  

func _ready():
	# Set up black environment
	var env = WorldEnvironment.new()
	var environment = Environment.new()
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color(0, 0, 0, 1)  
	env.environment = environment
	add_child(env)

	# Create text node
	var text = Label3D.new()
	text.text = """TEST
A CALL FROM THE VOID

Lorem ipsum dolor sit amet consectetur 
adipiscing elit. Quisque faucibus ex sapien 
vitae pellentesque sem placerat. In id cursus
 mi pretium tellus duis convallis. T

empus leo eu aenean sed diam urna tempor. 
Pulvinar vivamus fringilla lacus nec metus 
bibendum egestas. Iaculis massa nisl malesuada 
lacinia integer nunc posuere. Ut hendrerit semper
 vel class aptent taciti sociosqu. 
Ad litora torquent per conubia nostra inceptos
 himenaeos.



"""
	
	text.font_size = 600
	text.modulate = Color(1, 0.8, 0, 1) 
	text.position = Vector3(0, -30, 2)  
	text.rotation_degrees.x = TILT_ANGLE
	add_child(text)
	
	# Create camera
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
