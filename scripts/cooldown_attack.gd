class_name CooldownAttack extends Timer

@export var attack: Attack
@export var offense: OffensiveStats

@onready var targets: TargetingRange = %TargetingRange

func _physics_process(delta: float) -> void:
	if targets.current_taget and attack and is_stopped():
		attack.launch(targets.current_taget, offense)
		start()
