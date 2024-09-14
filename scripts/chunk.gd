class_name Chunk extends Node2D

func _ready() -> void:
	for map in get_children() as Array[NavMap]:
		if map.visible:
			Navigation.add_navmap(map)
