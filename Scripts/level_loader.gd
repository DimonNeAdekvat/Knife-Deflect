extends Node
class_name LevelLoader

@onready var ui_scene : PackedScene = preload("res://UI/in_game_ui.tscn")

func load_path(path : String):
	get_tree().change_scene_to_file(path)
	connect_ui()

func load_pack(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)
	connect_ui()

func connect_ui():
	var level = get_tree().current_scene.get_child(0)
	var ui = ui_scene.instantiate()
	level.connect("victory",ui.on_victory)
	level.connect("game_over",ui.on_game_over)
	level.connect("score_changed",ui.set_score)
	level.connect("health_changed",ui.set_health)
	get_tree().current_scene.add_child(ui)
