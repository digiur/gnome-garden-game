extends Node2D

@export var seconds: float = 3

func _ready() -> void:
	await get_tree().create_timer(seconds).timeout
	queue_free()
