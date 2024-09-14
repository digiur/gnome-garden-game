class_name Array2i extends Object

var data: Array[int] = []
var size: Vector2i = Vector2i.ZERO
var offset: Vector2 = Vector2i.ZERO

func resize(size: Vector2i, fill: int = 0, offset: Vector2i = Vector2i.ZERO) -> void:
	self.size = size
	self.data = []
	self.data.resize(size.x * size.y)
	self.data.fill(fill)

func gv(v: Vector2i) -> int:
	return data[cv(v)]

func sv(v: Vector2i, i: int) -> void:
	data[cv(v)] = i

func cv(v: Vector2i) -> int:
	return v.x * size.y + v.y

func gf(x: int, y: int) -> int:
	return data[cf(x,y)]

func sf(x: int, y: int, i: int) -> void:
	data[cf(x,y)] = i

func cf(x: int, y: int) -> int:
	return x * size.y + y
