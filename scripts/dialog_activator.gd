class_name DialogActivator extends Area2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(&"dialogue_debug_action"):
		print("handle_dialogue_event")
		if has_overlapping_areas():
			activate_dialogue_source()
		else:
			print("No dialogue sources")

func activate_dialogue_source() -> void:
	var dialog_sources = get_overlapping_areas()

	if dialog_sources.size() > 1:
		push_warning("Overlapping dialogue sources detected")

	if !dialog_sources[0].has_method("speak"):
		push_error("Dialogue missing speak() method")
	else:
		dialog_sources[0].speak()
