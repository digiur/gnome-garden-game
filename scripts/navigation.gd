class_name Navigation extends Object

static var astar: AStarGrid2D = AStarGrid2D.new()
static var navMaps: Dictionary[NavMap, bool] = {}
static var dirty_region: bool = true
const tile_size: = Vector2i(32, 32)

static func _static_init() -> void:
	astar.cell_size = tile_size
	astar.offset = astar.cell_size / 2.0
	astar.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ALWAYS
	astar.default_compute_heuristic = astar.HEURISTIC_OCTILE
	astar.default_estimate_heuristic = astar.HEURISTIC_OCTILE

static func add_navmap(navMap: NavMap) -> void:
	print("add navMap: %s | rect: %s" % [navMap.name, navMap.get_used_rect_global()])
	if navMaps.has(navMap):
		push_warning("Attempt to add Navmap %s already regestered" % navMap.name)

	navMaps[navMap] = true
	dirty_region = true

static func remove_navmap(navMap: NavMap) -> void:
	print("remove navMap: %s | rect: %s" % [navMap.name, navMap.get_used_rect_global()])
	if !navMaps.has(navMap):
		push_warning("Attempt to remove Navmap %s not regestered" % navMap.name)
	else:
		navMaps.erase(navMap)
		dirty_region = true

static func global_to_tile(v: Vector2) -> Vector2i:
	return Vector2i(floor(v.x / tile_size.x), floor(v.y / tile_size.y))

static func get_path_2d(global_from: Vector2, global_to: Vector2) -> PackedVector2Array:
	var from = global_to_tile(global_from)
	var to = global_to_tile(global_to)
	print("get_path_2d from %s to %s" % [from, to])

	if dirty_region:
		clean_region()

	if astar.is_dirty():
		clean_astar()

	var path = astar.get_point_path(from, to, true)
	print("found path: %s" % path)
	return path

static func clean_astar() -> void:
	astar.update()
	astar.fill_solid_region(astar.region)
	for navMap in navMaps.keys() as Array[NavMap]:
		set_map_walkables(navMap)
	print("astar cleaned: %s" % astar.region)

static func clean_region() -> void:
	astar.region = Rect2i(Vector2i.ZERO, Vector2i.ZERO)
	for navMap in navMaps.keys() as Array[NavMap]:
		astar.region = astar.region.merge(navMap.get_used_rect_global())

	dirty_region = false
	print("astar region re-merged: %s" % astar.region)

static func set_map_walkables(navMap: NavMap) -> void:
	var rect = navMap.get_used_rect_global()
	for x in range(rect.position.x, rect.end.x):
		for y in range(rect.position.y, rect.end.y):
			var v = Vector2i(x,y)
			if navMap.is_walkable(v):
				astar.set_point_solid(v, false)
