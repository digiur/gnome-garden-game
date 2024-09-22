extends Camera2D

@export var last_pos: Vector2 = Vector2.ZERO
@export var speed: float = 2500.0

func _ready() -> void:
	last_pos = position

func _physics_process(delta):

	if Input.is_action_pressed("camera_down"):
		position += Vector2.DOWN * speed * delta

	if Input.is_action_pressed("camera_up"):
		position += Vector2.UP * speed * delta

	if Input.is_action_pressed("camera_right"):
		position += Vector2.RIGHT * speed * delta

	if Input.is_action_pressed("camera_left"):
		position += Vector2.LEFT * speed * delta

	if Input.is_action_pressed("camera_reset"):
		position = Vector2.ZERO

	GGG.player_move.emit(global_position - last_pos)

	last_pos = global_position
