class_name Target extends Area2D

@export var defense: DefensiveStats
@onready var health_points: HealthPoints = %HealthPoints as HealthPoints

func get_attacked(attack: Attack, offense: OffensiveStats) -> int:
	return health_points.deplete(attack.power)
