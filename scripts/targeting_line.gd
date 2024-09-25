class_name TargetingLine extends Line2D

@onready var targets: TargetingRange = %TargetingRange as TargetingRange
@onready var cooldown: CooldownAttack = %CooldownAttack

@onready var my_target: Vector2 = global_position

func _process(delta: float) -> void:
	if targets.current_taget:
		my_target = targets.current_taget.global_position

	var d = my_target - global_position
	d = global_position + d * remap(1 - (cooldown.time_left / cooldown.wait_time), 0, 1, 0.5, 1)
	points[1] = to_local(d)
