class_name TargetingRange extends Area2D

var current_taget: Target = null
var targets_in_range: Dictionary[Target, bool] = {}

func _physics_process(delta: float) -> void:
	if current_taget == null and targets_in_range.size() > 0:
		current_taget = targets_in_range.keys().pick_random()

func _on_area_entered(area: Target) -> void:
	targets_in_range[area] = true

func _on_area_exited(area: Target) -> void:
	targets_in_range.erase(area)
	if current_taget == area:
		current_taget = null
