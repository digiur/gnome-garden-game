class_name NavMap extends TileMapLayer

@export var is_nav_data: = false

var tile_pos: Vector2i:
	get:
		return Navigation.global_to_tile(global_position)

func get_used_rect_global() -> Rect2i:
	var rect: = get_used_rect()
	rect.position = rect.position + tile_pos
	return rect

func is_walkable(global_pos: Vector2i) -> bool:
	return get_cell_tile_data(global_pos - tile_pos) != null
