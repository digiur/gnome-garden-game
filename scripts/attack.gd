class_name Attack extends Resource

@export var _power: int = 10
@export var _variance: int = 3

func launch(target: Target, offense: OffensiveStats) -> void:
	target.do_attack(self, offense)

func get_power() -> int:
	return _power + randi_range(-1,1) * _variance

func is_crit() -> bool:
	return true if randf() < 0.2 else false
