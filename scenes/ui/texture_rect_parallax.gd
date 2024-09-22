extends TextureRect

@export var speed: Vector2 = Vector2.ONE / 30.0
var scroll: Vector2 = Vector2.ZERO

func get_input():
	var input_direction: = Input.get_vector("wizard_left", "wizard_right", "wizard_up", "wizard_down")
	scroll += input_direction * speed
	material.set_shader_parameter("scroll", scroll)

func _physics_process(delta):
	get_input()
