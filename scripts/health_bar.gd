class_name HealthBar extends Label

@onready var health_points: HealthPoints = %HealthPoints

func _process(delta: float) -> void:
	text = str(health_points.current_health)
