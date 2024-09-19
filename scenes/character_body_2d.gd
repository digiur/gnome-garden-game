extends CharacterBody2D

@export var speed = 400

func get_input():
	var input_direction = Input.get_vector("wizard_left", "wizard_right", "wizard_up", "wizard_down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
