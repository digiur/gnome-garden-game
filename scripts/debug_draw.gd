@tool
extends Node2D

@export var circle_nodes: Array[Node2D] = []
@export var palete: = [Color.WEB_GREEN, Color.WEB_MAROON, Color.WEB_PURPLE]
@export var debug_width: float = 5.0
@export var debug_radius: float = 32.0

func _process(delta: float) -> void:
	#if Engine.is_editor_hint():
		queue_redraw()

func _draw() -> void:
	#if Engine.is_editor_hint():
		draw_circles()

func draw_circles():
		var i: = 0
		for node in circle_nodes:

			if !node:
				continue

			draw_circle(node.global_position - global_position, debug_radius, palete[i], false, debug_width)
			i = (i + 1) % palete.size()
