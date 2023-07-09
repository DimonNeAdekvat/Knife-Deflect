extends Node

@export var state : GameStateRes

func _init():
	if FileAccess.file_exists("user://Knife-Deflect/game_state.tres") :
		state = ResourceLoader.load("user://Knife-Deflect/game_state.tres")
	else:
		state = GameStateRes.new()
