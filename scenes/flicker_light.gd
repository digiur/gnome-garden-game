class_name FlickerLight extends PointLight2D

@export var energy_noise: FastNoiseLite
@export var x_noise: FastNoiseLite
@export var y_noise: FastNoiseLite
@export_range(-1, 1) var flicker_energy: float = 0.5
@export var flicker_move_distance: float = 30.0
@export var speed: float = 2.0

var t: float = 0.0

func _process(delta: float) -> void:
	t += delta * speed

	energy = 0.5 - abs(energy_noise.get_noise_1d(t)) * flicker_energy

	position.x = x_noise.get_noise_1d(t) * flicker_move_distance / 2.0
	position.y = y_noise.get_noise_1d(t) * flicker_move_distance / 2.0
