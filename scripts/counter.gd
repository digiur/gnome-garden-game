class_name Counter extends RefCounted

static var counters: Dictionary[StringName, int] = {}

var _name: StringName
var _start: int
var _delta: int

func _init(name: StringName, start: int = 0, delta: int = 1) -> void:
	_name = name
	_start = start
	_delta = delta

func top() -> int:
	return counters.get_or_add(_name, _start)

func inc() -> int:
	counters[_name] = counters.get_or_add(_name, _start) + _delta
	return counters[_name]

func next() -> int:
	return inc()

func dec() -> int:
	counters[_name] = counters.get_or_add(_name, _start) - _delta
	return counters[_name]

func prev() -> int:
	return dec()
