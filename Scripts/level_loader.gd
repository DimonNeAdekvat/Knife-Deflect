extends Node
class_name LevelLoader

var state : GameStateRes

func _ready():
	state = get_tree().root.get_node("GameState").state

func load_path(path : String):
	get_tree().change_scene_to_file(path)

func load_pack(scene : PackedScene):
	get_tree().change_scene_to_packed(scene)

func load_indx(index : int):
	if index < 1 :
		print("levels start at 1")
		return
	var path = "res://Levels/"
	var levels = DirAccess.get_files_at(path)
	if index > levels.size() :
		load_path("res://UI/main_menu.tscn")
	path += "level" + var_to_str(index) + ".tscn"
	if !FileAccess.file_exists(path):
		print("level does not exist")
		return
	state.curr_level = index
	load_path(path)
