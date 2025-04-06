extends TextEdit

func _ready() -> void:
	self.scroll_fit_content_width = true
	self.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
