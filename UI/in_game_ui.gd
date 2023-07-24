extends Control
class_name InGameUI

@export var bg_texture : Texture2D = preload("res://Assets/background.png") 
var loader = LevelLoader.new()
var state : GameStateRes

func _ready():
	set_background(bg_texture,TextureRect.STRETCH_SCALE)
	add_child(loader)
	state = get_tree().root.get_node("GameState").state


func set_background(texture : Texture2D,stretch : TextureRect.StretchMode):
	$BG/TextureRect.texture = texture
	$BG/TextureRect.stretch_mode = stretch

func set_health(relative : float):
	%Health.value = relative * 100.0

func set_score(val : int) :
	%Score.text = var_to_str(val)

func on_victory():
	%HBoxControl.hide()
	$VI.show()
	state.progression = max(state.progression,state.curr_level)
	release_specific_buttons()

func on_game_over():
	%HBoxControl.hide()
	$GO.show()
	release_specific_buttons()

func release_specific_buttons():
	Input.action_release("spin_left")
	Input.action_release("spin_right")

func _on_left_button_down():
	Input.action_press("spin_left")


func _on_left_button_up():
	Input.action_release("spin_left")


func _on_right_button_down():
	Input.action_press("spin_right")


func _on_right_button_up():
	Input.action_release("spin_right")

func _on_home_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_reload_pressed():
	loader.load_indx(state.curr_level)

func _on_next_pressed():
	loader.load_indx(state.curr_level + 1)
