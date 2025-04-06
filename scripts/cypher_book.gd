extends Control

var current_page = 0
var pages = []

# Moving the book
var mouse_in_title := false
var drag_offset := Vector2.ZERO
var dragging := false
var newPosition := Vector2()

func _ready():
	visible = false
	pages = [
		$Background/CyphersCover,
		$Background/CyphersP1,
		$Background/CyphersP2,
		$Background/CyphersP3
	]
	_show_page(current_page)

func _show_page(page_index: int) -> void:
	for i in range(pages.size()):
		if i == page_index:
			pages[i].visible = true
		else:
			pages[i].visible = false

func _on_open_book_pressed() -> void:
	visible = true

func _on_next_page_pressed() -> void:
	if current_page < pages.size() - 1:
		current_page+=1
		_show_page(current_page)

func _on_back_page_pressed() -> void:
	if current_page > 0:
		current_page-=1
		_show_page(current_page)

func _on_button_pressed() -> void:
	visible = false

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
			newPosition = get_viewport().get_mouse_position() - drag_offset

func _physics_process(_delta):
	if dragging:
		var target_position = get_global_mouse_position() - drag_offset
		global_position = global_position.lerp(target_position, 0.8)

func _on_title_bar_mouse_entered() -> void:
	mouse_in_title = true

func _on_title_bar_mouse_exited() -> void:
	mouse_in_title = false
