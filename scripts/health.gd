class_name HealthPoints extends Node

var health: int = 0
@export var max_health: float = 100

signal health_depleted

func _rady() -> void:
	_reset()

func _reset() -> void:
	health = max_health

func take_damage(damage:float) -> void:
	var start_health: = health
	health = health - damage

	if start_health > 0 and health <= 0:
		health_depleted.emit()
