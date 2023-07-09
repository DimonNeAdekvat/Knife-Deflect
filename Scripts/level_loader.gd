extends Node
class_name LevelLoader

func load_path(path : String):
	var scene = load(path)
	load_pack(scene)

func load_pack(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)

