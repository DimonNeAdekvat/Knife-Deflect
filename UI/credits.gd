extends VBoxContainer

func _on_home_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

func _on_D_itch_pressed():
	OS.shell_open("https://snail-with-tea.itch.io/")

func _on_D_github_pressed():
	OS.shell_open("https://github.com/DimonNeAdekvat")


func _on_itch_M_pressed():
	OS.shell_open("https://michael006.itch.io/")


func _on_M_github_pressed():
	OS.shell_open("https://github.com/Micael006")


func _on_G_itch_pressed():
	OS.shell_open("https://gkp228.itch.io/")


func _on_G_github_pressed():
	OS.shell_open("https://github.com/WhatTheMUCK")


func _on_C_itch_pressed():
	pass # Replace with function body.


func _on_C_github_pressed():
	OS.shell_open("https://github.com/ColaMen")
