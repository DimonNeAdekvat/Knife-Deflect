extends Control

var state : GameStateRes
var loader : LevelLoader


func _ready():
	state = get_tree().root.get_node("GameState").state
	state.curr_level = -1
	loader = LevelLoader.new()
	add_child(loader)


func _on_story_pressed():
	loader.load_indx(state.progression+1)
