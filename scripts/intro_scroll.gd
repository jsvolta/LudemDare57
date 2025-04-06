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

	# Add star particles
	var stars = CPUParticles2D.new()
	stars.position = Vector2(640, 360)  # Center of screen
	stars.amount = 300
	stars.lifetime = 8.0
	stars.preprocess = 8.0
	stars.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	stars.emission_rect_extents = Vector2(640, 360)
	stars.direction = Vector2(0, 1)
	stars.spread = 10.0
	stars.gravity = Vector2.ZERO
	stars.initial_velocity_min = 10.0
	stars.initial_velocity_max = 30.0
	stars.scale_amount_max = 3.0
	stars.color = Color(1, 1, 1, 0.7)
	add_child(stars)

	# Add fast moving stars
	var fast_stars = CPUParticles2D.new()
	fast_stars.position = Vector2(640, 360)
	fast_stars.amount = 50
	fast_stars.lifetime = 4.0
	fast_stars.preprocess = 4.0
	fast_stars.emission_shape = CPUParticles2D.EMISSION_SHAPE_RECTANGLE
	fast_stars.emission_rect_extents = Vector2(640, 360)
	fast_stars.direction = Vector2(0, 1)
	fast_stars.spread = 5.0
	fast_stars.gravity = Vector2.ZERO
	fast_stars.initial_velocity_min = 50.0
	fast_stars.initial_velocity_max = 100.0
	fast_stars.scale_amount_min = 2.0
	fast_stars.scale_amount_max = 4.0
	fast_stars.color = Color(1, 1, 1, 0.9)
	add_child(fast_stars)

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
