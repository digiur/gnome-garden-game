class_name TargetingArea extends Area2D

@export var type = Hitbox

var current_taget: Node2D = null
var targets_in_range: Dictionary[Node2D, bool] = {}

func _physics_process(delta: float) -> void:
	if current_taget == null and targets_in_range.size() > 0:
		current_taget = targets_in_range.keys().pick_random()

func _on_area_entered(area: Area2D) -> void:
	if is_instance_of(area, type):
		targets_in_range[area] = true

func _on_area_exited(area: Area2D) -> void:
	if targets_in_range.erase(area):
		pass
	if current_taget == area:
		current_taget = null
