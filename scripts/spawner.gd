class_name Spawner extends Node2D

@export var spawn_time: = 2
@export var MOB = preload("res://scenes/mobs/mob.tscn")

@onready var target: Node2D = %AttackTarget
@onready var spawn: Node2D = %Spawn
@onready var path_2d: Path2D = %Path2D
@onready var mob_counter: Counter = Counter.new("mob")

func _ready() -> void:
	path_2d.curve = Curve2D.new()
	for point in Navigation.get_path_2d(spawn.global_position, target.global_position):
		path_2d.curve.add_point(point)
	queue_next_spawn()

func spawn_mob() -> void:
	var mob: = MOB.instantiate()
	mob.name = mob.name + str(mob_counter.inc())
	path_2d.add_child(mob)
	queue_next_spawn()

func queue_next_spawn() -> void:
	get_tree().create_timer(spawn_time).timeout.connect(spawn_mob)
