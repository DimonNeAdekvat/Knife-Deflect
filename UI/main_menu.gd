extends Control

var state : GameStateRes

func _ready():
	state = get_tree().root.get_node("GameState").state
	state.curr_level = -1
