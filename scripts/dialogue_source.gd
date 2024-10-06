@tool
class_name DialogueSource extends Area2D

@export var dialog_resource: DialogueResource
@export var start_point: String = ""

func speak() -> void:
	if start_point.is_empty():
		DialogueManager.show_example_dialogue_balloon(dialog_resource)
	else:
		DialogueManager.show_example_dialogue_balloon(dialog_resource, start_point)
