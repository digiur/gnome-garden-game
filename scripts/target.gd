class_name Target extends Area2D

@export var defense: DefensiveStats
@export var crit_multiplier: float = 1.0
@onready var health_points: HealthPoints = %HealthPoints as HealthPoints

func do_attack(attack: Attack, offense: OffensiveStats) -> int:
	var crit: = attack.is_crit()
	var attack_power = attack.get_power() * (crit_multiplier if crit else 1.0)

	return health_points.deplete(attack_power, crit)
