class_name HealthBar extends Label

@onready var health_points: HealthPoints = %HealthPoints

const ORANGE_LABEL_SETTINGS = preload("res://resources/ui/damage_number_orange_label_settings.tres")
const RED_LABEL_SETTINGS = preload("res://resources/ui/damage_number_red_label_settings.tres")
const WHITE_LABEL_SETTINGS = preload("res://resources/ui/damage_number_white_label_settings.tres")

func _process(delta: float) -> void:
	text = str(health_points.current_health)

func _on_health_points_health_low() -> void:
	label_settings = ORANGE_LABEL_SETTINGS

func _on_health_points_health_critical() -> void:
	label_settings = RED_LABEL_SETTINGS

func _on_health_points_health_empty() -> void:
	visible = false
