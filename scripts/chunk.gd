class_name Chunk extends Node2D

func _ready() -> void:
	for map in get_children() as Array[NavMap]:
		if map.visible and map.is_nav_data:
			Navigation.add_navmap(map)

func _exit_tree() -> void:
	for map in get_children() as Array[NavMap]:
		Navigation.remove_navmap(map)
