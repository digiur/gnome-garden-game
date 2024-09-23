class_name Mob extends PathFollow2D

@export var speed: float = 100

@export var walk_period: float = 0.5
@export var walk_variance: float = 0.3

@export var pause_period: float = 1.0
@export var pause_variance: float = 0.6

var _paused = false

func _ready() -> void:
	if !is_zero_approx(pause_period):
		var speed_adjustment: float = (walk_period + pause_period) / walk_period
		print("speed_adjustment: %s" % speed_adjustment)
		speed *= speed_adjustment
		_paused = true
		var t: float = randf_range(pause_period - pause_variance, pause_period + pause_variance)
		get_tree().create_timer(t).connect("timeout",_unpause)

func _physics_process(dt: float) -> void:
	if !_paused:
		progress += speed * dt

	if progress_ratio >= 1.0:
		queue_free()

func _on_health_points_health_empty() -> void:
	queue_free()

func _pause() -> void:
	_paused = true
	var t: float = randf_range(pause_period - pause_variance, pause_period + pause_variance)
	get_tree().create_timer(t).connect("timeout", _unpause)

func _unpause() -> void:
	_paused = false
	var t: float = randf_range(walk_period - walk_variance, walk_period + walk_variance)
	get_tree().create_timer(t).connect("timeout", _pause)
