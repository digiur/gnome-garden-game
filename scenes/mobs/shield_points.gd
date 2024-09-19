class_name ShieldPoints extends Label

var current_shield: int = 0

@export var max_shield: int = 100
@export var recharge_rate: int = 100
@export_range(0, 1, 0.05, "suffix:%") var low_threshold: float = 0.5
@export_range(0, 1, 0.05, "suffix:%") var critical_threshold: float = 0.15

signal shield_low
signal shield_critical
signal shield_depleted

func _ready() -> void:
	reset_to_max()

func reset_to_max() -> int:
	current_shield = max_shield
	text = str(current_shield)
	return current_shield

func damage_percent_of_max(damage_percent: int) -> int:
	return take_damage(max_shield * damage_percent)

func damage_percent_of_current(damage_percent: int) -> int:
	return take_damage(current_shield * damage_percent)

func take_damage(damage: int) -> int:
	var new_shield: = current_shield - damage
	var shield_percent: float = current_shield as float / max_shield as float
	var new_shield_percent: float = new_shield as float / max_shield as float

	if shield_percent >= low_threshold and new_shield_percent < low_threshold:
		shield_low.emit()

	if shield_percent >= critical_threshold and new_shield_percent < critical_threshold:
		shield_critical.emit()

	if current_shield > 0 and new_shield <= 0:
		shield_depleted.emit()

	current_shield = new_shield
	text = str(current_shield)
	return current_shield
