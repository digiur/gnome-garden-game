class_name GridBackground extends CanvasLayer

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		match event.button_index:
			MOUSE_BUTTON_LEFT:
				GGG.grid_click.emit(event.position)
				get_viewport().set_input_as_handled()
				print("grid clicked signal sent")
