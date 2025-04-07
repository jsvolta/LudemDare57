extends Camera2D

func _ready() -> void:
	self.offset.x = $"..".size.x/2
	self.offset.y = $"..".size.y/2
