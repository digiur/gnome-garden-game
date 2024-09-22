class_name DamageNumbers extends Node2D

const NUMBER = preload("res://scenes/damage_number.tscn")

const CRIT_LABEL_SETTINGS = preload("res://resources/ui/damage_number_orange_label_settings.tres")

func _on_health_points_health_depleted(delta:int, crit: bool) -> void:
	var number:Control = NUMBER.instantiate()
	add_child(number)
	number.text = str(delta)
	number.set_global_position(global_position)
	if crit:
		number.label_settings = CRIT_LABEL_SETTINGS
