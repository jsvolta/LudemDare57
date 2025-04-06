extends Control

var current_level = State.level_index

# Moving the sheet
var mouse_in_title := false
var drag_offset := Vector2.ZERO
var dragging := false
var new_position := Vector2()


func _ready() -> void:
	self.visible = true









# Moving the book
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() && mouse_in_title:
			dragging = true
			# Calculate offset between mouse and panel top-left corner
			drag_offset = get_global_mouse_position() - global_position
		else:
			dragging = false
			
	elif event is InputEventMouseMotion:
		if dragging:
			new_position = get_viewport().get_mouse_position() - drag_offset

func _physics_process(_delta):
	if dragging:
		if self.global_position.y <= 330.0 && self.global_position.y >= 0.0 && self.global_position.x <= 756.0 && self.global_position.x >= 0.0:
			var target_position = get_global_mouse_position() - drag_offset
			global_position = global_position.lerp(target_position, 1.0)
		else:
			var startPosition = Vector2(185.0,178.0)
			global_position = global_position.lerp(startPosition, 1.0)
			dragging = false

func _on_draggable_area_mouse_entered() -> void:
	mouse_in_title = true


func _on_draggable_area_mouse_exited() -> void:
	mouse_in_title = false
