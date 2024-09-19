extends Camera2D

@export var speed: float = 250.0

func _physics_process(delta):

	if Input.is_action_pressed("camera_down"):
		position += Vector2.DOWN * speed * delta

	if Input.is_action_pressed("camera_up"):
		position += Vector2.UP * speed * delta

	if Input.is_action_pressed("camera_right"):
		position += Vector2.RIGHT * speed * delta

	if Input.is_action_pressed("camera_left"):
		position += Vector2.LEFT * speed * delta
