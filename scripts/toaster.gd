extends Area2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var is_flashing: bool = false

func _ready() -> void:
	sprite.play("idle")

func _on_main_scene_toaster_cliked() -> void:
	sprite.play("idle")
