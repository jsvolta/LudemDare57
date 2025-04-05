extends Label

var tween: Tween

func _on_main_scene_cypher_changed(new_text:Variant) -> void:
	self.text = new_text

func shake() -> void:
	if tween:
		tween.kill()
	
	tween = create_tween()
	var start_pos = position
	
	# Create a snappy shaking effect
	for i in range(5):
		tween.tween_property(self, "position:x", start_pos.x - 10.0, 0.05)
		tween.tween_property(self, "position:x", start_pos.x + 10.0, 0.05)
	
	tween.tween_property(self, "position:x", start_pos.x, 0.05)
