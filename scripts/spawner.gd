extends Node

@export var spawn_time: = 2
@export var MOB = preload("res://scenes/mobs/mob.tscn")
@export var targetPos: Vector2 = Vector2.ZERO

@onready var target: Node2D = %AttackTarget
@onready var spawn: Node2D = %Spawn
@onready var path_2d: Path2D = %Path2D

func _ready() -> void:
	path_2d.curve = Curve2D.new()
	for point in Navigation.get_path_2d(spawn.global_position, target.global_position):
		path_2d.curve.add_point(point)
	get_tree().create_timer(spawn_time).timeout.connect(spawn_mob)

func spawn_mob() -> void:
	print("mobspawn")
	var mob: = MOB.instantiate()
	path_2d.add_child(mob)
	get_tree().create_timer(spawn_time).timeout.connect(spawn_mob)
