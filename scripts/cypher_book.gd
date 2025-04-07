extends Control

var current_page = 0
var pages = []

# Moving the book
var mouse_in_title := false
var drag_offset := Vector2.ZERO
var dragging := false
var new_position := Vector2()
var viewport_size := Vector2()
var target_position := Vector2()
var panel_size := Vector2()

func _ready():
	visible = false
	pages = [
		[	#0
			$Background/CyphersInstruction,		#0 - General instructions of the book's purpose
			$Background/CyphersP1,				#1 - Morse Code
		],[	#1
			$Background/CyphersP2, 				#2 - Caesar Cypher
			$Background/CyphersP3, 				#3 - Caesar Cypher
		],[	#2
			$Background/CyphersP4, 				#4 - 
			$Background/CyphersP5 				#5 - Page Cutouts
		]
	]
	_show_page(current_page)

func _show_page(page_index: int) -> void:
	for i in range(pages.size()):
		if i == page_index:
			pages[i][0].visible = true
			pages[i][1].visible = true
		else:
			pages[i][0].visible = false
			pages[i][1].visible = false

func _on_open_book_pressed() -> void:
	visible = true
	var startPosition = Vector2(185.0,178.0)
	global_position = global_position.lerp(startPosition, 1.0)

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
	
	elif event is InputEventMouseMotion and dragging:
		new_position = get_viewport().get_mouse_position() - drag_offset
		global_position = new_position

func _process(_delta):
	target_position = get_global_mouse_position() - drag_offset
	panel_size = $Background.get_rect().size
	viewport_size = get_viewport().get_visible_rect().size

	if dragging:
		target_position.y = clamp(target_position.y, 0, viewport_size.y - panel_size.y)
		target_position.x = clamp(target_position.x, 0, viewport_size.x - panel_size.x)
		global_position = global_position.lerp(target_position, 1.0)
	else:
		dragging = false
	
func _on_title_bar_mouse_entered() -> void:
	mouse_in_title = true

func _on_title_bar_mouse_exited() -> void:
	mouse_in_title = false

func _on_close_book_pressed() -> void:
	self.visible = false
