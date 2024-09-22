extends CharacterBody2D

@export var speed = 400

func _physics_process(delta):
	var input_direction = Input.get_vector("wizard_left", "wizard_right", "wizard_up", "wizard_down")
	velocity = input_direction * speed
	move_and_slide()
