class_name HealthPoints extends Label

var current_health: float = 0

@export var max_health: float = 100
@export var regen: float = 0
@export_range(0, 1, 0.05, "suffix:%") var low_threshold: float = 0.5
@export_range(0, 1, 0.05, "suffix:%") var critical_threshold: float = 0.15

signal health_low
signal health_critical
signal health_depleted

func _process(delta: float) -> void:
	pass

func _ready() -> void:
	reset_to_max()
	
func reset_to_max() -> float:
	current_health = max_health
	set_text(str(current_health))
	return current_health

func damage_percent_of_max(damage_percent: float) -> float:
	return take_damage(max_health * damage_percent)

func damage_percent_of_current(damage_percent: float) -> float:
	return take_damage(current_health * damage_percent)

func take_damage(damage:float) -> float:
	var new_health: = current_health - damage
	var health_percent: float = current_health as float / max_health as float
	var new_health_percent: float = new_health as float / max_health as float

	if health_percent >= low_threshold and new_health_percent < low_threshold:
		health_low.emit()

	if health_percent >= critical_threshold and new_health_percent < critical_threshold:
		health_critical.emit()

	if current_health > 0 and new_health <= 0:
		health_depleted.emit()

	current_health = new_health
	text = str(current_health)
	return current_health
