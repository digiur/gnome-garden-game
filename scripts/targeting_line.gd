class_name TargetingLine extends Line2D

@onready var targets: TargetingRange = %TargetingRange as TargetingRange
@onready var cooldown: CooldownAttack = %CooldownAttack

func _process(delta: float) -> void:
	if targets.current_taget:
		var d = targets.current_taget.global_position - global_position
		d = global_position + d * (1 - (cooldown.time_left / cooldown.wait_time))
		points[1] = to_local(d)
	else:
		points[1] = Vector2.ZERO
