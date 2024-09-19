extends Node2D

@export var velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += delta * velocity


func _on_tower_attack_hurtbox_area_entered(area: Area2D) -> void:
	if area is HitBox:
		queue_free()
@onready var sprite_2d: Sprite2D = %Sprite2D

func _ready() -> void:
	sprite_2d.look_at(velocity+global_position)
