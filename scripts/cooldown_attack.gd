class_name CooldownAttack extends Timer

@export var attack: Attack
@export var offense: OffensiveStats
@export var effect: PackedScene

@onready var targets: TargetingRange = %TargetingRange

func _physics_process(delta: float) -> void:
	if targets.current_taget and attack and is_stopped():
		attack.launch(targets.current_taget, offense)
		start()
		if effect:
			var e = effect.instantiate() as Node2D
			targets.current_taget.add_child(e)
			e.global_position = targets.current_taget.global_position
