class_name HurtBox extends Area2D

@onready var hurt_points: float = 10

signal hurt

func _on_area_entered(area: Area2D) -> void:
	print("Hurtbox collided with Hitbox")
