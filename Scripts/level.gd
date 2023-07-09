extends Node2D

signal victory
signal game_over
signal score_changed(score : int)
signal health_changed(health : float)
# Called when the node enters the scene tree for the first time.
@onready var ui_scene : PackedScene = preload("res://UI/in_game_ui.tscn")

func _ready():
	$ControlableLog/HealthComponent.connect("health_changed_r", on_health_changed)
	$ControlableLog/HealthComponent.connect("death", on_game_over)
	$KnifeSpawner.connect("score_changed", on_score_changed)
	$KnifeSpawner.connect("victory", on_victory)
	connect_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.

func on_health_changed(health : float):
	emit_signal("health_changed", health)

func on_score_changed(score : int):
	emit_signal("score_changed", score)

func on_victory():
	emit_signal("victory")

func on_game_over():
	emit_signal("game_over")

func connect_ui():
	var ui = ui_scene.instantiate()
	connect("victory",ui.on_victory)
	connect("game_over",ui.on_game_over)
	connect("score_changed",ui.set_score)
	connect("health_changed",ui.set_health)
	get_tree().current_scene.add_child(ui)

