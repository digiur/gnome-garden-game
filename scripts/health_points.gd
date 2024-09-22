class_name HealthPoints extends Node

@export var max_health:int = 100
@export var replenish_per_sec:int = 0
@export_range(0, 1, 0.05, "suffix:%") var low_threshold:float = 0.5
@export_range(0, 1, 0.05, "suffix:%") var critical_threshold:float = 0.15

@onready var current_health:int = max_health
@onready var current_health_percent:float = 1.0

signal health_changed
signal health_depleted
signal health_replenished

signal health_full

signal health_high
signal health_low
signal health_critical

signal health_empty

func _ready() -> void:
	current_health = max_health
	current_health_percent = 1.0

func deplete(delta:int, crit:bool) -> int:

	delta *= 2 if crit else 1

	var new_health:int = current_health - delta
	var new_health_percent:float = new_health as float / max_health as float

	health_changed.emit(-delta, crit)
	health_depleted.emit(delta, crit)

	if is_equal_approx(current_health_percent, 1.0) and new_health_percent < 1.0:
		health_high.emit()

	if current_health_percent >= low_threshold and new_health_percent < low_threshold:
		health_low.emit()

	if current_health_percent >= critical_threshold and new_health_percent < critical_threshold:
		health_critical.emit()

	if current_health_percent > 0.0 and new_health_percent <= 0.0:
		health_empty.emit()

	update_currents(new_health)
	return current_health

func replenish(delta:int, crit:bool) -> int:
	var new_health:int = current_health + delta
	var new_health_percent:float = new_health as float / max_health as float

	health_changed.emit(delta, crit)
	health_replenished.emit(delta, crit)

	if is_equal_approx(current_health_percent, 0.0) and new_health_percent > 0.0:
		health_critical.emit()

	if current_health_percent <= critical_threshold and new_health_percent > critical_threshold:
		health_low.emit()

	if current_health_percent <= low_threshold and new_health_percent > low_threshold:
		health_high.emit()

	if current_health_percent < 1.0 and new_health_percent >= 0.0:
		health_full.emit()

	update_currents(new_health)
	return current_health

func update_currents(new_health) -> void:
	current_health = clampi(new_health, 0, max_health)
	var new_health_percent:float = new_health as float / max_health as float
	current_health_percent = clampf(new_health_percent, 0.0, 1.0)
