extends TextureRect

@export var speed:float = 1.0/32.0
var scroll: Vector2 = Vector2.ZERO

func _ready() -> void:
	GGG.player_move.connect(moved)

func moved(v:Vector2):
	scroll += v.normalized() * speed
	material.set_shader_parameter("scroll", scroll)
