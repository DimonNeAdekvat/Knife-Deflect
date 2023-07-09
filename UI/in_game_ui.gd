extends Control
class_name InGameUI

@export var bg_texture : Texture2D = preload("res://Assets/background.png") 

func _ready():
	set_background(bg_texture,TextureRect.STRETCH_SCALE)


func set_background(texture : Texture2D,stretch : TextureRect.StretchMode):
	$BG/TextureRect.texture = texture
	$BG/TextureRect.stretch_mode = stretch

func set_health(relative : float):
	%Health.value = relative * 100.0

func set_score(val : int) :
	%Score.text = var_to_str(val)


func _on_left_button_down():
	Input.action_press("spin_left")


func _on_left_button_up():
	Input.action_release("spin_left")


func _on_right_button_down():
	Input.action_press("spin_right")


func _on_right_button_up():
	Input.action_release("spin_right")
