extends Label

func _on_main_scene_range_changed(light_years:float) -> void:
	self.text = "Range: " + str(snappedf(light_years, 0.001)) + " Mly"
