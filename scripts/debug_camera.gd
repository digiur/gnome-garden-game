extends Camera2D

@export var last_pos: Vector2 = Vector2.ZERO
@export var speed: float = 2500.0
@export var zoom_speed: float = 1.1

func _ready() -> void:
	last_pos = position
	
func _process(delta: float) -> void:
	GGG.player_move.emit(global_position - last_pos)

	last_pos = global_position
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("camera_reset"):
		position = Vector2.ZERO
		zoom = Vector2.ONE

	if event.is_action_pressed("camera_zoom_in"):
		zoom *= zoom_speed

	if event.is_action_pressed("camera_zoom_out"):
		zoom *= 1.0/zoom_speed
		
	zoom = clamp(zoom, Vector2(0.25, 0.25), Vector2(3.0, 3.0))

func _physics_process(delta: float):
	if Input.is_action_pressed("camera_down"):
		position += Vector2.DOWN * speed * delta

	if Input.is_action_pressed("camera_up"):
		position += Vector2.UP * speed * delta

	if Input.is_action_pressed("camera_right"):
		position += Vector2.RIGHT * speed * delta

	if Input.is_action_pressed("camera_left"):
		position += Vector2.LEFT * speed * delta
