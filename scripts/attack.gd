extends Node2D

@export var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += delta * velocity


func _on_tower_attack_hurtbox_area_entered(area: Area2D) -> void:
	if area is HitBox:
		queue_free()
