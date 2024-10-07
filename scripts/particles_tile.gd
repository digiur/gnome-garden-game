class_name ParticlesTile extends Node2D

@export var explode: = true
@export var one_shot: = true:
	set(v):
		one_shot = v
		if one_shot:
			stop()

@onready var core: GPUParticles2D = %Core
@onready var base_a: GPUParticles2D = %BaseA
@onready var base_b: GPUParticles2D = %BaseB
@onready var base_c: GPUParticles2D = %BaseC
@onready var motes_a: GPUParticles2D = %MotesA
@onready var motes_b: GPUParticles2D = %MotesB
@onready var motes_c: GPUParticles2D = %MotesC
@onready var gpu_particles_2d: GPUParticles2D = $GPUParticles2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _ready() -> void:
	restart()

func restart() -> void:
	core.restart()
	core.one_shot = false
	base_a.restart()
	base_a.one_shot = false
	base_b.restart()
	base_b.one_shot = false
	base_c.restart()
	base_c.one_shot = false
	motes_a.restart()
	motes_a.one_shot = false
	motes_b.restart()
	motes_b.one_shot = false
	motes_c.restart()
	motes_c.one_shot = false
	gpu_particles_2d.restart()
	gpu_particles_2d.one_shot = true
	
	if one_shot:
		stop()

	if !explode:
		audio_stream_player_2d.stop()
		gpu_particles_2d.visible = false

func stop() -> void:
	core.one_shot = true
	motes_c.one_shot = true
	base_c.one_shot = true
	animation_player.active = true

func _on_core_finished() -> void:
	base_a.one_shot = true
	base_b.one_shot = true
	motes_a.one_shot = true
	motes_b.one_shot = true

func _on_motes_a_finished() -> void:
	queue_free()
