extends SubViewportContainer

func _process(delta):
	
	#var parent_position_x = $"../../..".global_position.x
	#var parent_position_y = $"../../..".global_position.y
	#var position = Vector2($".".global_position.x+parent_position_x,$".".global_position.y+parent_position_y)
	#$SubViewport/Camera2D.global_position = position
	
	#var parent_position = $"../../..".global_position + self.global_position
	
	var parent_position = self.global_position
	$SubViewport/Camera2D.global_position = parent_position
