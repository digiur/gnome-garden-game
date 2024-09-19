class_name Tower extends Node2D

@export var projectile_speed: float = 450.0

const TOWER_ATTACK = preload("res://scenes/towers/tower_attack.tscn")

var targets_in_range: Dictionary[Node2D, bool] = {}
var current_taget: Node2D = null

@onready var timer: Timer = %Timer

func _physics_process(delta: float) -> void:
	if current_taget == null and targets_in_range.size() > 0:
		current_taget = targets_in_range.keys().pick_random()

	if current_taget != null and timer.is_stopped():
		launch_attack()
		timer.start()

func _on_tower_range_area_entered(area: Area2D) -> void:
	print("mob entered")
	targets_in_range[area] = true

func _on_tower_range_area_exited(area: Area2D) -> void:
	print("mob exited")
	targets_in_range.erase(area)
	if current_taget == area:
		current_taget = null

func launch_attack() -> void:
	var attack = TOWER_ATTACK.instantiate()
	attack.velocity = (current_taget.global_position - global_position).normalized() * projectile_speed
	add_child(attack)
