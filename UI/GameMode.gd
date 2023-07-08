extends Control


const levels_path = "res://UI/levels.tscn"
const endless_path = "res://Scenes/main_scene.tscn"


func _on_levels_pressed():
	get_tree().change_scene_to_file(levels_path)


func _on_endless_pressed():
	get_tree().change_scene_to_file(endless_path)
