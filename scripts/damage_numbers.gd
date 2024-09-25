class_name DamageNumbers extends Node2D

const NUMBER = preload("res://scenes/damage_number.tscn")


func _on_health_points_health_depleted(delta:int, crit: bool) -> void:
	var number:Control = NUMBER.instantiate()
	add_child(number)
	number.text = str(delta)
	number.set_global_position(global_position)
