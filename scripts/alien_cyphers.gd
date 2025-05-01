extends Control

var current_level = State.level_index

#Game Hints
var game_has_hints = State.game_has_hints
var bg_colour_1: Color
var bg_colour_2: Color

# Moving the sheet
var mouse_in_title := false
var drag_offset := Vector2.ZERO
var dragging := false
var new_position := Vector2()
var viewport_size := Vector2()
var target_position := Vector2()
var panel_size := Vector2()

@onready var image_panel: Panel = $CypherPage/Panel

func _ready() -> void:
	hide()

# Moving the book
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in_title:
			dragging = true
			# Calculate offset between mouse and panel top-left corner
			drag_offset = get_global_mouse_position() - global_position
		else:
			dragging = false
	
	elif event is InputEventMouseMotion and dragging:
		new_position = get_viewport().get_mouse_position() - drag_offset
		global_position = new_position

func _process(_delta):
	target_position = get_global_mouse_position() - drag_offset
	panel_size = $CypherPage/Panel.get_rect().size
	viewport_size = get_viewport().get_visible_rect().size

	if dragging:
		target_position.y = clamp(target_position.y, 0, viewport_size.y - panel_size.y)
		target_position.x = clamp(target_position.x, 0, viewport_size.x - panel_size.x)
		global_position = global_position.lerp(target_position, 1.0)
	else:
		dragging = false

func _on_draggable_area_mouse_entered() -> void:
	mouse_in_title = true


func _on_draggable_area_mouse_exited() -> void:
	mouse_in_title = false


func _on_main_scene_cypher_changed(image_path:String) -> void:
	#Changing cypher images
	var style_box: StyleBoxTexture = image_panel.get_theme_stylebox("panel")
	style_box.texture = load(image_path)
	image_panel.add_theme_stylebox_override("panel", style_box)
	
	#Updating the hint
	if game_has_hints:
		$CypherPage/Hint1.visible = true
		$CypherPage/Hint2.visible = false
		current_level = State.level_index
		match current_level:
			1:
				change_hint1_color(Color(0, 0.439, 0.753))
			2:
				change_hint1_color(Color(0, 0.522, 0.11))
			3:
				change_hint1_color(Color(0.595, 0.53, 0))
			4:
				change_hint1_color(Color(0, 0.439, 0.753))
				change_hint2_color(Color(0, 0.522, 0.11))
			5:
				change_hint1_color(Color(0.78, 0, 0.396))
	else:
		$CypherPage/Hint1.visible = false
		$CypherPage/Hint2.visible = false


func change_hint1_color(new_color: Color) -> void:
	var panel = $CypherPage/Hint1
	var style = StyleBoxFlat.new()
	style.bg_color = new_color
	style.corner_radius_bottom_left = 3
	style.corner_radius_bottom_right = 3
	style.corner_radius_top_left = 3
	style.corner_radius_top_right = 3
	panel.add_theme_stylebox_override("panel", style)

func change_hint2_color(new_color: Color) -> void:
	var panel = $CypherPage/Hint2
	var style = StyleBoxFlat.new()
	$CypherPage/Hint2.visible = true
	style.bg_color = new_color
	style.corner_radius_bottom_left = 3
	style.corner_radius_bottom_right = 3
	style.corner_radius_top_left = 3
	style.corner_radius_top_right = 3
	panel.add_theme_stylebox_override("panel", style)
