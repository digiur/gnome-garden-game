extends CharacterBody2D

@export var speed: float = 400

func _physics_process(delta):
	var input_direction: Vector2 = Input.get_vector(
		&"wizard_left", &"wizard_right",
		&"wizard_up", &"wizard_down"
	)
	velocity = input_direction * speed
	move_and_slide()
