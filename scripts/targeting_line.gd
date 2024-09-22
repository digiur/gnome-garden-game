class_name TargetingLine extends Line2D

@onready var targets: TargetingRange = %TargetingRange as TargetingRange

func _process(delta: float) -> void:
	if targets.current_taget:
		points[1] = to_local(targets.current_taget.global_position)
	else:
		points[1] = Vector2.ZERO
