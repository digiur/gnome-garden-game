class_name GGG extends Object

# Message BUS
static var grid_click: Signal = new_static_signal("grid_click")
static var player_move: Signal = new_static_signal("player_move")

static var static_signal_id: int = 0

static func new_static_signal(name: StringName) -> Signal:
	var signal_name: String = "StaticSignal-%s-%s" % [name, static_signal_id]
	var owner_class := (GGG as Object)
	owner_class.add_user_signal(signal_name)
	static_signal_id += 1
	return Signal(owner_class, signal_name)

# Utility
static func easy_rect(a: Vector2i, b: Vector2i) -> Rect2i:
	var rect: = Rect2i()
	rect.position.x = min(a.x, b.x)
	rect.position.y = min(a.y, b.y)
	rect.end.x = max(a.x, b.x)
	rect.end.y = max(a.y, b.y)
	return rect

static var global_counter: Counter = Counter.new("global")
