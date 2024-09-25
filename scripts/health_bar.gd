class_name HealthBar extends Label

@onready var health_points: HealthPoints = %HealthPoints


func _process(delta: float) -> void:
	text = str(health_points.current_health)

func _on_health_points_health_low() -> void:
	#label_settings = ORANGE_LABEL_SETTINGS
	pass

func _on_health_points_health_critical() -> void:
	#label_settings = RED_LABEL_SETTINGS
	pass

func _on_health_points_health_empty() -> void:
	visible = false
