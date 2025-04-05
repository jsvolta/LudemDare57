extends Control

var current_page = 0
var pages = []

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
