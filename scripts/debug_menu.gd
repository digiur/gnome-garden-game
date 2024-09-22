class_name DebugMenu extends CanvasLayer

@onready var scene_menu: PopupMenu = %Scene
@onready var chunk_menu: PopupMenu = %Chunk

@export_file("*.tscn") var scene_files: Array[String]
@export_file("*.tscn") var chunk_files: Array[String]

func _ready() -> void:
	for file in scene_files:
		scene_menu.add_item(file)

	for file in chunk_files:
		chunk_menu.add_item(file)

func _on_scenes_menu_id_pressed(id: int) -> void:
	print("clikced scene: %s" % scene_files[id])
	Engine.get_main_loop().change_scene_to_file(scene_files[id])

func _on_chunk_id_pressed(id: int) -> void:
	print("clikced chunk: %s" % chunk_files[id])
