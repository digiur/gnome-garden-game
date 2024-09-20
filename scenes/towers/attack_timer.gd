class_name AttackTimer extends Timer

@export var attack:Attack = null

@export var has_target: = false

func _physics_process(delta: float) -> void:
	if has_target and is_stopped():
		launch_attack()
		start()

func launch_attack() -> void:
	print("attack")
	pass
