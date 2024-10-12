class_name TargetingLine extends Line2D

@onready var targets: TargetingRange = %TargetingRange as TargetingRange
@onready var cooldown: CooldownAttack = %CooldownAttack

@onready var my_target: Vector2 = global_position

func _ready() -> void:
	cooldown.attack_launched.connect(did_attack)

func _process(delta: float) -> void:
	var d = my_target - global_position
	d = global_position + d * (cooldown.time_left / cooldown.wait_time)
	points[1] = to_local(d)

func did_attack(v: Vector2) -> void:
	my_target = v
