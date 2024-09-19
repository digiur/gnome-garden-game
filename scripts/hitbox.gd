class_name HitBox extends Area2D

@onready var health_points: HealthPoints = %HealthPoints

signal hit

func _on_area_entered(area: Area2D) -> void:
	print("Hitbox collided with Hurtbox")
