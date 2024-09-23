class_name Spawner extends Node2D

@export var spawn_time: float = 1.0
@export var MOB = preload("res://scenes/mobs/mob.tscn")
@export var one_shot: bool = false
@export var spawn_speed_tracking_mob: bool = false

var spawned: bool = false

@onready var target: Node2D = %AttackTarget
@onready var spawn: Node2D = %Spawn
@onready var path_2d: Path2D = %Path2D
@onready var mob_counter: Counter = Counter.new("mob")

func _ready() -> void:
	path_2d.curve = Curve2D.new()
	for point in Navigation.get_path_2d(spawn.global_position, target.global_position):
		path_2d.curve.add_point(point)
	spawn_mob()

func spawn_mob() -> void:
	if one_shot and spawned:
		return

	spawned = true

	var mob: = MOB.instantiate()
	mob.name = mob.name + str(mob_counter.inc())
	path_2d.add_child(mob)

	if spawn_speed_tracking_mob:
		mob = MOB.instantiate()
		mob.name = mob.name + str(mob_counter.inc())
		mob.pause_period = 0.0
		path_2d.add_child(mob)

	queue_next_spawn()

func queue_next_spawn() -> void:
	get_tree().create_timer(spawn_time).timeout.connect(spawn_mob)
