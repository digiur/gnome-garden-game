class_name Attack extends Resource

@export var power: int = 10

func launch(target: Target, offense: OffensiveStats) -> void:
	target.get_attacked(self, offense)
