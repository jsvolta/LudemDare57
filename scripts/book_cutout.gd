extends SubViewportContainer

func _process(_delta):
	var parent_position = self.global_position
	$SubViewport/Camera2D.global_position = parent_position
