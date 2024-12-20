extends Node2D

@onready var entrances: Dictionary[GGG.Dir , Node2D] = {
	GGG.Dir.N: $ZoneWest/entrance,
	GGG.Dir.S: $ZoneNorth/entrance,
	GGG.Dir.E: $ZoneEast/entrance,
	GGG.Dir.W: $ZoneSouth/entrance
}
@onready var player: CharacterBody2D = %Player

func _ready():
	print("Exits Ready")
	if(GGG.forestHistory.is_empty()):
		print("No history")
		return
	var lastExit: GGG.Dir = GGG.forestHistory[GGG.forestHistory.size()-1]
	print("Exit history: %s" % GGG.forestHistory)
	match lastExit:
		GGG.Dir.N:
			print("entered from south")
			player.global_position = entrances.get(GGG.Dir.S).global_position
		GGG.Dir.S:
			print("entered from north")
			player.global_position = entrances.get(GGG.Dir.N).global_position
		GGG.Dir.E:
			print("entered from west")
			player.global_position = entrances.get(GGG.Dir.W).global_position
		GGG.Dir.W:
			print("entered from east")
			player.global_position = entrances.get(GGG.Dir.E).global_position

func _reload_scene() -> void:
	get_tree().reload_current_scene()

func _on_zone_west_body_entered(body: Node2D) -> void:
	print("exited west")
	GGG.forestHistory.append(GGG.Dir.W)
	_reload_scene()

func _on_zone_east_body_entered(body: Node2D) -> void:
	print("exited east")
	GGG.forestHistory.append(GGG.Dir.E)
	_reload_scene()

func _on_zone_north_body_entered(body: Node2D) -> void:
	print("exited north")
	GGG.forestHistory.append(GGG.Dir.N)
	_reload_scene()

func _on_zone_south_body_entered(body: Node2D) -> void:
	print("exited south")
	GGG.forestHistory.append(GGG.Dir.S)
	_reload_scene()
