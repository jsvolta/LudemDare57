extends Control

var current_level = State.level_index

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
	var style_box: StyleBoxTexture = image_panel.get_theme_stylebox("panel")
	style_box.texture = load(image_path)
	image_panel.add_theme_stylebox_override("panel", style_box)
